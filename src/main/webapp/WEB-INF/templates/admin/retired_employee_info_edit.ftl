<#import "admin_frame.ftl" as main>
<@main.page title="离退员工管理">
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
					<div class="panel-heading">
						<#if demission??>修改<#else>添加</#if>离退员工信息
					</div>
					<div class="panel-body">
						<form id="form2" class="form-horizontal row-border" action="retired_employee_info_edit.do"
						method="post" data-validate="parsley" onsubmit="$('#form2').parsley('validate');">
						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-md-1 control-label">离职类型</label>
								<div class="col-md-3">
									<select name="lzlx" class="form-control" id="lzlx">
										<option value="">离职类型</option>
										<option value="1" <#if lzlx??&&lzlx==1>selected</#if>>辞职</option>
										<option value="2" <#if lzlx??&&lzlx==2>selected</#if>>自离</option>
										<option value="3" <#if lzlx??&&lzlx==3>selected</#if>>劳动合同期满</option>
										<option value="4" <#if lzlx??&&lzlx==4>selected</#if>>协商解除劳动合同</option>
										<option value="5" <#if lzlx??&&lzlx==5>selected</#if>>违法解除劳动合同</option>
										<option value="6" <#if lzlx??&&lzlx==6>selected</#if>>经济性裁员</option>
										<option value="7" <#if lzlx??&&lzlx==7>selected</#if>>我单位过错解除</option>
										<option value="8" <#if lzlx??&&lzlx==8>selected</#if>>劳动者过错解除</option>
										<option value="9" <#if lzlx??&&lzlx==9>selected</#if>>非双方过错解除</option>
										<option value="10" <#if lzlx??&&lzlx==10>selected</#if>>劳动者死亡或失踪</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control" required="required" name="ename" <#if employee??&&employee.name??> value="${employee.name?html}"</#if>>
								</div>
								<a type="button" href="retired_employee_user" id="usernameselect" class="btn btn-success btn-sm" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
							</div>
						</div>
						</form>
					</div>
					<div class="panel-footer">
						<div class="row">
							<button class="btn btn-primary"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>