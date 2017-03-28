$(document).ready(function() {

    /******************************************
    事前準備
    *******************************************/

    //タブボタンの数を取得
    var tabQuantity = $('.tab__button').length;

    //タブの長さとボディの長さの差分を取得
    var tabExtraDistance = $('.tab').width() - $('.tab-container').width();

    /******************************************
    スライダー発動
    *******************************************/

    var slider = $('.article-list').bxSlider({
        speed: 300,
        pager: false,
        controls: false,
        touchEnabled: false, // モバイルのスワイプ
        // swipeThreshold: 70, //スワイプ操作として処理される最小の移動距離
        // preventDefaultSwipeY:false,
        preloadImages: 'visible',
        // preventDefaultSwipeX: false,
        oneToOneTouch: false,
        onSlideBefore: function($slideElement, oldIndex, newIndex) {
            //スライドする時に関数を呼び出す。newIndexはスライダーの現在地。
            slideChange(newIndex);

        },
        onSlideAfter: function($slideElement, oldIndex, newIndex) {
            // 高さ調整
            set_height();
        }
    });

    /******************************************
    スライドする時に発動する関数。タブの表示調整を行う。
    *******************************************/

    function slideChange(newIndex) {

        //クラスを調整
        $('.tab__button').removeClass('active');
        $('.tab__button').removeClass('tab__button_current');
        // $('.tab > div:nth-child(' + (newIndex + 1) + ')').addClass('active').addClass("tab__button_current");
        $('.tab > div').eq(newIndex).addClass('active').addClass("tab__button_current");
        //スクロールするべき距離を取得。タブ全体の長さ / ( タブの個数 - 1 ) * スライドの現在地
        var scrollDestination = (tabExtraDistance / (tabQuantity - 1)) * (newIndex);

        //スクロール位置を調整
        $('.tab-container').animate({
            scrollLeft: scrollDestination
        }, 'slow');
        if (nth != 0) {
            history.replaceState(null, 'title', location.protocol + '//' + location.host + location.pathname + location.search + '#tab-' + nth);
        } else {
            history.replaceState(null, 'title', location.protocol + '//' + location.host + location.pathname + location.search);
        };
    }

    /******************************************
    タブボタンクリックで発動する関数
    *******************************************/

    $('.tab__button').on('click', function(e) {
        $('.tab__button').removeClass('tab__button_current');

        //何番目の要素かを取ってスライドを移動する
        var nth = $('.tab__button').index(this);
        slider.goToSlide(nth);

        $(this).addClass("tab__button_current");
        if (nth != 0) {
            history.replaceState(null, 'title', location.protocol + '//' + location.host + location.pathname + location.search + '#tab-' + nth);
        } else {
            history.replaceState(null, 'title', location.protocol + '//' + location.host + location.pathname + location.search);
        };
        //クリックイベントを無効化
        e.preventDefault();

        // 高さ調整
        set_height();

    })

    // ブラウザバックした場合、選択中のタブに移動
    $(window).on('load', function() {

        nth = location.hash.replace("#tab-", "");
        if (nth == "" || !$.isNumeric(nth)) {
            nth = 0
        };
        slider.goToSlide(nth);
        $("div.tab__button").eq(nth).addClass("tab__button_current");
        // 高さ調整
        set_height();
    });

    var set_height = function() {
        $('.article-list .items').each(function(i) {
            if ($(this).attr('aria-hidden') == "false") {
                // 100は余白
                $('.bx-viewport').css('height', $(this).height() + 100)
            }
        });
    };
});