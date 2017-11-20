if ("undefined" == typeof SHUODAO ||!SHUODAO)
    var SHUODAO = {};
SHUODAO.namespace = function() {
    var i, j, d, a = arguments, o = null;
    for (i = 0; i < a.length; i += 1)
        for (d = ("" + a[i]).split("."), o = SHUODAO, j = "SHUODAO" == d[0] ? 1 : 0; j < d.length; j += 1)
            o[d[j]] = o[d[j]] || {}, o = o[d[j]];
    return o
}, SHUODAO.lang = SHUODAO.lang || {}, function() {
    var L = SHUODAO.lang, OP = Object.prototype, ARRAY_TOSTRING = "[object Array]", FUNCTION_TOSTRING = "[object Function]", OBJECT_TOSTRING = "[object Object]", NOTHING = [], HTML_CHARS = {
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#x27;",
        "/": "&#x2F;",
        "`": "&#x60;"
    }, ADD = ["toString", "valueOf"], OB = {
        isArray: function(o) {
            return OP.toString.apply(o) === ARRAY_TOSTRING
        },
        isBoolean: function(o) {
            return "boolean" == typeof o
        },
        isFunction: function(o) {
            return "function" == typeof o || OP.toString.apply(o) === FUNCTION_TOSTRING
        },
        isNull: function(o) {
            return null === o
        },
        isNumber: function(o) {
            return "number" == typeof o && isFinite(o)
        },
        isObject: function(o) {
            return o && ("object" == typeof o || L.isFunction(o)) ||!1
        },
        isString: function(o) {
            return "string" == typeof o
        },
        isUndefined: function(o) {
            return "undefined" == typeof o
        },
        _IEEnumFix: - [1] ? function() {}
        : function(r, s) {
            var i, fname, f;
            for (i = 0; i < ADD.length; i += 1)
                fname = ADD[i], f = s[fname], L.isFunction(f) && f != OP[fname] && (r[fname] = f)
        },
        escapeHTML: function(html) {
            return html.replace(/[&<>"'\/`]/g, function(match) {
                return HTML_CHARS[match]
            })
        },
        preventDefault: function(e) {
            e.preventDefault ? e.preventDefault() : e.returnValue=!1
        },
        extend: function(subc, superc, overrides) {
            if (!superc ||!subc)
                throw new Error("extend failed, please check that all dependencies are included.");
            var i, F = function() {};
            if (F.prototype = superc.prototype, subc.prototype = new F, subc.prototype.constructor = subc, subc.superclass = superc.prototype, superc.prototype.constructor == OP.constructor && (superc.prototype.constructor = superc), overrides) {
                for (i in overrides)
                    L.hasOwnProperty(overrides, i) && (subc.prototype[i] = overrides[i]);
                L._IEEnumFix(subc.prototype, overrides)
            }
        },
        augmentObject: function(r, s) {
            if (!s ||!r)
                throw new Error("Absorb failed, verify dependencies.");
            var i, p, a = arguments, overrideList = a[2];
            if (overrideList && overrideList!==!0)
                for (i = 2; i < a.length; i += 1)
                    r[a[i]] = s[a[i]];
            else {
                for (p in s)
                    !overrideList && p in r || (r[p] = s[p]);
                L._IEEnumFix(r, s)
            }
            return r
        },
        augmentProto: function(r, s) {
            if (!s ||!r)
                throw new Error("Augment failed, verify dependencies.");
            var i, a = [r.prototype, s.prototype];
            for (i = 2; i < arguments.length; i += 1)
                a.push(arguments[i]);
            return L.augmentObject.apply(this, a), r
        },
        dump: function(o, d) {
            var i, len, s = [], OBJ = "{...}", FUN = "f(){...}", COMMA = ", ", ARROW = " => ";
            if (!L.isObject(o))
                return o + "";
            if (o instanceof Date || "nodeType"in o && "tagName"in o)
                return o;
            if (L.isFunction(o))
                return FUN;
            if (d = L.isNumber(d) ? d : 3, L.isArray(o)) {
                for (s.push("["), i = 0, len = o.length; len > i; i += 1)
                    s.push(L.isObject(o[i]) ? d > 0 ? L.dump(o[i], d - 1) : OBJ : o[i]), s.push(COMMA);
                s.length > 1 && s.pop(), s.push("]")
            } else {
                s.push("{");
                for (i in o)
                    L.hasOwnProperty(o, i) && (s.push(i + ARROW), s.push(L.isObject(o[i]) ? d > 0 ? L.dump(o[i], d - 1) : OBJ : o[i]), s.push(COMMA));
                s.length > 1 && s.pop(), s.push("}")
            }
            return s.join("")
        },
        substitute: function(s, o, f, recurse) {
            for (var i, j, k, key, v, meta, token, dump, objstr, saved = [], lidx = s.length, DUMP = "dump", SPACE = " ", LBRACE = "{", RBRACE = "}"; (i = s.lastIndexOf(LBRACE, lidx), !(0 > i)) && (j = s.indexOf(RBRACE, i), !(i + 1 > j));)
                token = s.substring(i + 1, j), key = token, meta = null, k = key.indexOf(SPACE), k>-1 && (meta = key.substring(k + 1), key = key.substring(0, k)), v = o[key], f && (v = f(key, v, meta)), L.isObject(v) ? L.isArray(v) ? v = L.dump(v, parseInt(meta, 10)) : (meta = meta || "", dump = meta.indexOf(DUMP), dump>-1 && (meta = meta.substring(4)), objstr = v.toString(), v = objstr === OBJECT_TOSTRING || dump>-1 ? L.dump(v, parseInt(meta, 10)) : objstr) : L.isString(v) || L.isNumber(v) || (v = "~-" + saved.length + "-~", saved[saved.length] = token), s = s.substring(0, i) + v + s.substring(j + 1), recurse===!1 && (lidx = i - 1);
            for (i = saved.length - 1; i >= 0; i -= 1)
                s = s.replace(new RegExp("~-" + i + "-~"), "{" + saved[i] + "}", "g");
            return s
        },
        trim: function(s) {
            try {
                return s.replace(/^\s+|\s+$/g, "")
            } catch (e) {
                return s
            }
        },
        merge: function() {
            var i, o = {}, a = arguments, l = a.length;
            for (i = 0; l > i; i += 1)
                L.augmentObject(o, a[i], !0);
            return o
        },
        later: function(when, o, fn, data, periodic) {
            when = when || 0, o = o || {};
            var f, r, m = fn, d = data;
            if (L.isString(fn) && (m = o[fn]), !m)
                throw new TypeError("method undefined");
            return L.isUndefined(data) || L.isArray(d) || (d = [data]), f = function() {
                m.apply(o, d || NOTHING)
            }, r = periodic ? setInterval(f, when) : setTimeout(f, when), {
                interval: periodic,
                cancel: function() {
                    this.interval ? clearInterval(r) : clearTimeout(r)
                }
            }
        },
        isValue: function(o) {
            return L.isObject(o) || L.isString(o) || L.isNumber(o) || L.isBoolean(o)
        }
    };
    L.hasOwnProperty = OP.hasOwnProperty ? function(o, prop) {
        return o && o.hasOwnProperty && o.hasOwnProperty(prop)
    } : function(o, prop) {
        return !L.isUndefined(o[prop]) && o.constructor.prototype[prop] !== o[prop]
    }, OB.augmentObject(L, OB, !0), L.augment = L.augmentProto, SHUODAO.augment = L.augmentProto, SHUODAO.extend = L.extend
}();;

