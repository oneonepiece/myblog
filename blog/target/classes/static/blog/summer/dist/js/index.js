/*
 * 
 * 
 * 
 */


//跳转
$(".panel #panelhrefid").click(function () {
    var href = $(".panel #panelhrefid").attr("href");
    gopage(href);
});
var gopage = function(uri) {
	window.location.href = uri.toString();
}

//当符合宽度条件就把一些元素隐藏
var minwith_hide = function() {
	var wid = $(window).width();
	if(wid <= 580 || wid < 1205 && wid > 900) {
		$(".mycursor-type #btn-minwith-hide").hide();
	} else {
		$(".mycursor-type #btn-minwith-hide").show();
	}
}


//图片缩放
var indeximgratio =  function() {
    $('.panel-footer .mycursor-type img').each(function() {
        var maxWidth = 140; // 图片最大宽度
        var maxHeight = 140;    // 图片最大高度
        var ratio = 0;  // 缩放比例
        var width = $(this).width();    // 图片实际宽度
        var height = $(this).height();  // 图片实际高度

        // 检查图片是否超宽
        if(width > maxWidth){
            ratio = maxWidth / width;   // 计算缩放比例
            $(this).css("width", maxWidth); // 设定实际显示宽度
            height = height * ratio;    // 计算等比例缩放后的高度
            $(this).css("height", height);  // 设定等比例缩放后的高度

        }else {
            $(this).css("margin-left", (maxWidth-width)/2 );
        }

        // 检查图片是否超高
        if(height > maxHeight){
            ratio = maxHeight / height; // 计算缩放比例
            $(this).css("height", maxHeight);   // 设定实际显示高度
            width = width * ratio;    // 计算等比例缩放后的高度
            $(this).css("width", width * ratio);    // 设定等比例缩放后的高度
        }else {
            $(this).css("margin-top", (maxHeight-height)/2 );
		}
		//主要是防止元素显示的时候先大后小，不够美观。
		//$(this).css("display" , "inline");
    });


}

