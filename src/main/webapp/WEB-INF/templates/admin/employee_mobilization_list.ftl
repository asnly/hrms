<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>

<@main.page title="员工调动信息管理">
<script>
	function confirmSend(){
		return window.confirm("你确定要删除吗");
		
	}
</script>
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
					<div class="panel panel-body">
					<a href="employee_mobilization_info_edit" class="btn btn-success btn-sm" type="button"><i class="fa fa-pencil"></i>添加员工调动信息</a>
					</hr>
					<table class="table table-condended">
						<thead>
							<tr>
							<th>员工编号</th>
							<th>调动前部门</th>
							<th>调动后部门</th>
							<th>调动前职务</th>
							<th>调动后职务</th>
							<th>调动类型</th>
							<th>调动原因</th>
							<th>调动时间</th>
							<th>操作</th>
							</tr>
						</thead>
						<#list TransferInformationList as TransferInformation>
						<tbody>
							<tr>
								<td><#if TransferInformation.employeeid??>${TransferInformation.employeeid?html}</#if></td>
								<td><#if TransferInformation.beforedept??>${TransferInformation.beforedept?html}</#if></td>
								<td><#if TransferInformation.afterdept??>${TransferInformation.afterdept?html}</#if></td>
								<td><#if TransferInformation.beforeposition??>${TransferInformation.beforeposition?html}</#if></td>
								<td><#if TransferInformation.afterposition??>${TransferInformation.afterposition?html}</#if></td>
								<td><#if TransferInformation.type??>${TransferInformation.type?html}</#if></td>
								<td><#if TransferInformation.reason??>${TransferInformation.reason?html}</#if></td>
								<td><#if TransferInformation.transfertime??>${TransferInformation.transfertime?string("yyyy-MM-dd")}</#if></td>
								<td>
									<a href="employee_mobilization_info_edit?tid=#{TransferInformation.id}" class="btn btn-sm btn-success"><i class="fa fa-pencil"></i>修改</a>
									<a href="employee_mobilization_list_edit?action=delete&tid=#{TransferInformation.id}" class="btn btn-sm btn-default" onclick="return confirmSend();"><i class="fa fa-times"></i>删除</a>
								</td>
							</tr>
						</tbody>
						</#list>
					</table>
					<#assign currentUrl>employee_mobilization_list?_t=1&</#assign>
					<@pager.pageul pagination=pagination url="${currentUrl}" />
				</div>
				</div>
				
			</div>
		</div>
	</div>
</@main.page>