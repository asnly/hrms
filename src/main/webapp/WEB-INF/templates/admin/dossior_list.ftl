<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>

<@main.page title="员工档案管理">
<script>
	
	function confirmsend() {
		return window.confirm("你确定要删除吗?");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>员工档案管理</li>
		</ol>
		<h1>员工档案管理</h1>
	</div>
	<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-primary">
						<div class="panel-body">
							<p>
								<a href="dossior_info_edit" type="button" value="添加档案信息" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>添加档案信息</a>
							</p>
							<table class="table table-condensed">
								<thead>
									<tr>
										<th style="width:12%">员工id</th>
										<th style="width:12%">档案号码</th>
										<th style="width:12%">所属部门</th>
										<th style="width:12%">档案名称</th>
										<th style="width:12%">内容摘要</th>
										<th style="width:12%">备注</th>
										<th style="width:12%">创建时间</th>
										<th style="width:100px">操作</th>
									</tr>
								</thead>
								<tbody>
									<#list dossierList as dossior>
									<tr>
										<td><#if dossior.employeeid??>${dossior.employeeid?html}</#if></td>
										<td id="d1#{dossior.id}"><#if dossior.dossiernum??>${dossior.dossiernum?html}</#if></td>
										<td id="d2#{dossior.id}"><#if dossior.department??>${dossior.department?html}</#if></td>
										<td id="d3#{dossior.id}"><#if dossior.designation??>${dossior.designation?html}</#if></td>
										<td id="c#{dossior.id}"><#if dossior.context??>${dossior.context?html}</#if></td>
										<td id="r#{dossior.id}"><#if dossior.remark??>${dossior.remark?html}</#if></td>
										<td><#if dossior.dossiertime??>${dossior.dossiertime?string("yyyy-mm-dd HH:mm:SS")}</#if></td>
										<td>
											<a href="dossior_info_edit?dossiorId=#{dossior.id}" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>修改</a>
											<a href="dossior_list_edit.do?action=delete&dossiorId=#{dossior.id}" onclick="return confirmsend();" class="btn btn-default btn-sm"><i class="fa fa-times"></i>删除</a> 
										</td>
									</tr>
									
									</#list>
								</tbody>
							</table>
							<#assign currentUrl>dossior_list?_t=1&</#assign>
							<@pager.pageul pagination=pagination url="${currentUrl}"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--container-->
</@main.page>