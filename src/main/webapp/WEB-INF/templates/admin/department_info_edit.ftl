<#import "admin_frame.ftl" as main>
<@main.page title="添加部门信息">
	<div id="page-heading">
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
				<li><a href="Institution_level">机构级别维护</a></li>
				<li><a href="department_info">部门信息管理</a></li>
				<li>添加部门信息</li>
			</ol>
		<h1><#if info??>修改<#else>添加</#if>部门信息</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<#if info??>修改<#else>添加</#if>部门信息
					</div>
					<div class="panel-body">
						<form id="validate-form" class="form-horizontal row-border" action="dept_info_edit.do" data-validate='parsley'
							onsubmit="return $('validate-form').parsley('validate');">
							<div class="form-group">
							<#if info??>
								<input type="hidden" name="deptid" value=#{info.id} >
							</#if>
							
							<div class="validate-block">
								<label class="col-sm-3 control-label">部门名称</label>
								<div class="col-sm-6">
									<input type="text" name="deptName" class="form-control" required="required" <#if info??&&info.deptName??>value="${info.deptName?html}"</#if>>
								</div>
							</div>
							</div>
							<div class="form-group">
							`	<#if deptinfo??>
									<input type="hidden" name="levelid" value=#{deptinfo.id} >
								</#if>
								<div class="validate-block">
								<label class="col-sm-3 control-label">所属级别</label>
								<div class="col-sm-6">
									<input type="text" name="level" class="form-control" required="required" <#if deptinfo??&&deptinfo.name??>value="${deptinfo.name?html}"</#if>>
								</div>
							</div>
							</div>
							
						</form> 
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="btn-toolbar">
								<button class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
								<a href="javascript:;" onclick="history.go(-1);" class="btn btn-default">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>