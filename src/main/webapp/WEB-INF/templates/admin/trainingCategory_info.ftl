<#import "admin_frame.ftl" as main>
<@main.page title="培训类别维护">
<script type="text/javascript">
	function change(id){
		var code=document.getElementById("code");
		var temp=document.getElementById("p"+id);
		code.value=$(temp).html();
		var categoryname=document.getElementById("categoryname");
		temp=document.getElementById("n"+id);
		categoryname.value=$(temp).html();
		var tid=document.getElementById("tid");
		tid.value=id;
	}
	function confirmSend(){
		return window.confirm("你确定要删除吗");
	}
</script>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>培训类别维护</li>
		</ol>
		<h1>培训类别维护</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<a id="btntext" class="btn btn-success btn-sm" type="button" value="添加培训类别" data-toggle="modal" data-target="#myModal"><i class="fa fa-pencil">添加培训类别</i></a>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>类别代码</th>
									<th>类别名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<#list trainingCategoryList as trainingCategory>
							<tbody>
								<tr>
									<td id="p#{trainingCategory.id}"><#if trainingCategory.catrgorycode??>${trainingCategory.catrgorycode?html}</#if></td>
									<td id="n#{trainingCategory.id}"><#if trainingCategory.category??>${trainingCategory.category?html}</#if></td>
									<td>
										<input id="#{trainingCategory.id}" type="button" onclick="change(this.id)" class="btn btn-success btn-sm" value="修改" data-toggle="modal" data-target="#myModals" />
										<a href="trainingCategory_info_edit?action=delete&trainingid=#{trainingCategory.id}" type="button" class="btn btn-success btn-sm" onclick="return confirmSend();"><i class="fa fa-times">删除</i></a>
									</td>
								</tr>
							</tbody>
							</#list>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
               添加培训类别
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="validate-form" class="form-horizontal" action="trainingCategory_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#validate-form').parsley( 'validate' );">
						<div class="form-group">
							<#if trainingCategory??>
								<input type="hidden" name="trainingCategoryid" value=#{trainingCategory.id}>
							</#if>
							<div class="validate-block">
								<label class="col-sm-3 control-label">类别代码:</label>
								<div class="col-sm-6">
									<input type="text" name="code" class="form-control" required="required"<#if trainingCategory??&&trainingCategory.catrgorycode??> value="${trainingCategory.catrgorycode?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">类别名称:</label>
							<div class="col-sm-6">
								<input type="text" name="categoryname" class="form-control" required="required"<#if trainingCategory??&&trainingCategory.category??> value="${trainingCategory.category?html}"</#if>>
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
               修改培训类别
            </h4>
         </div>
        	 <div class="modal-body">
        		<form id="form2" class="form-horizontal" action="trainingCategory_info_edit.do" method="post" 
							data-validate="parsley" onsubmit="return $('#form2').parsley( 'validate' );">
						<div class="form-group">
								<input type="hidden" name="trainingCategoryid" id="tid">
							<div class="validate-block">
								<label class="col-sm-3 control-label">类别代码:</label>
								<div class="col-sm-6">
									<input type="text" name="code" id="code" class="form-control" required="required"<#if trainingCategory??&&trainingCategory.catrgorycode??> value="${trainingCategory.catrgorycode?html}"</#if>>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">类别名称:</label>
							<div class="col-sm-6">
								<input type="text" name="categoryname" id="categoryname" class="form-control" required="required"<#if trainingCategory??&&trainingCategory.category??> value="${trainingCategory.category?html}"</#if>>
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