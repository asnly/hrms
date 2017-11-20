<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="员工信息管理">
<#assign filterUrl><#if education??>&education=${education}</#if><#if department??>&department=${department}</#if><#if status??>&status=${status}</#if><#if searchword??>&searchword=${searchword?html}</#if></#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>员工信息管理</li>
		</ol>
		<h1>员工信息管理</h1>
	</div>
	<script>
		function del(){
			alert("你确定要删除吗？");
		}
	</script>
	<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-body">
							<p>
							<a href="base_info_edit" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>添加员工信息</a>
							</p>
							<hr>
							<form action="base_info" class="form-horizontal" role="form">
								
								<div class="form-group">
									<label class="col-md-1 control-label"><strong>学历</strong></label>
									<div class="col-md-2">
										<select name="education" class="form-control" >
											<option value="">请选择学历</option>
											<option value="1" <#if education??&&education=="1">selected</#if>>大专</option>
											<option value="2" <#if education??&&education=="2">selected</#if>>本科</option>
											<option value="3" <#if education??&&education=="3">selected</#if>>硕士</option>
											<option value="4" <#if education??&&education=="4">selected</#if>>博士</option>
										</select>
									</div>
									<label class="col-md-1 control-label"><strong>部门</strong></label>
									<div class="col-md-2">
										<select name="department" class="form-control" >
											<option value="">请选择部门</option>
											<#if deptMap?exists>
											<#list deptMap?keys as key>
											<option value="${deptMap[key]}">${deptMap[key]}</option>
											</#list>
											</#if>
											
										</select>
									</div>
									<label class="col-md-1 control-label"><strong>人员状态</strong></label>
									<div class="col-md-2">
										<select class="form-control" name="status">
											<option value="">请选择人员状态</option>
											<option value="1" <#if status??&&status=="1">selected</#if>>在职</option>
											<option value="2" <#if status??&&status=="2">selected</#if>>兼职</option>
											<option value="3" <#if status??&&status=="3">selected</#if>>离职</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label style="width:auto"><strong>关键词</strong></label>
									<div class="col-md-5">
										<input type="text" name="searchword" class="form-control" placeholder="输入姓名或id号"<#if searchword??>value="${searchword?html}"</#if> />
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-md btn-primary"><i class="fa fa-search"></i>查询</button>
									</div>
								</div>
							</form>
							
							<hr>
							<table class="table table-striped">
								<thead>
									<tr>
										<th style="width:6%">姓名</th>
										<th style="width:6%">性别</th>
										<th style="width:10%">正装照</th>
										<th style="width:10%">身份证</th>
										<th style="width:6%">学历</th>
										<th style="width:10%">学历图片</th>
										<th style="width:6%">学位</th>
										<th style="width:10%">学位图片</th>
										<th style="width:8%">部门</th>
										<th style="width:8%">职务</th>
										<th style="width:10%">人员状态</th>
										<th style="width:40px">操作</th>
									</tr>
								</thead>
								<tbody>
									<#list employeeList as employeeInfo>
									<tr>
										<td><#if employeeInfo.name??>${employeeInfo.name?html}</#if></td>
										<td><#if employeeInfo.gender??>${employeeInfo.gender?html}</#if></td>
										<td><#if employeeInfo.image??>${employeeInfo.image?html}</#if></td>
										<td><#if employeeInfo.idcard1??>${employeeInfo.idcard1?html}</#if>
											<#if employeeInfo.idcard2??>${employeeInfo.idcard2?html}</#if>
										</td>
										<td><#if employeeInfo.education??>${employeeInfo.education?html}</#if></td>
										<td><#if employeeInfo.educationimage??>${employeeInfo.educationimage?html}</#if></td>
										<td><#if employeeInfo.degree??>${employeeInfo.degree?html}</#if></td>
										<td><#if employeeInfo.degreeimage??>${employeeInfo.degreeimage?html}</#if></td>
										<td><#if employeeInfo.department??>${employeeInfo.department?html}</#if></td>
										<td><#if employeeInfo.position??>${employeeInfo.position?html}</#if></td>
										<td><#if employeeInfo.rstatus??>${employeeInfo.rstatus?html}</#if></td>
										<td><a href="base_info_edit?employeeInfoId=#{employeeInfo.id}" class="btn btn-success btn-sm"><i class="fa fa-sign-in"></i>修改</a></td>
										<td><a href="base_info_del?action=delete&employeeInfoId=#{employeeInfo.id}" onclick="return del();" class="btn btn-default btn-sm"><i calss="fa fa-times"></i>删除</a></td>
									</tr>
									</#list>
								</tbody>
							</table>
							<#assign currentUrl>base_info?_t=1${filterUrl!}&</#assign>
							<@pager.pageul pagination=pagination url="${currentUrl}" />
						</div>
					</div>
				</div>
			</div>
		</div>
</@main.page>