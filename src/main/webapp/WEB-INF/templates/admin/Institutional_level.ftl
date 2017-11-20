<#import "admin_frame.ftl" as main>
<@main.page title="级别信息维护">
<script>
	function change(id){
		var num=document.getElementById("deptLevelname");
		var temp=document.getElementById("p"+id);
		num.value=$(temp).html();
		var status=document.getElementById("status");
		var temp=document.getElementById("n"+id);
		status.value=$(temp).html();
		var deptlevelid=document.getElementById("dlevelid");
		deptlevelid.value=id;
		
	}
	function confirmSend(){
		return window.confirm("你确定要删除吗?");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>机构级别维护</li>
		</ol>
		<h1>机构级别维护</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p>
							<a id="btntext" type="button" value="添加部门级别信息" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil">添加部门级别信息</i></a>
						</p>
						
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>级别名称</th>
									<th>级别状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<#list deptLevelInfoList as deptLevelInfo>
									<tr>
										<td id="p#{deptLevelInfo.id}"><#if deptLevelInfo.name??>${deptLevelInfo.name?html}</#if></td>
										<td id="n#{deptLevelInfo.id}"><#if deptLevelInfo.status??>${deptLevelInfo.status?html}</#if></td>
										<td>
											<a href="department_info?levelid=#{deptLevelInfo.id}" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>添加部门信息</a>
											<input id="#{deptLevelInfo.id}" type="button" onclick="change(this.id);" value="修改" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals"/>
											<a href="Institutional_level_edit?action=delete&deptlevelid=#{deptLevelInfo.id}" onclick="return confirmSend();" class="btn btn-success btn-sm"><i class="fa fa-times"></i>删除</a>
										</td>
									</tr>
								</#list>
							</tbody>
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
               添加机构信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="Institutional_level_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						<#--
						<div class="form-group">
							<#if departmentInfo??>
							<input type="hidden" name="deptid" value=#{departmentInfo.id}>
							</#if>					
							<div class="validate-block">
								<label class="col-sm-3 control-label">部门编号：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="num" class="form-control" required="required" <#if departmentInfo?? && departmentInfo.deptNum??>value="${departmentInfo.deptNum?html}"</#if>>
							    </div>
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">部门名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="deptname" class="form-control" required="required" <#if departmentInfo?? && departmentInfo.deptName??>value="${departmentInfo.deptName?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm"></label>
							</div>
						</div>
						-->
						<div class="form-group">
							<#if deptLevelInfo??>
								<input type="hidden" name="deptlevelid" value=#{deptLevelInfo.id}>
							</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">级别名称:</label>
								<div class="col-sm-6">
									<input type="text" name="deptLevelname" class="form-control" required="required"<#if deptLevelInfo??&&deptLevelInfo.name??> value="${deptLevelInfo.name?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">级别状态:</label>
							<div class="col-sm-6">
								<input type="text" name="status" class="form-control" required="required"<#if deptLevelInfo??&&deptLevelInfo.status??> value="${deptLevelInfo.status?html}"</#if>>
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
               修改机构信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="Institutional_level_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						<div class="form-group">
							
							<input type="hidden" name="deptlevelid" id="dlevelid">
											
							<div class="validate-block">
								<label class="col-sm-3 control-label">级别名称：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="deptLevelname" id="deptLevelname" class="form-control" required="required" <#if deptLevelInfo?? && deptLevelInfo.name??>value="${deptLevelInfo.name?html}"</#if>>
							    </div>
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">级别状态：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="status" id="status" class="form-control" required="required" <#if deptLevelInfo?? && deptLevelInfo.status??>value="${deptLevelInfo.deptName?html}"</#if>>
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