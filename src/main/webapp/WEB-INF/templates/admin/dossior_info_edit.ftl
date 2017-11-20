<#import "admin_frame.ftl" as main>
<@main.page title="员工档案管理">
<script type="text/javascript">
	$(function(){
		var employeename=$("#employeename").val();
		alert(employeename);
		if(employeename){
			$("#usernameselect").hide();
		}
	})
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
					<div class="panel-heading">
						<#if dossior??>修改<#else>添加</#if>档案信息
					</div>
					<div class="panel-body">
						<form id="validate-form" class="form-horizontal row-border" action="dossior_info_edit.do" method="post" 
						data-validate='parsley' onsubmit="return $('#validate-form').parsley('validate');">
							<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">员工姓名</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" required="required" id="employeename" name="employeename" <#if employee??&&employee.name??>value="${employee.name?html}"</#if>>
								</div>
								<a href="username_info_select" id="usernameselect" class="btn btn-success btn-sm" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
							</div>
						</div>
						<div class="form-group">
							<#if dossior??>
							<input type="hidden" name="dossiorid" id="dossiorid" value="#{dossior.id}">
							</#if>
							<#if employee??>
								<input type="hidden" name="employeeid" value="#{employee.id}">
							</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">档案号码：</label>
							    <div class="col-sm-3">
							    	<input type="text" name="num" class="form-control" required="required" <#if dossior?? && dossior.dossiernum??>value="${dossior.dossiernum?html}"</#if>>
							    </div>
						    </div>
						</div>
								
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">所属部门：</label>
							    <div class="col-sm-3">
							    	<#if dossior??>
							    		<input type="text" class="form-control" name="Ddept" value="${dossior.department?html}" />
							    		<button type="button"
							    	<#else>
							    	</#if>
							    	<#if employee??>
							    		<input type="text" class="form-control" value="${employee.department?html}"/>
							    	</#if>
							    	<select name="DeptId"  class="form-control" >
										<option value="">选择部门</option>
										<#list deptInfoMap?keys as key>
										<option value="${key}">${deptInfoMap[key]}</option>
										</#list>
									</select>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">档案名字：</label>
								<div class="col-sm-3">
									<input type="text" name="designation" class="form-control" required="required" <#if dossior??&&dossior.designation??> value="${dossior.designation?html}" </#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">内容摘要：</label>
							    <div class="col-sm-3">
							    	<input type="textarea" name="context" class="form-control"  required="required" <#if dossior??&&dossior.context??>value="${dossior.context?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">备注</label>
								<div class="col-sm-3">
									<input type="text" name="remark" class="form-control" retuired="required" <#if dossior??&&dossior.remark??>value="${dossior.remark?html}"</#if>>
								</div>
							</div>
						</div>
						
									
						</form>	
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-3 col-sm-offset-5">
								<button class="btn btn-primary" onclick="$('#validate-form').submit();">保存</button>
								<a href="javascript:;" class="btn btn-default" onclick="history.go(-1);">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>