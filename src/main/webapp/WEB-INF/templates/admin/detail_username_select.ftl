<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>员工姓名选择</title>
		<meta name="viewport" content="width=device-width,inistital-scale=1.0">
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
			<div id="page-heading">
				<h1>员工姓名选择</h1>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-body">
								<form id="validate-form" class="form-horizontal row-border" action="detail_username_select.do" method="post">
								<table class="table table-condensed">
									<thead>
										<tr>
											<th>员工姓名</th>
										</tr>
									</thead>
									<#if emMap?exists>
									<#list emMap?keys as key>
									<tbody>
										<tr>
											<td><input type="checkbox" value="${emMap[key]}" name="ename">${emMap[key]}</td>
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
											<button class="btn btn-primary" onclick="$('#validate-form').submit();">提交</button>
											<a href="javascript:;" onclick="history.go(-1);" class="btn btn-default">取消</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
<script type='text/javascript' src='${request.contextPath}/js/jquery-1.10.2.min.js'></script>
	<script type='text/javascript' src='${request.contextPath}/js/bootstrap.min.js'></script>
</html>