<div class="tcBG"></div>
     <div class="xzjs xzjs1">
          <h3>添加部门</h3>
          <div class="xzglBx xzzy">
              <form id="create_depfrom">
               <input type="hidden" name="id" value="${parentId}">
               <table>
                   <tr>
                      <td class="name  two_01">父部门名称：</td>
                      <td class="two_01 zitys" ><#if parentId = 0>亿我拍</#if>${dept.deptName}</td>
                   </tr>
                   <tr>
                      <td class="name"><strong>* </strong>部门名称：</td>
                      <td><input type="text" name="deptName" id="deptName"  class="validate[required,maxSize[30]]" style="width:150px"/>
                      </td>
                   </tr>
                   <tr>
                      <td class="name">排序：</td>
                      <td ><input type="text" name="sortOrder" id ="sortOrder" value="100"  class="put" style="width:150px"/>
                      </td>
                   </tr>
                   <tr>
                      <td class="name" valign="top" style="line-height:28px">部门描述：</td>
                      <td>
                          <textarea name="memo" id ="memo">最多输入64个字</textarea>
                      </td>
                   </tr>
                   <tr>
                      <td class="name" >名称：</td>
                      <td>
                          <span><input type="radio" name = "enable" id="enable1" value="1" class="chek2" checked><label>启用</label></span>
                          <span><input type="radio" name = "enable" id ="enable2" value="2" class="chek2"><label>禁用</label></span>
                      </td>
                   </tr>
               </table>
              </form>
          </div>
          <div class="buttom">
          	<button type="button" class="but1" onClick="create(${parentId});">保存</button>
          	<button type="button" class="but2" onClick="cancel();">取消</button></div>
     </div>
  </div>