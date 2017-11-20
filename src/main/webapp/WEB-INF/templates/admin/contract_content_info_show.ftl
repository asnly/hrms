<!DOCTYPE html>
<html>
	<head>
		<title>合同内容查看</title>
		<meta http-equiv="X-UA-Comptible" content="IE=edge,chrome=1" />
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
					<div class="panel panel-primary">
						<div class="panel-body">
							<span><#if contract??&&contract.content??>${contract.content?html}</#if></span>
						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-sm-5 col-sm-offset-5">
									<div class="btn-toolbar">
										<a href="" class="btn btn-primary">导出</button>
										<a href="javascript:;" class="btn btn-default" onclick="history.go(-1);">取消</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>