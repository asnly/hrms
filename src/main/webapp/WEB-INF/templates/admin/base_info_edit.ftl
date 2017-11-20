<#import "admin_frame.ftl" as main>
<@main.page title="员工基本信息维护">

<#assign html_other_script in main>
	<script type="text/javascript">
		$(function(){
			var username=$('#username').val();
			if(username){
				$("#tt").hide();
			}
			$("#degree").hide();
		})
		function showinfo(){
			var degree=$('#degreeId').val();
			if(degree!=null&&degree==1){
				$("#www").hide();
				
			}else{
				$("#www").show();
				$("#img12").show();
				
			}
		}
		
		$("#file0").change(function(){
			var objUrl=getObjectURL(this.files[0]);
			if(objUrl){
				$("#img0").attr("src",objUrl);
				$("#img0").css("width","100px");
				$("#img0").css("height","70px");
			}
		});
		$("#file3").change(function(){
			var objUrl=getObjectURL(this.files[0]);
			if(objUrl){
				$("#img1").attr("src",objUrl);
				$("#img1").css("width","200px");
				$("#img1").css("height","100px");
			}
		});
		$("#file7").change(function(){
			var objUrl=getObjectURL(this.files[0]);
			if(objUrl){
				$("#img2").attr("src",objUrl);
				$("#img2").css("width","200px");
				$("#img2").css("height","100px");
			}
		});
		$("#file1").change(function(){
			var objUrl=getObjectURL(this.files[0]);
			if(objUrl){
				$("#img11").attr("src",objUrl);
				$("#img11").css("width","150px");
				$("#img11").css("height","100px");
			}
		});
		$("#file2").change(function(){
			var objUrl=getObjectURL(this.files[0]);
			if(objUrl){
				$("#img12").attr("src",objUrl);
				$("#img12").css("width","150px");
				$("#img12").css("height","100px");
			}
		})
		function getObjectURL(file){
			var url=null;
			if(window.createObjectURL!=undefined){
				url=window.createObjectURL(file);
			}else if(window.URL!=undefined){
				url=window.URL.createObjectURL(file);
			}else if(window.webkitURL!=undefined){
				url=window.webkitURL.createObject(file);
			}
			return url;
		}
	</script>
