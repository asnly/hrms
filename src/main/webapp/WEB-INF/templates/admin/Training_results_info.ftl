<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>

<@main.page title="培训人员与成绩">
	<div id="page-heading">
		<ol class="breadcrumb">
			<Li><a href="index">首页</a></li>
			<li>培训人员与成绩</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a href="Training_results_info_edit" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>添加培训成绩信息信息</a>
						<hr>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>员工姓名</th>
									<th>培训类别</th>
									<th>培训名称</th>
									<th>成绩</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr></tr>
								<tr></tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>	
</@main.page>
