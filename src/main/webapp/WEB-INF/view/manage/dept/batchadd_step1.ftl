      <div class="tcBG"></div>
      <div class="sxbkq">
           <h3>批量导入</h3>
           <div class="img"><img src="${ctx}/static/manage/images/pl_01.png" width="763" height="62" /></div>
           <div class="step_01">
               <div class="tit_01">导入Excel电子表格</div>
               <p>1. 编辑Excel电子表格信息<span> —— 将通讯录按照模板（<a href="${ctx}/static/common/templates.xls">下载模板</a>）进行整理</span></p>
               <div class="img"><img src="${ctx}/static/manage/images/pl-img.png" width="824" height="158" /></div>
               <p>2. 选择整理完成的Excel文件进行上传。</p>
               <div class="sccg"><input type="file" name="fileData" id="fileData"><em id="batchAddFileSuccessMessage"></em></div>
           </div>
           <div class="btn">
		           			<input type="hidden" id="batchAddFilePath" name="batchAddFilePath" value="">
		           			<input type="button" id="btn_batchAdd_step2" onclick="javascript:batchAdd_step2()" value="下一步" class="but1" />
           				    <input type="button" name="" value="取消" onclick="javascript:confirmLeave('您确定取消操作？');" class="but1" />
           		</table>
           		
           </div>
      </div>
      
<script type="text/javascript">
	$(function() {
		setTimeout(function(){
		    $("#fileData").uploadify({
		        'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
		        'uploader': '${ctx}/common/upload',
		        'formData'  : {'jsessionid':'${authService.sessionId}'},
		        'buttonText':'上传附件',
		        'height':15,
		        'width':80,
		        'fileSizeLimit':'20MB',
		        'fileObjName':'fileData',
		        'removeTimeout':3,
		        'queueSizeLimit':1,
		        'multi':false,
		        'onUploadSuccess' : function(file, data, response) {
		        	eval('data = '+data);
		        	$("#batchAddFileSuccessMessage").html("文件[ "+data.fileName +" ]上传成功！");
		        	$("#batchAddFilePath").val(data.filePath);
		        	$("#toStep2Form").show();
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传文件错误!");
		        }
		    });
		 },10);
	});
</script>