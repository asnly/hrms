<#import "admin_frame.ftl" as main>
<@main.page title="管理首页">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
		</ol>
		<h1>管理首页</li>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<a href="base_info" class="shortcut-tiles tiles-green">
									<div class="tiles-body">
										<div class="pull-left"><i class="fa fa-users"></i></div>
									</div>
									<div class="tiles-footer">
										人员档案
									</div>
								</a>
							</div>
							<div class="col-md-4">
								<a href="employee_mobilization_list" class="shortcut-tiles tiles-brown">
									<div class="tiles-body">
										<div class="pull-left"><i class="fa fa-arrows-h"></i></div>
									</div>
									<div class="tiles-footer">
										人事调配
									</div>
								</a>
							</div>
						
							<div class="col-md-4">
								<a href="trainingCategory_info" class="shortcut-tiles tiles-orange">
									<div class="tiles-body">
										<div class="pull-left"><i class="fa fa-trophy"></i></div>
									</div>
									<div class="tiles-footer">
										教育培训
									</div>
								</a>
							</div>
							<div class="col-md-4">
								<a href="Institutional_level" class="shortcut-tiles tiles-purple">
									<div class="tiles-body">
										<div class="pull-left"><i class="fa fa-th"></i></div>
									</div>
									<div class="tiles-footer">
										系统管理
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- container -->
</@main.page>