var _assert = '1'; //全局调试控制台日志开关.  1 为打开,其他值为关闭!
var _develop_tag = '1'; //打开将使用开发环境的地址. 1位打开, 其他值为关闭
/**
	这个js文件用于定义全局的变量
	这个文件中的所有变量都需要在后台生成
*/
var base_url = "http://localhost:51122";
var image_url="http://localhost:51122";

var develop_base_url = "http://localhost/timeline";
var develop_image_url="http://localhost/timeline";


var tag_url = "user/tagcontent_list.html?tagId=";//"page/p/user/label";
var p_s_url = getBaseUrl() +  "/p";
var m_s_url = getBaseUrl() +  "/m";

/*method*/
var _method_post = "post";
var _method_get	="get";


/*data_type  json/xml/form/string/bytes*/
var _data_type_xml = "xml";
var _data_type_json = "json";
var _data_type_string = "string";
var _data_type_form = "form";
var _data_type_bytes = "bytes";

/*fmt*/
var _fmt_map = "map";
var _fmt_json = "json";
var _fmt_string = "string";

/*opt*/
var _opt_l = "l";
var _opt_r = "r";
var _opt_c = "c";
var _opt_u = "u";
var _opt_d = "d";

/*date format*/
var format_y = 'yyyy';
var format_ym = 'yyyy-mm';
var format_ymd = 'yyyy-mm-dd';
var format_ymdhm = 'yyyy-mm-dd HH:MM';
var format_ymdhms = 'yyyy-mm-dd HH:MM:ss';


var _url_r =getBaseUrl()+"/r/1";//请求地址.
var _url_config = getBaseUrl() + "/static/json/config.json";


var _assert_cut1 = "=========================";
var _assert_cut2 = "======================================================";


function getBaseUrl() {
	if (_develop_tag == '1') {
		return develop_base_url;
	}else{
		return base_url;
	}
}


function getImageUrl() {
	if (_develop_tag == '1') {
		return develop_image_url;
	}else{
		return image_url;
	}
}

function assertAlert(message) {
	if(_assert=='1') {
		alert(message);
	}
}

function assertConsole(message) {
	if(_assert=='1'){
		console.log(message);
	}
}


function assertCut1() {
	if(_assert=='1'){
		assertConsole(_assert_cut1);
	}
}

function assertCut2() {
	if(_assert=='1'){
		assertConsole(_assert_cut2);
	}
}

var _help = "请联系管理员bentengwu@163.com或稍后再试!";

function _help(msg) {
	if (msg) {
		return msg + ","+_help;
	}else{
		return _help;
	}
}

function _alertHelp(msg) {
	alert(_help(msg));
}

function go(url) {
	window.location.href = url;
}





