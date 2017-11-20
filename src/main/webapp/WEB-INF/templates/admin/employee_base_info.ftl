<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<#assign filterUrl><#if gender??>&gender=${gender}</#if><#if education??>&education=${education}</#if><#if degree??>&degree=${degree}</#if><#if dept??>&dept=${dept}</#if><#if searchword??>&searchword=${searchword}</#if></#assign>
<@main.page title="基本信息情况查询">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>基本信息情况查询</li>
		</ol>
		<h1>基本信息情况查询</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form id="form2" action="employee_base_info" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-1 control-label" style="width:auto"><strong>学历</strong></label>
								<div class="col-md-2">
								<select name="education" class="form-control">
									<option value="">请选择学历</option>
									<option value="0" <#if education??&&education=="0">selected</#if>>大专</option>
									<option value="1" <#if education??&&education=="1">selected</#if>>本科</option>
									<option value="2" <#if education??&&education=="2">selected</#if>>硕士</option>
									<option value="3" <#if education??&&education=="3">selected</#if>>博士</option>
								</select>
								</div>
								<label class="col-md-1 control-label" style="width:auto"><strong>学位</strong></label>
								<div class="col-md-2">
								<select name="degree" class="form-control">
									<option value="">是否有学位</option>
									<option value="0" <#if degree??&&degree=="0"></#if>>有</option>
									<option value="1" <#if degree??&&degree=="1"></#if>无</option>
								</select>
								</div>
								<label class="col-md-1 control-label" style="width:auto"><strong>部门</strong></label>
								<div class="col-md-2">
								<select name="dept" class="form-control">
									<option value="">选择部门</option>
									<#if deptMap?exists>
										<#list deptMap?keys as key>
											<option value="${key}">${deptMap[key]}</option>
										</#list>
									</#if>
								</select>
								</div>
								<label class="col-md-1 control-lable radio-inline" style="width:auto"><strong>性别</strong></label>
								<div class="col-md-2">
									<label class="radio-inline">
										<input type="radio" name="gender" value="男" checked>男
									</label>
									<label class="radio-inline">
										<input type="radio" name="gender" value="女">女
									</label>
									
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label class="col-md-1 control-label" style="width:auto"><strong>关键字</strong></label>
								<div class="col-md-5">
									<input type="text" name="searchword" class="form-control" placeholder="请输入年龄或姓名" <#if searchword??>value="${searchword?html}"</#if>>
								</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-md btn-primary"><i class="fa fa-search"></i>查询</button>
								</div>
							</div>
						</form>
						</hr>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>学历</th>
									<th>学位</th>
									<th>所在部门</th>
								</tr>
							</thead>
							<#list employeeList as employee>
							<tbody>
								<tr>
									<td><#if employee.name??>${employee.name?html}</#if></td>
									<td><#if employee.gender??>${employee.gender?html}</#if></td>
									<td><#if employee.age??>${employee.age?html}</#if></td>
									<td><#if employee.education??>${employee.education?html}</#if></td>
									<td><#if employee.degree??>${employee.degree?html}</#if></td>
									<td><#if employee.department??>${employee.department?html}</#if></td>
								</tr>
							</tbody>
							</#list>
						</table>
						<#assign currentUrl>employee_base_info?_t=1${filterUrl!}</#assign>
						<@pager.pageul pagination=pagination url="${currentUrl}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>