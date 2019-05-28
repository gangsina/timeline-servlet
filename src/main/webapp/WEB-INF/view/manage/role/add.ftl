 <div class="tcBG"></div>
 <div class="xzjs xzjs1">
  <h3>新增职务</h3>
  <div class="xzglBx xzzy">
  <form id="myform">
   <table>
       <tr>
          <td class="name"><strong>* </strong>职位名称：</td>
          <td ><input type="text" name="roleName" id="roleName" value=""  class="put validate[required,maxSize[50]]" style="width:150px"/>
          </td>
       </tr>
        <tr>
          <td class="name"><strong>* </strong>排序：</td>
          <td ><input type="text" name="sortOrder" id="sortOrder" value=""  class="put validate[required,maxSize[5],custom[integer]]" style="width:150px"/>
          </td>
       </tr>
       <tr>
          <td class="name" valign="top" style="line-height:28px">职位描述：</td>
          <td>
              <textarea name="memo" id="memo" class="validate[maxSize[200]]"></textarea>
          </td>
       </tr>
       <tr>
          <td class="name" valign="top" style="line-height:36px;">职务权限：</td>
          <td>
             <div class="ztreeData" style="margin-left:10px;overflow:auto;">
             	<ul id="ztreeList" class="ztree"></ul>
             </div>
          </td>
       </tr>
   </table>
   <input type="hidden" name="operIds" id="operIds" value="">
  </form>
  </div>
  <div class="buttom"><button type="button" onclick="createRole();" class="but1">提交</button><button type="button" onclick="$.unblockUI();" class="but2" >取消</button></div>
 </div>
 <script type="text/javascript">
 
 
 var ztree;
 $(function(){
 
 	var setting = {
    	check: {
    		enable: true
    	},
    	data: {
    		simpleData: {
    			enable: true
    		}
    	}
    };
	
	var zTreeNodes = ${jsonData};
	$.fn.zTree.init($("#ztreeList"), setting, zTreeNodes);
	ztree = $.fn.zTree.getZTreeObj("ztreeList");
 })
 
function createRole(){

	var allCheck = $('#myform').validationEngine('validate');
	if(!allCheck){
		return;
	}

	var nodes =  ztree.getCheckedNodes(true);
	var operIds = "";
	for(var i =0; i<nodes.length; i++){
		if(nodes[i].code){
			operIds += nodes[i].id + ",";
		}
	}
	if(operIds == ""){
		alert("请选择操作权限!");
		return;
	}
	operIds = operIds.substring(0,operIds.length-1);
	$("#operIds").val(operIds);
	$.ajax({
		url:'${ctx}/manage/role/create',
		dataType:'json',
		data:$('#myform').serialize(),
		type:'post',
		success:function(data){
			alert(data.msg);
			if(data.result == "ok"){
				location.reload();
			}
		},error:function(data){
			alert("提交失败!");
		}
	})
}
 </script>