SHUODAO.namespace("app.carousel"), SHUODAO.app.carousel = function() {
    function init(elm, opt) {
        function slideList(targetPage) {
            var offsetX = "-" + targetPage * itemWidth * itemPerSlide + "px";
            $list.animate({
                "margin-left": offsetX
            }, options.speed), targetPage > 0 && countPage - 1 > targetPage ? ($btnPrev.removeClass("page-btn-prev-disabled"), $btnNext.removeClass("page-btn-next-disabled")) : 0 === targetPage ? ($btnPrev.addClass("page-btn-prev-disabled"), $btnNext.removeClass("page-btn-next-disabled")) : targetPage === countPage - 1 && ($btnPrev.removeClass("page-btn-prev-disabled"), $btnNext.addClass("page-btn-next-disabled"))
        }
        function autoPlay() {
            return 0 >= countPage?!1 : (elm.timeoutAuto && window.clearInterval(elm.timeoutAuto), void(elm.timeoutAuto = setInterval(function() {
                curIndex += 1, curIndex > countPage - 1 && (curIndex = 0), slideList(curIndex)
            }, options.delay)))
        }
        var options, $listWrap, $list, $btnPrev, $btnNext, itemLength, itemWidth, itemHeight, itemPerSlide, countPage, $elm = $(elm), curIndex = 0;
        return 0 === $elm.length ? $elm : $elm.length > 1 ? ($elm.each(function() {
            init($(this), opt)
        }), this) : (options = $.extend({}, defaults, opt), $listWrap = $elm.find(options.listWrapSelector), $list = $listWrap.find(options.listSelector), $btnPrev = $elm.find(options.prevBtnSelector), $btnNext = $elm.find(options.nextBtnSelector), itemWidth = options.itemWidth || $list.children(options.itemSelector).outerWidth(), itemHeight = options.itemHeight || $list.children(options.itemSelector).outerHeight() - 1, itemLength = $list.children(options.itemSelector).length, itemPerSlide = 4 !== itemLength ? Math.ceil($listWrap.width() / itemWidth) : 4, countPage = Math.ceil(itemLength / itemPerSlide), 1 === countPage && ($btnPrev.hide(), $btnNext.hide()), $listWrap.css({
            height: itemHeight
        }), $list.css({
            width: itemWidth * itemLength,
            "margin-left": 0
        }), $btnPrev.addClass("page-btn-prev-disabled"), 1 >= countPage && $btnNext.addClass("page-btn-next-disabled"), window.clearInterval(elm.timeoutAuto), slideList(0), options.autoPlay && (autoPlay(), $elm.on({
            mouseenter: function() {
                elm.timeoutAuto && window.clearInterval(elm.timeoutAuto)
            },
            mouseleave: function() {
                autoPlay()
            }
        })), $btnPrev.off("click.carousel").on("click.carousel", function(e) {
            e.preventDefault(), $(this).hasClass("page-btn-prev-disabled") || (curIndex -= 1, 0 >= curIndex && (curIndex = 0, $(this).addClass("page-btn-prev-disabled")), $btnNext.removeClass("page-btn-next-disabled"), slideList(curIndex))
        }), void $btnNext.off("click.carousel").on("click.carousel", function(e) {
            e.preventDefault(), $(this).hasClass("page-btn-next-disabled") || (curIndex += 1, curIndex > countPage - 1 && (curIndex = countPage - 1, $(this).addClass("page-btn-next-disabled")), $btnPrev.removeClass("page-btn-prev-disabled"), slideList(curIndex))
        }))
    }
    var defaults;
    return defaults = {
        listWrapSelector: ".J_carouselWrap",
        listSelector: ".J_carouselList",
        itemSelector: "li",
        prevBtnSelector: ".J_carouselPrev",
        nextBtnSelector: ".J_carouselNext",
        itemWidth: null,
        itemHeight: null,
        autoPlay: !0,
        speed: 500,
        delay: 5e3
    }, {
        init: init
    }
}();

jQuery(function($){
	var $starGoodsCarousel=$(".J_starGoodsCarousel"),resizeTimer=null;
	function initCarousel(){SHUODAO.app.carousel.init($starGoodsCarousel,{itemSelector:".J_carouselItem"})};
	
	$(window).on("resize.carousel", function() {
        resizeTimer && window.clearTimeout(resizeTimer), resizeTimer = window.setTimeout(function() {
            initCarousel()
        }, 300)
    })
    
	initCarousel();

});
