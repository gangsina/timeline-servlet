/**
 * TODO 将以前写过的一个js方法合并到这里来。
 * @Author thender email: bentengwu@163.com
 * @Date 2019/6/26 14:30.
 */

//字符串--------------------------------------------------------------------------
/**
 *@description  生成随机的字符串
 *@author thender email: bentengwu@163.com
 *@date 2019/6/26 14:32
 *@param length  eg: 6
 *@return  随机的数组加字幕组成的字符串。
 **/
function randomStr(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

/**
 *@description 将 targetStr 中 出现 oldStr 的地方替换为 newStr
 *@author thender email: bentengwu@163.com
 *@date 2019/6/26 16:05
 *@param targetStr
 *@param oldStr
 *@param newStr
 *@return 替换后的字符串.
 **/
function replaceAll(targetStr, oldStr, newStr) {
    return targetStr.replace(new RegExp(oldStr, "g"), newStr);
}


/**
 *@description  获取时间
 *@author thender email: bentengwu@163.com
 *@date 2019/6/26 14:31
 *@param null	
 *@return  eg: 1984-12-13
 **/
function _getCurrentDate(){
    var date = new Date();// 获取当前日期
    var nowMonth = date.getMonth() + 1;
    var strDate = date.getDate();
    var seperator = "-";
    if (nowMonth >= 1 && nowMonth <= 9) {
        nowMonth = "0" + nowMonth;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    return date.getFullYear() + seperator + nowMonth + seperator + strDate;
}

/**
 *@description  根据属性名来获取name;
 * note: 如果有多个的情况下,取第一个.
 *@author thender email: bentengwu@163.com
 *@date 2019/6/28 16:03
 *@param unique_name 全局唯一的名字
 *@return 对应document中element的值.
 **/
function getValueByName(unique_name) {
    return document.getElementsByName(unique_name)[0].value;
}