</#assign>

	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>员工基本信息维护</li>
		</ol>
		<h1>员工基本信息维护</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<#if info??>修改<#else>添加</#if>员工信息
				</div>
				<div class="panel-body">
					<form id="validate-form" class="form-horizontal row-border" action="base_info_edit.do" method="post" 
						 data-validate="parsley" onsubmit="return $('#validate-form').parsley('validate');">
						<div class="form-group">
							<#if info??>
								<input type="hidden" name="infoId" value="#{info.id}" />
							</#if> 
							<#if account??>
								<input type="hidden" name="accountid" value="#{account.id}" />
							</#if>

							<div class="valiedate-block">
								<label class="col-sm-2 control-label">帐号</label>
									<div class="col-sm-2">
										<input type="text" name="username" id="username" class="form-control" required="required" <#if account??&&account.username??>value="${account.username}"</#if>>
										<div id="tt"><a id="btntext" value="添加用户" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil"></i>添加帐号</a></div>
									</div>
							</div>
							<div class="validate-block">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-2">
									<input type="text" name="fullname" class="form-control" required="required" <#if info??&&info.name??>value="${info.name}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-2 control-label">性别</label>
									<div class="col-sm-2">
										
										<label class="radio-inline">
											<input type="radio" name="gender" id="m" value="男" checked> 男
										</label>
										<label class="radio-inline">
											<input type="radio" name="gender" id="f" value="女"> 女
										</label>
										
										
									</div>
							</div>
								<div class="validate-block">
									<label class="col-sm-2 control-label">年龄</label>
										<div class="col-sm-2">
											<input ype="text" name="age" class="form-control" required="required" <#if info??&&info.age??>value="${info.age}"</#if> />
										</div>
								</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-2 control-label">正装</label>
									<div class="col-sm-2">
										<input type="file" name="file0" id="file0" multiple="multiple"  /><img src="" id="img0" />
									</div>
							</div>
							<div class="validate-block">
								<label class="col-sm-2 control-label">职务</label>
								<div class="col-sm-2">
									<input type="text" name="duties" class="form-control" required="required" <#if info??&&info.position??>value="${info.position}"</#if>/>
								</div>
							</div>
						</div>
						<div class="form-group">
							
							<div class="validate-block">
								<label class="col-sm-2 control-label">身份证正面</label>
								<div class="col-sm-2">
									<input type="file" name="file3" id="file3" multiple="multiple" />
									<img src="" id="img1"/>
								</div>	
							  </div>
							  <div class="validate-block">
								<label class="col-sm-2 control-label">身份证反面</label>
								<div class="col-sm-2">
									<input type="file" name="file7" id="file7" multiple="multiple" />
									<img src="" id="img2"/> 
								</div>
							  </div>
						</div>
							
						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-2 control-label">学历</label>
								<div class="col-sm-2">
									<select name="EducationId" class="form-control" id="educationId" onchange="showinfo();">
										<option value="">选择学历</option>
										<option value="1" <#if EducationId??&&EducationId=="1">selected</#if>>大专</option>
										<option value="2" <#if EducationId??&&EducationId=="2">selected</#if>>本科</option>
										<option value="3" <#if EducationId??&&EducationId=="3">selected</#if>>硕士</option>
										<option value="4" <#if EducationId??&&EducationId=="4">selected</#if>>博士</option>
									</select>
								</div>
							</div>
						
							<div class="validate-block">
								
								<label class="col-sm-2 control-label">学位</label> 
									<div class="col-sm-2">
									<select name="DegreeId" class="form-control" id="degreeId"  onchange="showinfo();">
										<option value="">是否有学位</option>
										<option value="0" <#if DegreeId??&&DegreeId=="0">selected</#if>>有</option>
										<option value="1" <#if DegreeId??&&DegreeId=="1">selected</#if>>无</option>
									</select>
									</div>
							</div>
						
						</div>
						<div class="form-group" id="dd">
							<div class="validate-block" id="fff">
							<label class="col-sm-2 control-label">学历附件</label>
								<div class="col-sm-2">
									<input type="file" name="file1" id="file1" >
									<img src="" id="img11" />
								</div>
							</div>
							<div class="validate-block" id="www">
							<label class="col-sm-2 control-label">学位附件</label>
								<div class="col-sm-2">
									<input type="file" name="file2" id="file2" >
									<img src="" id="img12" />
								</div>
							</div>
						</div>
						<div class="form-group">
						<div class="validate-block">
							<label class="col-sm-2 control-label">部门</label>
							<div class="col-sm-2">
								<select name="DeptId" class="form-control" >
										<option vlaue="">请选择部门</option>
									<#list deptinfo?keys as key>
										<option value="${deptinfo[key]}">${deptinfo[key]}</option>
									</#list>
								</select>
							</div>
						</div>
						<div class="validate-block">
							<label class="col-sm-2 control-label">人员状态</label>
							<div class="col-sm-2">
								<select name="Pstatus" class="form-control" >
									<option value="">请选择</option>
									<option value="1" <#if Pstatus??&&Pstatus=="1">selected</#if>>在职</option>
									<option value="2" <#if Pstatus??&&Pstatus=="2">selected</#if>>兼职</option>
									<option value="3" <#if Pstatus??&&Pstatus=="3">selected</#if>>离职</option>
								</select> 
							</div>
						</div>
						</div>
					
					</form>
				</div>
				<div class="panel-footer">
						<div class="row">
							<div class="btn-toolbar">
								<button class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
								<a href="javascript:;" onclick="history.go(-1);" class="btn btn-default">取消</a>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div><!-- container -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               选择用户名
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="base_info_edit" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						<div class="form-group">
							
							<div class="validate-block">
								<table class="table table-condensed">
										<thead>
											<tr>
											<th>用户帐号列表</th>
											</tr>
										</thead>
										<#if userinfo?exists>
										<#list userinfo?keys as key>
										<tbody>
											<tr>
											<td>
											<input type="checkbox" value="${userinfo[key]}" name="username">${userinfo[key]}
											</td>
											</tr>
										</tbody>	
										</#list>
										</#if>
										</table>
						    </div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn-primary btn" onclick="$('#form2').submit();">提交</button>
					</div>
				</div>
			</div>
		</div>
</@main.page>
 