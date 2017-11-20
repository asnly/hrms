<#import "user_frame.ftl" as main>


<@main.page title="培训信息">
	<div id="page-heading">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li>培训信息</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body">
						<form id="form2" class="form-horizontal" method="post" action="traigRecord_info_select.do">
						<div class="form-group">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>培训科目</th>
									<th>课时</th>
									<th>费用</th>
									<th>培训教师</th>
									<th>培训时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<#list trainigRecordList as tr>
							<tbody>
								<tr>
									<td>
										<#if tr??&&tr.id??>${tr.id}</#if>
									</td>
									<td>
										
										<#if tr??&&tr.subject??>${tr.subject?html}</#if>
									</td>
									<td>
										<#if tr??&&tr.classinfo??>${tr.classinfo?html}</#if>
									</td>
									<td>
										<#if tr??&&tr.price??>${tr.price?html}</#if>
									</td>
									<td>
										<#if tr??&&tr.teacher??>${tr.teacher?html}</#if>
									</td>
									<td><#if tr??&&tr.starttime??>${tr.starttime?string("yyyy-MM-dd")}</#if>——<#if tr??&&tr.endtime??>${tr.endtime?string("yyyy-MM-dd")}</#if></td>
									<#if employee??>
								<td>
									<a href="traigRecord_info_select.do?eid=#{employee.id}&trid=#{tr.id}" onclick="onclick="$('#form2').submit();">参加</a>
								</td>
								</#if>
								</tr>
								
							</tbody>
							</#list> 
							
						</table>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</@main.page>