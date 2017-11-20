
	util = {
    SLIDE_INDEX: 0,
    imgLoad: function(a, b) {
        var c = new Image;
        c.src = a,
        c.complete ? b() : c.onload = function() {
            b(),
            c.onload = null
        }
    }
},
	goodsDetail = {
    init: function() {
        var a = this;
        a.config(),
        a.runMultiFuns()
    },
    config: function() {
        var a = this;
        a.u = util,
        a.bigpicFlag = !1,
        "function" != typeof String.prototype.trim && (String.prototype.trim = function() {
            return this.replace(/^\s+|\s+$/g, "")
        })
    },
    runMultiFuns: function() {
        var a = this;
        a.showHeadView(),
        a.showProSlide()
      
    },
    showHeadView: function() {
        $(window).scroll(function() {
            var a = $(this).scrollTop(),
            b = $("#goodsDetail").offset().top + 50;
            if (a > b) {
                $("#goodsSubBar").addClass("goods-sub-bar-play"),
                $("#goodsSubMenu").find("li").eq(0).addClass("current").siblings().removeClass("current");
                var c = $("#goodsSubMenu > ul > li:gt(0)").length;
                $("#goodsSubMenu > ul > li:gt(0)").each(function() {
//                    var b = $(this).find("a").attr("href");
//                    b && (itemSt = $(b).offset().top - 70, nextItem = null, nextItem = $(this).index() < c ? $(this).next().find("a").attr("href") : $(".guess-u-like"), nextItemSt = $(nextItem).offset().top, a > itemSt && nextItemSt > a && $(this).addClass("current").siblings().removeClass("current"))
                })
            } else $("#goodsSubBar").removeClass("goods-sub-bar-play")
        })
    },
    changeProSlidCallback: function(a) {
        var b = this,
        c = null;
        c = $("#goodsPicList").find("li").eq(a).find("img").attr(b.bigpicFlag ? "data-src-b": "data-src");
        var d = $("#goodsPicList").find("li").eq(a).find("img").attr("data-src-b"),
        e = function() {
            $(".J_goodsBigPic").attr("src", c)
        },
        f = function() {
            $(".J_goodsBigPic").attr("srcset", d)
        };
        b.u.imgLoad(c, e),
        b.u.imgLoad(d, f),
        $("#goodsPicList").find("li").removeClass("current"),
        $("#goodsPicList").find("li").eq(a).addClass("current")
    },
    showProSlide: function() {
        var a = this,
        b = a.u;
        b.SLIDE_INDEX = 0,
        $(document).on("click", "#goodsPicList>li",
        function() {
            var c = $(this).index();
            a.changeProSlidCallback(c),
            b.SLIDE_INDEX = c
        });
        var c = $("#goodsPicList").find("li").length;
        $(document).on("click", "#goodsPicPrev",
        function() {
            var d = b.SLIDE_INDEX - 1;
            0 >d && (d = c - 1),
            b.SLIDE_INDEX = d,
            a.changeProSlidCallback(d)
        }),
        $(document).on("click", "#goodsPicNext",
        function() {
            var d = b.SLIDE_INDEX + 1;
            d > c - 1 && (d = 0),
            b.SLIDE_INDEX = d,
            a.changeProSlidCallback(d)
        })
    },
},
$(function() {
    goodsDetail.init()
});