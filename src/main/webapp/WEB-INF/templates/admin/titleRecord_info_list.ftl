<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="职称聘任管理">

	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>职称聘任管理</li>
		</ol>
		<h1>职称聘任管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-body">
					<a href="TitleRecord_info_edit" type="button" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>添加职称信息</a> 
					<hr>
					<form id="form2" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-md-1 control-label" style="width:auto"><strong>关键字</strong></label>
							<div class="col-md-5">
								<input type="text" name="searchword" required="required" class="form-control" placeholder="请输入名字或编号" <#if searchword??>value="${searchword?html}"</#if>>
							</div>
							<div class="col-md-2">
								<button class="btn btn-sm btn-primary" type="submit"><i class="fa fa-search"></i>查找</button>
							</div>
						</div>
					</form>
					<hr>
					<table class="table table-condensed" >
						<thead>
							<tr>
								
								<th>员工id</th>
								<th style="width:30%">聘任职称</th>
								<th style="width:30%">聘任时间</th>
								<th style="width:180px">操作</th>
							</tr>
						</thead>
						<#list titleRecordList as titleRecord>
						<tbody>
							<tr>
								
								<td><#if titleRecord.employeeid??>${titleRecord.employeeid?html}</#if></td>
								<td><#if titleRecord.titlename??>${titleRecord.titlename?html}</#if></td>
								<td><#if titleRecord.titletime??>${titleRecord.titletime?string("yyyy-MM-dd")}</#if></td>
								<td>
									<a href="TitleRecord_info_edit?tcid=#{titleRecord.id}" type="button" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>修改</a>
									<a href="TitleRecord_info_list_edit.do?action=delete&tcid=#{titleRecord.id}" onclick="return confirm();" class="btn btn-default btn-sm"><i class="fa fa-times"></i>删除</a>
								</td>
							</tr>
						</tbody>
						</#list>
					</table>
				</div>
				<div class="panel-footer">
				</div>
			</div>
		</div>
	</div>
</@main.page>