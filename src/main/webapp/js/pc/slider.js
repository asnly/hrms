(function() {
    !function($, window, document) {
        var Plugin, defaults, pluginName;
        return pluginName = "xmSlide", defaults = {
            width: 940,
            height: 528,
            responsiveWidth: 960,
            start: 1,
            navigation: {
                active: !0,
                effect: "slide"
            },
            pagination: {
                active: !0,
                effect: "slide"
            },
            play: {
                active: !1,
                effect: "slide",
                interval: 5e3,
                auto: !1,
                swap: !0,
                pauseOnHover: !1,
                restartDelay: 2500
            },
            effect: {
                slide: {
                    speed: 500
                },
                fade: {
                    speed: 300,
                    crossfade: !0
                }
            },
            callback: {
                loaded: function() {},
                start: function() {},
                complete: function() {}
            }
        }, Plugin = function() {
            function Plugin(element, options) {
                this.element = element, this.options = $.extend(!0, {}, defaults, options), this._defaults = defaults, this._name = pluginName, this.init()
            }
            return Plugin
        }(), Plugin.prototype.init = function() {
            var $element, nextButton, pagination, playButton, prevButton, stopButton, isOnlyOne, _this = this;
            return $element = $(this.element), isOnlyOne = $element.find("img").length > 1?!1 : !0, this.data = $.data(this), $.data(this, "animating", !1), $.data(this, "total", $element.children().not(".xm-slider-navigation", $element).length), $.data(this, "current", this.options.start - 1), $.data(this, "vendorPrefix", this._getVendorPrefix()), "undefined" != typeof TouchEvent && ($.data(this, "touch", !0), this.options.effect.slide.speed = this.options.effect.slide.speed / 2), $element.css({
                overflow: "hidden"
            }), $element.slidesContainer = $element.children().not(".xm-slider-navigation", $element).wrapAll("<div class='xm-slider-container'>", $element).parent().css({
                overflow: "hidden",
                position: "relative"
            }), $(".xm-slider-container", $element).wrapInner("<div class='xm-slider-control'>", $element).children(), $(".xm-slider-control", $element).css({
                position: "relative",
                left: 0
            }), $(".xm-slider-control", $element).children().addClass("xm-slider-slide").css({
                position: "absolute",
                top: 0,
                left: 0,
                width: "100%",
                zIndex: 0,
                display: "none",
                webkitBackfaceVisibility: "hidden"
            }), $.each($(".xm-slider-control", $element).children(), function(i) {
                var $slide;
                return $slide = $(this), $slide.attr("xm-slider-index", i)
            }), this.data.touch && ($(".xm-slider-control", $element).on("touchstart", function(e) {
                return _this._touchstart(e)
            }), $(".xm-slider-control", $element).on("touchmove", function(e) {
                return _this._touchmove(e)
            }), $(".xm-slider-control", $element).on("touchend", function(e) {
                return _this._touchend(e)
            })), $element.fadeIn(0), $element.find("img").each(window.devicePixelRatio < 1.5 ? function() {
                $(this).attr("data-src-orig", $(this).attr("src"))
            } : function() {
                var srcset = $(this).attr("srcset");
                srcset && srcset.split(" 2x")[0] && $(this).attr("data-src-orig", srcset.split(" 2x")[0]).removeAttr("srcset")
            }), this.update(), this.data.touch&&!isOnlyOne && this._setuptouch(), $(".xm-slider-control", $element).children(":eq(" + this.data.current + ")").eq(0).fadeIn(0, function() {
                return $(this).css({
                    zIndex: 10
                })
            }), this.options.navigation.active&&!isOnlyOne && (prevButton = $("<a>", {
                "class": "xm-slider-previous xm-slider-navigation icon-slides icon-slides-prev",
                href: "#",
                title: "Previous",
                text: "Previous"
            }).appendTo($element), nextButton = $("<a>", {
                "class": "xm-slider-next xm-slider-navigation icon-slides icon-slides-next",
                href: "#",
                title: "Next",
                text: "Next"
            }).appendTo($element)), $(".xm-slider-next", $element).click(function(e) {
                return e.preventDefault(), _this.stop(!0), _this.next(_this.options.navigation.effect)
            }), $(".xm-slider-previous", $element).click(function(e) {
                return e.preventDefault(), _this.stop(!0), _this.previous(_this.options.navigation.effect)
            }), this.options.play.active && (playButton = $("<a>", {
                "class": "xm-slider-play xm-slider-navigation",
                href: "#",
                title: "Play",
                text: "Play"
            }).appendTo($element), stopButton = $("<a>", {
                "class": "xm-slider-stop xm-slider-navigation",
                href: "#",
                title: "Stop",
                text: "Stop"
            }).appendTo($element), playButton.click(function(e) {
                return e.preventDefault(), _this.play(!0)
            }), stopButton.click(function(e) {
                return e.preventDefault(), _this.stop(!0)
            }), this.options.play.swap && stopButton.css({
                display: "none"
            })), this.options.pagination.active && (pagination = $("<ul>", {
                "class": "xm-slider-pagination"
            }).appendTo($element), $.each(new Array(this.data.total), function(i) {
                var paginationItem, paginationLink;
                return paginationItem = $("<li>", {
                    "class": "xm-slider-pagination-item"
                }).appendTo(pagination), paginationLink = $("<a>", {
                    href: "#",
                    "data-xm-slider-item": i,
                    html: i + 1
                }).appendTo(paginationItem), paginationLink.click(function(e) {
                    return e.preventDefault(), _this.stop(!0), _this.goto(1 * $(e.currentTarget).attr("data-xm-slider-item") + 1)
                })
            })), $(window).bind("resize", function() {
                return _this.update()
            }), this._setActive(), this.options.play.auto&&!isOnlyOne && this.play(), this.options.callback.loaded(this.options.start)
        }, Plugin.prototype._setActive = function(number) {
            var $element, current;
            return $element = $(this.element), this.data = $.data(this), current = number>-1 ? number : this.data.current, $(".active", $element).removeClass("active"), $(".xm-slider-pagination li:eq(" + current + ") a", $element).addClass("active")
        }, Plugin.prototype.update = function() {
            var $element, height, width;
            return $element = $(this.element), width = $element.width(), this.options.width = width, height = this.options.height, width <= this.options.responsiveWidth && $element.find("img").each(window.devicePixelRatio < 1.5 ? function() {
                $(this).attr("data-src-r") && $(this).attr("src", $(this).attr("data-src-r"))
            } : function() {
                $(this).attr("data-src-r-2x") ? $(this).attr({
                    src: $(this).attr("data-src-r-2x")
                }) : $(this).attr("data-src-r") && $(this).attr("src", $(this).attr("data-src-r"))
            }), width > this.options.responsiveWidth && $element.find("img").each(function() {
                $(this).attr({
                    src: $(this).attr("data-src-orig")
                })
            }), $(".xm-slider-control, .xm-slider-container", $element).css({
                width: width,
                height: height
            })
        }, Plugin.prototype.next = function(effect) {
            var $element;
            return $element = $(this.element), this.data = $.data(this), $.data(this, "direction", "next"), void 0 === effect && (effect = this.options.navigation.effect), "fade" === effect ? this._fade() : this._slide()
        }, Plugin.prototype.previous = function(effect) {
            var $element;
            return $element = $(this.element), this.data = $.data(this), $.data(this, "direction", "previous"), void 0 === effect && (effect = this.options.navigation.effect), "fade" === effect ? this._fade() : this._slide()
        }, Plugin.prototype.goto = function(number) {
            var $element, effect;
            if ($element = $(this.element), this.data = $.data(this), void 0 === effect && (effect = this.options.pagination.effect), number > this.data.total ? number = this.data.total: 1 > number && (number = 1), "number" == typeof number)return "fade" === effect ? this._fade(number) : this._slide(number);
            if ("string" == typeof number) {
                if ("first" === number)
                    return "fade" === effect ? this._fade(0) : this._slide(0);
                if ("last" === number)
                    return "fade" === effect ? this._fade(this.data.total) : this._slide(this.data.total)
            }
        }, Plugin.prototype._setuptouch = function() {
            var $element, next, previous, slidesControl;
            return $element = $(this.element), this.data = $.data(this), slidesControl = $(".xm-slider-control", $element), next = this.data.current + 1, previous = this.data.current - 1, 0 > previous && (previous = this.data.total - 1), next > this.data.total - 1 && (next = 0), slidesControl.children(":eq(" + next + ")").css({
                display: "block",
                left: "100%"
            }), slidesControl.children(":eq(" + previous + ")").css({
                display: "block",
                left: "-100%"
            })
        }, Plugin.prototype._touchstart = function(e) {
            var $element, touches;
            return $element = $(this.element), this.data = $.data(this), touches = e.originalEvent.touches[0], this._setuptouch(), $.data(this, "touchtimer", Number(new Date)), $.data(this, "touchstartx", touches.pageX), $.data(this, "touchstarty", touches.pageY), e.stopPropagation()
        }, Plugin.prototype._touchend = function(e) {
            var $element, duration, prefix, slidesControl, timing, touches, transform, _this = this;
            return $element = $(this.element), this.data = $.data(this), touches = e.originalEvent.touches[0], slidesControl = $(".xm-slider-control", $element), slidesControl.position().left > .5 * this.options.width || slidesControl.position().left > .1 * this.options.width && Number(new Date) - this.data.touchtimer < 250 ? ($.data(this, "direction", "previous"), this._slide()) : slidesControl.position().left<-(.5 * this.options.width) || slidesControl.position().left<-(.1 * this.options.width) && Number(new Date) - this.data.touchtimer < 250 ? ($.data(this, "direction", "next"), this._slide()) : (prefix = this.data.vendorPrefix, transform = prefix + "Transform", duration = prefix + "TransitionDuration", timing = prefix + "TransitionTimingFunction", slidesControl[0].style[transform] = "translateX(0px)", slidesControl[0].style[duration] = .85 * this.options.effect.slide.speed + "ms"), slidesControl.on("transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd", function() {
                return prefix = _this.data.vendorPrefix, transform = prefix + "Transform", duration = prefix + "TransitionDuration", timing = prefix + "TransitionTimingFunction", slidesControl[0].style[transform] = "", slidesControl[0].style[duration] = "", slidesControl[0].style[timing] = ""
            }), e.stopPropagation()
        }, Plugin.prototype._touchmove = function(e) {
            var $element, prefix, slidesControl, touches, transform;
            return $element = $(this.element), this.data = $.data(this), touches = e.originalEvent.touches[0], prefix = this.data.vendorPrefix, slidesControl = $(".xm-slider-control", $element), transform = prefix + "Transform", $.data(this, "scrolling", Math.abs(touches.pageX - this.data.touchstartx) < Math.abs(touches.pageY - this.data.touchstarty)), this.data.animating || this.data.scrolling || (e.preventDefault(), this._setuptouch(), slidesControl[0].style[transform] = "translateX(" + (touches.pageX - this.data.touchstartx) + "px)"), e.stopPropagation()
        }, Plugin.prototype.play = function(next) {
            var $element, currentSlide, slidesContainer, _this = this;
            return $element = $(this.element), this.data = $.data(this), !this.data.playInterval && (next && (currentSlide = this.data.current, this.data.direction = "next", "fade" === this.options.play.effect ? this._fade() : this._slide()), $.data(this, "playInterval", setInterval(function() {
                return currentSlide = _this.data.current, _this.data.direction = "next", "fade" === _this.options.play.effect ? _this._fade() : _this._slide()
            }, this.options.play.interval)), slidesContainer = $($element), this.options.play.pauseOnHover && (slidesContainer.unbind(), slidesContainer.bind("mouseenter", function() {
                return $(".xm-slider-navigation", $element).show(), _this.stop()
            }), slidesContainer.bind("mouseleave", function() {
                return $(".xm-slider-navigation", $element).hide(), _this.play()
            })), $.data(this, "playing", !0), $(".xm-slider-play", $element).addClass("xm-slider-playing"), this.options.play.swap) ? ($(".xm-slider-play", $element).hide(), $(".xm-slider-stop", $element).show()) : void 0
        }, Plugin.prototype.stop = function(clicked) {
            var $element;
            return $element = $(this.element), this.data = $.data(this), clearInterval(this.data.playInterval), this.options.play.pauseOnHover && clicked && $(".xm-slider-container", $element).unbind(), $.data(this, "playInterval", null), $.data(this, "playing", !1), $(".xm-slider-play", $element).removeClass("xm-slider-playing"), this.options.play.swap ? ($(".xm-slider-stop", $element).hide(), $(".xm-slider-play", $element).show()) : void 0
        }, Plugin.prototype._slide = function(number) {
            var $element, currentSlide, direction, duration, next, prefix, slidesControl, timing, transform, value, _this = this;
            return $element = $(this.element), this.data = $.data(this), this.data.animating || number === this.data.current + 1 ? void 0 : ($.data(this, "animating", !0), currentSlide = this.data.current, number>-1 ? (number -= 1, value = number > currentSlide ? 1 : - 1, direction = number > currentSlide?-this.options.width : this.options.width, next = number) : (value = "next" === this.data.direction ? 1 : - 1, direction = "next" === this.data.direction?-this.options.width : this.options.width, next = currentSlide + value), - 1 === next && (next = this.data.total - 1), next === this.data.total && (next = 0), this._setActive(next), slidesControl = $(".xm-slider-control", $element), number>-1 && slidesControl.children(":not(:eq(" + currentSlide + "))").css({
                display: "none",
                left: 0,
                zIndex: 0
            }), slidesControl.children(":eq(" + next + ")").css({
                display: "block",
                left: value * this.options.width,
                zIndex: 10
            }), this.options.callback.start(currentSlide + 1), this.data.vendorPrefix ? (prefix = this.data.vendorPrefix, transform = prefix + "Transform", duration = prefix + "TransitionDuration", timing = prefix + "TransitionTimingFunction", slidesControl[0].style[transform] = "translateX(" + direction + "px)", slidesControl[0].style[duration] = this.options.effect.slide.speed + "ms", slidesControl.on("transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd", function() {
                return slidesControl[0].style[transform] = "", slidesControl[0].style[duration] = "", slidesControl.children(":eq(" + next + ")").css({
                    left: 0
                }), slidesControl.children(":eq(" + currentSlide + ")").css({
                    display: "none",
                    left: 0,
                    zIndex: 0
                }), $.data(_this, "current", next), $.data(_this, "animating", !1), slidesControl.unbind("transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd"), slidesControl.children(":not(:eq(" + next + "))").css({
                    display: "none",
                    left: 0,
                    zIndex: 0
                }), _this.data.touch && _this._setuptouch(), _this.options.callback.complete(next + 1)
            })) : slidesControl.stop().animate({
                left: direction
            }, this.options.effect.slide.speed, function() {
                return slidesControl.css({
                    left: 0
                }), slidesControl.children(":eq(" + next + ")").css({
                    left: 0
                }), slidesControl.children(":eq(" + currentSlide + ")").css({
                    display: "none",
                    left: 0,
                    zIndex: 0
                }, $.data(_this, "current", next), $.data(_this, "animating", !1), _this.options.callback.complete(next + 1))
            }))
        }, Plugin.prototype._fade = function(number) {
            var $element, currentSlide, next, slidesControl, value, _this = this;
            return $element = $(this.element), this.data = $.data(this), this.data.animating || number === this.data.current + 1 ? void 0 : ($.data(this, "animating", !0), currentSlide = this.data.current, number ? (number -= 1, value = number > currentSlide ? 1 : - 1, next = number) : (value = "next" === this.data.direction ? 1 : - 1, next = currentSlide + value), - 1 === next && (next = this.data.total - 1), next === this.data.total && (next = 0), this._setActive(next), slidesControl = $(".xm-slider-control", $element), slidesControl.children(":eq(" + next + ")").css({
                display: "none",
                left: 0,
                zIndex: 10
            }), this.options.callback.start(currentSlide + 1), this.options.effect.fade.crossfade ? (slidesControl.children(":eq(" + this.data.current + ")").stop().fadeOut(this.options.effect.fade.speed), slidesControl.children(":eq(" + next + ")").stop().fadeIn(this.options.effect.fade.speed, function() {
                return slidesControl.children(":eq(" + next + ")").css({
                    zIndex: 0
                }), $.data(_this, "animating", !1), $.data(_this, "current", next), _this.options.callback.complete(next + 1)
            })) : slidesControl.children(":eq(" + currentSlide + ")").stop().fadeOut(this.options.effect.fade.speed, function() {
                return slidesControl.children(":eq(" + next + ")").stop().fadeIn(_this.options.effect.fade.speed, function() {
                    return slidesControl.children(":eq(" + next + ")").css({
                        zIndex: 10
                    })
                }), $.data(_this, "animating", !1), $.data(_this, "current", next), _this.options.callback.complete(next + 1)
            }))
        }, Plugin.prototype._getVendorPrefix = function() {
            var body, i, style, transition, vendor;
            for (body = document.body || document.documentElement, style = body.style, transition = "transition", vendor = ["Moz", "Webkit", "Khtml", "O", "ms"], transition = transition.charAt(0).toUpperCase() + transition.substr(1), i = 0; i < vendor.length;) {
                if ("string" == typeof style[vendor[i] + transition])
                    return vendor[i];
                i++
            }
            return !1
        }, $.fn[pluginName] = function(options) {
            return this.each(function() {
                return $.data(this, "plugin_" + pluginName) ? void 0 : $.data(this, "plugin_" + pluginName, new Plugin(this, options))
            })
        }
    }(jQuery, window, document)
}).call(this);;