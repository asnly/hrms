<#import "admin_frame.ftl" as main>

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
<@main.page title="培训详情">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>培训详情</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel panel-body">
						<form id="form2" class="form-horizontal" action="training_base_info.do" method="post" data-validate="parsley" 
							onsubmit="$("#form2").parsley('validate');">
							<div class="form-group">
								<#if trainigRecord??>
									<input type="hidden" class="form-control" name="trid" value=#{trainigRecord.id} >
								</#if>
								<div class="validate-block">
									<label class="col-sm-2 control-label">培训类别</label>
									<div class="col-sm-2">
										<input type="text" name="type" class="form-control" <#if trainigRecord??&&trainigRecord.category??>value="${trainigRecord.category?html}"</#if> />
									</div>
								</div>
								<div class="validate-block">
											<label class="col-sm-2 control-label">培训性质</label>
											<div class="col-sm-2">
												<input type="text" name="nature" class="form-control" <#if trainigRecord??&&trainigRecord.nature??>value="${trainigRecord.nature?html}"</#if>>
											</div>
									</div>
									
							</div>
							<hr>
							<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-2 control-label">科目名称</label>
									<div class="col-sm-2">
										<input type="text" name="subject" class="form-control" <#if trainigRecord??&&trainigRecord.subject??>value="${trainigRecord.subject?html}"</#if>>
									</div>
								</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label">培训名称</label>
									<div class="col-sm-2">
										<input type="text" name="trainName" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.name??>value="${trainigRecord.name?html}"</#if> >
									</div>
								</div>
							</div>
							<hr>
							<div class="form-group">
								
								
								<div class="validate-block">
									<label class="col-sm-2 control-label">费用</label>
									<div class="col-sm-2">
										<input type="text" name="price" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.price??>value="${trainigRecord.price?html}"</#if> >
									</div>
								</div>
								
								<div class="validate-block">
									<label class="col-sm-2 control-label">总费用</label>
									<div class="col-sm-2">
										<input type="text" name="totalprice" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.totalprice??>value="${trainigRecord.totalprice?html}"</#if> >
									</div>
								</div>
							</div>
							
							<hr>
							<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-2 control-label">培训教师</label>
									<div class="col-sm-2">
										<input type="text" name="teacher" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.teacher??>value="${trainigRecord.teacher?html}"</#if>>
									</div>
								</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label">课时</label>
									<div class="col-sm-2">
										<input type="text" name="classinfo" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.classinfo??>value="${trainigRecord.classinfo?html}"</#if>>
									</div>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-2 control-label">地点</label>
									<div class="col-sm-2">
										<input type="text" name="location"	class="form-control" required="required" <#if trainigRecord??&&trainigRecord.location??>value="${trainigRecord.location?html}"</#if>>
									</div>
								</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label"> 主办单位</label>
									<div class="col-sm-3">
										<input type="text" name="sponsor"	class="form-control" required="required" <#if trainigRecord??&&trainigRecord.organizer??>value="${trainigRecord.organizer?html}"</#if>>
									</div>
								</div>
							</div>
							<hr>
							
							<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-2 control-label">培训方式</label>
									<div class="col-sm-2">
										<input type="text" name="method"	class="form-control" required="required" <#if trainigRecord??&&trainigRecord.methods??>value="${trainigRecord.methods?html}"</#if>>
									</div>
								</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label">负责人姓名</label>
									<div class="col-sm-2">
										<input type="text" name="principal"	class="form-control" required="required" <#if trainigRecord??&&trainigRecord.nameofpersonincharge??>value="${trainigRecord.nameofpersonincharge?html}"</#if>>
									</div>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-2 control-label">开始时间</label>
									<div class="col-sm-2">
										<input type="text" name="starttime"	class="date-picker form-control" required="required" <#if trainigRecord??&&trainigRecord.starttime??>value="${trainigRecord.starttime?string("yyyy-MM-dd")}"</#if>>
									</div>
								</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label">结束时间</label>
									<div class="col-sm-2">
										<input type="text" name="endtime"  class="date-picker form-control" required="required" <#if trainigRecord??&&trainigRecord.endtime??>value="${trainigRecord.endtime?string("yyyy-MM-dd")}"</#if>>
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