<#import "admin_frame.ftl" as main>
<@main.page title="员工证书记录">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>员工证书记录</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>姓名</th>
									<th>证书名称</th>
									<th>证书号</th>
									<th>发证单位</th>
									<th>证书日期</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</@main.page>