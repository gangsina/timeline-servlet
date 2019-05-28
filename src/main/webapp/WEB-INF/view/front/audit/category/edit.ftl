 <div class="tcBG"></div>
 <div class="qjsq">
      <h3>修改类型</h3>
      <div class="tbl">
          <div class="leix">
          	<strong>*</strong>类型名称：
          	<input type="text" maxlength="30" id="categoryName" name="categoryName" class="put" value="${category.categoryName}" />
          </div>
           <div style="margin-left:87px;color:red;margin-top:5px;display:none" id="errorMsgDiv">* 请输入类型名称 </div>
      </div>
      <div class="btn_02">
           <button type="button" class="Button4" onclick="formSubmit(${category.id});">确定</button>
           <button type="button" class="Button5" onclick="$.unblockUI();">取消</button>
      </div>
 </div>
