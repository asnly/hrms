<#import "admin_frame.ftl" as main>
<@main.page title="部门信息管理">
<script>
	function change(id,name){
		var deptname=document.getElementById("deptname");
		alert(name);
		var temp=document.getElementById("d1"+id);
		deptname.value=$(temp).html();
		var lid=document.getElementById("lid");
		lid.value=name;
		var deptid=document.getElementById("dtid");
		deptid.value=id;
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li><a href="Institutional_level">机构级别维护</a></li>
			<li>部门信息管理</li>
		</ol>
		<h1>部门信息管理</h1>
	</div>
	<div id="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p>
						<a id="btntext" type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil"></i>添加部门信息</a>
						</p>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>部门名称</th>
									<th>级别名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<#list deptinfo as info>
								<tr>
								<td id="d1#{info.id}"><#if info??&&info.deptName??>${info.deptName?html}</#if></td>
								<td><#if deptlevel??&&deptlevel.name??>${deptlevel.name?html}</#if></td>
								<td>
									<a id="#{info.id}"name="#{deptlevel.id}" type="button" onclick="change(this.id,this.name);" value="修改" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals"><i class="fa fa-pencil"></i>修改</a> 
									
									<a href="delete_dept_info?action=delete&levelid=#{deptlevel.id}&deptid=#{info.id}" class="btn btn-success btn-sm" onclick="return confirm();"><i class="fa fa-pencil"></i>删除</a>
								</td>
								</tr>
								</#list>
							</tbody>
						</table>					
					</div>
				</div>
			</div>
		</div>
	</div><!-- contatiner -->
	
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
               添加部门信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="dept_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						<div class="form-group">
							<#if info??>
									<input type="hidden" name="deptid" value="#{info.id}"> 
								</#if>
							<#if deptlevel??>
									<input type="hidden" name="levelid" value="#{deptlevel.id}" >
								</#if>
							<div class="validate-block">
								
								<label class="col-sm-3 control-label">部门名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="deptname" class="form-control" required="required" <#if info?? && info.deptName??>value="${info.deptName?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							`	
								<div class="validate-block">
								<label class="col-sm-3 control-label">所属级别</label>
								<div class="col-sm-6">
									<input type="text" name="level" class="form-control" required="required" <#if deptlevel??&&deptlevel.name??>value="${deptlevel.name?html}"</#if>>
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
               修改部门信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="dept_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley('validate');">
							
						<div class="form-group">
						<input type="hidden" name="deptid" id="dtid">
						<input type="hidden" name="levelid" id="lid">
							<div class="validate-block">
								<label class="col-sm-3 control-label">部门名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="deptname" id="deptname" class="form-control" required="required" <#if info??&&info.deptName??>value="${info.deptName?html}"</#if>>
							    </div> 
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">所属级别：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="level" id="level" class="form-control" required="required" <#if deptlevel?? && deptlevel.name??>value="${deptlevel.name?html}"</#if>>
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