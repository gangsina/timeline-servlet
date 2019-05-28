<div class="tcBG"></div>
     <div class="xzjs xzjs1">
          <h3>访问记录</h3>
          <div class="xzglBx xzzy">
              <form>
               <table>
                   <tr>
                      <td class="name2 two_01">附件名称：</td>
                      <td class="two_01 zitys">${attachment.attachmentName}</td>  
                   </tr>
                   <tr>
                      <td class="name2">访问次数：</td>
                      <td class="blue">${attachment.downloadCount}</td>  
                   </tr>
                   <tr>
                      <td class="two_01 name2">上传人：</td>
                      <td class="two_01 zitys">${attachment.employee.realName}</td>  
                   </tr>
                   <tr>
                      <td class="name2">上传时间：</td>
                      <td class="zitys">${attachment.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>  
                   </tr>
               </table>
              </form>
          </div>
          <div class="xzglBx xzzy" style="overflow:auto">
               <table>
               	<#list recordList as rl>
                   <tr>
                      <td class="name2 <#if rl_index%2==0>two_01</#if>">访问人:</td>
                      <td class="zitys <#if rl_index%2==0>two_01</#if>">${rl.employee.realName}</td>
                      <td class="name2 <#if rl_index%2==0>two_01</#if>">访问时间:</td>
                      <td class="zitys <#if rl_index%2==0>two_01</#if>">${rl.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
                   </tr>
                   </#list>
               </table>
          </div>
          <div class="btn_02">
               <button type="button" class="Button5" onclick="$.unblockUI();">关闭</button>
          </div>
     </div>