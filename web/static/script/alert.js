function alert(e){
    // $("body").append("<div id='msg'><span>"+e+"</span></div>");
    let html="";
    html+="<div class='con'><div id='msg'>";
    html+="<div class='info_message'>";
    html+="<div class='alertTitle'>提示</div>";
    html+="<span class='detail_message'>"+e+"</span>";
    html+="</div><div id='alertSure'>确定</div>";
    html+="<div id='alertCancel'>取消</div></div></div>"
    $('body').append(html);
    clearmsg();
}
function clearmsg(){
    // var t = setTimeout(function(){
    //     $("#msg").remove();
    // },2000)
    $('#alertSure').click(function(){
        $("#msg").remove();
        $('.con').remove();
    })
    $('#alertCancel').click(function(){
        $("#msg").remove();
        $('.con').remove();
    })
};
