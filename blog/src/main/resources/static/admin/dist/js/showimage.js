/**
 * 从 file 域获取 本地图片 url
 * 编辑：www.jbxue.com
 */
function getFileUrl(sourceId) {
    var url;
    if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
        url = document.getElementById(sourceId).value;
    } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
    } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
        url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
    }
    return url;
}

/**
 * 将本地图片 显示到浏览器上
 * 编辑：www.jbxue.com
 */
// function preImg(sourceId, targetId) {
//     var url = getFileUrl(sourceId);
//     var imgPre = document.getElementById(targetId);
//     imgPre.src = url;
// }

//$('#randomCoverImage').onchange(preImg(this.id , "#blogCoverImage");

$('#randomCoverImage').onchange(function () {
    var url = getFileUrl("#blogCoverImage");
    $("#blogCoverImage").attr("src", url);
    $("#blogCoverImage").attr("style", "width:160px ;height: 120px;display:block;");

});

// <input type="file" name="imgOne" id="imgOne" onchange="preImg(this.id,'imgPre');" />
//     <img id="imgPre" src="" width="300px" height="300px" style="display: block;" />