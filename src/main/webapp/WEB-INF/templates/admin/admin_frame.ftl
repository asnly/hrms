<#macro page title>
<!DOCTYPE html>
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
	<script type="text/javascript" src="${request.contextPath}/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" />
		function add(){
		 	var info=$("#information").val();
		 	document.getElementById("btn2").setAttribute("type", "submit");
			if(info){
				$('#baseinfo li').eq(6).before('<li><a href="#">'+info+'</a></li');
				$(this).prop("disabled",true);
				$('#myModal').modal('hide');
			}
			
		}
	</script>
</head>
<body class="">
	<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
		<a id ="leftmenu-trigger" class="pull-left" data-toggle="tooltip" data-placement="bottom" title="打开/关闭边栏" ></a>
		<div class="navbar-header pull-left">
			<a class="" href="index"></a>
		</div>
		<ul class="nav navbar-nav pull-left">
			<li class="dropdown">
				<a href="index" class="username"><span class="hidden-xs">后台管理</span></a>
			</li>
		</ul>
		<ul class="nav navbar-nav pull-right toolbar">
			<li class="dropdown">
				<#if adminUser??>
				<a href="#" class="dropdown-toggle username" data-toggle="dropdown"><#if adminUser.nick??>${adminUser.nick?html}</#if><i class="fa fa-caret-down fa-scale"></i></a>
				<ul class="dropdown-menu userinfo arrow">
					<li class="username">
						<a href="#">
							<div class="pull-left"><h5>您好,<#if adminUser.nick??>${adminUser.nick?html}</#if></h5></div>
						</a>
					</li>
					<li class="userlinks">
						<ul class="dropdown-menu">
							<li><a href="${request.contextPath}/admin/logout" class="text-right">退出</a></li>
						</ul>
					</li>
				</ul>
				</#if>
				<#if accountRole??>
					<a href="#" class="dropdown-toggle username" data-toggle="dropdown"><#if accountRole.rolename??>${accountRole.rolename?html}</#if><i class="fa fa-caret-down fa-scale"></i></a>
				<ul class="dropdown-menu userinfo arrow">
					<li class="username">
						<a href="#">
							<div class="pull-left"><h5>您好,<#if accountRole.username??>${accountRole.username?html}</#if></h5></div>
						</a>
					</li>
					<li class="userlinks">
						<ul class="dropdown-menu">
							<li><a href="change_pwd">修改密码<i class="pull-right fa fa-pencil"></i></a></li>
							<li><a href="${request.contextPath}/admin/logout" class="text-right">退出</a></li>
						</ul>
					</li>
				</ul>
				</#if>
			</li>
		</ul>
	</header>
	<div id="page-container">
		<!-- Begin SideBar -->
		<nav id="page-leftbar" role="navigation">
			<!-- Begin SideBar Menu -->
			<ul class="acc-menu" id="sidebar">
				<li><a href="index"><i class="fa fa-home"></i><span>首页</span></a></li>
						<li><a href="javascript:;"><i class="fa fa-list-ol"></i><span>人员档案</span></a>
							<ul class="acc-menu" id="baseinfo"> 
								<li><a href="base_info">员工基本信息维护</a></li>
								<li><a href="dossior_list">员工档案管理</a></li>
								<li><a href="detail_list">员工履历管理</a></li>
								<li><a href="Contract_list">员工合同管理</a></li>
								<li><a href="rewardsAndpunishments_list">奖惩管理</a></li>
								<li><a href="employee_base_info">员工基本信息查询</a></li>
								<li><a id="btntext" type="button" data-target="#myModal" data-toggle="modal">
										<span class="glyphicon glyphicon-plus"></span>添加其他信息
									</a>
								</li>
							</ul>
						</li>	
						<li><a href="javascript:;"><i class="fa fa-list-ol"></i><span>人事调配</span></a>
							<ul class='acc-menu'>
								<li><a href="employee_mobilization_list">人事变动</a></li>
								<li><a href="TitleRecord_info_list">职称聘请记录</a></li>
								<li><a href="retired_employee_list">离退员工管理</a></li>
								<li><a href="personnel_change_search">人事变动查询</a></li>
							</ul>
						</li>
						<li><a href="javascript:;"><i class="fa fa-list-ol"></i><span>教育培训</span></a>
							<ul class='acc-menu'>
								<li><a href="trainingCategory_info">培训类别维护</a></li>
								<li><a href="trainingRecord_list">培训记录</a></li>
								<li><a href="Training_results_info">培训人员及成绩</a></li>
								<li><a href="">员工证书记录</a></li>
								<li><a href="">培训情况查询</a></li>
							</ul>
						</li>
						<li><a href="javascript:;"><i class="fa fa-list-ol"></i><span>系统管理</span></a>
							<ul class='acc-menu'>
								<li><a href="Institutional_level">机构级别维护</a></li>
								<li><a href="institution_info">机构信息维护</a></li>
								<li><a href="user_info">用户管理</a></li>
								<li><a href="role_info">角色管理</a></li>
								<li><a href="permission_info">角色、模块分配</a></li>
								<Li><a href="user_role_list">用户角色分配</a></li>
							</ul>
						</li>
			</ul>
		</nav>
		<div id="page-content">
			<div id='wrap'>
				<#nested>
			</div><!-- wrap -->
		</div><!-- page-container -->
		<footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline">
                <li>Hrms &copy; 2017</li>
               
                <button class="pull-right btn btn-inverse btn-xs" id="back-to-top" style="margin-top: -1px; text-transform: uppercase;"><i class="fa fa-arrow-up"></i></button>
            </ul>
        </div>
    </footer>
	</div>
	
	<!-- 模态框(Model) 添加其他人事信息-->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        			<h4 class="modal-title">添加其他信息</h4>
      			</div>
      <div class="modal-body">
        	<label>添加的人员档案信息：</label>
			<input type="text" name="infomation" id="information" />					    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">取消</button>
        <button type="button" class="btn btn-primary" id="btn2" onclick="add();">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    
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
