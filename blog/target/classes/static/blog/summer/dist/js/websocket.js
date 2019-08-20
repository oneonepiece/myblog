
//显示数据left
function dataEncapsulationLeft( name,mess,messTime){
    <!-- Message. Default to the left -->
    var left1 = '<div class="direct-chat-msg">\n' +
        '    <div class="direct-chat-info clearfix">\n' +
        '    <span class="direct-chat-name pull-left"> ';
  //name
    var left2 = '</span>\n<span class="direct-chat-timestamp pull-right">';
       //messTime
    var left3 = '</span>\n' +
                '</div>\n' +
                '<img class="direct-chat-img" ' +
                'src="/blog/summer/dist/img/user1-128x128.jpg"   alt="Message User Image">\n'+
                '<div class="direct-chat-text">';
    //message
    var left4 = '</div> </div>';

    $(".direct-chat-messages").append(left1 + name + left2 + messTime + left3 + mess + left4);
}
//显示数据left
function dataEncapsulationRight(name,mess,messTime){

    var right1 = '<div class="direct-chat-msg right" >\n' +
        '    <div class="direct-chat-info clearfix">\n' +
        '    <span class="direct-chat-name pull-right"> ';

    var right2 = '</span>\n' +
        '<span class="direct-chat-timestamp pull-left">';

    var right3 = '</span>\n' +
        '</div>\n' +
        '<img class="direct-chat-img" ' +
        'src="/blog/summer/dist/img/user3-128x128.jpg"  alt="Message User Image">\n' +
        '   <div class="direct-chat-text" id="my-message-right">';

    var right4 = '</div> </div>';

    $(".direct-chat-messages").append(right1 + name + right2 + messTime + right3 + mess + right4 );

}

//用户id、名字
var myid = getRandom(999);
var myname = "Alin";
//var myMessTime = "2019-07-19 13:30";

var stompClient = null;

//随机数
function getRandom(n){
    return Math.floor(Math.random()*n+1)
}

//解析是自己发的消息还是对方发的
function jsonResolver(message) {
    var userid = JSON.parse(message.body).userid;
    var name = JSON.parse(message.body).name;
    var mess = JSON.parse(message.body).message;
    var messTime =  JSON.parse(message.body).message_time;

    if (userid == myid){
        dataEncapsulationRight(name , mess ,messTime);
    } else {
        dataEncapsulationLeft(name , mess ,messTime);
    }

}
//messageRestUrl  获取旧消息
function getMessageOld(messageRestUrl) {
    //var messageRestUrl = "/restapi/getmessage";
    $.ajax({url:messageRestUrl.toString(),async:true,success:function(resultdata){
            //each方法中的函数参数为两个时，item为数组的每一项，item返回的是对item对象的提取。
            $.each(resultdata,function(index,item){
                jsonResolverOld(item);
            });

        }});
    //旧消息解析
    function jsonResolverOld(jsondata) {
       var userid = jsondata.userid;
       var name = jsondata.name;
       var message = jsondata.message;
       var message_time = jsondata.message_time;
       if (name == null)return;
        if (userid == myid){
            dataEncapsulationRight(name , message ,message_time);
        } else {
            dataEncapsulationLeft(name , message ,message_time);
        }
    }
}


//连接
function connect() {
    //获取旧消息
    getMessageOld("/restapi/getmessage");

    var socket = new SockJS('/gs-guide-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        //连接成功
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/reply', function (message) {
            //showGreeting(JSON.parse(greeting.body).content);
            //解析返回的消息，也就是准备需要显示的消息
            jsonResolver(message)
        });
    });
}

//关闭连接
function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
   // 连接关闭
    console.log("Disconnected");
}

//时间
function timeString() {
    //判断是否在前面加0
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }
    var myDate = new Date();
    var year=myDate.getFullYear();        //获取当前年
    var month=myDate.getMonth()+1;   //获取当前月
    var date=myDate.getDate();            //获取当前日
    var h=myDate.getHours();              //获取当前小时数(0-23)
    var m=myDate.getMinutes();          //获取当前分钟数(0-59)
    var s=myDate.getSeconds();

    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
    return now;

}
//发送消息
function sendName() {
    var message = $("#my-message").val();
    //空值过滤
    if(message === "")return null;
    var messageTime = timeString();
    var objMessage = {"message":message , "userid":myid ,
        "name": myname , "message_time": messageTime };

    stompClient.send("/app/message_send", {}, JSON.stringify(objMessage));

}

$(function () {
    //阻止form表单点击submit时的默认操作
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    //连接的时候应该获取历史记录
    connect();
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#message-send" ).click(function() { sendName(); });
});


//以下是springboot里参考的demo源代码
// var stompClient = null;
//
// function setConnected(connected) {
//     $("#connect").prop("disabled", connected);
//     $("#disconnect").prop("disabled", !connected);
//     if (connected) {
//         $("#conversation").show();
//     }
//     else {
//         $("#conversation").hide();
//     }
//     $("#greetings").html("");
// }
//
// function connect() {
//     var socket = new SockJS('/gs-guide-websocket');
//     stompClient = Stomp.over(socket);
//     stompClient.connect({}, function (frame) {
//         setConnected(true);
//         console.log('Connected: ' + frame);
//         stompClient.subscribe('/topic/greetings', function (greeting) {
//             showGreeting(JSON.parse(greeting.body).content);
//         });
//     });
// }
//
// function disconnect() {
//     if (stompClient !== null) {
//         stompClient.disconnect();
//     }
//     setConnected(false);
//     console.log("Disconnected");
// }
//
// function sendName() {
//     stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
// }
//
// function showGreeting(message) {
//     $("#greetings").append("<tr><td>" + message + "</td></tr>");
// }
//
// $(function () {
//     $("form").on('submit', function (e) {
//         e.preventDefault();
//     });
//     $( "#connect" ).click(function() { connect(); });
//     $( "#disconnect" ).click(function() { disconnect(); });
//     $( "#send" ).click(function() { sendName(); });
// });