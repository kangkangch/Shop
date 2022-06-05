var ip = "";
var address = "";
var date = new Date();
$(function () {
  //获取ip
  ip = returnCitySN.cip;
  $("#ip").val(ip);
  //获取地址
  address = returnCitySN.cname;
  $("#address").val(address);

  $("#submit").click(function () {
    var usernameText = $("#username").val();
    var usernamePatt = /^\w{3,8}$/;
    if (!usernamePatt.test(usernameText)) {
      $("#errorMessage").text("用户名不合法！")
      return false;
    } else {
      //获取时间
      date = new Date();
      // alert(date.toLocaleString());
      $("#date").val(date.toLocaleString());
    }
  })
})