$(document).ready(function(){
    $(function(){
        $("#topcontrol").css("display", "none");
        $(window).scroll(function(){
            if($(window).scrollTop()>100){
                $("#topcontrol").fadeIn(1500);
            }
            else{
                $("#topcontrol").fadeOut(1500);
            }
        });
    });
    $("#topcontrol").on("click", function(){
        $("body,html").animate({
            scrollTop:0
        },
        500);
        return false;
    });
});
