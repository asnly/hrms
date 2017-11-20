<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="合同管理">
<#assign html_other_script in main>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script>
		$(function(){
			$(".date-picker").datepicker({
				format:"yyyy-mm-dd",
				language:"zh-CN",
				autoclose:true
			})
		})
	</script>
</#assign>
<div id="page-heading">
	<ol class="breadcrumb">
		<li><a href="index">首页</a></li>
		<li>合同管理</li>
	</ol>
	<h1>合同管理</h1>
</div> 

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<#if contract??>修改<#else>添加</#if>合同信息
				</div>
				<div class="panel-body">
					<form id="form2" class="form-horizontal row-border" method="post" action="contract_info_edit.do"
					data-validate='parsley' onsubmit="$('#form2').parsley('validate')">
					<div class="form-group">
						
						<div class="validate-block">
							<label class="col-md-2 control-label">员工姓名</label>
							<div class="col-md-3">
								<input type="text" name="username" class="form-control" required="required" <#if employee??&&employee.name??>value="${employee.name?html}"</#if>/>
								<a href="contract_user_info" class="btn btn-success btn-sm" id="usernameselect" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
							</div>
							
						</div>
						<div class="validate-block">
						
							<label class="col-md-2 control-label">合同编号</label>
							<div class="col-md-3">
								<input type="text" name="contractnum" class="form-control" required="required" <#if contract??&&contract.contractnum??>value="${contract.contractnum?html}"</#if>/>
							</div>
						</div>
					</div>
					<div class="form-group">
					<#if employee??>
							<input type="hidden" name="employeeid" value=#{employee.id} />
						</#if>
						<#if contract??>
							<input type="hidden" name="contractid" value=#{contract.id} />
						</#if>
						<div class="validate-block">
							<label class="col-md-2 control-label">岗位</label>
							<div class="col-md-2">
								<input type="text" name="quarters" class="form-control" required="required" <#if contract??&&contract.quarters??>value="${contract.quarters?html}"</#if> />
							</div>
						</div>
						<div class="validate-block">
							<label class="col-md-2 control-label">合同内容</label>
							<div class="col-md-2">
								<textarea name="context"  style="width:400px;height:200px;resize:none" required="required"><#if contract??&&contract.content??>${contract.content?html}</#if></textarea>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="validate-block">
							<label class="col-md-2 control-label">开始时间</label>
							<div class="col-md-2">
								<input type="text" class="date-picker form-control" name="begintime" required="required" <#if contract??&&contract.starttime??>value="${contract.starttime?string("yyyy-MM-dd")}"</#if>/>
							</div>
						</div>
						<div class="validate-block">
							<label class="col-md-2 control-label">结束时间</label>
							<div class="col-md-2">
								<input type="text" class="date-picker form-control" name="endtime" required="required" <#if contract??&&contract.endtime??>value="${contract.endtime?string("yyyy-MM-dd")}"</#if>/>
							</div>
						</div>
					</div>
					</form>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-sm-3 col-sm-offset-5">
							<div class="btn-toolbar">
								<button class="btn btn-primary" onclick="$('#form2').submit();">保存</button>
								<a href="javascript:;" class="btn btn-default" onclick="history.go(-1)">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</@main.page>