<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的事件</title>
<link type="text/css" href="${ctx}/static/front/css/moblie/index.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/moblie/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/moblie/flexible-0.3.4.min.js"></script>
</head>
<body>
<div class="wrap">
    <div class="title">
        <div class="title_left">类型</div>
        <div class="title_right">
		<#if follow.eventType == 1>
           广告上刊
		<#elseif follow.eventType == 2>
           活动启用
		<#elseif follow.eventType == 3>
			媒介采买
		</#if>
		</div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">标题</div>
        <div class="title_right">${follow.title}</div>
        <div class="clear"></div>
    </div>
    <div class="title">
    <div class="title_left">发起人</div>
    <div class="title_right">${follow.initiator}</div>
    <div class="clear"></div>
</div>
    <div class="title">
        <div class="title_left">时间</div>
        <div class="title_right">${follow.createDate?string('yyyy-MM-dd HH:mm:ss')}</div>
        <div class="clear"></div>
    </div>
<#if follow.eventType != 3>
    <div class="title">
        <div class="title_left">甲方</div>
        <div class="title_right">${follow.customerName}</div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType == 3>
    <div class="title">
        <div class="title_left">安装地点</div>
        <div class="title_right">${follow.address}</div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">安装位置</div>
        <div class="title_right"><div class="content">${follow.installPicAttachmentId}</div></div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">物业公司</div>
        <div class="title_right">${follow.propertyManagerCompany}</div>
        <div class="clear"></div>
    </div>
</#if>
    <div class="title">
        <div class="title_left">
		<#if follow.eventType == 2>
            合同金额
		<#elseif follow.eventType==1>单价<#elseif follow.eventType==3>单价</#if>
		</div>
        <div class="title_right">${follow.unitPrice}元</div>
        <div class="clear"></div>
    </div>
<#if follow.eventType == 1>
    <div class="title">
        <div class="title_left">设备数量</div>
        <div class="title_right">${follow.deviceNumber}</div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">海报附件</div>
        <div class="title_right"><div class="content">${follow.adcAttachmentId}</div></div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType != 3>
    <div class="title">
        <div class="title_left">合同附件</div>
        <div class="title_right"><div class="content">${follow.contractAttachmentId}</div></div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType == 2>
    <div class="title">
        <div class="title_left">预算附件</div>
        <div class="title_right"><div class="content">${follow.budgetAttachmentId}</div></div>
        <div class="clear"></div>
    </div>
</#if>

    <div class="title">
        <div class="title_left">合同来回</div>
        <div class="title_right">
            <#if follow.contractStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(1);"/>
            <#elseif follow.contractStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.contractStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(1);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">上级领导</div>
        <div class="title_right">
            <#if follow.upperStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(2);"/>
            <#elseif follow.upperStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.upperStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(2);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">总经理</div>
        <div class="title_right">
            <#if follow.generalManagerStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(3);"/>
            <#elseif follow.generalManagerStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.generalManagerStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(3);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">上刊</div>
        <div class="title_right">
            <input type="hidden" id="adcManagerStatus" value="${follow.adcManagerStatus}"/>
            <#if follow.adcManagerStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(4);"/>
            <#elseif follow.adcManagerStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.adcManagerStatus==2><img src="${ctx}/static/front/images/moblie/green.png" /></#if>
                &nbsp;&nbsp;&nbsp;&nbsp;
            下刊
         <#if follow.adcManagerStatus == -1>
            <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(4);"/>
        <#elseif follow.adcManagerStatus==1><img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(4);"/>
        <#elseif follow.adcManagerStatus==2><img src="${ctx}/static/front/images/moblie/green.png" /></#if>
        </div>
        <div class="clear"></div>
    </div>

