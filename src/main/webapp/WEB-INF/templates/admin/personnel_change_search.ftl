<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>

<@main.page title="人事变动查询">
<#assign filterUrl><#if transferType??>&transferType=${transferType}</#if><#if allocationsearch??>&allocationsearch=${allocationsearch}</#if></#assign>

	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>人事变动查询</li>
		</ol>
		<h1>人事变动查询</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="panel panel-primary">
				
				<div class="panel-body">
					<form id="form2" action="personnel_change_search" class="form-horizontal" role="form">
					
					<div class="form-group">
						<label class="col-md-1 control-label" style="width:auto"><strong>调动类型</strong></label>
						<div class="col-md-2">
							<select name="transferType" class="form-control">
											<option value="">请选择类型</option>
											<option value="调职" <#if transferType??&&transferType=="调职">selected</#if>>调职</option>
											<option value="任用" <#if transferType??&&transferType=="任用">selected</#if>>任用</option>
											<option value="升职" <#if transferType??&&transferType=="升职">selected</#if>>升职</option>
											<option value="降职" <#if transferType??&&transferType=="降职">selected</#if>>降职</option>
											<option value="免职" <#if transferType??&&transferType=="免职">selected</#if>>免职</option>
											<option value="复职" <#if transferType??&&transferType=="复职">selected</#if>>复职</option>
											<option value="借调" <#if transferType??&&transferType=="借调">selected</#if>>借调</option>
											<option value="兼职" <#if transferType??&&transferType=="兼职">selected</#if>>兼职</option>
							</select>
						</div>
						<label class="col-md-1 control-label" style="width:auto"><strong>查询人事调配信息</strong></label>
						<div class="col-md-3">
							<input type="text" name="allocationsearch" class="form-control"  placeholder="输入员工姓名或员工id" <#if allocationsearch??>value="${allocationsearch?html}"</#if> />
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-md btn-primary"><i class="fa fa-search"></i>查询</button>
						</div>
						
					</div>
				</form>
				<div id="div2">
				<table class="table table-condended">
					<thead>
						<tr>
							<th>姓名</th>
							<th>调动部门</th>
							<th>调动职务</th>
							<th>调动类型</th>
							<th>调动时间</th>
						</tr>
					</thead>
					<#list TransferInfoList as transferInfo>
					<tbody>
						<tr>
							<td><#if employee??&&employee.name??>${employee.name?html}</#if></td>
							<td><#if transferInfo??&&transferInfo.afterdept??>${transferInfo.afterdept?html}</#if></td>
							<td><#if transferInfo??&&transferInfo.afterposition??>${transferInfo.afterposition?html}</#if></td>
							<#--<td><#if titleRecord??&&titleRecord.titlename??>${titleRecord.titlename?html}</#if></td>-->
							<td><#if transferInfo??&&transferInfo.type??>${transferInfo.type?html}</#if></td>
							<td><#if transferInfo??&&transferInfo.transfertime??>${transferInfo.transfertime?string("yyyy-MM-dd")}</#if></td>
						</tr>
					</tbody>
					</#list>
				</table>
				<#assign currentUrl>personnel_change_search?_t=1${filterUrl!}</#assign>
				<@pager.pageul pagination=pagination url="${currentUrl}" />
				</div>
				</div>
				
			</div>
		</div>
	</div>
</@main.page>