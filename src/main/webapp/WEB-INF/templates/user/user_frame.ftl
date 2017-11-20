<#macro page title>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
	<title>${title!}-人力资源管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0" />
	<meta name="description" content=""/>
	<meta name="author" content=""/>
	<link href="${request.contextPath}/css/styles.min.css" rel="stylesheet" type='text/css' media="all" />
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="${request.contextPath}/js/html5.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/respond.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/placeholdr.js"></script>
	<![endif]-->
	<meta http-equiv="Content-type" content="text/html;charset=utf-8" />
	</head>
	<body class="collapse-leftbar ">

    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
    
        <a id="leftmenu-trigger" class="pull-left" data-toggle="tooltip" data-placement="bottom" title="打开/关闭边栏"></a>
        
        <div class="navbar-header pull-left">
            <a class="" href="index"></a>
        </div>
        
        <ul class="nav navbar-nav pull-left">
        	<li class="dropdown">
        		<a href="index" class="username" ><span class="hidden-xs">人力资源管理系统</span></a>
        	</li>
        </ul>

        <ul class="nav navbar-nav pull-right toolbar">
        	<li class="dropdown">
        		<a href="#" class="dropdown-toggle username" data-toggle="dropdown"><#if accountRole.rolename??>${accountRole.rolename?html}</#if> <i class="fa fa-caret-down fa-scale"></i></a>
        		<ul class="dropdown-menu userinfo arrow">
        			<li class="username">
                        <a href="#">
        				    <div class="pull-left"><h5>您好, <#if accountRole.username??>${accountRole.username?html}</#if></h5></div>
                        </a>
        			</li>
        			<li class="userlinks">
        				<ul class="dropdown-menu">
        					<li><a href="change_password">修改密码 <i class="pull-right fa fa-pencil"></i></a></li>
        					<li class="divider"></li>
        					<li><a href="${request.contextPath}/user/logout" class="text-right">退出</a></li>
        				</ul>
        			</li>
        		</ul>
        	</li>
        	
		</ul>
    </header>

    <div id="page-container">
        <!-- BEGIN SIDEBAR -->
        <nav id="page-leftbar" role="navigation">
                <!-- BEGIN SIDEBAR MENU -->
            <ul class="acc-menu" id="sidebar">
                <li><a href="index"><i class="fa fa-home"></i> <span>首页</span></a></li>
                <li><a href="javascript:;"><i class="fa fa-list-ol"></i> <span>信息查询</span></a>
                    <ul class='acc-menu'>
                       <li><a href="preview_info">个人信息</a></li>
                       <li><a href="traigRecord_info_select">培训信息</a></li>
                    </ul>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>

<div id="page-content">
	<div id='wrap'>
		<#nested>
	</div> <!--wrap -->
</div> <!-- page-content -->

    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline">
                <li>MBA-ADM &copy; 2014</li>
                <!--li class="pull-right"><a href="javascript:;" id="back-to-top">Top <i class="icon-arrow-up"></i></a></li-->
                <button class="pull-right btn btn-inverse btn-xs" id="back-to-top" style="margin-top: -1px; text-transform: uppercase;"><i class="fa fa-arrow-up"></i></button>
            </ul>
        </div>
    </footer>

</div> <!-- page-container -->

<script type='text/javascript' src='${request.contextPath}/js/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='${request.contextPath}/js/bootstrap.min.js'></script>
<script type='text/javascript' src='${request.contextPath}/js/enquire.js'></script> 
<script type='text/javascript' src='${request.contextPath}/js/jquery.cookie.js'></script> 
<script type='text/javascript' src='${request.contextPath}/js/jquery.touchSwipe.min.js'></script> 
<script type='text/javascript' src='${request.contextPath}/js/jquery.nicescroll.min.js'></script>
<script type='text/javascript' src='${request.contextPath}/js/application.js'></script>

<script type='text/javascript' src='${request.contextPath}/plugins/form-toggle/toggle.min.js'></script> 
<script type='text/javascript' src='${request.contextPath}/plugins/form-parsley/parsley.min.js'></script> 
<script type='text/javascript' src='${request.contextPath}/js/formvalidation.js'></script> 

${html_other_script!}

</body>
</html>
</#macro>