<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="离退员工管理">
<#assign filterUrl><#if searchword??>&searchword=${searchword}</#if><#if lzlx??>&lzlx=${lzlx}</#if></#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>离退员工管理</li>
		</ol>
		<h1>离退员工管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a href="retired_employee_info_edit" class="btn btn-success btn-sm" type="button"><i class="fa fa-pencil"></i>添加离职信息</a> 
						</hr>
						<form action="retired_employee_list" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-1 control-label" style="auto">关键字</label>
								<div class="col-md-5">
									<input type="text" class="form-control" name="searchword" required="required" placeholder="输入员工姓名" <#if searchword??>value="${searchword?html}"</#if>>
								</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-primary btn-md"><i class="fa fa-search"></i>查询</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label" style="auto">离职类型</label>
								<div class="col-md-2">
									<select name="lzlx" class="form-control">
										<option value="">离职类型</option>
										<option value="1" <#if lzlx??&&lzlx==1>selected</#if>>辞职</option>
										<option value="2" <#if lzlx??&&lzlx==2>selected</#if>>自离</option>
										<option value="3" <#if lzlx??&&lzlx==3>selected</#if>>退休</option>
										<option value="4" <#if lzlx??&&lzlx==4>selected</#if>>劳动合同期满</option>
										<option value="5" <#if lzlx??&&lzlx==5>selected</#if>>协商解除劳动合同</option>
										<option value="6" <#if lzlx??&&lzlx==6>selected</#if>>违法解除劳动合同</option>
										<option value="7" <#if lzlx??&&lzlx==7>selected</#if>>经济性裁员</option>
										<option value="8" <#if lzlx??&&lzlx==8>selected</#if>>我单位过错解除</option>
										<option value="9" <#if lzlx??&&lzlx==9>selected</#if>>劳动者过错解除</option>
										<option value="10" <#if lzlx??&&lzlx==10>selected</#if>>非双方过错解除</option>
										<option value="11" <#if lzlx??&&lzlx==11>selected</#if>>劳动者死亡或失踪</option>
									</select>
								</div>
							</div>
						</form>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>员工编号</th>
									<th>离职原因</th>
									<th>离职类型</th>
									<th>离职时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									</td></td>
								</tr>
							</tbody>
						</table>
						<#assign currentUrl>retired_employee_list?_t=1${filterUrl!}&</#assign>
						<@pager.pageul pagination=pagination url="${currentUrl}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>