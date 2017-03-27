jQuery(function($) {
  var nav = $('#global-navi'),
    offset = nav.offset();
  $(window).scroll(function() {
    if ($(window).scrollTop() > offset.top) {
      nav.addClass('fixed');
    } else {
      nav.removeClass('fixed');
    }
  });
});

$(function() {
  var topBtn = $('#page-top');
  topBtn.hide();
  //スクロールが100に達したらボタン表示
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      topBtn.fadeIn();
    } else {
      topBtn.fadeOut();
    }
  });
  //スクロールしてトップ
  topBtn.click(function() {
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;
  });

  // フッターバナー
  $('.banner-bottom').overlayAd({
    'position': 'bottom',
    'mobileStyle': 'trimming',
    'targetBlank': false,
    'backgroundStyle': true,
    'backgroundColor': 'none'
  });

  // 画像遅延表示
  $("img.lazy").lazyload({
    threshold: 200,
    effect: "fadeIn",
    effect_speed: 2000
  });
});