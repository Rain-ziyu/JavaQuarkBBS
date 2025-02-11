/*链接*/
var hosts = "yzzy.top:8081";
var quark_login_api = "http://"+hosts+"/user/login";
var quark_getUser_api = "http://"+hosts+"/user/message/";
var quark_KeyWordReplace_api = "http://"+hosts+"/replace";
var quark_logout_api = "http://"+hosts+"/user/logout";
var quark_register_api = "http://"+hosts+"/user";
var quark_upload_api = "http://"+hosts+"/upload/image";
var quark_upload_icon_api = "http://"+hosts+"/upload/usericon/";
var quark_posts_add_api = "http://"+hosts+"/posts";
var quark_posts_get_api = "http://"+hosts+"/posts";
var quark_chat_History_api = "http://"+hosts+"/chat";
var quark_chat_creatChat_api = "http://"+hosts+"/chat";
var quark_chat_getChatList_api = "http://"+hosts+"/chat/list";
var quark_posts_detail_api = "http://"+hosts+"/posts/detail/";
var quark_reply_add_api = "http://"+hosts+"/reply";
var quark_collect_add_api = "http://"+hosts+"/collect";
var quark_collect_all_api = "http://"+hosts+"/collect";
var quark_collect_judge_api = "http://"+hosts+"/collect/judge";
var quark_collect_del_api = "http://"+hosts+"/collect";
var quark_label_getall_api = "http://"+hosts+"/label";
var quark_rank_posts_api="http://"+hosts+"/rank/topPosts";
var quark_rank_users_api = "http://"+hosts+"/rank/newUsers";
var quark_user_detail_api = "http://"+hosts+"/user/detail/";
var quark_userInfo_detail_api = "http://"+hosts+"/user/userInfo/";
var quark_user_update_api = "http://"+hosts+"/user/";
var quark_user_update_psd_api = "http://"+hosts+"/user/password/";
var quark_label_posts_api = "http://"+hosts+"/posts/label/";
var quark_webSocket_api = "http://"+hosts+"/quarkServer";
var quark_notification_api="http://"+hosts+"/notification/";
var quark_adv_getList_api="http://"+hosts+"/adv";
var quark_adv_add_api="http://"+hosts+"/adv";
var quark_rereply_add_api="http://"+hosts+"/reply/rereply";
var quark_adv_getByUser_api="http://"+hosts+"/adv/getById";
var quark_title_getAll_api = "http://"+hosts+"/title/all";
var quark_title_getByUser_api = "http://"+hosts+"/title";
var quark_title_wear_api = "http://"+hosts+"/title";
var quark_search_add_api="http://"+hosts+"/search";
var quark_search_get_api="http://"+hosts+"/search";
var quark_label_add_api="http://"+hosts+"/label";
var quark_chat_webSocket_api = "ws://124.222.44.157:8083/websocket";

function setCookie(data) {
    var expiresDate= new Date();
    expiresDate.setTime(expiresDate.getTime() + (60 * 60 * 1000));
    $.cookie("QUARK_TOKEN",data,{
        path: '/',
        expires : 1
    });
}

function getCookie() {
    return $.cookie('QUARK_TOKEN');
}

function deleteCookie() {
    $.cookie("QUARK_TOKEN",null,{
        path: '/'
    });
}

(function ($) {
    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
})(jQuery);

function applyHeader() {
    var htm;
    $.get(quark_getUser_api+ getCookie(),function (data) {
        if (data.status == 200){
            htm =  "<a class='avatar' href='/user/setting'>"+
                "<img src='"+data.data.icon+"'>"+
                "<cite>"+data.data.username+"</cite>"+
                "</a>"+
                "<div class='nav'>"+
                "<a href='/user/setting'><i class='iconfont icon-shezhi'></i>设置</a>"+
                "<a href='' onclick='logout()'><i class='iconfont icon-tuichu' style='top: 0; font-size: 22px;'></i>退了</a>"+
                "</div>";
        }else{
            htm ="<a class='unlogin' href='#'><i class='iconfont icon-touxiang'></i></a>"+
                "<span><a href='/user/login'>登入</a><a href='/user/register'>注册</a></span>";
        }

        $(".nav-user").append(htm);
    });
}

function logout() {

    $.post(quark_logout_api,{
        token: getCookie()
    },function (obj) {
        if (obj.status == 200){
            deleteCookie();
            location.href = "/index";
        }else{
            layer.msg(obj.error,{icon:5});
        }
    });

}