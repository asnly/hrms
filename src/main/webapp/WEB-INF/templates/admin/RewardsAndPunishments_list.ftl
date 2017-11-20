<#import "admin_frame.ftl" as main>
<#import "pagination.ftl" as pager>
<@main.page title="奖惩管理">
<script type="text/javascript">
	function show(){
		var jclx=$("#jclx").val();
		if(jclx=="0"){
			$("#punishments").hide();
			$("#rewards").show();
		}
		if(jclx=="1"){
			$("#rewards").hide();
			$("#punishments").show();
		}
		if(jclx==""){
			$("#punishments").show();
			$("#rewards").show();
		}
		
	}
	function confirmSend(){
		return window.confirm("你确定要删除吗?");
	}
</script>  
<#assign filterUrl><#if searchword??>&searchword=${searchword}</#if><#if rewards??>&rewards=${rewards}</#if><#if punishments??>&punishments=${punishments}</#if></#assign>
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>奖惩管理</li>
		</ol>
		<h1>奖惩管理</h1>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<p>
						<a href="rewardsAndpunishments_info_edit" class="btn btn-success btn-sm" type="button"><i class="fa fa-pencil"></i>添加奖惩信息</a>
						</p>
						<hr>
						<form action="rewardsAndpunishments_list" class="form-horizontal" role="form">
							<div class="form-group">
							<label class="col-md-1 control-label" style="width:auto"><strong>奖惩类型</strong></label>
							<div class="col-md-2">
								<select name="jclx" id="jclx" class="form-control" onchange="show()">
									<option value="">请选择奖惩</option>
									<option value="0">奖励</option>
									<option value="1">处罚</option>
								</select>
							</div>
								<div class="col-md-2" id="rewards">
								<select name="rewards" class="form-control">
									<option value="">奖励类型</option>
									<option value="1" <#if rewards??&&rewards=="1">selected</#if>>嘉奖</option>
									<option value="2" <#if rewards??&&rewards=="2">selected</#if>>记功</option>
									<option value="3" <#if rewards??&&rewards=="3">selected</#if>>记大功</option>
									<option value="4" <#if rewards??&&rewards=="4">selected</#if>>升级</option>
									<option value="5" <#if rewards??&&rewards=="5">selected</#if>>晋升</option>
									<option value="6" <#if rewards??&&rewards=="6">selected</#if>>破格晋升</option>
								</select>
								</div>
								<div class="col-md-2" id="punishments">
									
									<select name="punishments" class="form-control">
									<option value="">处罚类型</option>
									<option value="1" <#if punishments??&&punishments=="1">selected</#if>>警告</option>
									<option value="2" <#if punishments??&&punishments=="2">selected</#if>>记过</option>
									<option value="3" <#if punishments??&&punishments=="3">selected</#if>>记大过</option>
									<option value="4" <#if punishments??&&punishments=="4">selected</#if>>降级</option>
									<option value="5" <#if punishments??&&punishments=="5">selected</#if>>撤职</option>
									<option value="6" <#if punishments??&&punishments=="6">selected</#if>>开除</option>
								</select>
							
								</div>
						</div>
							<div class="form-group">
								<label class="col-md-1 control-label" style="width:auto">关键词</label>
								<div class="col-md-5">
									<input type="text" name="searchword" class="form-control" placeholder="输入员工姓名或编号" <#if searchword??>value="${searchword?html}"</#if>>
								</div>
								<div class="col-md-2">
								<button type="submit" class="btn btn-md btn-primary"><i class="fa fa-search"></i>查询</button>
								</div>
							</div>	
						</form>
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>获奖人员</th>
									<th>奖惩标题</th>
									<th>奖惩内容</th>
									<th>奖金类别</th>
									<th>奖惩时间</th>
									<th>操作</th>
								</tr>
							</thead>
							
							<#list rewardsAndPunishmentsList as RewardsAndPunishment>			
							<tbody>
								<tr>
									<td id="d#{RewardsAndPunishment.id}"><#if RewardsAndPunishment.rewardsuser??>${RewardsAndPunishment.rewardsuser?html}</#if></td>
									<td id="n#{RewardsAndPunishment.id}"><#if RewardsAndPunishment.rewardstitle??>${RewardsAndPunishment.rewardstitle?html}</#if></td>
									<td id="c#{RewardsAndPunishment.id}"><#if RewardsAndPunishment.rewardscontext??>${RewardsAndPunishment.rewardscontext?html}</#if></td>
									<td id="f#{RewardsAndPunishment.id}"><#if RewardsAndPunishment.rewardscategory??>${RewardsAndPunishment.rewardscategory?html}</#if></td>
									<td><#if RewardsAndPunishment.rewardstime??>${RewardsAndPunishment.rewardstime?string("yyyy-MM-dd HH:mm:SS")}</#if></td>
									<td>
										<a href="rewardsAndpunishments_info_edit?rpid=#{RewardsAndPunishment.id}" class="btn btn-success btn-sm"><i class="fa fa-pencil"></i>修改</a>
										<a href="rewardsAndpunishments_list_edit?action=delete&rpid=#{RewardsAndPunishment.id}" onclick="return confirmSend();" class="btn btn-default btn-sm"><i class="fa fa-times"></i>删除</a>
									</td>
								</tr>
							</tbody>
							</#list>				
	
						</table>
						<#assign currentUrl>rewardsAndpunishments_list?_t=1${filterUrl!}&</#assign>
						<@pager.pageul pagination=pagination url="${currentUrl}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>