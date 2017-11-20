<#import "admin_frame.ftl" as main>
<@main.page title="角色权限管理">
<script>
	function change(id){
		var rolename=document.getElementById("role");
		var temp=document.getElementById("p1"+id);
		rolename.value=$(temp).html();
		var permission1=$("#personnalDossier").val();
		temp=document.getElementById("p2"+id);
		permission1.value=$(temp).html();
		var permission2=$("#personnelAllocation");
		temp=document.getElementById("p3"+id);
		permission2.value=$(temp).html();
		var permission3=$("#education");
		temp=document.getElementById("p4"+id);
		permission3.value=$(temp).html();
		var permission4=$("#systemManagement");
		temp=document.getElementById("p5"+id);
		permission4.value=$(temp).html();
		var pid=document.getElementById("pid");
		pid.value=id;
	}
	function confirmSend(){
		return window.confirm("你确定要删除吗");
	}
	
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>角色权限管理</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a id="btntext" type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil"></i>添加角色权限</a>
						<table class="table table-condensed">
						<thead>
							<tr>
								<th>角色名称</th>
								<th>角色权限1</th>
								<th>角色权限2</th>
								<th>角色权限3</th>
								<th>角色权限4</th>
								<th>操作</th>
							</tr>
						<thead>
						<#list permissionList as permission>
						<tbody>
							<tr>
								
								<td id="p1#{permission.id}"><#if permission??&&permission.roleName??>${permission.roleName?html}</#if></td>
								<td id="p2#{permission.id}"><#if permission??&&permission.permission1??>${permission.permission1?html}</#if></td>
								<td id="p3#{permission.id}"><#if permission??&&permission.permission2??>${permission.permission2?html}</#if></td>
								<td id="p4#{permission.id}"><#if permission??&&permission.permission3??>${permission.permission3?html}</#if></td>
								<td id="p5#{permission.id}"><#if permission??&&permission.permission4??>${permission.permission4?html}</#if></td>
								<td>
									<input id="#{permission.id}" type="button" onclick="change(this.id);" value="修改" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals">
									<a href="permission_info_edit?action=delete&permissionId=#{permission.id}" onclick="return confirmSend();" class="btn btn-default btn-sm"><i class="fa fa-times"></i>删除</a>
								</td>
							</tr>
							
						</tbody>
						</#list>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- container -->
	
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
               添加权限
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="permission_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						
						<div class="form-group">
						<#if permission??>
						<input type="hidden" name="permissionid" value=#{permission.id}>
						</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">角色名称：</label>
							    <div class="col-sm-6">
							    	<select name="rolename">
							    		<#if roleMap?exists>
							    		<#list roleMap?keys as key>
							    		<option value="${roleMap[key]}">${roleMap[key]}</option>
							    		</#list>
										</#if>
							    	</select>
							    	
							    </div>
						    </div>
						</div>
						<div class="form-group">
								<div class="validate-block">
								<label class="col-sm-3 control-label">角色权限：</label>
								<div class="col-sm-6">
											<p>
											<input type="checkbox" name="personnalDossier" value="1"/>人员档案权限
											</p>
											<p>
											<input type="checkbox" name="personnelAllocation" value="2" />人事调配权限
											</p>
											<p>
											<input type="checkbox" name="education" value="3"/>教育培训权限
											</p>
											<p>
											<input type="checkbox" name="systemManagement" value="4" />系统管理权限
											</p>
								</div>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="btn1" class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
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
               修改权限
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="permission_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						
						<div class="form-group">
						<input type="hidden" name="permissionid" id="pid">
							<div class="validate-block">
								<label class="col-sm-3 control-label">角色名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="role" id="role" class="form-control" required="required" <#if permission??&&permission.roleName??>value="${permission.roleName?html}"</#if>>
							    </div>
							    
						    </div>
						</div>
						<div class="form-group">
								<div class="validate-block">
								<label class="col-sm-3 control-label">角色权限：</label>
								<div class="col-sm-6">
											<p>
											<input type="checkbox" name="personnalDossier" id="personnalDossier" value="1" />人员档案权限
											</p>
											<p>
											<input type="checkbox" name="personnelAllocation" id="personnelAllocation" value="2" />人事调配权限
											</p>
											<p>
											<input type="checkbox" name="education" id="education" value="3" />教育权限
											</p>
											<p>
											<input type="checkbox" name="systemManagement" id="systemManagement" value="4" />系统管理权限
											</p>
								</div>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="btn1" class="btn-primary btn" onclick="$('#form2').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
</@main.page>