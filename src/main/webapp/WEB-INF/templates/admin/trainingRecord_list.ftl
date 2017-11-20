<#import "admin_frame.ftl" as main>
<#assign html_other_script in main>
		<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="${request.contextPath}/plugins/form-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
		
		<script>
			$(function(){
				$(".date-picker").datepicker({
					format:"yyyy-mm-dd",
					language:"zh-CN",
					autoclose:true
				})
				$("#category").hide();
			})
			$("#btn1").click(function(){
				$("#category").show();
			})
		</script>
		
		function confirmSend(){
			return window.confirm("你确定要删除吗?");
		}
</#assign>
<@main.page title="培训记录">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>培训记录</li>
		</ol>
		
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a id="btntext" class="btn btn-success btn-sm" type="button" data-toggle="modal" data-target="#myModal"value="添加培训记录"><i class="fa fa-pencil"></i>添加培训记录</a>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>培训科目</th>
									<th>培训教师</th>
									<th>培训性质</th>
									<th>培训类型</th>
									<th>培训方式</th>
									<th>课时</th>
									<th>费用</th>
									<th>总费用</th>
									<th>各科目成绩比重</th>
									<th>操作</th>
								</tr>
							</thead>
							<#list trainigRecordList as trainigRecord>
							<tbody>
								<tr>
									<td><#if trainigRecord.subject??>${trainigRecord.subject?html}</#if></td>
									<td><#if trainigRecord.teacher??>${trainigRecord.teacher?html}</#if></td>
									<td>
										<#if trainigRecord.nature??>
										<#if trainigRecord.nature=="1">知识培训
										<#elseif trainigRecord.nature=="2">技能培训
										<#elseif trainigRecord.nature=="3">思维培训
										<#elseif trainigRecord.nature=="4">观念培训
										<#elseif trainigRecord.nature=="5">心理培训
										</#if>
										</#if>
									</td>
									
									<td><#if trainigRecord.category??>${trainigRecord.category?html}</#if></td>
									<td>
										<#if trainigRecord.methods??>
                						<#if trainigRecord.methods=="1">讲授
                						<#elseif trainigRecord.methods=="2">工作轮换
                						<#elseif trainigRecord.methods=="3">工作指导
                						<#elseif trainigRecord.methods=="4">研讨
                						<#elseif trainigRecord.methods=="5">视听技术
                						<#elseif trainigRecord.methods=="6">案例研究
                						<#elseif trainigRecord.methods=="7">角色扮演
                						<#elseif trainigRecord.methods=="8">企业内部网络培训
                						</#if>
                						</#if>
									</td>
									<td><#if trainigRecord.classinfo??>${trainigRecord.classinfo?html}</#if></td>
									<td><#if trainigRecord.price??>${trainigRecord.price?html}</#if></td>
									<td><#if trainigRecord.totalprice??>${trainigRecord.totalprice?html}</#if></td>
									<td><#if trainigRecord.grading??>${trainigRecord.grading?html}</#if></td>
									<td>
										<a href="trainingRecord_info?trid=#{trainigRecord.id}" class="btn btn-success btn-sm"><i class="fa fa-sign-in"></i>详情</a>
										<a href="trainingRecord_list_edit.do?action=delete&trid=#{trainigRecord.id}" class="btn btn-sm btn-default" onclick="return confirmSend();"><i class="fa fa-times"></i>删除</a>
									</td>								
								</tr>
								
							</tbody>
							</#list>
						</table>
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
               添加培训信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="trainingRecord_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						
						<div class="form-group">
						<#if trainigRecord??>
							<input type="hidden" name="trid" value=#{trainigRecord.id} >
						</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">培训科目:</label>
							    <div class="col-sm-6">
							    	<input type="text" name="subject" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.subject??>value="${trainigRecord.subject?html}"</#if>>
							    </div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">培训类型:</label>
								<div class="col-sm-6">
									<select name="category" class="form-control">
										<option value="">请选择类别</option>
									<#list tcMap?keys as key>
										<option value="${tcMap[key]}">${tcMap[key]}</option>
									</#list>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">培训方式</label>
							<div class="col-sm-5">
								<select name="pxfs" class="form-control">
									<option value="">选择培训方式</option>
									<option value="1" <#if pxfs??&&pxfs=="1">selected</#if>>讲授</option>
									<option value="2" <#if pxfs??&&pxfs=="2">selected</#if>>工作轮换</option>
									<option value="3" <#if pxfs??&&pxfs=="3">selected</#if>>工作指导</option>
									<option value="4" <#if pxfs??&&pxfs=="4">selected</#if>>研讨</option>
									<option value="5" <#if pxfs??&&pxfs=="5">selected</#if>>视听技术</option>
									<option value="6" <#if pxfs??&&pxfs=="6">selected</#if>>案例研究</option>
									<option value="7" <#if pxfs??&&pxfs=="7">selected</#if>>角色扮演</option>
									<option value="8" <#if pxfs??&&pxfs=="8">selected</#if>>企业内部网络培训</option>
								</select>
							</div>
						</div>
						<div class="form-group">
						<div class="validate-block">
							<label class="col-sm-3 control-label">培训性质</label>
								<div class="col-sm-2">
									<select name="pxxz" class="form-control">
										<option value="">选择培训性质</option>
										<option value="1" <#if pxxz??&&pxxz=="1">selected</#if>>知识培训</option>
										<option value="2" <#if pxxz??&&pxxz=="2">selected</#if>>技能培训</option>
										<option value="3" <#if pxxz??&&pxxz=="3">selected</#if>>思维培训</option>
										<option value="4" <#if pxxz??&&pxxz=="4">selected</#if>>观念培训</option>
										<option value="5" <#if pxxz??&&pxxz=="5">selected</#if>>心理培训</option>
									</select>
								</div>
						</div>
						</div>
						<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-3 control-label">培训教师:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="teacher" required="required" <#if trainigRecord??&&trainigRecord.teacher??>value="${trainigRecord.teacher?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">课时:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="classHour" required="required" <#if trainigRecord??&&trainigRecord.classinfo??>value="${trainigRecord.classinfo?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">费用:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="price" requied="required" <#if trainigRecord??&&trainigRecord.price??>value="${trainigRecord.price?html}"</#if>>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">占比重(10的倍数): </label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="subjectPercent" required="required" <#if trainigRecord??&&trainigRecord.grading??>value="${trainigRecord.grading?html}"</#if>>
							</div>
						</div>
						
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="btn1" class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
	
		<#--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               修改培训信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="trainingRecord_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						
						<div class="form-group">
						<#if trainigRecord??>
							<input type="hidden" name="trid" value=#{trainigRecord.id} >
						</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">培训科目：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="subject" class="form-control" required="required" <#if trainigRecord??&&trainigRecord.subject??>value="${trainigRecord.subject?html}"</#if>>
							    </div>
						    </div>
						</div>
						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">培训类型:</label>
								<div class="col-sm-6">
									<#if trainigRecord??>
										<input type="text" name="type" class="form-control" id="type" required="required" <#if trainigRecord.category??>value="${trainigRecord.category?html}"></#if>>
										<button type="button" id="btn2">修改</button>
										<select name="category" id="category" class="form-control">
										<option value="">请选择类别</option>
									<#list tcMap?keys as key>
										<option value="${tcMap[key]}">${tcMap[key]}</option>
									</#list>
									</select>
									
									<#else>
									<select name="category" class="form-control">
										<option value="">请选择类别</option>
									<#list tcMap?keys as key>
										<option value="${tcMap[key]}">${tcMap[key]}</option>
									</#list>
									</select>
									</#if>
								</div>
							</div>
						</div>
						<div class="form-group">
								<div class="validate-block">
									<label class="col-sm-3 control-label">培训教师：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="teacher" required="required" <#if trainigRecord??&&trainigRecord.teacher??>value="${trainigRecord.teacher?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">课时</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="classHour" required="required" <#if trainigRecord??&&trainigRecord.classinfo??>value="${trainigRecord.classinfo?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">费用</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="price" requied="required" <#if trainigRecord??&&trainigRecord.price??>value="${trainigRecord.price?html}"</#if>>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">科目所占比重</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="subjectPercent" required="required" <#if trainigRecord??&&trainigRecord.grading??>value="${trainigRecord.grading?html}"</#if>>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="btn1" class="btn-primary btn" onclick="$('#form2').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
		-->
</@main.page>