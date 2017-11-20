if (typeof VIPSHOP == "undefined")
	var VIPSHOP = {};
VIPSHOP.core2 = true;
(function($) {
	Function.prototype.method = function(name, fn) {
		if (typeof this.prototype[name] == "undefined")
			this.prototype[name] = fn;
		return this
	};
	String.method("encode", function(noCom) {
		return noCom ? encodeURI(this) : encodeURIComponent(this)
	}).method("decode", function(noCom) {
		return noCom ? decodeURI(this) : decodeURIComponent(this)
	});
	VIPSHOP.isMobile = "createTouch" in document
			&& !("onmousemove" in document.documentElement)
			|| /(iPhone|iPad|iPod)/i.test(navigator.userAgent);
	VIPSHOP.isIE6 = navigator.appVersion.indexOf("MSIE 6") > -1;
	var webpCache = {};
	VIPSHOP.webp = function(feature, callback) {
		var kTestImages = {
			lossy : "UklGRiIAAABXRUJQVlA4IBYAAAAwAQCdASoBAAEADsD+JaQAA3AAAAAA",
			lossless : "UklGRhoAAABXRUJQVlA4TA0AAAAvAAAAEAcQERGIiP4HAA==",
			alpha : "UklGRkoAAABXRUJQVlA4WAoAAAAQAAAAAAAAAAAAQUxQSAwAAAARBxAR/Q9ERP8DAABWUDggGAAAABQBAJ0BKgEAAQAAAP4AAA3AAP7mtQAAAA==",
			animation : "UklGRlIAAABXRUJQVlA4WAoAAAASAAAAAAAAAAAAQU5JTQYAAAD/////AABBTk1GJgAAAAAAAAAAAAAAAAAAAGQAAABWUDhMDQAAAC8AAAAQBxAREYiI/gcA"
		};
		var img = new Image;
		var fCache = webpCache[feature];
		if (typeof fCache == "boolean")
			if (fCache)
				callback(feature, true);
			else
				callback(feature, false);
		else {
			img.onload = function() {
				var result = img.width > 0 && img.height > 0;
				webpCache[feature] = result;
				callback(feature, result)
			};
			img.onerror = function() {
				webpCache[feature] = false;
				callback(feature, false)
			};
			img.src = "data:image/webp;base64," + kTestImages[feature]
		}
	};
	VIPSHOP.errorReport = function(msg, fileUrl, fileLine) {
		var _ua = navigator.userAgent, target, mouseX, mouseY, docST = $(
				document).scrollTop(), docSL = $(document).scrollLeft(), errorContent;
		$(function() {
			$(document).mousemove(function(e) {
				target = e.target;
				mouseX = e.pageX;
				mouseY = e.pageY
			});
			setTimeout(function() {
				errorContent = {
					_ua : _ua,
					url : location.href,
					fileUrl : fileUrl,
					fileLine : fileLine,
					msg : msg,
					docST : docST,
					docSL : docSL,
					target : target,
					mouseX : mouseX,
					mouseY : mouseY
				}
			}, 10)
		})
	};
	window.onerror = VIPSHOP.errorReport;
	VIPSHOP.guid = function(pre) {
		return (pre || "VIPSHOP_") + +new Date + (Math.random() + "").slice(-8)
	};
	VIPSHOP.zIndexManager = function() {
		if (!VIPSHOP.maxIndex) {
			var zIndexArr = $.map($("body > *"), function(i, n) {
				var obj = $(i), zIndexVal;
				if (obj.css("position") != "static") {
					zIndexVal = obj.css("zIndex");
					return zIndexVal == "auto" ? 0 : zIndexVal - 0
				}
			});
			if (zIndexArr.length == 0)
				zIndexArr.push(1);
			var MaxZ = Math.max.apply(null, zIndexArr);
			if (MaxZ >= 214748E4) {
				VIPSHOP.maxIndex = 214748E4;
				VIPSHOP.log("zIndex\u5df2\u7ecf\u8d85\u8fc7\u6700\u5927\u503c")
			} else
				VIPSHOP.maxIndex = MaxZ
		}
		return ++VIPSHOP.maxIndex
	};
	VIPSHOP.namespace = function(str) {
		var arr = str.split("."), o = VIPSHOP;
		for (var i = arr[0] == "VIPSHOP" ? 1 : 0; i < arr.length; i++) {
			o[arr[i]] = o[arr[i]] || {};
			o = o[arr[i]]
		}
		return o
	};
	VIPSHOP.parentCls = function() {
	};
	VIPSHOP.parentCls.prototype = {
		get : function(args) {
			var prop = this[args];
			return $.isFunction(prop) ? prop.apply(this, Array.prototype.slice
					.call(args, 1)) : prop
		}
	};
	VIPSHOP.log = function(msg) {
		if (window["console"])
			try {
				console.log.apply(console, arguments)
			} catch (e) {
				console.log(msg)
			}
		return this
	};
	VIPSHOP.JSS = function(jQueryObj) {
		var targetDom = jQueryObj ? jQueryObj : $(".J_widget"), widget;
		targetDom
				.each(function() {
					var value, _eval, nsCrackArr, s, $data = {}, dataRes = $(
							this).data();
					for ( var i in dataRes) {
						value = dataRes[i];
						if (typeof value == "string") {
							nsCrackArr = value.split(".");
							if (/^(?:\$.*|\{.*\}|\[.*\]|null|false|true|NaN)$/
									.test(value)
									|| (+value + "" === value || window[nsCrackArr[0]]))
								_eval = true;
							else
								_eval = false;
							try {
								if (!window[nsCrackArr[0]])
									data = _eval ? eval("0," + value) : value;
								else {
									s = window;
									for (var j = 0, len = nsCrackArr.length; j < len; j++)
										s = s[nsCrackArr[j]];
									data = s
								}
							} catch (e) {
								data = value
							}
							$data[i] = data
						}
					}
					if (widget = $(this)[$data.widget])
						widget.call($(this), $data)
				});
		return this
	};
	$(function() {
		VIPSHOP.JSS()
	});
	VIPSHOP.queryStringToJSON = function(url) {
		if (url === "")
			return "";
		var pairs = (url || location.search).replace(/^\?/, "").split("&");
		var result = {};
		for (var i = 0, len = pairs.length; i < len; i++) {
			var pair = pairs[i].split("=");
			if (!!pair[0])
				result[pair[0]] = decodeURIComponent(pair[1] || "")
		}
		return result
	};
	VIPSHOP.setSead = function(settings) {
		for (var cur = 0, len = settings.length; cur < len; cur++) {
			var target = $(settings[cur].target), attr = settings[cur].attr, data = settings[cur].data;
			target.each(function(i, n) {
				for ( var k in attr) {
					var attrVal = attr[k];
					if ($.type(attr[k]) === "function")
						attrVal = attr[k].call($(n), i) || "";
					$(n).attr(k, attrVal)
				}
				for ( var j in data) {
					var dataVal = data[j];
					if ($.type(data[j]) === "function")
						dataVal = data[j].call($(n), i) || "";
					$(n).data(j, dataVal)
				}
			})
		}
		$.Listeners.pub("setSeadDone").success();
		return this
	};
	(function() {
		var _crackName = function(name) {
			var index = name.lastIndexOf("."), clsName, o, args;
			if (index != -1) {
				args = name.substring(0, index);
				o = VIPSHOP.namespace(args);
				clsName = name.substring(index + 1, name.length)
			} else {
				clsName = name;
				o = VIPSHOP
			}
			return {
				clsName : clsName,
				o : o
			}
		};
		$
				.extend(
						VIPSHOP,
						{
							extend : function(subCls, superCls) {
								if (!$.isFunction(subCls)
										|| !$.isFunction(superCls))
									return false;
								var F = function() {
								}, subClsProp;
								F.prototype = superCls.prototype;
								subClsProp = subCls.prototype = new F;
								subCls.prototype.constructor = subCls;
								subCls.superclass = superCls.prototype;
								return subCls
							},
							declare : function(subCls, superCls, prop) {
								var o = _crackName(subCls);
								var subCls = o.o[o.clsName] = function(opts) {
									if (superCls) {
										if ($.isFunction(superCls)
												&& superCls.prototype._init)
											superCls._init = superCls.prototype._init;
										superCls._init
												&& superCls._init.call(this,
														opts)
									}
									prop._init.call(this, opts);
									if (opts && opts.plugins)
										for (var i = 0; i < opts.plugins.length; i++)
											this.usePlugin(opts.plugins[i])
								};
								if (superCls)
									VIPSHOP.extend(subCls, superCls);
								for ( var key in prop) {
									subCls.prototype[key] = prop[key];
									if (typeof prop[key] == "function"
											&& key != "_init")
										subCls.prototype[key].supername = key
								}
								subCls.prototype._meta = {};
								subCls.prototype._meta.className = o.clsName;
								if (superCls) {
									subCls.prototype.supermethod = function(
											args) {
										if (args.callee.supername)
											return subCls.superclass[args.callee.supername]
													()
									};
									subCls.prototype.getSuperMethod = function(
											name) {
										if (subCls.superclass[name])
											return subCls.superclass[name]
									}
								}
								subCls.prototype._plugins = {};
								subCls.prototype.addPlugin = function(name,
										callback) {
									this._plugins[name] = callback;
									if (callback.methods)
										$.extend(subCls.prototype,
												callback.methods)
								};
								subCls.prototype.usePlugin = function(name) {
									if (this._plugins[name]
											&& typeof this._plugins[name] === "function")
										this._plugins[name]();
									else if (this._plugins[name]._init)
										this._plugins[name]._init.call(this);
									else
										VIPSHOP.log("\u8fd8\u6ca1\u6709\u4e3a "
												+ o.clsName + " \u5b9a\u4e49 "
												+ name + " \u63d2\u4ef6")
								};
								subCls.prototype.useObject = function(name,
										opts) {
									var config;
									if (typeof obj == "function")
										try {
											var node = this.node;
											if (this.node instanceof jQuery)
												node = this.node[0];
											if (opts)
												config = $.extend({}, opts, {
													node : node
												});
											else
												config = {
													node : node
												};
											new obj(config)
										} catch (e) {
											VIPSHOP
													.log(e,
															"\u8c8c\u4f3c\u6ca1\u6709\u4e3a\u5176\u4f5c\u4e3a\u63d2\u4ef6\u63a5\u53e3")
										}
									else
										VIPSHOP
												.log(obj,
														"\u4e0d\u5b58\u5728\u8fd9\u4e2a\u6784\u9020\u51fd\u6570\uff01")
								}
							},
							plugin : function(name, obj, callback) {
								obj.prototype.addPlugin(name, callback)
							}
						})
	})();
	VIPSHOP.bridgeTojQuery = function(methodName, widget) {
		var methodArray = $.trim(methodName).split(",");
		jQuery
				.each(
						methodArray,
						function(i, n) {
							jQuery.fn[n] = function(config, args) {
								var args = Array.prototype.slice.call(
										arguments, 1), Obj, R, _widget, method, getWidgetData;
								var hasWidget = jQuery(this)
										.data("widget_" + n);
								if (typeof config != "string" && hasWidget) {
									hasWidget.destroy && hasWidget.destroy();
									jQuery(this).removeData("widget_" + n)
								}
								if (config == "destroy") {
									getWidgetData = jQuery(this).data(
											"widget_" + n);
									if (getWidgetData) {
										getWidgetData.destroy
												&& getWidgetData.destroy();
										$(this).removeData("widget_" + n);
										return
									} else
										return true
								} else if (typeof config == "string") {
									if (config.indexOf("_") == 0) {
										VIPSHOP
												.log("\u4e0d\u80fd\u8c03\u7528\u79c1\u6709\u65b9\u6cd5");
										return false
									}
									_widget = $(this).data("widget_" + n);
									method = _widget ? _widget[config] : null;
									if (method) {
										R = method.apply(_widget, args);
										if (R === _widget
												|| typeof R == "undefined")
											return this;
										else
											return R
									}
								} else {
									config = $.extend({}, config, {
										node : this
									});
									Obj = new widget(config);
									Obj[n] = function(func) {
										var args = Array.prototype.slice.call(
												arguments, 1);
										var R = Obj[func](args);
										return R
									};
									$(this).data("widget_" + n, Obj);
									return this
								}
							};
							$[n] = function(options) {
								return new widget(options)
							}
						})
	};
	if (!jQuery.browser) {
		var uaMatch = function(ua) {
			var ua = ua.toLowerCase();
			var match = /(chrome)[ \/]([\w.]+)/.exec(ua)
					|| (/(webkit)[ \/]([\w.]+)/.exec(ua) || (/(opera)(?:.*version|)[ \/]([\w.]+)/
							.exec(ua) || (/(msie) ([\w.]+)/.exec(ua) || (ua
							.indexOf("compatible") < 0
							&& /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua) || []))));
			return {
				browser : match[1] || "",
				version : match[2] || "0"
			}
		}, matched = uaMatch(navigator.userAgent), browser = {};
		if (matched.browser) {
			browser[matched.browser] = true;
			browser.version = matched.version
		}
		if (browser.chrome)
			browser.webkit = true;
		else if (browser.webkit)
			browser.safari = true;
		jQuery.browser = browser
	}
})(jQuery);
	(function($) {
		VIPSHOP.declare(
						"Switchable2",
						null,
						{
							defaults : {
								_triggers : [],
								_panels : [],
								_prev : null,
								_next : null,
								nowOn : 0,
								count : 0,
								visiNum : 1,
								multiple : false,
								effect : "",
								activeCls : "active",
								autoPlay : false,
								interval : 1E3,
								overPause : false,
								activeIndex : 0,
								delay : 500,
								pervCls : null,
								nextCls : null,
								trigger : "click",
								switchEvent : $.noop,
								panelCls : ".bd",
								triggerCls : ""
							},
							_init : function(option) {
								var that = this, options, node;
								options = that.options = $.extend({},
										that.defaults, option);
								node = that.node = $(options.node);
								options.pannelDom = $(options.panelCls);
								options.triggerDom = $(options.triggerCls);
								options.prevDom = $(options.pervCls);
								options.nextDom = $(options.nextCls);
								that.setStyle();
								that.setWrapWidth();
								that.bindTriggerEvent();
								if (options.autoPlay) {
									var proxyEvt = $.proxy(that.next, that);
									options._interval = setInterval(proxyEvt,
											options.interval);
									that.node.on({
										"mouseenter" : function() {
											clearInterval(options._interval)
										},
										"mouseleave" : function() {
											clearInterval(options._interval);
											options._interval = setInterval(
													proxyEvt, options.interval)
										}
									})
								}
								switch (options.effect) {
								case "slideXLoop":
								case "slideX":
									options.childs = options.pannelDom.children();
									var childML = options.childs.eq(0).css(
											"marginLeft");
									var childMR = options.childs.eq(0).css(
											"marginRight");
									options.childWidth = options.childs.eq(0)
											.outerWidth()
											+ parseInt(childML != "auto" ? childML
													: 0)
											+ parseInt(childMR != "auto" ? childMR
													: 0);
									options.childLen = options.childs.length;
									options.triggerDom.children().on(
											"click.switchable2",
											function() {
												var index = $(this).index();
												$(this).addClass(options.activeCls)
														.siblings().removeClass(
																options.activeCls);
												that.switchTo(index)
											}).eq(options.activeIndex).trigger(
											"click.switchable2");
									that.lazyload(options.childs.eq(0));
									break;
								default:
									break
								}
								return this
							},
							setStyle : function() {
								var that = this;
								var options = that.options;
								switch (options.effect) {
								case "slideXLoop":
								case "slideX":
									var pannelDomParent = options.pannelDom
											.parent();
									if (pannelDomParent.css("position") != "relative")
										pannelDomParent.css("position", "relative");
									if (options.pannelDom.css("position") != "absolute")
										options.pannelDom.css("position",
												"absolute");
									options.pannelDom.children().css("float",
											"left");
									break;
								default:
									break
								}
							},
							setWrapWidth : function() {
								var that = this;
								var options = that.options;
								switch (options.effect) {
								case "slideXLoop":
								case "slideX":
									options.pannelDom.width(999999);
									break;
								default:
									break
								}
								return this
							},
							bindTriggerEvent : function() {
								var that = this;
								var options = that.options;
								options.nextDom.on("click.switchable2", $.proxy(
										that.next, that));
								options.prevDom.on("click.switchable2", $.proxy(
										that.prev, that));
								return this
							},
							switchTo : function(i) {
								var that = this;
								var options = that.options;
								var target = i % options.childLen;
								var orientation = null;
								switch (options.effect) {
								case "slideXLoop":
									if (i > options.nowOn) {
										orientation = "next";
										var childLen = options.pannelDom.children().length;
										if (i >= childLen - options.visiNum + 1)
											options.childs.clone().addClass(
													"loop_clone_next").appendTo(
													options.pannelDom);
										options.pannelDom
												.stop(true, false)
												.animate(
														{
															"left" : -i
																	* options.childWidth
														},
														300,
														function() {
															options.pannelDom
																	.css({
																		"left" : -target
																				* options.childWidth
																	});
															options.nowOn = target;
															return
														});
										that.triggerAddCls(Math.abs(target));
										options.nowOn = i
									} else if (i < options.nowOn) {
										orientation = "prev";
										if (i < 0) {
											$(".loop_clone_prev").remove();
											options.childs.clone().addClass(
													"loop_clone_prev").prependTo(
													options.pannelDom);
											options.pannelDom.css({
												"left" : -options.childLen
														* options.childWidth
											});
											options.pannelDom
													.stop(true, false)
													.animate(
															{
																"left" : -(i + options.childLen)
																		* options.childWidth
															},
															300,
															function() {
																var target = i
																		% options.childLen;
																options.pannelDom
																		.css({
																			"left" : -(options.childLen + target)
																					* options.childWidth
																		})
															});
											options.nowOn = Math
													.abs(options.childLen + target);
											that.triggerAddCls(options.nowOn)
										} else {
											options.pannelDom
													.stop(true, false)
													.animate(
															{
																"left" : -i
																		* options.childWidth
															}, 300);
											options.nowOn = i;
											that.triggerAddCls(Math.abs(target))
										}
									}
									break;
								case "slideX":
									var proxyEvt = $.proxy(that.next, that);
									options._interval
											&& clearInterval(options._interval);
									if (i < 0)
										return;
									if (i == options.childLen)
										return;
									if (i > options.nowOn) {
										orientation = "next";
										options.pannelDom
												.stop(true, false)
												.animate(
														{
															"left" : -target
																	* options.childWidth
														}, 300)
									} else if (i < options.nowOn) {
										orientation = "prev";
										options.pannelDom
												.stop(true, false)
												.animate(
														{
															"left" : -target
																	* options.childWidth
														}, 300)
									}
									if (options.autoPlay && options.interval)
										options._interval = setInterval(proxyEvt,
												options.interval);
									that.triggerAddCls(target);
									options.nowOn = i;
									break;
								default:
									break
								}
								var curPannel = options.pannelDom.children().eq(i);
								that.lazyload(curPannel);
								var I = i % options.childLen;
								if (I < 0)
									I = options.childLen - 1;
								options.switchEvent(I, orientation);
								if (options.triggerAutoFocus)
									that.ctrlTrigger(I, orientation);
								return this
							},
							ctrlTrigger : function(i, orientation) {
								var options = this.options;
								var childLen = options.childs.length;
								var triggerVisiNum = options.triggerVisiNum;
								var firstTrigger = options.triggerDom.children()
										.first();
								var firstTriggerH = firstTrigger.outerHeight(true);
								options.overView = options.overView || 0;
								options.firstTriOnView = options.firstTriOnView || 0;
								options.lastTriOnView = options.lastTriOnView
										|| triggerVisiNum - 1;
								if (childLen === triggerVisiNum)
									return;
								if (orientation === "next")
									if (i > options.lastTriOnView) {
										options.firstTriOnView += 1;
										options.lastTriOnView += 1;
										options.overView += 1
									} else if (i === 0) {
										options.firstTriOnView = 0;
										options.lastTriOnView = triggerVisiNum - 1;
										options.overView = 0
									}
								if (orientation === "prev")
									if (i <= options.firstTriOnView) {
										options.firstTriOnView -= 1;
										options.lastTriOnView -= 1;
										options.overView -= 1
									} else if (i == childLen - 1) {
										options.firstTriOnView = childLen
												- triggerVisiNum - 1;
										options.lastTriOnView = childLen - 1;
										options.overView = childLen
												- triggerVisiNum
									}
								if (options.overView < 0)
									options.overView = 0;
								options.triggerDom.stop(true, false).animate({
									top : -firstTriggerH * options.overView
								}, "normal")
							},
							lazyload : function(target) {
								$(target).find("img.lazy").each(function(i, n) {
									var jqN = $(n);
									jqN.attr("src", jqN.data("original"));
									jqN.removeClass("lazy")
								});
								return this
							},
							prev : function() {
								var that = this;
								var options = that.options;
								var i = options.nowOn;
								i--;
								switch (options.effect) {
								case "slideXLoop":
								case "slideX":
									that.switchTo(i);
									break;
								default:
									options.nowOn = i;
									break
								}
								return this
							},
							next : function() {
								var that = this;
								var options = that.options;
								var childLen = options.pannelDom.children().length;
								var i = options.nowOn;
								i++;
								switch (options.effect) {
								case "slideXLoop":
								case "slideX":
									that.switchTo(i);
									break;
								default:
									options.nowOn = i;
									break
								}
								return this
							},
							start : function() {
								var that = this;
								var options = that.options;
								return this
							},
							stop : function() {
								return this
							},
							triggerAddCls : function(i) {
								var that = this;
								var options = that.options;
								options.triggerDom.children().eq(i).addClass(
										options.activeCls).siblings().removeClass(
										options.activeCls)
							}
						});
		VIPSHOP.bridgeTojQuery("switchable2,Switchable2", VIPSHOP.Switchable2)
	})(jQuery);
	

$(function($) {
	setTimeout(function() {
		$("#J_slideBanner_wrap").Switchable2({
			"panelCls" : "#J_slideBanner_panel",
			"triggerCls" : "#J_slideBanner_trigger",
			"pervCls" : "#J_slidebaner_left",
			"nextCls" : "#J_slidebaner_right",
			"effect" : "slideXLoop",
			"activeCls" : "current",
			"autoPlay" : true,
			"interval" : 5E3
		})
	}, 0);
})