$(document).ready(function() {
    $(".scroll-to").on('click', function (e){
        e.preventDefault();
        $('body').animate({
            scrollTop: $($(this).data('to')).offset().top - 64
        }, 400);
    });
});