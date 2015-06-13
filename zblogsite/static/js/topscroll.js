$(document).ready(function(){
    function topscroll(){
        $(window).scroll(function(){
        if($(window).scrollTop()>100){
            $("#topcontrol").fadeIn(1500);
        }
        else{
            $("#topcontrol").fadeOut(1500);
        }
    }
    topscroll();
});
