<!DOCTYPE html>
	<html>
		<head>
			<meta charset="utf-8" />
			<title>人力资源管理系统</title>
			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width,initial-scale=1.0" />
			<meta name="description" content=""/>
			<meta name="author" content=""/>
			<link href="${request.contextPath}/css/styles.min.css" rel='stylesheet' type='text/css' />
			<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<script>
			$(function(){
				document.getElementsByName("user").value = "";
				document.getElementsByName("pwd").value="";
			})
		</script>
		</head>
		<body class="focusedform"> 
			<div class="verticalcenter">
				<div class="panel panel-orange">
					<form action="login" method="post" class="form-horizontal" style="margin-bottom:0px !important;">
						<div class="panel-body">
							<h4 class="text-center" style="margin-bottom:25px;">人力资源管理系统</h4>
								<input type="hidden" name="from" value="${from!}" />
								<div class="form-group">
									<div class="col-sum-12">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control" name="user" id="user" placeholder="用户名" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sum-12">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"></i></span>
											<input type="password" class="form-control" name="pwd" id="pwd" placeholder="密码" />
										</div>
									</div>
								</div>
								
								<#if error??&&error=="true">
									<div class="has-error">
										<ul class="help-block list-unstyled"><li><i class="icon-warning-sign"></i>用户名密码错误</li>
									</div>
								</#if>
						
						<div class="panel-footer">
							<div class="pull-right">
								<input type="submit" class="btn btn-orange" value="登录" />
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</body>
	</html>
</html>