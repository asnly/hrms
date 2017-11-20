<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>选择用户</title>
		<meta name="viewport" content="width=device-width" initital-scale="1.0">
		<link rel="stylesheet" href="${request.contextPath}/css/styles.min.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
	<!--[if lt IE 9]>
        <link rel="stylesheet" href="${request.contextPath}/css/ie8.css">
		<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
	<![endif]-->
	</head>
	<body class="">
		<div id='wrap'>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-body">
								<form id="form2" class="form-horizontal" method="post" action="RewardsAndPunishment_user_select.do">
									<table class="table table-condensed">
										<thead>
											<tr>
												<th>用户帐号列表</th>
											</tr>
										</thead>
										<#if employeeMap?exists>
										<#list employeeMap?keys as key>
										<tbody>
											<tr>
												<td><input type="checkbox" value="${employeeMap[key]}" name="username">${employeeMap[key]}</td>
											</tr>
										</tbody>
										</#list>
										</#if>
									</table>
								</form>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-sm-3 col-sm-offset-5">
										<div class="btn-toolbar">
											<button class="btn btn-success" onclick="$('#form2').submit();">提交</button>
											<a href="javascript:;" class="btn btn-default"onclick="history.go(-1);">取消</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer role="contentinfo" style="margin-left:0px">
			<div class="clearfix">
				<ul class="list-unstyled list-inline pull-left">
					<li>hrms &copy;2017</li>
				</ul>
			</div>
		</footer>
	</body>
	<script type="text/javascript" src="${request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${request.contextPath}/js/bootstrap.min.js"></script>
</html>