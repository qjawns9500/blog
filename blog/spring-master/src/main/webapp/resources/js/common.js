$(document).ready(function () {
    $(window).scroll(function () {
        let headerScroll = $(window).scrollTop();

        if (headerScroll > 90) {
            $('.header').addClass('scroll')
        } else {
            $('.header').removeClass('scroll')
        }
    })
    
    $('.header').mouseenter(function () {
        $(this).addClass('headerActive')
    })

    $('.header').mouseleave(function () {
        $(this).removeClass('headerActive')
    })

    $('.toggle').click(function () {
        $('.header').toggleClass('toggleActive')
    })

})