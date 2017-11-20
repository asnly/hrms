<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="履历管理">
<#assign filterUrl><#if searchword??>&searchword=${searchword}</#if></#assign>
<script>
	function confirmSend(){
		return window.confirm("你确定要删除吗");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>履历管理</li>
		</ol>
		<h1>履历管理</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p>
						<a href="detail_info_edit" class="btn btn-success btn-sm" type="button" value="添加履历信息"><i class="fa fa-pencil">添加履历信息</i></a>
						</p>
						<form action="detail_list" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-md-1 label-control" style="width:auto">关键词</label>
							<div class="col-md-5">
								<input type="text" name="searchword" class="form-control" placeholder="输入编号或姓名" <#if searchword??> value=${searchword?html}</#if>>
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-md btn-primary"><i class="fa fa-search"></i>查询</button>
							</div>
						</div>
						
						</form>
						<table class="table table-condensed">
							
							<thead>
								<tr>
									<th>员工编号</th>
									<th>职位</th>
									<th>工作部门</th>
									<th>工作内容</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>业绩</th>
									<th>操作</th>
								</tr>
							</thead>
							<#list detailList as detail>
							<tbody>
								<tr>
									<td><#if detail.employeeid??>${detail.employeeid?html}</#if></td>
									<td><#if detail.job??>${detail.job?html}</#if></td>
									<td><#if detail.department??>${detail.department?html}</#if></td>
									<td><#if detail.workcontent??>${detail.workcontent?html}</#if></td>
									<td><#if detail.starttime??>${detail.starttime?string("yyyy-MM-dd HH:mm:SS")}</#if></td>
									<td><#if detail.endtime??>${detail.endtime?string("yyyy-MM-dd HH:mm:SS")}</#if></td>
									<td><#if detail.performance??>${detail.performance?html}</#if></td>
									<td>
										<a href="detail_info_edit?detailid=#{detail.id}" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>修改</a>
										<a href="detail_info_list_edit.do?action=delete&detailid=#{detail.id}" class="btn btn-default btn-sm" onclick="return confirmSend();"><i class="fa fa-times"></i>删除</a>
									</td>
								</tr>
							</tbody>
							</#list>
						</table>
						<#assign currentUrl>detail_list?_t=1${filterUrl!}&</#assign>
						<@pager.pageul pagination=pagination url="${currentUrl}" />
					</div>
					
				</div>
			</div>
		</div>
	</div>
</@main.page> 