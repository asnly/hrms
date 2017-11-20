<#import "admin_frame.ftl" as main>
<@main.page title="角色管理">
<script>
	function confirmSend(){
		return window.confirm("你确定要删除吗？");
	}
	function change(id){
		var rolename=document.getElementById("rolename");
		var temp=document.getElementById("p1"+id);
		rolename.value=$(temp).html();
		var description=document.getElementById("description");
		temp=document.getElementById("p2"+id);
		description.value=$(temp).html();
		var roleid=document.getElementById("rolenameid");
		roleid.value=id;
	}
	
	
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>角色管理</li>
		</ol>
		<h1>角色管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p>
							<a id="btntext" type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencl"></i>添加角色信息</a>
						</p>
						<table class="table table-condensed">
							<thead>
							<tr>
								<th>角色名称</th>
								<th>描述</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
							</thead>
							<#list RoleInfoList as roleInfo>
							<tbody>
								<tr>
									<td id="p1#{roleInfo.id}"><#if roleInfo.rolename??>${roleInfo.rolename?html}</#if></td>
									<td id="p2#{roleInfo.id}"><#if roleInfo.description??>${roleInfo.description?html}</#if></td>
									<td><#if roleInfo.createtime??>${roleInfo.createtime?string("yyyy-MM-dd HH:mm:SS")}</#if></td>
									<td>
										<input id="#{roleInfo.id}" type="button" onclick="change(this.id);"  value="修改" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals" />
										<a href="role_info_edit?action=delete&roleid=#{roleInfo.id}" onclick="return confirmSend();" class="btn btn-success btn-sm"><i class="fa fa-times"></i>删除</a>
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
               添加角色信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="role_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						
						<div class="form-group">
						<#if roleInfo??>
							<input type="hidden" name="roleid" value=#{roleInfo.id} >
						</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">角色名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="rolename" class="form-control" required="required" <#if roleInfo?? && roleInfo.rolename??>value="${roleInfo.rolename?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-3 control-label">角色描述：</label>
								<div class="col-sm-6">
									<textarea class="form-control" name="description" rows="3" cols="20" required="required" <#if roleInfo??&&roleInfo.description??>value="${roleInfo.description?html}"</#if>></textarea>
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
               修改角色信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="role_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley('validate');">
						<input type="hidden" name="roleid" id="rolenameid" />
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">角色名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="rolename" id="rolename" class="form-control" required="required" <#if roleInfo?? && roleInfo.rolename??>value="${roleInfo.rolename?html}"</#if>>
							    																							  
							    </div> 
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">角色描述：</label>
							    <div class="col-sm-6">
							    	<textarea class="form-control" name="description" id="description" required="required" <#if roleInfo??&&roleInfo.description??>value="${roleInfo.description?html}"</#if>></textarea>
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