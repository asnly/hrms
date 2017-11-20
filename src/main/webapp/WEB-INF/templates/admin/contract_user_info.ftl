<!DOCTYPE HTML>
<html>
	<head>
		<title>用户姓名选择</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0" />
		<link rel="stylesheet" href="${request.contextPath}/css/styles.min.css" />
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
									<form id="form2" action="contract_user_info.do" class="form-horizontal" method="post">
										<table class="table table-condensed">
											<thead>
												<tr>
													<th>用户姓名</th>
												</tr>
											</thead>
											<#if emMap?exists>
											<#list emMap?keys as key>
											<tbody>
												<tr>
													<td><input type="checkbox" name="ename" value="${emMap[key]}" /> ${emMap[key]}</td>
												</tr>
											</tbody>
											</#list>
											</#if>
										</table>
									</form>
							</div>
							<div class="panel-footer">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-5">
										<div class="btn-toolbar">
											<button class="btn btn-primary" onclick="$('#form2').submit();">提交</button>
											<a href="javascript:;" class="btn btn-default" onclick="history.go(-1);">取消</a>
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
					<Li>hrms @copy; 2017</li>
				</ul>
			</div>
		</footer>
	</body>
	<script type='text/javascript' src='${request.contextPath}/js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript' src='${request.contextPath}/js/bootstrap.min.js'></script>
</html>