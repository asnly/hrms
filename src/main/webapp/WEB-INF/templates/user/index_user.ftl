<#import "user_frame.ftl" as main>
<@main.page title="用户首页">
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
										个人信息
									</div>
								</a>
							</div>
							<div class="col-md-4">
								<a href="" class="shortcut-tiles tiles-orange">
									<div class="tiles-body">
										<div class="pull-left"><i class="fa fa-trophy"></i></div>
									</div>
									<div class="tiles-footer">
										培训信息
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