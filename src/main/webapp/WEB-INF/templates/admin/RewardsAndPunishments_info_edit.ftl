<#import "admin_frame.ftl" as main>
<@main.page title="奖惩管理">
<#assign html_other_script in main>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
	<script>
		$(function(){
			$(".date-picker").datepicker({
				format: "yyyy-mm-dd",
				language: "zh-CN",
				autoclose: true
			});
			var ename=$('#ename').val();
			if(ename){
				$('#nameselect').hide();
			}
		});
		function show(){
			var jclx=$("#jclx").val();
			if(jclx=="0"){
				$("#rewards").show();
				$("#punishments").hide();
			}else if(jclx=="1"){
				$("#punishments").show();
				$("#rewards").hide();
			}else{
				$("#punishments").show();
				$("#rewards").show();
			}
		}
	</script>
</#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>奖惩管理</li>
		</ol>
		<h1>奖惩管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if rewardsAndPunishments??>修改<#else>添加</#if>奖惩信息
					</div>
					<div class="panel-body">
							<form id="form2" class="form-horizontal row-border" action="rewardsAndpunishments_info_edit.do"
								method="post" data-validate='parsley' onsubmit="$('#form2').parsley('validate')">
								<div class="form-group">
									<#if employee??>
										<input type="hidden" name="employeeid" value=#{employee.id} >
									</#if>
									<#if rewardsAndPunishments??>
										<input type="hidden" name="rpid" value=#{rewardsAndPunishments.id}>
									</#if>
									<div class="validate-block">
										<label class="col-sm-3 control-label">获奖人员</label>
											<div class="col-sm-3">
												<#if rewardsAndPunishments??>
												<input type="text" name="ename" id="ename" class="form-control" required="required" <#if rewardsAndPunishments.rewardsuser??> value="${rewardsAndPunishments.rewardsuser?html}"</#if>>
												<#else>
												<input type="text" name="ename" id="ename" class="form-control" required="required" <#if employee??&&employee.name??> value="${employee.name?html}"</#if>>
												</#if>
											</div>
										<a href="RewardsAndPunishment_user_select" id="nameselect" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>请选择员工姓名</a>
									</div>
								</div>
								
								<div class="form-group">
									<div class="validate-block">
										<label class="col-sm-3 control-label">奖惩标题</label>
										<div class="col-sm-3">
											<input type="text" name="title" class="form-control" required="required" <#if rewardsAndPunishments??&&rewardsAndPunishments.rewardstitle??> value="${rewardsAndPunishments.rewardstitle?html}"</#if>>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="validate-block">
										<label class="col-sm-3 control-label">奖惩类型</label>
											<div class="col-sm-3">
												<select name="jclx" class="form-control" onchange="show();" id="jclx">
													<option value="">请选择奖惩</option>
													<option value="0" >奖励</option>
													<option value="1" >处罚</option>
												</select>
											</div>
									<div class="col-sm-3" id="rewards">
										<select name="rewards" class="form-control">
											<option value="">奖励类型</option>
											<option value="1" <#if rewards??&&rewards=="1">selected</#if>>嘉奖</option>
											<option value="2" <#if rewards??&&rewards=="2">selected</#if>>记功</option>
											<option value="3" <#if rewards??&&rewards=="3">selected</#if>>记大功</option>
											<option value="4" <#if rewards??&&rewards=="4">selected</#if>>升级</option>
											<option value="5" <#if rewards??&&rewards=="5">selected</#if>>晋升</option>
											<option value="6" <#if rewards??&&rewards=="6">selected</#if>>破格晋升</option>
										</select>
									</div>
									<div class="col-sm-3" id="punishments">
										<select name="punishments" class="form-control">
											<option value="">处罚类型</option>
											<option value="7" <#if punishments??&&punishments=="7">selected</#if>>警告</option>
											<option value="8" <#if punishments??&&punishments=="8">selected</#if>>记过</option>
											<option value="9" <#if punishments??&&punishments=="9">selected</#if>>记大过</option>
											<option value="10" <#if punishments??&&punishments=="10">selected</#if>>降级</option>
											<option value="11" <#if punishments??&&punishments=="11">selected</#if>>撤职</option>
											<option value="12" <#if punishments??&&punishments=="12">selected</#if>>开除</option>
										</select>
									</div>
								</div>
							</div>
								
							<div class="form-group">
								<div class="validate-block">
									<label class="col-md-3 control-label">奖惩内容</label>
									<div class="col-md-3">
										<textarea class="form-control" name="content" rows="4" cols="20" required="required" ><#if rewardsAndPunishments??&&rewardsAndPunishments.rewardscontext??> ${rewardsAndPunishments.rewardscontext?html}</#if></textarea>
									</div>
								</div>
							</div>
								
							<div class="form-group">
							<div class="validate-block">
								<label class="col-md-3 control-label">奖惩时间</label>
								<div class="col-md-3">
									<input type="text" class="date-picker form-control" name="rptime" required="required" <#if rewardsAndPunishments??&&rewardsAndPunishments.rewardstime??> value="${rewardsAndPunishments.rewardstime?string("yyyy-MM-dd")}"</#if>>
								</div>
							</div>
						</div>			
										
							</form>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-3 col-sm-offset-5">
								<button class="btn btn-primary" onclick="$('#form2').submit();">保存</button>
								<a href="javascript:;" class="btn btn-default" onclick="history.go(-1);">取消</a>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</@main.page>