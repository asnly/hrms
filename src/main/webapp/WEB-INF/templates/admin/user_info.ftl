<#import "admin_frame.ftl" as main>
<@main.page title="用户信息管理">
<script>
	function change(id){
		var username=document.getElementById("username");
		var temp=document.getElementById("p"+id);
		username.value=$(temp).html();
		var password=document.getElementById("pwd");
		temp=document.getElementById("n"+id);
		password.value=$(temp).html();
		var userid=document.getElementById("uid");
		userid.value=id;
	}
	function confirmSend(){
		return window.confirm("你确定要删除吗？");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>用户信息管理</li>
		</ol>
		<h1>用户信息管理</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a id="btntext" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i calss="fa fa-pencil">添加角色信息</i></a>
						<table class="table table consened">
							<thead>
								<tr>
									<th>用户名</th>
									<th>密码</th>
									<th>操作</th>
								</tr>
							</thead>
							<#list userinfoList as userinfo>
							<tbody>
								<tr>
									<td id="p#{userinfo.id}"><#if userinfo??&&userinfo.username??>${userinfo.username?html}</#if></td>
									<td id="n#{userinfo.id}"><#if userinfo??&&userinfo.pwd??>${userinfo.pwd?html}</#if></td>
									<td>
										<input id="#{userinfo.id}" type="button" onclick="change(this.id);"  value="修改" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals" />
										<a href="user_info_edit?action=delete&userid=#{userinfo.id}" onclick="return confirmSend();" class="btn btn-success btn-sm"><i class="fa fa-times"></i>删除</a>
									</td>
								</tr>
							</tbody>
							</#list>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- container -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加用户信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="user_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
							<#if userinfo??>
								<input type="hidden" name="userid" value=#{userinfo.id} />
							</#if>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">用户名：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="username" class="form-control" required="required" <#if userinfo?? && userinfo.username??>value="${userinfo.username?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							`	
								<div class="validate-block">
								<label class="col-sm-3 control-label">初始密码：</label>
								<div class="col-sm-6">
										<input type="password" name="pwd" class="form-control" required="required" <#if userinfo??&&userinfo.pwd??>value="${userinfo.pwd?html}"</#if>>
								</div>
							</div>
						</div>
						
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="myModals" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabels" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabels">
               修改用户信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="user_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley('validate');">
							
						<div class="form-group">
						<input type="hidden" name="userid" id="uid">
							<div class="validate-block">
								<label class="col-sm-3 control-label">用户名：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="username" id="username" class="form-control" required="required" <#if userinfo??&&userinfo.username??>value="${userinfo.username?html}"</#if>>
							    </div> 
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">密码：</label>
							    <div class="col-sm-6">
							    	<input type="password" name="pwd" id="pwd" class="form-control" required="required" <#if userinfo?? &&userinfo.pwd??>value="${userinfo.pwd?html}"</#if>>
							    </div>
						    </div>
						
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn-primary btn" onclick="$('#form2').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
</@main.page>