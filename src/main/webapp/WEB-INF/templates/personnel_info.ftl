<link href="${request.contextPath}/css/preview_table.css" rel="stylesheet" type='text/css'/>

<div style="width:800px;margin:auto;font-size:12px">
	<div class="littleTitlePreview">
        个人信息
    </div>
    <div>
        <table class="tableRegisterPreview">
            <tbody><tr>
                <td>
                    <div class="divoptitlePreview">姓名</div>
                    <div class="divopctrlPreview"><#if employee.name??>${employee.name?html}</#if></div>
                </td>
                
                <td>
                    <div class="divoptitlePreview">性别</div>
                    <div class="divopctrlPreview"><#if employee.gender??>${employee.gender?html}</#if></div>
                </td>
                
            </tr>
            <tr>
                <td>
                	<div class="divoptitlePreview">年龄</div>
                	<div class="divopctrlPreview"><#if employee.age??>${employee.age?html}</#if></div>
                </td>
                <td>
                	<div class="divoptitlePreview">职务</div>
                	<div class="divopctrilPreview"><#if employee.position??>${employee.position?html}</#if></div>
                </td>
                
            </tr>
            <tr>
                <td>
                	<div class="divoptitlePreview">学历</div>
                	<div class="divopctrilPreview">
						<#if employee.education??>
							<#if employee.education=="1">大专
							<#elseif employee.education=="2">本科
							<#elseif employee.education=="3">硕士
							<#elseif employee.education=="4">博士
							</#if>
						</#if>
						</div>
                </td>
                <td>
                	<div class="divoptitlePreview">学位</div>
                	<div class="divopctrilPreview">
					<#if employee.degree??>
						<#if employee.degree=="0">有
						<#elseif employee.degree=="1">无
						</#if>
					</#if></div>
                </td>
            </tr>
            <tr>
            	<td>
                	<div class="divoptitlePreview">部门</div>
                	<div class="divopctrlPreview"><#if employee.department??>${employee.department?html}</#if></div>
                	
                </td>
                <td>
                	<div class="divoptitlePreview">人员状态</div>
                	<div class="divopctrlPreview">
					<#if employee.rstatus??>
						<#if employee.rstatus=="1">在职
						<#elseif employee.rstatus=="1">兼职
						<#elseif employee.rstatus=="2">离职
						</#if>
					</#if></div>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    
    <!-- 履历管理 -->
    <div class="littleTitlePreview">履历管理</div>
    <div>
        <table class="tableRegisterPreview">
            <tbody><tr>
            	<th>职位</th>
                <th>工作部门</th>
                <th>工作内容</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>业绩</th>
            </tr>
            	<td><#if detail.job??>${detail.job?html}</#if></td>
            	<td><#if detail.department??>${detail.department?html}</#if></td>
            	<td><#if detail.workcontent??>${detail.workcontent?html}</#if></td>
            	<td><#if detail.starttime??>${detail.starttime?string("yyyy-MM-dd")}</#if></td>
            	<td><#if detail.endtime??>${detail.endtime?string("yyyy-MM-dd")}</#if></td>
           		<td><#if detail.performance??>${detail.performance?html}</#if></td>
            <tr>
            	
            </tr>
        </tbody>
        	
        </table>
    </div>
    
    <!-- 合同管理 -->
    <div class="littleTitlePreview">合同管理</div>
    <div>
        <table class="tableRegisterPreview">
            <tbody><tr>
            	<th>合同编号</th>
                <th>岗位</th>
                <th>合同内容</th>
                <th>开始时间</th>
                <th>结束时间</th>
            </tr>
            	
            <tr>
            	<td><#if contract.contractnum??>${contract.contractnum?html}</#if></td>
            	<td><#if contract.quarters??>${contract.quarters?html}</#if></td>
            	<td><#if contract.content??>${contract.content?html}</#if></td>
            	<td><#if contract.starttime??>${contract.starttime?string("yyyy-MM-dd")}</#if></td>
            	<td><#if contract.endtime??>${contract.endtime?string("yyyy-MM-dd")}</#if></td>
            </tr>
        </tbody>
        	
        </table>
    </div>
    
    
    <!-- 档案管理 -->
    <#--<div class="littleTitlePreview">档案管理</div>
    <div>
        <table class="tableRegisterPreview">
            <tbody><tr>
            	<th>档案号码</th>
                <th>所属部门</th>
                <th>档案名称</th>
                <th>内容摘要</th>
                <th>备注</th>
                <th>创建时间</th>
            </tr>
            	<td><#if dossier.dossiernum??>${dossier.dossiernum}</#if></td>
            	<td><#if detail.department??>${detail.department?html}</#if></td>
            	<td><#if detail.workcontent??>${detail.workcontent?html}</#if></td>
            	<td><#if detail.starttime??>${detail.starttime?string("yyyy-MM-dd")}</#if></td>
            	<td><#if detail.endtime??>${detail.endtime?string("yyyy-MM-dd")}</#if></td>
           		<td><#if detail.performance??>${detail.performance?html}</#if></td>
            <tr>
            	
            </tr>
        </tbody>
        	
        </table>
    </div>-->
    <!-- 奖惩管理 -->
    <div class="littleTitlePreview">合同管理</div>
    <div>
        <table class="tableRegisterPreview">
            <tbody><tr>
            	<th>奖惩标题</th>
                <th>奖惩内容</th>
                <th>奖惩类别</th>
                <th>奖惩时间</th>
            </tr>
            	<#list rewardsAndpunishments as rp>
            <tr>
            	<td><#if rp.rewardstitle??>${rp.rewardstitle?html}</#if></td>
            	<td><#if rp.rewardscontext??>${rp.rewardscontext?html}</#if></td>
            	<td><#if rp.rewardscategory??>
            		<#if rp.rewardscategory=="1">嘉奖
            		<#elseif rp.rewardscategory=="2">记功
            		<#elseif rp.rewardscategory=="3">记大功
            		<#elseif rp.rewardscategory=="4">升级
            		<#elseif rp.rewardscategory=="5">晋升
            		<#elseif rp.rewardscategory=="6">破格晋升
            		<#elseif rp.rewardscategory=="7">警告
            		<#elseif rp.rewardscategory=="8">记过
            		<#elseif rp.rewardscategory=="9">记大过
            		<#elseif rp.rewardscategory=="10">降级
            		<#elseif rp.rewardscategory=="11">撤职
            		<#elseif rp.rewardscategory=="12">开除
            		</#if>
            	</#if></td>
            	<td><#if rp.rewardstime??>${rp.rewardstime?string("yyyy-MM-dd")}</#if></td>
            </tr>
            	</#list>
        </tbody>
        	
        </table>
    </div>
</div>