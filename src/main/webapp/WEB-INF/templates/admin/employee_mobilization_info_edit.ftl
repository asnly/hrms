<#import "admin_frame.ftl" as main>
<@main.page title="员工调动信息管理">
<#assign html_other_script in main>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script>
		$(function(){
			$(".date-picker").datepicker({
				format: "yyyy-mm-dd",
				language: "zh-CN",
				autoclose: true
			});
			$("#aftert").hide();
			$("#transferType").hide();
		});
		$("#btn1").click(function(){
			$("#afterdepartment").hide();
			$("#aftert").show();
			$("#btn1").hide();
		})
		$("#btn2").click(function(){
			$("#tType").hide();
			$("#transferType").show();
			$("#btn2").hide();
		})
	</script>
</#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>员工调动信息管理</li>
		</ol>
		<h1>员工调动信息管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if transferinfo??>修改<#else>添加</#if>员工调动信息
					</div>
					<div class="panel-body">
						<form id="form2" class="form-horizontal row-border" method="post" action="employee_mobilization_info_edit.do"
							data-validate="parsley" onsubmit="$('#form2').parsley('validate')">
							<div class="form-group">
							<#if transferinfo??>
								<input type="hidden" name="tid" value=#{transferinfo.id} >
							</#if>
							<#if employee??>
								<input type="hidden" name="eid" value=#{employee.id} >
							</#if>
								<div class="validate-block">
									<label class="col-md-2 control-label">员工姓名</label>
									<div class="col-md-3">
										<input type="text" class="form-control" name="username" required="required" <#if employee??&&employee.name??>value="${employee.name?html}"</#if> />
										<a href="employee_mobilization_user_info" class="btn btn-success btn-sm" id="usernameselect" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
									</div>
								</div>
								
								<div class="validate-block">
									<label class="col-md-2 control-label">调动前部门</label>
									<div class="col-md-3">
										<input type="text" class="form-control" name="beforeDept" required="required" <#if employee??&&employee.department??>value="${employee.department?html}"</#if>/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-2 control-label">调动后部门</label>
									<div class="col-md-3">
										
										<#if transferinfo??>
											
											<input type="text" class="form-control" name="afterdept" id="afterdepartment"  <#if transferinfo.afterdept??>value="${transferinfo.afterdept?html}"</#if> />
											<button type="button" class="btn btn-default btn-sm" id="btn1">修改</button>
											<select name="afterDept" id="aftert" class="form-control">	
											<option value="">请选择部门</option>
											<#list deptInfoMap?keys as key>
												<option value="${deptInfoMap[key]}">${deptInfoMap[key]}</option>
											</#list>
										</select>
											
											<#else>
											<select name="afterDept" class="form-control">	
											<option value="">请选择部门</option>
											<#list deptInfoMap?keys as key>
												<option value="${deptInfoMap[key]}">${deptInfoMap[key]}</option>
											</#list>
										</select>
										</#if>
									</div>
								</div>
								
								<div class="validate-block">
									<label class="col-md-2 control-label">调动前职务</label>
									<div class="col-md-3">
										<input type="text" class="form-control" name="beforeJob" required="required" <#if employee??&&employee.position??>value="${employee.position?html}"</#if>/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-2 control-label">调动后职务</label>
									<div class="col-md-3">
										<input type="text" class="form-control" name="afterJob" required="required" <#if transferinfo??&&transferinfo.afterposition??>value="${transferinfo.afterposition?html}"</#if> />
									</div>
								</div>
								<div class="validate-block">
									<label class="col-md-2 control-label">调动原因</label>
									<div class="col-md-3">
										<textarea name="reason" class="form-control"  rows="5" cols="50" style="resize:none"><#if transferinfo??&&transferinfo.reason??>${transferinfo.reason}</#if></textarea> 
										<#--<input type="text" class="form-control" name="reason" required="required" /> -->
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-2 control-label">调动类型</label>
									<div class="col-md-3">
										<#if transferinfo??>
											<input type="text" class="form-control" name="tType" id="tType" <#if transferinfo.type??>value="${transferinfo.type?html}"</#if>>
											<button type="button" class="btn btn-sm btn-default" id="btn2">修改</button>
											<select name="transferType" id="transferType" class="form-control">
											<option value="">请选择类型</option>
											<option value="调职">调职</option>
											<option value="任用">任用</option>
											<option value="升职">升职</option>
											<option value="降职">降职</option>
											<option value="免职">免职</option>
											<option value="复职">复职</option>
											<option value="借调">借调</option>
											<option value="兼职">兼职</option>
										</select>
											<#else>
											<select name="transferType" class="form-control">
											<option value="">请选择类型</option>
											<option value="调职">调职</option>
											<option value="任用">任用</option>
											<option value="升职">升职</option>
											<option value="降职">降职</option>
											<option value="免职">免职</option>
											<option value="复职">复职</option>
											<option value="借调">借调</option>
											<option value="兼职">兼职</option>
										</select>
										</#if>
										
									</div>
								</div>
								<div class="validate-block">
									<label class="col-md-2 control-label">调动时间</label>
									<div class="col-md-3">
										<input type="text" class="date-picker form-control" name="transferTime" required="required" <#if transferinfo??&&transferinfo.transfertime??>value="${transferinfo.transfertime?string("yyyy-MM-dd")}"</#if> />
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer">
						<button class="btn btn-primary" onclick="$('#form2').submit();">保存</button>
						<a href="javascript:;" class="btn btn-default" onclick="history.go(-1);">取消</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>