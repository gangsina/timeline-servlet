  <div class="tcBG" style="width:385px;height:300px"></div>
     <div class="xzjs xzjs1" style="width:385px;height:300px">
          <h3 style="width:385px">
     	系统日志
          </h3>
          <div class="xzglBx xzzy" style="width:345px;height:150px">
			   <table>
			       <tr>
			          <td class="name">日志目录：</td>
			          <td ><input type="text" name="memo" id="memo" value="${showPath}" style="width:200px"  class="put" readOnly/>
			          </td>
			       </tr>
			        <tr>
			          <td class="name">日志名称：</td>
			          <td ><input type="text" name="value" id="value" value="${log4jName}" style="width:200px" class="put" readOnly/>
			          </td>
			       </tr>
			        <tr>
			          <td class="name">时间：</td>
			          <td ><input type="text" name="logDate" id="logDate" value="${currentDate}" onclick="WdatePicker({readOnly:true})" style="width:200px" class="put" />
			          </td>
			       </tr>
			   </table>
  		</div>
      <div class="buttom">
      	  <#if lib.checkOper('20050103')>
	      	<button type="button" class="but1" onclick="location.href='${ctx}/manage/log/downloadSysLog?date='+$('#logDate').val()">下载</button>
	      </#if>
	      <button onclick="$.unblockUI();" type="button" class="but2" >取消</button>
      </div>
 </div>