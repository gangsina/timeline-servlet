<form id="myform">
	<input type="hidden" id="attachmentIds" name="attachmentIds" value="" />
	<input type="hidden" name="msgType" id="msgType" value="00"/>
	<input type="hidden" name="auditApplyId" id="auditApplyId" value="${apply.id}"/>
	<input type="hidden" name="auditFlowLevelId" id="auditFlowLevelId" value="${flowLevel.id}"/>
	<input type="hidden" name="status" id="status" value="${flowLevel.id}"/>
   <ul>
     <li>
     	<label><strong>* </strong> 审批意见:</label>
     	<input type="radio" name="checkstatus" value="1" id="yesStatus" checked class="chek"><i> 同意</i>
     	<#if flowLevel?? && flowLevel.nextId gt 0 && flowLevel.nextLevel??>
     	<p class="zhuand">
     		转到<input type="text" name="name" class="put" value="${flowLevel.nextLevel.employee.realName}" style="width:80px;" readonly /> 继续审批。
     	</p>
     	</#if>
     	<p class="noagree">
     		<input type="radio" name="checkstatus" id="noStatus" value="2" class="chek"><i> 不同意</i>
     	</p>
     </li>
     <li>
     	<label style="vertical-align:top">意见说明:</label>
     	<textarea name="memo" id="memo" maxlength="1000"></textarea>
     </li>
     <li>
     	<div style="margin-left:124px">
     	<input type="file" id="fileData" name="fileData">
     	</div>
     	<#--
     	<a href="#" class="sc_01">上传附件</a> 单次上传文件大小不能超过20MB。
     	-->
     	 <div style="margin-left:124px;" id="attachmentShow">
     	 
         </div>
     </li>
     <#--
     <li>
     	<label></label>
     	<span class="txfs2">
     		<strong >提醒方式:</strong>
     		<input type="checkbox" value="" class="chek" id="mailCheck"><i>邮件</i>  
     		<input type="checkbox" value="" class="chek" id="mobileCheck"><i> 短信</i>
     	</span>
     </li>
     -->
  </ul>
  </form>