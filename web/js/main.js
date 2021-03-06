/* ========================================================================= */
/*  Preloader Script
 /* =========================================================================
 
 window.onload = function () {
 document.getElementById('loading-mask').style.display = 'none';
 } */

$(function () {
    /* ========================================================================= */
    /*  Menu item highlighting
     /* ========================================================================= */

    jQuery(window).scroll(function () {
        if (jQuery(window).scrollTop() > 400) {
            jQuery("#navigation").css("background-color", "#00C7FC");
            jQuery("#navigation").addClass("animated-nav");
        } else {
            jQuery("#navigation").css("background-color", "transparent");
            jQuery("#navigation").removeClass("animated-nav");
        }
    });

    $('#nav').onePageNav({
        filter: ':not(.external)',
        scrollSpeed: 950,
        scrollThreshold: 1
    });

    // Slider Height
    var slideHeight = $(window).height();
    $('#home-carousel .carousel-inner .item, #home-carousel .video-container').css('height', slideHeight);

    $(window).resize(function () {
        'use strict',
                $('#home-carousel .carousel-inner .item, #home-carousel .video-container').css('height', slideHeight);
    });

    // portfolio filtering

    $("#projects").mixItUp();

    //fancybox

    $(".fancybox").fancybox({
        padding: 0,

        openEffect: 'elastic',
        openSpeed: 650,

        closeEffect: 'elastic',
        closeSpeed: 550,
    });


    /* ========================================================================= */
    /*  Facts count
     /* ========================================================================= */

    "use strict";
    $(".fact-item").appear(function () {
        $(".fact-item [data-to]").each(function () {
            var e = $(this).attr("data-to");
            $(this).delay(6e3).countTo({
                from: 50,
                to: e,
                speed: 3e3,
                refreshInterval: 50
            })
        })
    });

    /* ========================================================================= */
    /*  On scroll fade/bounce fffect
     /* ========================================================================= */

    $("#testimonial").owlCarousel({
        pagination: true, // Show bullet pagination
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true
    });

});

/* ========================================================================= */
/*  On scroll fade/bounce fffect
 /* ========================================================================= */

wow = new WOW({
    animateClass: 'animated',
    offset: 100,
    mobile: false
});
wow.init();

/* ---------------------------------------------------------------------- */
/*      Progress Bars
 /* ---------------------------------------------------------------------- */

initProgress('.progress');

function initProgress(el) {
    jQuery(el).each(function () {
        var pData = jQuery(this).data('progress');
        progress(pData, jQuery(this));
    });
}



function progress(percent, $element) {
    var progressBarWidth = 0;

    (function myLoop(i, max) {
        progressBarWidth = i * $element.width() / 100;
        setTimeout(function () {
            $element.find('div').find('small').html(i + '%');
            $element.find('div').width(progressBarWidth);
            if (++i <= max)
                myLoop(i, max);
        }, 10)
    })(0, percent);
}


/* ---------------------------------------------------------------------- */
/*      Đặt vé
 /* ---------------------------------------------------------------------- */
function vekhuhoi() {
    document.getElementById('li-vekhuhoi').className = "active loaive-index";
    document.getElementById('li-vemotchang').className = "loaive-index";
    document.getElementById('form-vemotchangindex').style.display = 'none';
    document.getElementById('form-vekhuhoiindex').style.display = '';
}

function vemotchang() {
    document.getElementById('li-vekhuhoi').className = "loaive-index";
    document.getElementById('li-vemotchang').className = "active loaive-index";
    document.getElementById('form-vemotchangindex').style.display = '';
    document.getElementById('form-vekhuhoiindex').style.display = 'none';
}


/* ---------------------------------------------------------------------- */
/*      Giới hạn ngày
 /* ---------------------------------------------------------------------- */
$(function getdate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("Ngaykhoihanh-motchang-getdate").setAttribute("min", today);
    document.getElementById("Ngaykhoihanh-khuhoi-getdate").setAttribute("min", today);
    document.getElementById("Ngayquayve-khuhoi-getdate").setAttribute("min", today);
});


/* ---------------------------------------------------------------------- */
/*      Set Getdate
 /* ---------------------------------------------------------------------- */
function setValue(id, newvalue) {
    var s = document.getElementById(id);
    s.value = newvalue;
}
window.onload = function () {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }
    var today = yyyy + '-' + mm + '-' + dd;
    setValue("ngaydangtt", today);
}