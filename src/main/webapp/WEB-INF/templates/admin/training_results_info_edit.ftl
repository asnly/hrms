<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>

<@main.page title="培训人员及成绩">
	<div id="page-heading">
		<ol class="breadcrumb">
			<Li><a href="index">首页</a></li>
			<li>培训人员与成绩</li>
		</ol>
	</div>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<#if trainersinfo??>修改<#else>添加</#if>培训人员与成绩
				</div>
				<div class="panel-body">
					<form id="form2" class="form-horizontal row-border" action="training_results_info_edit.do"
						method="post" data-validate='parsley' onsubmit="$('#form2').parsley('validate')">
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">员工姓名</label>
								<div class="col-sm-3">
								<input type="text" name="ename" class="form-control" required="required" <#if employee??&&employee.name??>value="${employee.name?html}"</#if>>
								</div>
								<a href="Training_results_info_user" id="usernameselect" class="btn btn-success btn-sm" value="选择员工姓名"><i class="fa fa-pencil"></i>选择员工姓名</a>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								 <label class="col-sm-3 control-label">培训类别</label>
								 <div class="col-sm-2">
										<select name="pxlb" class="form-control">
											<option value="">请选择培训类别</option>
											<#list tcMap?keys as key>
												<option value="${tcMap[key]}">${tcMap[key]}</option>
											</#list>
										</select>
									</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">培训科目</label>
							<div class="col-sm-2">
								<select name="pxmc" class="form-control">
									<option value="">选择培训科目</option>
									<#list tcSubject?keys as key>
												<option value="${tcSubject[key]}">${tcSubject[key]}</option>
											</#list>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">成绩</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" required="required" />
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
</@main.page>