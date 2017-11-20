<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="合同管理">
<#assign filterUrl><#if searchword??>&searchword=${searchword}</#if></#assign>
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
					<div class="panel-body">
						<p>
						<a href="contract_info_edit" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>添加合同信息</a> 
						</p>
						<hr>
						<form id="form2" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-1 control-label" style="width:auto"><strong>关键字</strong></label>
								<div class="col-md-5">
									<input type="text" name="searchword" class="form-control" placeholder="请输入名字或编号" <#if searchword??>value="${searchword?html}"</#if>>
								</div>
								<div class="col-md-2">
								<button class="btn btn-md btn-primary" type="submit"><i class="fa fa-search"></i>查询</button>
								</div>
							</div>
						</form>
						<hr>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>员工编号</th>
									<th style="width:20%">合同编号</th>
									<th style="width:15%">岗位</th>
									<th style="width:100px">合同内容</th>
									<th style="width:100px">开始时间</th>
									<th style="width:100px">结束时间</th>
									<th style="width:150px">操作</th>
								</tr>
							</thead>
							<#list contractList as contract>
							<tbody>
								<tr>
									<td><#if contract.employeeid??>${contract.employeeid?html}</#if></td>
									<td><#if contract.contractnum??>${contract.contractnum?html}</#if></td>
									<td><#if contract.quarters??>${contract.quarters?html}</#if></td>
									<td><#if contract.content??><a href="contract_content_info_show?contractid=#{contract.id}" class="btn btn-primary btn-sm">查看</a></#if></td>
									<td><#if contract.starttime??>${contract.starttime?string("yyyy-MM-dd")}</#if></td>
									<td><#if contract.endtime??>${contract.endtime?string("yyyy-MM-dd")}</#if></td>
									<td>
										<a href="contract_info_edit?contractid=#{contract.id}" class="btn btn-success btn-sm"><i class="fa fa-sign-in"></i>修改</a>
										<a href="contract_list_edit.do?action=delete&contractid=#{contract.id}" class="btn btn-default btn-sm"><i class="fa fa-error"></i>删除</a>
									</td>
								</tr>
							</tbody>
							</#list>
						</table>
						<#assign currentUrl>Contract_list?_t=${filterUrl!}</#assign>
						<@pager.pageul pagination=pagination url="${currentUrl}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>