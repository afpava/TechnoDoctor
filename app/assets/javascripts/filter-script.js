// JavaScript Document
  $(document).ready(function(){
    var $container = $('.brands_ids');
    $container.isotope({
        filter: '*',
        percentPosition: true,

        animationOptions: {
            duration: 750,
            easing: 'linear',
            queue: false,

        }
    });

    $('.brands_ids a').click(function(){
        $('.brands_ids .current').removeClass('current');
        $(this).addClass('current');

        var selector = $(this).attr('data-filter');
        $container.isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
         });
         return false;
    });
});
