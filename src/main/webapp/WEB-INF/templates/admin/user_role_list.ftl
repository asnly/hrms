<#import "admin_frame.ftl" as main>
<@main.page title="用户角色分配">
<script>
	
	function confirmSend(){
		return window.confirm("你确定要删除吗？");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>用户角色分配</li>
		</ol>
		<h1>用户角色分配</h1>
	</div>
	
	<div class="container">
		<div class="col=md-12">
			<div class="panel panel-primary">
				<div class="panel-body">
					<a href="user_role_info_edit" type="button" class="btn btn-success btn-sm" vlaue="添加用户角色"><i class="fa fa-pencil"></i>添加用户角色</a>
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>用户角色</th>
								<th>角色权限</th>
								<th>操作</th>
							</tr>
						</thead>
						<#list accoutRoleList as accoutRole>
						<tbody>
							<tr>
								<td id="p#{accoutRole.id}"><#if accoutRole??&&accoutRole.username??>${accoutRole.username?html}</#if></td>
								<td id="n#{accoutRole.id}"><#if accoutRole??&&accoutRole.rolename??>${accoutRole.rolename?html}</#if></td>
								<td>
									<a href="user_role_info_edit?userRoleId=#{accoutRole.id}" class="btn btn-default btn-sm"><i class="fa fa-pencil"></i>修改</a>
									
									<a href="user_role_list_edit.do?action=delete&accountRoleid=#{accoutRole.id}" class="btn btn-success btn-sm" onclick="return confirmSend();"><i class="fa fa-times"></i>删除</a>
								</td>
							</tr>
						</tbody>
						</#list>
					</table>
				</div>
			</div>
		</div>
	</div><!-- container -->
	
</@main.page>