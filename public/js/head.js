
$(function() {
    $('#logform').submit(function(e) {
        e.preventDefault();
        var login = $("#login").val();
        var pass = $("#pass").val();
        var url = $("#current_url").val();
        $.ajax({
            type: "POST",
            url: "/index",
            data: {"login": login, "pass": pass},
            cache: false,
            success: function(response){
                var messageResp2 = new Array('Неправильно введены данные!','Неправильный логин или пароль', "Введите логин и пароль!");
                var resultStat = messageResp2[Number(response)];
                if(response == 3){
                    window.location.href = url;
                }
                $("#resp1").text(resultStat).show().delay(1500).fadeOut(800);
            }
        });
    });
});


