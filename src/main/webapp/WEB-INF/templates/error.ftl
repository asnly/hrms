<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>出错啦(Error)</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<link href="${request.contextPath}/css/styles.min.css" rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body style="padding-top:0px">

<div>
	
	<div class="panel panel-primary">
		<div class="panel-body">
			<h3>出错啦：(Error!)</h3>
			  	<p>
			<#if exception.getMessage()?? >
			${exception.getMessage()!}
			<#else>
			${exception!}
			</#if></p>
					
		</div>
	</div>
 </div>
      
</body>
</html>

