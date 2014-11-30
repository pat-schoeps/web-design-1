$(document).ready(function() {
    $('.project-container').hover(function() {
       $(this).fadeTo(250, 0.8);
    },
    function() {
        $(this).fadeTo(250, 1);
    });

    $('li').hover(function() {
        $(this).css('border-bottom', '.25em solid black');
    },
    function() {
        $(this).css('border-bottom', '.0em');
    });


});