<#if follow.eventType != 3>
    <div class="title">
        <div class="title_left">发票</div>
        <div class="title_right">
            <#if follow.billStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(5);"/>
            <#elseif follow.billStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.billStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(5);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">收款</div>
        <div class="title_right">
            <#if follow.makeCollectionsStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(6);"/>
            <#elseif follow.makeCollectionsStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.makeCollectionsStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(6);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType == 3>
    <div class="title">
        <div class="title_left">入库</div>
        <div class="title_right">
            <#if follow.putStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(7);"/>
            <#elseif follow.putStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.putStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(7);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">支付</div>
        <div class="title_right">
            <#if follow.payStatus == -1>
                <img src="${ctx}/static/front/images/moblie/grey.png" onclick="handleService(8);"/>
            <#elseif follow.payStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
            <#elseif follow.payStatus==2><img src="${ctx}/static/front/images/moblie/red.png" onclick="handleService(8);"/></#if>
        </div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType == 1>
    <div class="title">
        <div class="title_left">上刊时间</div>
        <div class="title_right">${follow.adcUpTime?string('yyyy-MM-dd HH:mm:ss')}</div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">下刊时间</div>
        <div class="title_right">${follow.adcDownTime?string('yyyy-MM-dd HH:mm:ss')}</div>
        <div class="clear"></div>
    </div>
</#if>
<#if follow.eventType == 2>
    <div class="title">
        <div class="title_left">开始时间</div>
        <div class="title_right">${follow.adcUpTime?string('yyyy-MM-dd HH:mm:ss')}</div>
        <div class="clear"></div>
    </div>
    <div class="title">
        <div class="title_left">结束时间</div>
        <div class="title_right">${follow.adcDownTime?string('yyyy-MM-dd HH:mm:ss')}</div>
        <div class="clear"></div>
    </div>
</#if>
    <div class="title">
        <div class="title_left">备注</div>
        <div class="title_right">${memo}</div>
        <div class="clear"></div>
    </div>
</div>
<#--<footer>-->
    <#--<div class="footer_left" >不通过</div>-->
    <#--<div class="footer_right" >通过</div>-->
    <#--<div class="clear"></div>-->
<#--</footer>-->
<div class="popup_box">
    <div class="popup">
        <div class="popup_top"><span>确认处理合同来回处理合同来回处理合同来回吗？</span></div>
        <div class="popup_content">
            <div class="popup_content_top">
                <label for="radio1" class="popup_radio1 checked">
                    <input type="radio" id="radio1" name="handle" value="1" checked>
                </label>
                <label for="radio2" class="popup_radio2">
                    <input type="radio" id="radio2" name="handle" value="2">
                </label>
                <label for="eadio3" class="popup_radio3">
                    <input type="radio" id="eadio3" name="handle" value="3">
                </label>
            </div>
            <div class="popup_content_bottom">
                <textarea name="remarks" id="remarks" placeholder="点击添加备注"></textarea>
            </div>
        </div>
        <div class="popup_bottom">
            <div class="popup_bottom_left">取消</div>
            <div class="popup_bottom_right" onclick="$('.popup_box').hide();">确认</div>
        </div>
    </div>
</div>
<script>
    $("footer>div").click(function () {
        alert($(this).html());
    })
    $(function(){
        //给所有的单选按钮点击添加处理
        $("input[type='radio']").click(function(){
            //找出和当前name一样的单选按钮对应的label，并去除选中的样式的class
            $("input[type='radio'][name='"+$(this).attr('name')+"']").parent().removeClass("checked");
            //给自己对应的label
            $(this).parent().addClass("checked");
        });
    });
    function handleService(type) {
        alert(type);
        $('.popup_box').show();
        if(type==1){
            $("#dialog_text").html("确认处理合同来回吗?");
        }else if(type==2){
            $("#dialog_text").html("上级领导确认处理吗?");
        }else if(type==3){
            $("#dialog_text").html("总经理确认处理吗?");
        }else if(type==4){
            if($("#adcManagerStatus").val()==-1){
                $("#dialog_text").html("确认处理上刊吗?");
            }else{
                $("#dialog_text").html("确认处理下刊吗?");
            }
        }else if(type==5){
            $("#dialog_text").html("确认处理发票吗?");
        }else if(type==6){
            $("#dialog_text").html("确认处理收款吗?");
        }else if(type==7){
            $("#dialog_text").html("确认处理入库吗?");
        }else if(type==8){
            $("#dialog_text").html("确认处理支付吗?");
        }
    }
    
    function submitHandle() {
        alert("处理成功");
        $('.popup_box').hide();
    }
</script>
</body>
</html>