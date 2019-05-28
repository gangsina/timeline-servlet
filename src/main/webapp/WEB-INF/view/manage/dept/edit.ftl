<div class="tcBG"></div>
     <div class="xzjs xzjs1">
          <h3>编辑部门</h3>
          <div class="xzglBx xzzy">
              <form id="create_depfrom">
               <input type="hidden" name="id" value="${dept.id}">
               <table>
                   <tr>
                      <td class="name  two_01">父部门名称：</td>
                      <td class="two_01 zitys"><#if parentId = 0>亿我拍<#else>${parentName.deptName}</#if></td>
                   </tr>
                   <tr>
                      <td class="name"><strong>* </strong>部门名称：</td>
                      <td><input type="text" name="deptName" id="deptName" value="${dept.deptName}"  class="put validate[required,maxSize[30]]" style="width:150px"/>
                      </td>
                   </tr>
                   <tr>
                      <td class="name">排序：</td>
                      <td ><input type="text" name="sortOrder" id ="sortOrder" value="${dept.sortOrder}"  class="put" style="width:150px"/>
                      </td>
                   </tr>
                   <tr>
                      <td class="name" valign="top" style="line-height:28px">部门描述：</td>
                      <td>
                          <textarea name="memo" id ="memo">"${dept.memo}"</textarea>
                      </td>
                   </tr>
                   <tr>
                      <td class="name" >名称：</td>
                      <td>
                          <span><input type="radio" name = "enable" <#if dept.enable == 1>checked</#if> id="enable1" value="1" class="chek2"><label>启用</label></span>
                          <span><input type="radio" name = "enable" <#if dept.enable == 2>checked</#if> id ="enable2" value="2" class="chek2"><label>禁用</label></span>
                      </td>
                   </tr>
               </table>
              </form>
          </div>
          <div class="buttom">
          	<button type="button" class="but1" onClick="update();">保存</button>
          	<#--><button type="button" class="but1" onClick="deleteDept();">删除</button>-->
          	<button type="button" class="but2" onClick="cancel();">取消</button></div>
     </div>
  </div>
