<#import "admin_frame.ftl" as main>
<@main.page title="职称聘任管理">
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
			<li>职称聘任管理</li>
		</ol>
		<h1>职称聘任管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if titleRecord??>修改<#else>添加</#if>职称信息
					</div>
					<div class="panel-body">
						<form id="form2" class="form-horizontal row-border" action="TitleRecord_info_edit.do" method="post" data-validate='parsley' onsubmit="$('#form2').parsley('validate')">
							<div class="form-group">
								<#if employee??>
									<input type="hidden" name="employeeid" value=#{employee.id}>
								</#if>
								<#if titleRecord??>
									<input type="hidden" name="trid" value=#{titleRecord.id}>
								</#if>
								<div class="validate-block">
									<label class="col-md-2 control-label">用户选择</label>
									<div class="col-md-2">
										<input type="text" name="username" class="form-control" required="required" <#if employee??&&employee.name??>value="${employee.name?html}"</#if>>
									</div>
									<a href="TitleRecord_info_user_select" class="btn btn-success btn-sm" id="nameselect" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
								</div>
							</div>	
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-2 control-label">聘任职称</label>
									<div class="col-md-2">
										<input type="text" name="title" class="form-control" required="required" <#if titleRecord??&&titleRecord.titlename??>value="${titleRecord.titlename?html}"</#if>>
									</div>
								</div>
							</div>					
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-2 control-label">聘任时间</label>
									<div class="col-md-2">
										<input type="text" name="titletime" class="date-picker form-control" required="required" <#if titleRecord??&&titleRecord.titletime??>value="${titleRecord.titletime?string("yyyy-MM-dd")}"</#if>>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-3 col-sm-offset-5">
								
									<button class="btn btn-primary" onclick="$('#form2').submit();">保存</button>
									<a href="javascript:;" onclick="history.go(-1);" class="btn btn-default">取消</a>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>