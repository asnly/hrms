<#import "admin_frame.ftl" as main>
<@main.page title="履历管理">
<#assign html_other_script in main>
<script type='text/javascript' src='${request.contextPath}/plugins/form-datepicker/js/locales/bootstrap-datepicker.zh-CN.js'></script>
<script type='text/javascript' src='${request.contextPath}/plugins/form-datepicker/js/bootstrap-datepicker.js'></script>

<script>
$(function(){
	$(".date-picker").datepicker({
		format:"yyyy-mm-dd",
		language:"zh-CN",
		autoclose:true
	});
});
</script>
</#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>履历管理</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if detail??>修改<#else>添加</#if>履历 
					</div>
					<div class="panel-body">
						<form id="validate-form" class="form-horizontal row-border" action="detail_info_edit.do" method="post"
						data-validate='parsley' onsubmit="return $('#validate-form').parsley('validate');">
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">员工姓名</label>
								<div class="col-sm-3">
								<input type="text" name="ename" class="form-control" required="required" <#if employee??&&employee.name??>value="${employee.name?html}"</#if>>
								</div>
								<a href="detail_username_select" id="usernameselect" class="btn btn-success btn-sm" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
							</div>
						</div>
						<div class="form-group">
							<#if employee??>
								<input type="hidden" name="employeeid" value=#{employee.id}>
							</#if>
							<#if detail??>
								<input type="hidden" name="detailid" value=#{detail.id}>
							</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">职位</label>
								<div class="col-sm-3">
									<input type="text" name="job" class="form-control" required="required" <#if detail??&&detail.job??>value="${detail.job?html}" </#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">工作部门</label>
								<div class="col-sm-3">
								<#if detail??>
								<input type="text" name="dept" class="form-control" required="required" <#if detail.department??>value="${detail.department?html}" </#if>>
								<#else>
								<input type="text" name="dept" class="form-control" required="required" <#if employee??&&employee.department??>value="${employee.department?html}"</#if>>
								</#if>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">工作内容</label>
								<div class="col-sm-3">
								<input type="text" name="content" class="form-control" id="content"required="required" <#if detail??&&detail.workcontent??> value="${detail.workcontent?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">任职日期</label>
							<div class="col-sm-3">
							<input type="text" name="appointmentdate" class="date-picker form-control" id="appointmentdate" required="required" <#if detail??&&detail.starttime??> value="${detail.starttime?string("yyyy-MM-dd")}"</#if>>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">业绩</label>
							<div class="col-sm-3">
								<textarea class="form-control" name="achievement" id="achievement" required="required" ><#if detail??&&detail.performance??>${detail.performance}</#if></textarea>
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