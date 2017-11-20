<#import "user_frame.ftl" as main>
<@main.page title="查看个人信息">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>查看个人信息</li>
		</ol>
		<h1>查看个人信息</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body" style="min-width:850px;padding-top:0px">
						<#include "../personnel_info.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>