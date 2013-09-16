// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function liclick(){
    $(" .departments ul ").css({display: "none"}); // Opera Fix
    $(" .department li").hover(function(){
        $(this).find('ul:first').css({visibility: "visible",display: "none"}).show(400);
    },function(){
        $(this).find('ul:first').css({visibility: "hidden"});
    });
}
            /*
$(document).ready(function(){
    liclick();
});       */