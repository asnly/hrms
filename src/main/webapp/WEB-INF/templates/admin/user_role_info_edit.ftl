<#import "admin_frame.ftl" as main>
<@main.page title="用户角色分配">

<script>
	$(function(){
		var account=$("#useraccount").val();
		if(account){
			$("#selectuser").hide();
		}
	})
</script>

	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>用户角色分配</li>
		</ol>
		<h1>用户角色分配</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if accountRoleInfo??>修改<#else>添加</#if>用户角色	
					</div>
					<div class="panel-body">
						<form id="validate-form" class="form-horizontal row-border" action="user_role_info_edit.do" data-validate='parsley'
							onsubmit="$('validate-form').parsley('validate')">
								
								<div class="form-group">
									<#if accountRoleInfo??>
										<input type="hidden" name="userRoleId" value="#{accountRoleInfo.id}">
									</#if>
									<#if account??>
										<input type="hidden" name="accountId" value="#{account.id}">
									</#if>
									<div class="validate-block">
										<label class="col-sm-2 label-control">用户帐号</label>
											
											<div class="col-sm-3">
												<#if accountRoleInfo??>
												<input type="text" name="useraccount" id="useraccount" class="form-control" <#if accountRoleInfo??&&accountRoleInfo.username??>value="${accountRoleInfo.username}"</#if>>
												<#else>
													<input type="text" name="useraccount" id="useraccount" class="form-control" <#if account??&&account.username??>value="${account.username}"</#if>>
												</#if>
												<a href="user_info_select" id="selectuser" class="btn btn-success btn-sm" value="选择用户"><i class="fa fa-pencil"></i>选择用户</a>
											</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="validate-block">
										<label class="col-sm-2 label-control">用户角色</label>
											<#if roleinfoMap?exists>
											<#list roleinfoMap?keys as key>
											<div class="col-sm-3">
												<input type="radio" name="rolename"  value="${roleinfoMap[key]}" required="required" >${roleinfoMap[key]}
											</div>
											</#list>
											</#if>
									</div>
								</div>
								
							</form>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-5">
								<button class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
								<a href="javascript:;" onclick="history.go(-1)" class="btn btn-default">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>