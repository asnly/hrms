<#import "admin_frame.ftl" as main>
<@main.page title="机构信息维护">
<script>
	function confirmSend(){
		return window.confirm("你确定要删除吗？");
	};
	function change(id){
		var title=document.getElementById("title");
		var temp=document.getElementById("p"+id);
		title.value=$(temp).html();
		var category=document.getElementById("category");
		temp=document.getElementById("c"+id);
		category.value=$(temp).html();
		var content=document.getElementById("content");
		temp=document.getElementById("n"+id);
		content.value=$(temp).html();
		var tid=document.getElementById("instid");
		tid.value=id;
	};
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>机构信息维护</li>
		</ol>
		<h1>机构信息维护</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p><a id="btntext" type="button" value="添加公告" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil"></i>添加公告</a>
						</p>
						<hr>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>标题</th>
									<th>内容</th>
									<th>类别</th>
									<th>编辑者</th>
									<th>发布日期</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<#list InstitutionInfoList as InstitutionInfo>
									<tr>
										<td id="p#{InstitutionInfo.id}"><#if InstitutionInfo.title??>${InstitutionInfo.title?html}</#if></td>
										<td id="n#{InstitutionInfo.id}"><#if InstitutionInfo.content??>${InstitutionInfo.content?html}</#if></td>
										<td id="c#{InstitutionInfo.id}"><#if InstitutionInfo.category??>${InstitutionInfo.category?html}</#if></td>
										<td><#if InstitutionInfo.author??>${InstitutionInfo.author?html}</#if></td>
										<td><#if InstitutionInfo.issuedate??>${InstitutionInfo.issuedate?string("yyyy-MM-dd HH:mm:SS")}</#if></td>
										<td>
											<input id="#{InstitutionInfo.id}" type="button" onclick="change(this.id);" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModals" value="修改"/>
											<a href="institution_info_edit?action=delete&instid=#{InstitutionInfo.id}" class="btn btn-success btn-sm" onclick="return confirmSend();"><i class="fa fa-pencil"></i>删除</a>
										</td>
									</tr>
								</#list>
							</tbody>
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
               添加公告信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="institution_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						<div class="form-group">
							<#if InstitutionInfo??>
							<input type="hidden" name="institutionid" value=#{InstitutionInfo.id}>
							</#if>					
							<div class="validate-block">
								<label class="col-sm-3 control-label">标题：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="title" class="form-control" required="required" <#if InstitutionInfo?? && InstitutionInfo.title??>value="${InstitutionInfo.title?html}"</#if>>
							    </div>
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">类别：</label>
								<div class="col-sm-6">
									<select name="category" class="form-control">
							    		<option value="">请选择类别</option>
							    		<option value="1" <#if category??&&category==1>selected</#if>>活动</option>
							    		<option value="2" <#if category??&&category==2>selected</#if>>公告</option>
							    	</select> 
								</div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">内容：</label>
								<div class="col-sm-6">
									<textarea class="form-control" name="content" rows="6" cols="60" required="required"<#if InstitutionInfo??&&InstitutionInfo.content??>value="${InstitutionInfo.content?html}"</#if>></textarea>
								</div>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn-primary btn" onclick="$('#validate-form').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="modal fade" id="myModals" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabels" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabels">
               修改公告信息
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="institution_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						<div class="form-group">
							
							<input type="hidden" name="tid" id="instid">				
							<div class="validate-block">
								<label class="col-sm-3 control-label">标题：</label>
							    <div class="col-sm-6">
							    	<input type="text" name="title" id="title" class="form-control" required="required" <#if InstitutionInfo?? && InstitutionInfo.title??>value="${InstitutionInfo?html}"</#if>>
							    </div>
						    </div>
						</div>						
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">类别：</label>
								<div class="col-sm-6">
									 <select name="category" class="form-control" id="category">
							    	<option value="">请选择类别</option>
							    	<option value="1" <#if category??&&category==1>selected</#if>>活动</option>
							    	<option value="2" <#if category??&&category==2>selected</#if>>公告</option>
							    </select> 
								</div>
						    </div>
						</div>
						<div class="form-group">
							<div class="validate-block">
								<label class="col-sm-3 control-label">内容：</label>
								<div class="col-sm-6">
									<textarea id="content" name="content" rows="10" cols="60" class="form-control" required="required" <#if InstitutionInfo??&&InstitutionInfo.content??>value="${InstitutionInfo.content?html}"</#if>></textarea>
								</div>
								
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn-primary btn" onclick="$('#form2').submit();">保存</button>
					</div>
				</div>
			</div>
		</div>
</@main.page>