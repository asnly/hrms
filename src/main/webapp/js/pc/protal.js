OO(["com.mi.utils.time", "com.mi.utils.Cookie", "com.mi.widgets.sms", "com.mi.passport.mibao", "com.mi.utils.L11N", "com.mi.utils.URL"], "com.mi.passport.portal.2014",
function(k, b, a, d, e, l, i) {
    $.fn.showError = function(o) {
        if (!o) {
            o = ""
        } else {
            o = "" + o
        }
        return this.each(function(q, s) {
            var p = $(s);
            if (p.hasClass("quota_tip")) {
                return
            }
            var t = p.attr("_text");
            if (t && o) {
                var r = o.charAt(0);
                if (r === "5") {
                    p.text(t + "(" + o + ")").show()
                } else {
                    p.text(t).show()
                }
            } else {
                p.text(t).show()
            }
        })
    };
    $.fn.hideError = function() {
        return this.each(function(p, q) {
            var o = $(q);
            if (o.hasClass("quota_tip")) {
                return
            }
            var r = o.attr("_text");
            if (r) {
                o.text(r).hide()
            } else {
                o.hide()
            }
        })
    };
    $.fn.showPopup = function() {
        this.each(function(q, r) {
            var p = $(r),
            o = p.closest(".popup_mask");
            if (o.length) {
                o.show()
            }
            p.show();
            switch (r.id) {
            case "popManageTokenStatus":
            case "popManageTokenKeys":
                p.positionPopup();
            default:
            }
        });
        if ($(".popup_mask:visible").length) {
            $(document.body).css({
                "overflow-y":
                "hidden"
            })
        } else {
            $(document.body).css({
                "overflow-y":
                "auto"
            })
        }
        return this
    };
    $.fn.hidePopup = function() {
        this.each(function(q, r) {
            var p = $(r),
            o = p.closest(".popup_mask");
            if (o.length) {
                o.hide()
            }
            p.hide()
        });
        if ($(".popup_mask:visible").length) {
            $(document.body).css({
                "overflow-y": "hidden"
            })
        } else {
            $(document.body).css({
                "overflow-y": "auto"
            })
        }
        return this
    };
    $.fn.positionPopup = function() {
        return this.each(function(q, r) {
            var p = $(r);
            var o = $(window).height();
            var s = r.offsetHeight;
            if (s > o) {
                p.css("top", "0")
            } else {
                p.css("top", Math.round((o - s) / 2) + "px")
            }
        })
    };
    $(function() {
        $(".err_tip, .txt_tip").each(function(p, q) {
            var o = $(q);
            o.attr("_text", o.text())
        })
    });
    function m(o) {
        if (o) {
            if (o.code && o.code != 3001) {
                alert(o.desc + "(" + o.code + ")")
            }
        }
    }
    var h = i.$class({
        constructor: function() {
            this.$passwordMgr = $("[_role=passwordMgr]");
            this.$emailMgr = $("[_role=emailMgr]");
            this.$phoneMgr = $("[_role=phoneMgr]");
            this.$mibaoMgr = $("[_role=mibaoMgr]");
            this.$tokenMgr = $("[_role=tokenMgr]")
        },
        render: function() {
            this.uiBind();
            var p = l.parse(location.hash);
            var o = p.service || "";
            switch (o) {
            case "bindPhone":
                this.enterNewPhone();
                break;
            case "bindEmail":
                this.enterNewEmail();
                break;
            default:
            }
        },
        uiBind: function() {
            $(document.body).delegate(".mod_acc_tip .btn_mod_close, .mod_acc_tip .btn_close_popup", "click",
            function(C) {
                C.preventDefault();
                var D = $(C.target).closest(".mod_acc_tip"),
                E = D.attr("id");
                switch (E) {
                case "popManageTokenSetMobile":
                    $("#popManageTokenStatus").showPopup().find(".err_tip").hide();
                    D.hidePopup();
                    break;
                case "popManageTokenKeys":
                    $("#popManageTokenStatus").showPopup().find(".err_tip").hide();
                    D.hidePopup();
                    break;
                case "popManageTokenDisableFinish":
                    location.reload();
                    break;
                case "popManageTokenFinish":
                    location.href = "/";
                    break;
                case "popEnterNewPhone":
                    if (D.find("dl.success:visible").length) {
                        location.reload()
                    } else {
                        D.hidePopup()
                    }
                    break;
                case "popEnterNewEmail":
                    if (D.find("dl.success:visible").length) {
                        location.reload()
                    } else {
                        D.hidePopup()
                    }
                    break;
                default:
                    D.hidePopup()
                }
            });
            $(document.body).delegate(".icon_false, .icon_true", "click",
            function(D) {
                D.preventDefault();
                var C = $(D.target);
                if (C.hasClass("icon_false")) {
                    C.removeClass("icon_false").addClass("icon_true")
                } else {
                    C.removeClass("icon_true").addClass("icon_false")
                }
            });
            $("#btnUpdatePassword").click(i.proxy(function(C) {
                C.preventDefault();
                this.resetUpdatePasswordForm();
                this.editPassword()
            },
            this));
            $("#popUpdatePassword .oldPass").on("focus click", i.proxy(function(C) {
                $("#popUpdatePassword .grpOldPass .err_tip").hideError();
                $("#popUpdatePassword .grpOldPass label").removeClass("error_bg")
            },
            this)).blur(i.proxy(function(C) {
                this.checkOldPassword()
            },
            this));
            var p, B;
            $("#popUpdatePassword .newPass, #popUpdatePassword .newPass2").on("focus click", i.proxy(function(C) {
                C.stopImmediatePropagation();
                $("#popUpdatePassword .grpNewPass .err_tip").hideError();
                $("#popUpdatePassword .grpNewPass .txt_tip").show();
                $("#popUpdatePassword .grpNewPass label").removeClass("error_bg");
                clearTimeout(p);
                clearTimeout(B)
            },
            this)).blur(i.proxy(function(D) {
                var E;
                var C = $(D.target);
                if (C.hasClass("newPass")) {
                    p = setTimeout(i.proxy(function() {
                        this.checkNewPasswords(D)
                    },
                    this), 300)
                } else {
                    if (C.hasClass("newPass2")) {
                        B = setTimeout(i.proxy(function() {
                            this.checkNewPasswords(D)
                        },
                        this), 300)
                    }
                }
            },
            this));
            var x = false;
            $("#popUpdatePassword .chkcode_img, #popUpdatePassword .next_capt").click(i.proxy(function(C) {
                C.preventDefault();
                this.nextUpdatePasswordCaptcha()
            },
            this)).mouseover(i.proxy(function(C) {
                x = true
            },
            this)).mouseout(i.proxy(function(C) {
                x = false
            },
            this));
            var y = i.proxy(function(D) {
                D.stopImmediatePropagation();
                var C = D.target;
                $(C.parentNode).removeClass("error_bg");
                $("#popUpdatePassword .capt_box .err_tip").hideError()
            },
            this);
            $("#popUpdatePassword .chkcode input").on("focus click", y).blur(i.proxy(function(C) {
                if (x) {
                    return
                }
                this.checkPasswordCaptcha()
            },
            this));
            $("#popUpdatePassword .btnCancel").click(i.proxy(function(C) {
                C.preventDefault();
                $("#popUpdatePassword").hidePopup()
            },
            this));
            $("#popUpdatePassword .btnOK").click(i.proxy(function(C) {
                C.preventDefault();
                $("#popUpdatePassword .err_tip").hideError();
                $("#popUpdatePassword .error_bg").removeClass("error_bg");
                this.onUpdatePassword(C)
            },
            this));
            $("#btnUpdatePhone").click(i.proxy(function(C) {
                C.preventDefault();
                MiAccountVerification({
                    url: "/pass/auth/security/bindSafeAddress?userId=" + $(".na-num").text(),
                    user: $(".na-num").text(),
                    success: i.proxy(function() {
                        this.enterNewPhone()
                    },
                    this),
                    fail: function(D) {
                        m(D)
                    }
                })
            },
            this));
            $("#popEnterNewPhone .new_capt").click(i.proxy(this.reloadUpdatePhoneCaptcha, this));
            $("#popEnterNewPhone .chkcode_img").click(i.proxy(this.reloadUpdatePhoneCaptcha, this));
            $("#popEnterNewPhone .new_phone").on("focus click",
            function() {
                var C = $("#popEnterNewPhone");
                var D = C.find(".binding");
                D.find(".err_tip:not(.empty_capt):not(.wng_capt)").hideError();
                D.find(".new_phone").parent().removeClass("error_bg")
            }).blur(i.proxy(function(F) {
                var D = $.trim(F.target.value);
                if (!D) {
                    var C = $("#popEnterNewPhone");
                    var E = C.find(".binding");
                    E.find(".err_tip:not(.empty_capt):not(.wng_capt)").hideError();
                    E.find(".empty_phone").showError();
                    $(F.target).parent().addClass("error_bg")
                }
            },
            this));
            $("#popEnterNewPhone .capt_box").on("focus click",
            function() {
                var C = $("#popEnterNewPhone");
                var D = C.find(".binding");
                D.find(".empty_capt, .wng_capt").hideError();
                D.find(".capt_box").parent().removeClass("error_bg")
            }).blur(i.proxy(function(F) {
                var C = $("#popEnterNewPhone");
                var E = C.find(".binding");
                var D = $.trim(F.target.value);
                if (!D) {
                    E.find(".err_tip.empty_capt, .err_tip.wng_capt").hideError();
                    E.find(".empty_capt").showError();
                    $(F.target).parent().addClass("error_bg")
                }
            },
            this));
            $("#popEnterNewPhone .binding .btn_commom").click(i.proxy(this.onEnterNewPhone, this));
            $("#popEnterNewPhone .binding .set_qst_tit").click(function(C) {
                $("#popEnterNewPhone .binding .set_qst_list").toggle();
                C.stopPropagation();
                C.preventDefault()
            });
            $("#popEnterNewPhone .binding .set_qst_list").delegate("p", "click",
            function(G) {
                var C = $(G.target),
                E = C.closest(".set_qst_list").find("p"),
                F = C.closest("dd").find(".set_qst_tit"),
                H = F.find("span"),
                D = F.find("em");
                E.removeClass("chk");
                C.addClass("chk");
                H.text(C.text());
                D.text(C.attr("_code"));
                G.preventDefault()
            });
            $(document.body).click(function() {
                $("#popEnterNewPhone .binding .set_qst_list, #popManageTokenSetMobile .binding .set_qst_list").hide()
            });
            $("#popEnterNewPhone .verify .btn_commom").click(i.proxy(this.onVerifyNewPhone, this));
            $("#popEnterNewPhone .verify .btn_back, #popEnterNewPhone .success .btn_commom").click(i.proxy(this.cancelUpdatePhone, this));
            $("#popEnterNewPhone .success .btn_commom").click(function(C) {
                location.reload(true)
            });
            var u = null;
            $("#popEnterNewPhone .verify .phone_capt").on("focus click", i.proxy(function(C) {
                $("#popEnterNewPhone .verify .err_tip:not(.quota_tip)").hideError();
                $("#popEnterNewPhone .verify .phone_capt").parent().removeClass("error_bg")
            },
            this)).blur(i.proxy(function(D) {
                var C = D.target;
                if (!$.trim(C.value)) {
                    u = setTimeout(function() {
                        $("#popEnterNewPhone .verify .empty_capt").showError();
                        $("#popEnterNewPhone .verify .phone_capt").parent().addClass("error_bg")
                    },
                    200)
                }
            },
            this));
            $("#popEnterNewPhone .verify .resend").click(function() {
                clearTimeout(u)
            });
            var w = a.Sender;
            if (this.updatePhoneSMSSender) {
                this.updatePhoneSMSSender.stop()
            }
            var v = this.updatePhoneSMSSender = new w({
                smsFailureMsgBox: ".sms_custom",
                maxQuotaToShow: 2,
                timeStep: 60 * 1000,
                type: 150007,
                userBox: $('<input type="text">').val($(".na-num").text()),
                phoneBox: "#popEnterNewPhone .binding .full_new_phone",
                getCaptchaPostData: function() {
                    var C = $("#popEnterNewPhone .new_phone").val();
                    var D = $("#popEnterNewPhone .set_qst_list p.chk").attr("_code") || "";
                    if (D === "+86") {
                        D = ""
                    }
                    C = D + C;
                    return {
                        addressType: "PH",
                        replace: $("#btnUpdatePhone a").attr("href").indexOf("replace=true") > -1,
                        userId: $(".na-num").text(),
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        newAddress: C,
                        contentType: 150007
                    }
                },
                phoneTipLabel: "",
                duplicatePhoneHTML: "",
                sendButton: "#popEnterNewPhone .verify .resend",
                captchaBox: "#popEnterNewPhone .verify .phone_capt",
                "403Label": ".fbdn_tip",
                quotaTextLabel: "#quotaTextLabel",
                quotaLabel: "#quotaLabel",
                captchaURL: "/pass/auth/security/sendSafeAddressTicket",
                quotaURL: "/pass/sms/quota",
                captchaVerifyLabel: "",
                captchaVerifyURL: "",
                checkBindingURL: ""
            });
            v.render();
            $("#popEnterNewPhone .binding .btn_commom").click(function(C) {
                C.preventDefault()
            });
            $("#btnUpdateEmail").click(i.proxy(function(C) {
                C.preventDefault();
                MiAccountVerification({
                    url: "/pass/auth/security/bindSafeAddress?userId=" + $(".na-num").text(),
                    user: $(".na-num").text(),
                    success: i.proxy(function() {
                        this.enterNewEmail()
                    },
                    this),
                    fail: function(D) {
                        m(D)
                    }
                })
            },
            this));
            $("#popEnterNewEmail .binding .new_email").on("focus click",
            function(C) {
                $("#popEnterNewEmail .binding .err_tip:not(.empty_capt):not(.wng_capt)").hideError();
                $("#popEnterNewEmail .binding .new_email").parent().removeClass("error_bg")
            }).blur(i.proxy(function(F) {
                var C = $("#popEnterNewEmail");
                var E = C.find(".binding");
                var D = $.trim(F.target.value);
                if (!D) {
                    E.find(".err_tip:not(.empty_capt):not(.wng_capt)").hideError();
                    E.find(".empty_email").showError();
                    $(F.target).parent().addClass("error_bg")
                }
            },
            this));
            $("#popEnterNewEmail .binding .capt_box").on("focus click",
            function() {
                var C = $("#popEnterNewEmail");
                var D = C.find(".binding");
                D.find(".err_tip.empty_capt, .err_tip.wng_capt").hideError();
                D.find(".capt_box").parent().removeClass("error_bg")
            }).blur(function() {
                var C = $("#popEnterNewEmail");
                var D = C.find(".binding");
                if (!$.trim(this.value)) {
                    D.find(".err_tip.empty_capt, .err_tip.wng_capt").hideError();
                    D.find(".empty_capt").showError();
                    D.find(".capt_box").parent().addClass("error_bg")
                }
            });
            $("#popEnterNewEmail .binding .chkcode_img, #popEnterNewEmail .binding .chkcode_img + a").click(function(D) {
                D.preventDefault();
                var C = $("#popEnterNewEmail .binding .chkcode_img");
                C.attr("src", C.attr("_src") + "&_=" + k.now())
            });
            $("#popEnterNewEmail .binding .btn_commom").click(i.proxy(this.onEnterNewEmail, this));
            $("#popEnterNewEmail .verify .resend").click(i.proxy(this.onResendNewEmail, this));
            $("#popEnterNewEmail .verify .capt_box").on("focus click",
            function() {
                var D = $("#popEnterNewEmail");
                var C = D.find(".verify");
                C.find(".err_tip").hideError();
                $("#popEnterNewEmail .verify .capt_box").parent().removeClass("error_bg")
            }).blur(function() {
                var D = $("#popEnterNewEmail");
                var C = D.find(".verify");
                if (!$.trim(this.value)) {
                    C.find(".empty_capt").showError();
                    C.find(".capt_box").parent().addClass("error_bg")
                }
            });
            $("#popEnterNewEmail .verify .btn_back").click(function(D) {
                D.preventDefault();
                var C = $("#popEnterNewEmail");
                C.hidePopup()
            });
            $("#popEnterNewEmail .verify .btn_commom").click(i.proxy(this.onVerifyNewEmail, this));
            $("#popEnterNewEmail .success .btn_commom").click(function(D) {
                D.preventDefault();
                var C = $("#popEnterNewEmail");
                location.reload(true)
            });
            var t = false;
            $("#btnSetMibao").click(i.proxy(function(C) {
                C.preventDefault();
                MiAccountVerification({
                    url: "/pass/auth/security/setSafeQuestions?userId=" + $(".na-num").text(),
                    user: $(".na-num").text(),
                    success: i.proxy(function() {
                        if (!t) {
                            if (s) {
                                r.render();
                                t = true;
                                $("#popSetMibao form").bind("submit", o)
                            } else {
                                $.ajax({
                                    type: "GET",
                                    url: "/pass/auth/security/verifyQuestions",
                                    dataType: "text",
                                    data: {
                                        userId: $(".na-num").text(),
                                        _: +new Date
                                    },
                                    success: function(D) {
                                        D = D.replace("&&&START&&&", "");
                                        D = $.parseJSON(D);
                                        if (D.result === 0) {
                                            window.mibaoData = window.pageData = D.info
                                        }
                                        r.render();
                                        t = true;
                                        $("#popSetMibao form").bind("submit", o)
                                    },
                                    error: function() {
                                        r.render();
                                        t = true;
                                        $("#popSetMibao form").bind("submit", o)
                                    }
                                })
                            }
                        }
                        this.setMibao()
                    },
                    this),
                    fail: function(D) {
                        m(D)
                    }
                })
            },
            this));
            var z = $("#frmSetQuestions");
            var s = window.mibaoData || window.pageData;
            var r;
            r = this.setMibaoForm = new d.QuestionForm({
                form: z,
                ajax: true
            });
            var o = i.proxy(function(E) {
                var F = $("#popAnswerMibao");
                var D = $("#popSetMibao select.iselect");
                var C = F.find(".set_mibao li p");
                C.each(function(H, I) {
                    var G = $(I);
                    G.text(D[H].value)
                });
                $("#popSetMibao").hidePopup();
                this.answerMibao()
            },
            this);
            $("#popAnswerMibao .input_bg input").bind("focus",
            function(C) {
                $(C.target).closest("li").find(".error-mes").hide()
            });
            $("#popAnswerMibao .btn_back").click(function(C) {
                C.preventDefault();
                $("#popAnswerMibao").hidePopup();
                $("#popSetMibao").showPopup();
                return false
            });
            $("#popAnswerMibao .btn_commom").click(function(E) {
                E.preventDefault();
                var C = $("#popAnswerMibao .form-error-mes");
                C.hide();
                var D = false;
                $("#popAnswerMibao .input_bg input").each(function(H, I) {
                    var G = $(I);
                    var F = G.closest("li").find(".error-mes");
                    var J = G.val();
                    if (!J) {
                        F.text(e.getResource("answer_empty")).show();
                        D = true
                    } else {
                        if (J.length < 2) {
                            F.text(e.getResource("answer_too_short")).show();
                            D = true
                        } else {
                            if (J.length > 128) {
                                F.text(e.getResource("answer_too_long")).show();
                                D = true
                            } else {
                                F.text("").hide()
                            }
                        }
                    }
                });
                if (D) {
                    return
                }
                $.ajax({
                    url: "/pass/auth/security/setSafeQuestions",
                    type: "POST",
                    data: {
                        userId: $(".na-num").text(),
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        questions: $("#popSetMibao .form-data").val(),
                        verifiedQuestions: (function() {
                            var F = [];
                            $("#popAnswerMibao .input_bg input").each(i.proxy(function(H, I) {
                                var G = $(I);
                                $question = G.parent().parent().find("p");
                                F.push('{"q":"' + d.QuestionForm.addSlashes($question.html()) + '","a":"' + d.QuestionForm.addSlashes(G.val()) + '"}')
                            },
                            this));
                            return "[" + F.join(",") + "]"
                        })()
                    },
                    dataType: "text",
                    success: function(F) {
                        F = F.replace("&&&START&&&", "");
                        F = $.parseJSON(F);
                        if (F.result === 0) {
                            C.hide();
                            $("#popAnswerMibao").hidePopup();
                            $("#popFinishMibao").showPopup()
                        } else {
                            switch (F.result) {
                            case 1200305:
                                C.text(e.getResource("wrong_answer")).show();
                                break;
                            case 5200306:
                            case 5200307:
                            case 5200308:
                                C.text(e.getResource("jsp_2014_tip23") + "(" + F.result + ")").show();
                                break;
                            default:
                            }
                        }
                    }
                });
                return false
            });
            $("#popFinishMibao .btn_commom").click(function(C) {
                C.preventDefault();
                location.reload(true)
            });
            $("#btnManageToken").click(i.proxy(function(C) {
                C.preventDefault();
                this.manageToken()
            },
            this));
            $(document.body).delegate("a[_href]", "click", i.proxy(function(G) {
                G.preventDefault();
                var F = $(G.target);
                var I = $(F.attr("_href"));
                var E = F.attr("_target") || "self";
                var H = F.parents(".mod_acc_tip", true);
                var D = H.attr("id");
                var J = I.attr("id");
                function C() {
                    I.find(".disten30x76 img").removeAttr("src").removeAttr("_secret").removeAttr("_reset");
                    I.find("input[type=text]").val("");
                    I.find(".err_tip").hideError();
                    $.ajax({
                        type: "get",
                        url: "/pass/auth/security/genEnableSecret",
                        data: {
                            userId: $(".na-num").text(),
                            reset: $("#btnManageToken a").attr("href").indexOf("status") > -1
                        },
                        dataType: "text",
                        success: function(K) {
                            K = K.replace("&&&START&&&", "");
                            K = $.parseJSON(K);
                            if (K.result === 0) {
                                I.find(".disten30x76 img").attr("src", K.info.QRCodeUrl).attr("_secret", K.info.secret).removeAttr("_reset");
                                if (H.attr("id") === "popManageTokenStatus") {
                                    I.find(".disten30x76 img").attr("_reset", true)
                                }
                                I.find(".err_tip").hideError();
                                if (E !== "_blank") {
                                    H.hidePopup()
                                }
                                I.showPopup()
                            } else {
                                H.find(".sys_err").showError(K.result)
                            }
                        }
                    })
                }
                switch (J) {
                case "popManageTokenDownload":
                    if ($("#btnManageToken a").attr("href").indexOf("status") > -1) {
                        $("#popManageTokenDownload .tip_btns").addClass("token_enabled")
                    } else {
                        $("#popManageTokenDownload .tip_btns").removeClass("token_enabled")
                    }
                    if (E !== "_blank") {
                        H.hidePopup()
                    }
                    I.showPopup();
                    break;
                case "popManageTokenSetMobile":
                    MiAccountVerification({
                        url:
                        "/pass/auth/security/setBackupPhone?userId=" + $(".na-num").text(),
                        user: $(".na-num").text(),
                        success: i.proxy(function() {
                            if (E !== "_blank") {
                                H.hidePopup()
                            }
                            I.hideError().showPopup();
                            I.find(".error_bg").removeClass("error_bg");
                            I.find(".err_tip").hideError()
                        },
                        this),
                        fail: function(K) {
                            m(K)
                        }
                    });
                    break;
                case "popManageTokenActivate":
                    if (D === "popManageTokenStatus") {
                        MiAccountVerification({
                            url: "/pass/auth/security/enableTwoStepLogin?userId=" + $(".na-num").text(),
                            user: $(".na-num").text(),
                            success: i.proxy(function() {
                                C()
                            },
                            this),
                            fail: function(K) {
                                m(K)
                            }
                        })
                    } else {
                        C()
                    }
                    break;
                case "popManageTokenKeys":
                    I.find(".mi_code span").remove();
                    $.ajax({
                        url:
                        "/pass/auth/security/backupOtp",
                        dataType: "text",
                        type: "GET",
                        data: {
                            userId: $(".na-num").text(),
                            _: +new Date
                        },
                        success: function(M) {
                            M = M.replace("&&&START&&&", "");
                            M = $.parseJSON(M);
                            if (M.result === 0) {
                                var L = M.info.codes;
                                var K = I.find(".mi_code");
                                $.each(L,
                                function(N, O) {
                                    if ($.trim(O)) {
                                        K.append("<span>" + O + "</span>")
                                    } else {
                                        K.append("<span _used>" + e.getResource("jsp_2014_token_used") + "</span>")
                                    }
                                });
                                if (M.info.email) {
                                    I.find(".sendEmail").attr("href", "mailto:" + M.info.email)
                                }
                                if (E !== "_blank") {
                                    H.hidePopup()
                                }
                                I.showPopup()
                            }
                        }
                    });
                    break;
                case "popEnterNewEmail":
                    MiAccountVerification({
                        url:
                        "/pass/auth/security/bindSafeAddress?userId=" + $(".na-num").text(),
                        user: $(".na-num").text(),
                        success: i.proxy(function() {
                            if (E !== "_blank") {
                                H.hidePopup()
                            }
                            this.enterNewEmail()
                        },
                        this),
                        fail: function(K) {
                            m(K)
                        }
                    });
                    break;
                case "popEnterNewPhone":
                    MiAccountVerification({
                        url:
                        "/pass/auth/security/bindSafeAddress?userId=" + $(".na-num").text(),
                        user: $(".na-num").text(),
                        success: i.proxy(function() {
                            if (E !== "_blank") {
                                H.hidePopup()
                            }
                            this.enterNewPhone()
                        },
                        this),
                        fail: function(K) {
                            m(K)
                        }
                    });
                    break;
                case "popManageTokenDownAct":
                    if ($("#btnUpdateEmail a").attr("href").indexOf("replace=true") === -1) {
                        if (E !== "_blank") {
                            H.hidePopup()
                        }
                        $("#popManageTokenBindEmail").showPopup();
                        return
                    }
                    if ($("#btnUpdatePhone a").attr("href").indexOf("replace=true") === -1) {
                        if (E !== "_blank") {
                            H.hidePopup()
                        }
                        $("#popManageTokenBindPhone").showPopup();
                        return
                    }
                    if (E !== "_blank") {
                        H.hidePopup()
                    }
                    MiAccountVerification({
                        url: "/pass/auth/security/enableTwoStepLogin?userId=" + $(".na-num").text(),
                        user: $(".na-num").text(),
                        success: i.proxy(function() {
                            I.find(".err_tip").hideError();
                            I.showPopup()
                        },
                        this),
                        fail: function(K) {
                            m(K)
                        }
                    });
                    break;
                default:
                    I.find(".err_tip").hideError();
                    if (E !== "_blank") {
                        H.hidePopup()
                    }
                    I.showPopup()
                }
            },
            this));
            $("#popManageTokenDownload .newtab a").click(function(E) {
                E.preventDefault();
                $("#popManageTokenDownload .newtab a").removeClass("now");
                var D = $(E.target);
                D.addClass("now");
                var C = D.index();
                $($("#popManageTokenDownload .tabcon").hide()[C]).show()
            });
            $("#popManageTokenActivate input[type=text]").on("focus click",
            function(C) {
                $("#popManageTokenActivate .err_tip").hideError();
                $("#popManageTokenActivate .input_bg").removeClass("error_bg")
            }).blur(function(C) {
                if (!$.trim(C.target.value)) {
                    $("#popManageTokenActivate .empty_capt").showError();
                    $("#popManageTokenActivate .input_bg").addClass("error_bg")
                }
            });
            $("#popManageTokenActivate .btn_commom").click(function(D) {
                D.preventDefault();
                $("#popManageTokenActivate .err_tip").hideError();
                $("#popManageTokenActivate .input_bg").removeClass("error_bg");
                var C = $.trim($("#popManageTokenActivate input[type=text]").val());
                if (!C) {
                    $("#popManageTokenActivate .empty_capt").showError();
                    $("#popManageTokenActivate .input_bg").addClass("error_bg");
                    return
                }
                $.ajax({
                    dataType: "text",
                    url: "/pass/auth/security/checkCode",
                    type: "POST",
                    data: {
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        userId: $(".na-num").text(),
                        secret: $("#popManageTokenActivate .disten30x76 img").attr("_secret"),
                        code: C
                    },
                    success: function(E) {
                        E = E.replace("&&&START&&&", "");
                        E = $.parseJSON(E);
                        if (E.result === 0) {
                            MiAccountVerification({
                                url: "/pass/auth/security/enableTwoStepLogin?userId=" + $(".na-num").text(),
                                user: $(".na-num").text(),
                                success: function() {
                                    $("#popManageTokenActivate").hidePopup();
                                    $("#popManageTokenTrustDevice .mod_trust i").attr("class", "icon_true");
                                    $("#popManageTokenTrustDevice").showPopup()
                                },
                                fail: function(F) {
                                    m(F)
                                }
                            })
                        } else {
                            $("#popManageTokenActivate .err_tip").hideError();
                            $("#popManageTokenActivate .input_bg").addClass("error_bg");
                            switch (E.result) {
                            case 1200413:
                            case 1200414:
                                $("#popManageTokenActivate .wng_capt").showError(E.result);
                                break;
                            case 5200415:
                                $("#popManageTokenActivate .sys_err").showError(E.result);
                                break;
                            default:
                            }
                        }
                    }
                })
            });
            $("#popManageTokenTrustDevice .btn_commom").click(function(C) {
                C.preventDefault();
                $.ajax({
                    url:
                    "/pass/auth/security/enableTwoStepLogin",
                    type: "post",
                    dataType: "text",
                    data: {
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        userId: $(".na-num").text(),
                        secret: $("#popManageTokenActivate .disten30x76 img").attr("_secret"),
                        reset: !!$("#popManageTokenActivate .disten30x76 img").attr("_reset"),
                        isTrustEnable: !!$("#popManageTokenTrustDevice .mod_trust .icon_true").length,
                        code: $("#popManageTokenActivate input[type=text]").val()
                    },
                    success: function(D) {
                        D = D.replace("&&&START&&&", "");
                        D = $.parseJSON(D);
                        if (D.result === 0) {
                            $("#popManageTokenTrustDevice").hidePopup();
                            var E = new k.Countdown({
                                duration: 10000,
                                onProgress: function(F) {
                                    $("#popManageTokenFinish .logoutCountdown").text(Math.round(F.timeLeft / 1000))
                                },
                                onComplete: function() {
                                    location.href = "/"
                                }
                            });
                            E.start();
                            $("#popManageTokenFinish .err_tip").hideError();
                            $("#popManageTokenFinish").showPopup()
                        } else {
                            switch (D.result) {
                            case 5200430:
                                $("#popManageTokenTrustDevice .wng_capt").showError(D.result);
                                break;
                            default:
                                $("#popManageTokenTrustDevice .sys_err").showError(D.result)
                            }
                        }
                    }
                })
            });
            $("#popManageTokenStatus .tip_btns .btn_disable_token").click(function(C) {
                C.preventDefault();
                $("#popManageTokenStatus").hidePopup();
                MiAccountVerification({
                    url:
                    "/pass/auth/security/disableTwoStepLogin?userId=" + $(".na-num").text(),
                    user: $(".na-num").text(),
                    success: i.proxy(function() {
                        $("#popManageTokenStatus .sys_err").hideError();
                        $.ajax({
                            url: "/pass/auth/security/disableTwoStepLogin",
                            type: "POST",
                            dataType: "text",
                            data: {
                                passport_ph: b.get("passport_ph") || "",
                                passportsecurity_ph: b.get("passportsecurity_ph") || "",
                                passToken: b.get("passToken") || "",
                                userId: $(".na-num").text()
                            },
                            success: function(D) {
                                D = D.replace("&&&START&&&", "");
                                D = $.parseJSON(D);
                                $("#popManageTokenStatus").showPopup();
                                if (D.result === 0) {
                                    $("#popManageTokenStatus").hidePopup();
                                    $("#popManageTokenDisableFinish").showPopup()
                                } else {
                                    switch (D.result) {
                                    case 5200433:
                                    case 5200434:
                                    case 5200456:
                                    case 5200457:
                                    case 5200458:
                                        $("#popManageTokenStatus .sys_err").showError(D.result);
                                        break;
                                    default:
                                    }
                                }
                            },
                            error: function() {
                                $("#popManageTokenStatus").showPopup()
                            }
                        })
                    },
                    this),
                    fail: function(D) {
                        $("#popManageTokenStatus").showPopup();
                        m(D)
                    }
                })
            });
            $("#popManageTokenKeys #refresh_code").click(function(D) {
                D.preventDefault();
                var C = $("#popManageTokenKeys .mi_code");
                $.ajax({
                    type: "POST",
                    url: "/pass/auth/security/refreshBackupOtp",
                    dataType: "text",
                    data: {
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        userId: $(".na-num").text()
                    },
                    success: function(F) {
                        F = F.replace("&&&START&&&", "");
                        F = $.parseJSON(F);
                        if (F.result === 0) {
                            C.find("span").remove();
                            var E = F.info.codes;
                            $.each(E,
                            function(G, H) {
                                if ($.trim(H)) {
                                    C.append("<span>" + H + "</span>")
                                } else {
                                    C.append("<span _used>" + e.getResource("jsp_2014_token_used") + "</span>")
                                }
                            })
                        }
                    }
                })
            });
            $("#popManageTokenSetMobile .set_qst_tit").click(function(C) {
                $("#popManageTokenSetMobile .set_qst_list").toggle();
                C.stopPropagation();
                C.preventDefault()
            });
            $("#popManageTokenSetMobile .set_qst_list").delegate("p", "click",
            function(G) {
                var C = $(G.target),
                E = C.closest(".set_qst_list").find("p"),
                F = C.closest(".fixpos").find(".set_qst_tit"),
                H = F.find("span"),
                D = F.find("em");
                E.removeClass("chk");
                C.addClass("chk");
                H.text(C.text());
                D.text(C.attr("_code"));
                G.preventDefault()
            });
            $("#popManageTokenSetMobile .backupPhoneInput").on("focus click",
            function(C) {
                $("#popManageTokenSetMobile .err_tip").hideError();
                $("#popManageTokenSetMobile .input_bg").removeClass("error_bg")
            });
            $("#popManageTokenSetMobile .btn_commom").click(i.proxy(function(F) {
                F.preventDefault();
                var G = $("#popManageTokenSetMobile"),
                H = G.find(".backupPhoneInput");
                var C = H.val();
                if (!C) {
                    G.find(".empty_phone").showError();
                    $("#popManageTokenSetMobile .input_bg").addClass("error_bg");
                    return
                }
                if (!/^\d+$/.test(C)) {
                    G.find(".wng_fmt").showError();
                    $("#popManageTokenSetMobile .input_bg").addClass("error_bg");
                    return
                }
                var E = $.trim(G.find(".c_b em").text());
                if (E === "+86") {
                    E = ""
                }
                var D = E + C;
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "/pass/auth/security/setBackupPhone",
                    data: {
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        userId: $(".na-num").text(),
                        phone: D,
                        replace: $("#popManageTokenStatus li:first-child dd").hasClass(".has_fb_mobile")
                    },
                    success: i.proxy(function(I) {
                        I = I.replace("&&&START&&&", "");
                        I = $.parseJSON(I);
                        G.find(".err_tip").hideError();
                        G.find(".backupPhoneInput").val("");
                        if (I.result === 0) {
                            $("#popManageTokenStatus li:first-child dd .fb_mobile span").text(D);
                            $("#popManageTokenStatus li:first-child dd").addClass("has_fb_mobile");
                            G.hideError();
                            G.hidePopup();
                            this.manageToken()
                        } else {
                            $("#popManageTokenSetMobile .input_bg").addClass("error_bg");
                            switch (I.result) {
                            case 1200444:
                                $("#popManageTokenSetMobile .empty_phone").showError(I.result);
                                break;
                            case 1200445:
                                $("#popManageTokenSetMobile .wng_fmt").showError(I.result);
                                break;
                            case 1200446:
                                $("#popManageTokenSetMobile .bad_param").showError(I.result);
                                break;
                            case 1200448:
                                $("#popManageTokenSetMobile .dupl_phone").showError(I.result);
                                break;
                            case 1200449:
                                $("#popManageTokenSetMobile .set_fail").showError(I.result);
                                break;
                            case 5200451:
                            case 5200450:
                            case 5200447:
                                $("#popManageTokenSetMobile .sys_err").showError(I.result);
                                break;
                            default:
                                $("#popManageTokenSetMobile .set_fail").showError(I.result)
                            }
                        }
                    },
                    this)
                })
            },
            this));
            $("#popManageTokenStatus .delBackupPhone").click(function(C) {
                C.preventDefault();
                MiAccountVerification({
                    url: "/pass/auth/security/deleteBackupPhone?userId=" + $(".na-num").text(),
                    user: $(".na-num").text(),
                    success: i.proxy(function() {
                        $("#popManageTokenStatus .sys_err").hideError();
                        $.ajax({
                            url: "/pass/auth/security/deleteBackupPhone",
                            dataType: "text",
                            type: "POST",
                            data: {
                                passport_ph: b.get("passport_ph") || "",
                                passportsecurity_ph: b.get("passportsecurity_ph") || "",
                                passToken: b.get("passToken") || "",
                                userId: $(".na-num").text()
                            },
                            success: function(D) {
                                D = D.replace("&&&START&&&", "");
                                D = $.parseJSON(D);
                                if (D.result === 0) {
                                    $("#popManageTokenStatus li:first-child dd .fb_mobile span").text("");
                                    $("#popManageTokenStatus li:first-child dd").removeClass("has_fb_mobile")
                                } else {
                                    switch (D.result) {
                                    case 5200452:
                                    case 5200453:
                                    case 5200455:
                                        $("#popManageTokenStatus .sys_err").showError(D.result);
                                        break;
                                    case 1200454:
                                        $("#popManageTokenStatus .backup_phone_not_exists").showError(D.result);
                                        break;
                                    default:
                                    }
                                }
                            }
                        })
                    },
                    this),
                    fail: function(D) {
                        m(D)
                    }
                })
            });
            $("#popManageTokenKeys .sendEmail").click(function(E) {
                var D = [];
                $("#popManageTokenKeys .mi_code span:not([_used])").each(function(G, H) {
                    D.push($.trim($(H).text()))
                });
                var F = "?subject=" + encodeURIComponent(e.getResource("jsp_2014_my_backup_keys")) + "&body=" + D.join(" \r\n");
                var C = E.target.href;
                if (C.indexOf("subject=") === -1) {
                    C += F
                } else {
                    C = C.replace(/\?.*$/g, F)
                }
                E.target.href = C
            });
            $("#popUpdatePassword .oldPass, #popUpdatePassword .newPass, #popUpdatePassword .newPass2, #popUpdatePassword .capt_box").keypress(function(C) {
                if (C.keyCode === 13) {
                    C.preventDefault();
                    $("#popUpdatePassword .btnOK").click()
                }
            });
            $("#popEnterNewEmail .binding .new_email, #popEnterNewEmail .binding .capt_box").keypress(function(C) {
                if (C.keyCode === 13) {
                    C.preventDefault();
                    $("#popEnterNewEmail .binding .btn_commom").click()
                }
            });
            $("#popEnterNewEmail .verify .capt_box").keypress(function(C) {
                if (C.keyCode === 13) {
                    C.preventDefault();
                    $("#popEnterNewEmail .verify .btn_commom").click()
                }
            });
            $("#popEnterNewPhone .binding .new_phone, #popEnterNewPhone .binding .capt_box").keypress(function(C) {
                if (C.keyCode === 13) {
                    C.preventDefault();
                    $("#popEnterNewPhone .binding .btn_commom").click()
                }
            });
            $("#popEnterNewPhone .verify .phone_capt").keypress(function(C) {
                if (C.keyCode === 13) {
                    C.preventDefault();
                    $("#popEnterNewPhone .verify .btn_commom").click()
                }
            });
            $("#printKeys").click(function(C) {
                C.preventDefault();
                window.print()
            });
            var A = $("#popManageTokenStatus");
            var q = $("#popManageTokenKeys");
            $(window).resize(k.debounce(function() {
                A.positionPopup();
                q.positionPopup()
            }))
        },
        resetUpdatePasswordForm: function(o) {
            o = o || {};
            var p = $("#popUpdatePassword");
            p.find(".error_bg").removeClass("error_bg");
            p.find(".grpOldPass .err_tip, .capt_box .err_tip").hideError();
            if (!o.keepInputs) {
                p.find("input[type=text], input[type=password]").val("")
            }
        },
        nextUpdatePasswordCaptcha: function(q) {
            var p = $("#popUpdatePassword .chkcode_img");
            var o = p.attr("src") || "/pass/getCode?icodeType=login&_t=0";
            o = o.replace(/_t\=\d*/g, "_t=" + ( + new Date));
            p.attr("src", o)
        },
        onUpdatePasswordSuccess: function() {
            $("#popUpdatePassword").hidePopup();
            $("#popUpdatePasswordSuccess").showPopup();
            var o = new k.Countdown({
                duration: 10000,
                onProgress: function(p) {
                    $("#popUpdatePasswordSuccess .logoutCountdown").text(Math.round(p.timeLeft / 1000))
                },
                onComplete: function() {
                    location.href = "/"
                }
            });
            o.start()
        },
        onOldPasswordWrong: function(o) {
            $("#popUpdatePassword .grpOldPass .wng_pwd").showError(o);
            $("#popUpdatePassword .oldPass").parent().addClass("error_bg");
            $("#popUpdatePassword .capt_box .chkcode input").val("")
        },
        onUpdatePasswordCaptchaWrong: function(o) {
            $("#popUpdatePassword .capt_box .wng_capt").showError(o);
            $("#popUpdatePassword .capt_box .chkcode").addClass("error_bg");
            $("#popUpdatePassword .capt_box .chkcode input").val("");
            $("#popUpdatePassword .grpOldPass label").removeClass("error_bg");
            $("#popUpdatePassword .grpOldPass .wng_pwd").hideError()
        },
        updatePasswordAttempts: 0,
        MAX_UPDATE_CAPTLESS_ATTEMPTS: 3,
        onUpdatePasswordSystemError: function(o) {
            $("#popUpdatePassword .sys_err").showError(o)
        },
        onUpdatePasswordTooMuchError: function(o) {
            $("#popUpdatePassword .too_much").showError(o)
        },
        onUpdatePasswordEmailDisallowedError: function(o) {
            $("#popUpdatePassword .eq_email").showError(o)
        },
        onUpdatePassword: function(o) {
            if (!this.checkOldPassword() || !this.checkNewPasswords(o)) {
                return false
            }
            var p = $("#popUpdatePassword");
            if (p.find(".oldPass").val() === p.find(".newPass").val()) {
                p.find(".same_pwd").showError();
                p.find(".grpNewPass label").addClass("error_bg");
                return false
            }
            if ($("#popUpdatePassword .capt_box").css("display") !== "none") {
                if (!this.checkPasswordCaptcha()) {
                    return false
                }
            }
            this.resetUpdatePasswordForm({
                keepInputs: true
            });
            $.ajax({
                url: "/pass/auth/security/changePassword",
                type: "POST",
                dataType: "text",
                data: {
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    userId: $(".na-num").text(),
                    oldPassword: $("#popUpdatePassword .oldPass").val(),
                    password: $("#popUpdatePassword .newPass").val(),
                    icode: $.trim($("#popUpdatePassword .chkcode input").val())
                },
                success: i.proxy(function(r) {
                    r = r.replace("&&&START&&&", "");
                    r = $.parseJSON(r);
                    var q = r.result;
                    if (q === 0) {
                        this.onUpdatePasswordSuccess()
                    } else {
                        switch (q) {
                        case 110021001:
                        case 110041001:
                        case 1200102:
                        case 1200106:
                            this.onOldPasswordWrong(r.result);
                            break;
                        case 1200107:
                        case 1200105:
                            this.onUpdatePasswordCaptchaWrong(r.result);
                            break;
                        case 550065002:
                        case 550001008:
                        case 550025000:
                        case 550065000:
                            this.onUpdatePasswordSystemError(r.result);
                            break;
                        case 4200104:
                            this.onUpdatePasswordTooMuchError(r.result);
                            break;
                        case 1200110:
                            this.onUpdatePasswordEmailDisallowedError(r.result);
                            break;
                        default:
                        }
                        if (r.info && r.info.captchaUrl) {
                            this.requirePasswordCaptcha(r.info.captchaUrl)
                        }
                    }
                },
                this)
            });
            return true
        },
        checkOldPassword: function() {
            var o = $("#popUpdatePassword .oldPass").val();
            if (!o) {
                $("#popUpdatePassword .grpOldPass .empty_pwd").showError();
                $("#popUpdatePassword .grpOldPass label").addClass("error_bg")
            } else {
                $("#popUpdatePassword .grpOldPass .empty_pwd").hideError();
                $("#popUpdatePassword .grpOldPass label").removeClass("error_bg")
            }
            return !! o
        },
        checkNewPasswords: function(u) {
            var t = $("#popUpdatePassword .newPass").val(),
            o = $("#popUpdatePassword .newPass2").val();
            if (!t) {
                if (!$(u.target).hasClass(".newPass")) {
                    $("#popUpdatePassword .grpNewPass .empty_pwd").showError();
                    $("#popUpdatePassword .newPass").parent().addClass("error_bg")
                }
                return false
            } else {
                $("#popUpdatePassword .grpNewPass .empty_pwd").hideError();
                $("#popUpdatePassword .newPass").parent().removeClass("error_bg")
            }
            if (!o) {
                $("#popUpdatePassword .grpNewPass .empty_pwd2").showError();
                $("#popUpdatePassword .newPass2").parent().addClass("error_bg");
                return false
            } else {
                $("#popUpdatePassword .grpNewPass .empty_pwd2").hideError();
                $("#popUpdatePassword .newPass2").parent().removeClass("error_bg")
            }
            if (t !== o) {
                $("#popUpdatePassword .grpNewPass .pwd_mismatch").showError();
                $("#popUpdatePassword .newPass2").parent().addClass("error_bg");
                return false
            } else {
                $("#popUpdatePassword .grpNewPass .pwd_mismatch").hideError();
                $("#popUpdatePassword .newPass2").parent().removeClass("error_bg")
            }
            var q = /\d/g,
            p = /[a-zA-Z]/g,
            s = /[^0-9a-zA-Z]/g;
            var r = 0 + q.test(t) + p.test(t) + s.test(t);
            if (r < 2 || t.length < 8 || t.length > 16) {
                $("#popUpdatePassword .grpNewPass .pwd_fmt").showError();
                $("#popUpdatePassword .grpNewPass .txt_tip").hide();
                $("#popUpdatePassword .newPass").parent().addClass("error_bg");
                $("#popUpdatePassword .newPass2").parent().addClass("error_bg");
                return false
            } else {
                $("#popUpdatePassword .grpNewPass .pwd_fmt").hideError();
                $("#popUpdatePassword .grpNewPass .txt_tip").show();
                $("#popUpdatePassword .newPass").parent().removeClass("error_bg");
                $("#popUpdatePassword .newPass2").parent().removeClass("error_bg")
            }
            return true
        },
        checkPasswordCaptcha: function() {
            var o = $.trim($("#popUpdatePassword .chkcode input").val());
            if (!o) {
                $("#popUpdatePassword .capt_box .empty_capt").showError();
                $("#popUpdatePassword .capt_box .chkcode").addClass("error_bg");
                return false
            } else {
                $("#popUpdatePassword .capt_box .empty_capt").hideError();
                $("#popUpdatePassword .capt_box .chkcode").removeClass("error_bg")
            }
            return true
        },
        requirePasswordCaptcha: function(o) {
            o = o || "/pass/getCode?icodeType=login";
            o += "&_t=" + ( + new Date);
            $("#popUpdatePassword .capt_box .chkcode_img").attr("src", o);
            $("#popUpdatePassword .capt_box").show()
        },
        checkNewPhone: i.proxy(function(s) {
            var p = $("#popEnterNewPhone");
            var r = p.find(".binding");
            var o = r.find(".new_phone").val();
            var q = $("#popEnterNewPhone .set_qst_list p.chk").attr("_code") || "";
            if (q === "+86") {
                q = ""
            }
            o = q + o;
            if (!$.trim($("#popEnterNewPhone .capt_box").val())) {
                return
            }
            $.ajax({
                url: "/pass/auth/security/checkSafeAddressParams",
                type: "POST",
                data: {
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    addressType: "PH",
                    userId: $(".na-num").text(),
                    newAddress: o,
                    icode: $.trim(r.find(".capt_box").val()),
                    replace: $("#btnUpdatePhone a").attr("href").indexOf("replace=true") > -1
                },
                dataType: "text",
                success: function(t) {
                    t = t.replace("&&&START&&&", "");
                    t = $.parseJSON(t);
                    if (t.result === 0) {
                        if (s) {
                            s()
                        }
                    } else {
                        r.find(".chkcode_img").click();
                        r.find(".capt_box").val("").parent().addClass("error_bg");
                        switch (t.result) {
                        case 1200216:
                            r.find(".wng_fmt").showError(t.result);
                            break;
                        case 1200205:
                            r.find(".phone_bound").showError(t.result);
                            break;
                        case 1200207:
                            r.find(".phone_bound_elsewhere").showError(t.result);
                            break;
                        case 5200203:
                        case 5200204:
                        case 5200206:
                        case 5200218:
                            r.find(".sys_err").showError(t.result);
                            break;
                        case 1200201:
                            r.find(".wng_capt").showError(t.result);
                            break;
                        case 1200202:
                            r.find(".bad_param").showError(t.result);
                            break;
                        case 1200217:
                            r.find(".dupl_phone").showError(t.result);
                            break;
                        default:
                        }
                    }
                }
            })
        },
        this),
        checkNewEmail: i.proxy(function(s) {
            var q = this;
            var o = $("#popEnterNewEmail");
            var r = o.find(".binding");
            var p = r.find(".new_email").val();
            if (!p) {
                r.find(".empty_email").showError();
                return false
            }
            if (!/^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,6}$/.test(p)) {
                r.find(".wng_fmt").showError();
                return false
            }
            $.ajax({
                url: "/pass/auth/security/checkSafeAddressParams",
                type: "POST",
                data: {
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    addressType: "EM",
                    userId: $(".na-num").text(),
                    newAddress: p,
                    icode: $.trim(r.find(".capt_box").val()),
                    replace: $("#btnUpdateEmail a").attr("href").indexOf("replace=true") > -1
                },
                dataType: "text",
                success: function(u) {
                    u = u.replace("&&&START&&&", "");
                    u = $.parseJSON(u);
                    if (u.result === 0) {
                        if (s) {
                            s()
                        }
                    } else {
                        var t = $("#popEnterNewEmail .binding .chkcode_img");
                        t.attr("src", t.attr("src") + "&_=" + k.now());
                        $("#popEnterNewEmail .binding .capt_box").val("").parent().addClass("error_bg");
                        switch (u.result) {
                        case 1200216:
                            r.find(".wng_fmt").showError(u.result);
                            break;
                        case 1200205:
                            r.find(".email_bound").showError(u.result);
                            break;
                        case 1200207:
                            r.find(".email_bound_elsewhere").showError(u.result);
                            break;
                        case 5200203:
                        case 5200204:
                        case 5200206:
                            r.find(".sys_err").showError(u.result);
                            break;
                        case 1200201:
                            r.find(".wng_capt").showError(u.result);
                            break;
                        case 1200202:
                            r.find(".bad_param").showError(u.result);
                            break;
                        default:
                        }
                    }
                }
            })
        },
        this),
        onEnterNewPhone: function(s) {
            var p = $("#popEnterNewPhone");
            var r = p.find(".binding");
            r.find(".err_tip").hideError();
            var o = r.find(".new_phone").val();
            if (!o) {
                r.find(".empty_phone").showError();
                r.find(".new_phone").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            if (!/^\d+$/.test(o)) {
                r.find(".wng_fmt").showError();
                r.find(".new_phone").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            var q = $.trim(p.find(".capt_box").val());
            if (!q) {
                r.find(".empty_capt").showError();
                p.find(".capt_box").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            this.checkNewPhone(i.proxy(function() {
                var t = p.find(".verify");
                t.find(".disten30x103 h6 em").text(" " + o + " ");
                r.hide();
                t.show();
                $(p.find(".tab_opt span").removeClass("now")[1]).addClass("now");
                $(p.find(".tabline i").removeClass("now")[1]).addClass("now");
                var u = $("#popEnterNewPhone .binding .set_qst_tit em").text();
                if (u === "+86") {
                    u = ""
                }
                $("#popEnterNewPhone .binding .full_new_phone").val(u + o);
                var v = this.updatePhoneSMSSender;
                if (typeof this.updatePhoneSMSSender.quota === "number") {
                    $("#popEnterNewPhone .verify .resend").click()
                } else {
                    $.ajax({
                        url: v.quotaURL,
                        dataType: "text",
                        type: "POST",
                        data: v.getQuotaPostData ? v.getQuotaPostData() : {
                            address: v.$phoneBox.val(),
                            contentType: v.type,
                            userId: v.type ? v.$userBox.val() : -1
                        },
                        success: i.proxy(function(x) {
                            x = v.constructor.toJSON(x);
                            var w = +x.info || 0;
                            v.quota = w;
                            v.showQuota(v.quota);
                            if (v.quota <= 0) {
                                if (v.quotaURL) {
                                    if (v.countdown) {
                                        v.countdown.stop()
                                    }
                                    v.disabled = true;
                                    v.disableSendButton()
                                }
                            } else {
                                $("#popEnterNewPhone .verify .resend").click()
                            }
                        },
                        v)
                    })
                }
            },
            this));
            if (s) {
                s.preventDefault()
            }
            return false
        },
        onVerifyNewEmail: function(t) {
            if (t) {
                t.preventDefault()
            }
            var s = this;
            var p = $("#popEnterNewEmail");
            var o = p.find(".verify");
            var r = p.find(".success");
            var q = $.trim(o.find(".capt_box").val());
            if (!q) {
                o.find(".empty_capt").showError();
                return
            }
            $.ajax({
                type: "post",
                dataType: "text",
                url: "/pass/auth/security/bindSafeAddress",
                data: {
                    vkey: $.trim(o.find(".capt_box").val()),
                    userId: $(".na-num").text(),
                    newAddress: $("#popEnterNewEmail .binding .new_email").val(),
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    addressType: "EM",
                    replace: $("#btnUpdateEmail a").attr("href").indexOf("replace=true") > -1
                },
                success: function(u) {
                    u = u.replace("&&&START&&&", "");
                    u = $.parseJSON(u);
                    if (u.result === 0) {
                        $(p.find(".tab_opt span").removeClass("now")[2]).addClass("now");
                        $(p.find(".tabline i").removeClass("now")[2]).addClass("now");
                        o.hide();
                        r.show()
                    } else {
                        o.find(".err_tip").hideError();
                        switch (u.result) {
                        case 1200212:
                            o.find(".wng_capt").showError(u.result);
                            break;
                        case 5200213:
                        case 5200214:
                            o.find(".sys_err").showError(u.result);
                            break;
                        default:
                        }
                    }
                }
            })
        },
        onVerifyNewPhone: function(o) {
            if (o) {
                o.preventDefault()
            }
            $.ajax({
                type: "POST",
                dataType: "text",
                url: "/pass/auth/security/bindSafeAddress",
                data: {
                    userId: $(".na-num").text(),
                    vkey: $.trim($("#popEnterNewPhone .verify .phone_capt").val()),
                    replace: $("#btnUpdatePhone a").attr("href").indexOf("replace=true") > -1,
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    newAddress: $("#popEnterNewPhone .binding .full_new_phone").val()
                },
                success: function(s) {
                    s = s.replace("&&&START&&&", "");
                    s = $.parseJSON(s);
                    var q = $("#popEnterNewPhone");
                    var p = q.find(".verify");
                    var r = q.find(".success");
                    if (s.result === 0) {
                        $(q.find(".tab_opt span").removeClass("now")[2]).addClass("now");
                        $(q.find(".tabline i").removeClass("now")[2]).addClass("now");
                        p.hide();
                        r.show()
                    } else {
                        q.find(".verify .wng_capt").showError(s.result)
                    }
                }
            });
            return false
        },
        reloadUpdatePhoneCaptcha: i.proxy(function(p) {
            var o = $("#popEnterNewPhone .chkcode_img");
            var q = o.attr("src");
            if (q.indexOf("?") === -1) {
                q += "?"
            } else {
                q += "&"
            }
            q += "_=" + ( + new Date);
            o.attr("src", q);
            if (p) {
                p.preventDefault()
            }
            return false
        },
        this),
        cancelUpdatePhone: function(o) {
            $("#popEnterNewPhone").hidePopup();
            if (o) {
                o.preventDefault()
            }
            return false
        },
        showTip: function(o) {},
        hideTip: function(o) {},
        editPassword: function() {
            $.ajax({
                url: "/pass/auth/security/changePassword",
                type: "get",
                dataType: "text",
                data: {
                    userId: $(".na-num").text()
                },
                success: i.proxy(function(o) {
                    o = o.replace("&&&START&&&", "");
                    o = $.parseJSON(o);
                    if (o.result === 0) {
                        if (o.info.captchaUrl) {
                            this.requirePasswordCaptcha(o.info.captchaUrl)
                        } else {
                            $("#popUpdatePassword .capt_box").hide()
                        }
                        var p = $("#popUpdatePassword");
                        p.showPopup().find(".err_tip").hide();
                        p.find(".grpNewPass .txt_tip").show()
                    }
                },
                this)
            })
        },
        updatePassword: function() {},
        editEmail: function() {},
        updateEmail: function() {},
        enterNewPhone: function() {
            var p = $("#popEnterNewPhone");
            $(p.find(".tab_opt span").removeClass("now")[0]).addClass("now");
            $(p.find(".tabline i").removeClass("now")[0]).addClass("now");
            p.find(".binding").show();
            p.find(".verify").hide();
            p.find(".success").hide();
            p.find("input").val("");
            p.find(".err_tip").hideError();
            var o = p.find(".chkcode_img");
            o.attr("src", o.attr("_src") + "&_=" + k.now());
            p.showPopup()
        },
        enterNewEmail: function() {
            var p = $("#popEnterNewEmail");
            $(p.find(".tab_opt span").removeClass("now")[0]).addClass("now");
            $(p.find(".tabline i").removeClass("now")[0]).addClass("now");
            p.find(".binding").show();
            p.find(".verify").hide();
            p.find(".success").hide();
            p.find("input").val("");
            p.find(".err_tip").hideError();
            var o = p.find(".chkcode_img");
            o.attr("src", o.attr("_src") + "&_=" + k.now());
            p.showPopup()
        },
        setMibao: function() {
            var q = $("#popSetMibao");
            q.find(".error-mes").html("").hide();
            var o = $("#frmSetQuestions ul > li");
            o.each(function(s, t) {
                var r = $(t);
                var u = r.find('dd[_type^="-"]');
                if (!u.length) {
                    u = r.find("dd.def-opt")
                }
                u.click()
            });
            $("#frmSetQuestions").trigger("reset");
            q.showPopup();
            var p = $("#popAnswerMibao");
            p.find("li label input").val("");
            p.find("li > p").html("")
        },
        answerMibao: function(p) {
            var q = $("#popAnswerMibao");
            q.find(".error-mes").text("").hide();
            if (p && p.list && p.list.length) {
                var o = q.find(".set_mibao li p");
                o.each(function(r, s) {
                    $(s).text(p.list[r].q)
                })
            }
            q.showPopup()
        },
        manageToken: function() {
            var q;
            var o = $("#btnManageToken a");
            var p = o.attr("href");
            if (p.indexOf("status") > -1) {
                q = $("#popManageTokenStatus")
            } else {
                if (p.indexOf("explain") > -1) {
                    q = $("#popManageTokenHome")
                }
            }
            if (q) {
                if (q.attr("id") === "popManageTokenStatus") {
                    $.ajax({
                        url: "/pass/auth/security/twoStepLoginStatus",
                        type: "GET",
                        dataType: "text",
                        data: {
                            userId: $(".na-num").text(),
                            _: +new Date
                        },
                        success: function(r) {
                            r = r.replace("&&&START&&&", "");
                            r = $.parseJSON(r);
                            var s = r.info.hasBackupPhone;
                            if (s) {
                                q.find("li:first-child dd .fb_mobile span").text(r.info.backupPhone);
                                q.find("li:first-child dd").addClass("has_fb_mobile")
                            } else {
                                q.find("li:first-child dd").removeClass("has_fb_mobile")
                            }
                            q.find(".err_tip").hideError();
                            q.showPopup()
                        }
                    })
                } else {
                    q.find(".err_tip").hideError();
                    q.showPopup()
                }
            }
        },
        confirmMibao: function() {
            var o = $("#popAnswerMibao");
            o.showPopup()
        },
        emailSendTimes: 0,
        onResendNewEmail: function(q) {
            var r = $("#popEnterNewEmail");
            var p = r.find(".resend");
            var o = r.find(".verify");
            if (p.hasClass("noSend")) {
                return
            }
            p.addClass("noSend");
            $.ajax({
                type: "POST",
                url: "/pass/auth/security/sendSafeAddressTicket",
                data: {
                    passport_ph: b.get("passport_ph") || "",
                    passportsecurity_ph: b.get("passportsecurity_ph") || "",
                    passToken: b.get("passToken") || "",
                    userId: $(".na-num").text(),
                    newAddress: r.find(".new_email").val(),
                    addressType: "EM",
                    replace: $("#btnUpdateEmail a").attr("href").indexOf("replace=true") > -1
                },
                dataType: "text",
                success: i.proxy(function(u) {
                    u = u.replace("&&&START&&&", "");
                    u = $.parseJSON(u);
                    if (u.result === 0) {
                        var t = 60000 + 60000 * this.emailSendTimes++,
                        s = 100;
                        var x = new Date;
                        var v = p.attr("title");
                        var w = setInterval(function() {
                            var y = new Date;
                            var A = y - x;
                            var z = t / 1000 - Math.round(A / 1000);
                            if (z > 0) {
                                p.text(v + "(" + z + ")")
                            } else {
                                p.removeClass("noSend").text(v);
                                clearInterval(w)
                            }
                        },
                        s)
                    } else {
                        o.find(".err_tip").hideError();
                        switch (u.result) {
                        case 5200209:
                            o.find(".err_tip.sys_err").showError(u.result);
                            break;
                        case 1200210:
                            o.find(".err_tip.wng_capt").showError(u.result);
                            break;
                        default:
                        }
                    }
                },
                this)
            })
        },
        onEnterNewEmail: function(s) {
            var o = $("#popEnterNewEmail");
            var r = o.find(".binding");
            r.find(".err_tip").hideError();
            var p = r.find(".new_email").val();
            if (!p) {
                r.find(".empty_email").showError();
                r.find(".new_email").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            if (!/^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,6}$/.test(p)) {
                r.find(".wng_fmt").showError();
                r.find(".new_email").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            var q = $.trim(o.find(".capt_box").val());
            if (!q) {
                r.find(".empty_capt").showError();
                o.find(".capt_box").parent().addClass("error_bg");
                if (s) {
                    s.preventDefault()
                }
                return false
            }
            this.checkNewEmail(function() {
                var t = o.find(".verify");
                t.find(".disten30x103 h6 em").text(" " + p + " ");
                r.hide();
                t.show();
                $(o.find(".tab_opt span").removeClass("now")[1]).addClass("now");
                $(o.find(".tabline i").removeClass("now")[1]).addClass("now");
                $("#popEnterNewEmail .verify .resend").click()
            });
            if (s) {
                s.preventDefault()
            }
            return false
        },
        updatePhone: function() {},
        editMibaoQuestions: function() {},
        updateMibaoQuestions: function() {},
        enableToken: function() {},
        disableToken: function() {}
    });
    var n = i.$class({
        constructor: function() {},
        uploadingPhoto: false,
        render: function() {
            $(document.body).delegate(".mod_acc_tip .btn_mod_close, .btn_back", "click", i.proxy(function(R) {
                R.preventDefault();
                var P = $(R.target),
                T = R.target.id,
                S = P.closest(".mod_acc_tip"),
                Q = S.attr("id");
                switch (T) {
                case "reuploadPhoto":
                    $("#photoUploader")[0].reset();
                    $($(".layeruploadface .mod_tip_bd").hide()[0]).showPopup();
                    break;
                case "abortUpload":
                    this.uploadingPhoto = false;
                    $(R.target).closest(".mod_acc_tip").hidePopup();
                    $(".naImgLink a").click();
                    break;
                default:
                    $(R.target).closest(".mod_acc_tip").hidePopup()
                }
            },
            this));
            $(".titsbirth").bind("click",
            function(P) {
                P.stopPropagation();
                $(P.target).closest("li").find(".tits_list").toggle()
            });
            $(document.body).click(function(P) {
                $(".tits_list").hide()
            });
            $(document.body).delegate(".tits_list p", "click",
            function(S) {
                var P = $(S.target);
                var Q = P.closest("li");
                var R = P.attr("value");
                if (Q.hasClass("biry")) {
                    H(R)
                } else {
                    if (Q.hasClass("birm")) {
                        A(R)
                    } else {
                        t(R)
                    }
                }
            });
            $(".infosex span").click(function(R) {
                var P = $(R.target);
                var Q = P.closest(".infosex");
                Q.find("span").removeClass("now");
                P.closest("span", true).addClass("now")
            });
            function x(P) {
                if (P === "") {
                    return
                }
                $(".infosex span").removeClass("now");
                if (isNaN(P)) {
                    $(".infosex em:contains(" + P + ")").closest("span").addClass("now")
                } else {
                    $($(".infosex span")[P]).addClass("now")
                }
            }
            function E(P) {
                P = +P;
                return (P % 100 !== 0 && P % 4 === 0) || (P % 100 === 0 && P % 400 === 0)
            }
            function w(R, S, Q) {
                R = parseInt(R, 10);
                S = parseInt(S, 10);
                Q = parseInt(Q, 10);
                var P = E(R);
                var T = z.concat([]);
                if (P) {
                    T[2] = 29
                }
                if (Q <= T[S]) {
                    return true
                } else {
                    return false
                }
            }
            var z = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            var s = new Date,
            v = s.getFullYear(),
            r = s.getMonth() + 1,
            D = s.getDate();
            function H(R) {
                if (!R) {
                    $(".biry .birthcon").text(e.getResource("jsp_2014_select"));
                    return
                }
                $(".biry .birthcon").text(R);
                if (R == v) {
                    $(".birm .tits_list p").each(function(T, U) {
                        var V = parseInt(U.getAttribute("value"), 10);
                        if (V <= r) {
                            $(U).show()
                        } else {
                            $(U).hide()
                        }
                    })
                } else {
                    $(".birm .tits_list p").show()
                }
                var Q = $(".biry .birthcon").text(),
                S = $(".birm .birthcon").text(),
                P = $(".bird .birthcon").text();
                if (isNaN(Q) || isNaN(S) || isNaN(P)) {
                    return
                }
                if (!w(Q, S, P)) {
                    $(".bird .birthcon").text(e.getResource("jsp_2014_select"))
                }
                A(S)
            }
            function A(R) {
                if (!R) {
                    $(".birm .birthcon").text(e.getResource("jsp_2014_select"));
                    return
                }
                $(".birm .birthcon").text(R);
                R = parseInt(R, 10);
                var T = z[R];
                if (E($(".biry .birthcon").text()) && R === 2) {
                    T = 29
                }
                $(".bird .tits_list p").each(function(U, V) {
                    if (U < T) {
                        $(V).show()
                    } else {
                        $(V).hide()
                    }
                });
                if ($(".biry .birthcon").text() == v && parseInt($(".birm .birthcon").text()) === r) {
                    $(".bird .tits_list p").each(function(V, W) {
                        var U = parseInt(W.getAttribute("value"), 10);
                        if (U <= D) {
                            $(W).show()
                        } else {
                            $(W).hide()
                        }
                    })
                } else {}
                var Q = $(".biry .birthcon").text(),
                S = $(".birm .birthcon").text(),
                P = $(".bird .birthcon").text();
                if (isNaN(Q) || isNaN(S) || isNaN(P)) {
                    return
                }
                if (!w(Q, S, P)) {
                    $(".bird .birthcon").text(e.getResource("jsp_2014_select"))
                } else {
                    t(P)
                }
            }
            function t(P) {
                if (!P) {
                    $(".bird .birthcon").text(e.getResource("jsp_2014_select"));
                    return
                }
                $(".bird .birthcon").text(P)
            }
            $("#editInfo").click(function(U) {
                U.preventDefault();
                var P = $(".layereditinfo");
                P.find(".err_tip").hideError();
                var Q = $(".uinfo");
                var S = $.trim(Q.find(".lblnickname .value").text());
                if (Q.find(".lblnickname .value").attr("_empty") !== undefined) {
                    S = ""
                }
                $("input[name=nickname]").val(S);
                var Y = $.trim(Q.find(".lblbirthday .value").text());
                if (Q.find(".lblbirthday .value").attr("_empty") !== undefined) {
                    Y = ""
                }
                var T = Y.split("-"),
                W = T[0],
                V = T[1],
                R = T[2];
                H(W);
                A(V);
                t(R);
                var X = $.trim(Q.find(".lblgender .value").text());
                if (Q.find(".lblgender .value").attr("_empty") !== undefined) {
                    X = ""
                }
                x(X);
                P.showPopup()
            });
            $(".layereditinfo .nickname").on("focus click",
            function(P) {
                $(".layereditinfo .err_tip").hideError()
            });
            function q(P) {
                P = "" + P;
                if (P.length === 1) {
                    P = "0" + P
                }
                return P
            }
            $(".layereditinfo .btn_commom").click(function(U) {
                U.preventDefault();
                var P = $.trim($(".layereditinfo .nickname").val());
                var S = "";
                var R = parseInt($(".layereditinfo .biry .birthcon").text(), 10),
                T = parseInt($(".layereditinfo .birm .birthcon").text(), 10),
                Q = parseInt($(".layereditinfo .bird .birthcon").text(), 10);
                if (!R || !T || !Q) {
                    S = ""
                } else {
                    S = [R, q(T), q(Q)].join("-")
                }
                if (!P) {
                    $(".layereditinfo .empty_name").showError();
                    return
                }
                if (P.length < 2 || P.length > 20) {
                    $(".layereditinfo .bad_nickname").showError();
                    return
                }
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "/login",
                    data: {
                        nickname: P,
                        birthday: S,
                        gender: $(".layereditinfo .infosex .now").attr("value") || "",
                        userId: $(".na-num").text(),
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || ""
                    },
                    success: function(V) {
                        V = V.replace("&&&START&&&", "");
                        V = $.parseJSON(V);
                        if (V.result === 0) {
                            $(".layereditinfo").hidePopup();
                            location.reload(true)
                        } else {
                            $(".layereditinfo .err_tip").hideError();
                            switch (V.result) {
                            case 1200503:
                                $(".layereditinfo .empty_param").showError(V.result);
                                break;
                            case 1200504:
                                $(".layereditinfo .bad_nickname").showError(V.result);
                                break;
                            case 1200505:
                                $(".layereditinfo .bad_birthday").showError(V.result);
                                break;
                            case 1200506:
                                $(".layereditinfo .bad_gender").showError(V.result);
                                break;
                            case 1200507:
                                $(".layereditinfo .bad_param").showError(V.result);
                                break;
                            case 1200508:
                            case 5200509:
                            case 5200510:
                                $(".layereditinfo .sys_err").showError(V.result);
                                break;
                            default:
                            }
                        }
                    }
                })
            });
            $(".uplodefile").change(i.proxy(function(W) {
                var Q = W.target.value,
                U = W.target.form,
                P = $(U);
                $(".layeruploadface").find(".err_tip").hide();
                if (Q) {
                    var V = Q.lastIndexOf(".");
                    if (V !== -1) {
                        var S = Q.substring(V + 1).toLowerCase();
                        if (S !== "png" && S !== "jpg") {
                            $(".layeruploadface .wng_fmt").showError();
                            return
                        }
                    }
                }
                var T = W.target.files;
                if (T && T.length) {
                    var R = T[0];
                    if (R.size > 1 << 21) {
                        $(".layeruploadface .file_too_large").showError();
                        return
                    }
                }
                $(".layeruploadface .err_tip").hideError();
                this.uploadingPhoto = true;
                $.ajax({
                    type: "POST",
                    url: "/login",
                    dataType: "text",
                    data: {
                        userId: $(".na-num").text(),
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        quality: "1.0",
                        isRedirect: "true"
                    },
                    success: i.proxy(function(X) {
                        X = X.replace("&&&START&&&", "");
                        X = $.parseJSON(X);
                        if (X.result === 0) {
                            $(".layeruploadface .preupload").hide();
                            $(".layeruploadface .uploading .err_tip").hideError();
                            $(".layeruploadface .uploading").show();
                            var Y = X.info.tempUploadUrl;
                            U.action = Y;
                            P.submit()
                        } else {
                            switch (X.result) {
                            case 5200512:
                            case 5200513:
                                $(".layeruploadface .preupload .sys_err").showError(X.result);
                                break;
                            default:
                            }
                        }
                    },
                    this)
                })
            },
            this));
            $(".naImgLink a, .na-edit").click(function(P) {
                P.preventDefault();
                var Q = $(".layeruploadface");
                Q.find(".err_tip").hideError();
                Q.find("form").trigger("reset");
                $(Q.find(".mod_tip_bd").hide()[0]).show();
                Q.showPopup()
            });
            var p = 100;
            $(".layeruploadface .uploaded .clipimg img").load(i.proxy(function(T) {
                if (!this.uploadingPhoto) {
                    return
                }
                var R = $(T.target),
                Q = $(".layeruploadface .uploaded .movebox"),
                S = R.parent();
                $(".layeruploadface .uploading").hide();
                $(".layeruploadface .uploaded .err_tip").hideError();
                $(".layeruploadface .uploaded").show();
                $("#img_cache").append(R);
                var P = R.width();
                imgHeight = R.height();
                var V = 300;
                if (P > imgHeight) {
                    if (P > V) {
                        imgHeight = Math.floor(imgHeight * V / P);
                        P = V
                    }
                } else {
                    if (imgHeight > V) {
                        P = Math.floor(P * V / imgHeight);
                        imgHeight = V
                    }
                }
                R.css({
                    width: P + "px",
                    height: imgHeight + "px"
                }).appendTo(S);
                $("#img_cache").html("");
                p = Math.min(100, Math.min(R.width(), R.height()));
                R.css("top", Math.floor((V - R.prop("offsetHeight")) / 2));
                R.css("left", Math.floor((V - R.prop("offsetWidth")) / 2));
                var U = Math.floor((V - p) / 2);
                Q[0].style.cssText = "width:" + p + "px;height:" + p + "px;top:" + U + "px;left:" + U + "px;";
                this.uploadingPhoto = false
            },
            this));
            var C = $("#uploadPhoto"),
            B = C[0];
            var N = "";
            function G(Q) {
                var P = $("<DIV/>").html(Q);
                var R = P.text();
                P = null;
                return R
            }
            function F(T) {
                if (B.readyState === "complete" || B.readyState === "loaded" || (T && T.type === "load")) {
                    N = "";
                    var S;
                    try {
                        S = B.contentDocument || (B.contentWindow && B.contentWindow.document) || B.document;
                        if (!S) {
                            return
                        }
                    } catch(Q) {
                        return
                    }
                    var U = G($(S).find("textarea.jsonResult").val());
                    var R = U;
                    R = R.replace("&&&START&&&", "");
                    R = $.parseJSON(R);
                    if (!R) {
                        $(".layeruploadface .uploading .sys_err").showError();
                        return
                    }
                    if (R.result === 0) {
                        N = G($(S).find("textarea.uploadResult").val());
                        var P = R.info.data.temp_url;
                        $(".layeruploadface .uploaded .clipimg img").attr("src", P)
                    } else {
                        if (R.result === 1200521) {
                            if (R.info) {
                                R.result = R.info.issErrorCode
                            }
                        }
                        switch (R.result) {
                        case 90021:
                            $(".layeruploadface .uploading .file_too_large").showError(R.result);
                            break;
                        case 90018:
                            $(".layeruploadface .uploading .wng_fmt").showError(R.result);
                            break;
                        case 5200522:
                        case 5200524:
                            $(".layeruploadface .uploading .sys_err").showError(R.result);
                            break;
                        case 1200523:
                            $(".layeruploadface .uploading .missing_param").showError(R.result);
                            break;
                        case 80017:
                            $(".layeruploadface .uploading .missing_file").showError(R.result);
                            break;
                        case 10007:
                            $(".layeruploadface .uploading .unsupported_mime_type").showError(R.result);
                            break;
                        default:
                        }
                    }
                }
            }
            if ("onreadystatechange" in B) {
                B.onreadystatechange = F
            } else {
                B.onload = F
            }
            var y = false;
            var J, I;
            var O = $(".movebox");
            var K = $(".uploadimgs img");
            O.mousedown(function(P) {
                P.preventDefault();
                y = true;
                J = P.pageX - parseInt(O.css("left"));
                I = P.pageY - parseInt(O.css("top"))
            });
            $(document).mousemove(function(S) {
                if (y) {
                    S.preventDefault();
                    var R = parseInt(K.css("left"), 10),
                    X = R + K.prop("offsetWidth") - O.prop("offsetWidth");
                    var W = parseInt(K.css("top"), 10),
                    P = W + K.prop("offsetHeight") - O.prop("offsetHeight");
                    var V = S.pageX - J;
                    var U = S.pageY - I;
                    if (V < R) {
                        V = R
                    }
                    if (U < W) {
                        U = W
                    }
                    if (V > X) {
                        V = X
                    }
                    if (U > P) {
                        U = P
                    }
                    var T = Math.round((V - R) * 100 / (K.prop("offsetWidth") - O.prop("offsetWidth"))) + "%";
                    var Q = Math.round((U - W) * 100 / (K.prop("offsetHeight") - O.prop("offsetHeight"))) + "%";
                    O.css({
                        top: U,
                        left: V
                    })
                }
            }).mouseup(function(P) {
                P.preventDefault();
                y = false
            });
            var o = $(".layeruploadface .icon_square_rightbot");
            var M, u, L = false;
            o.mousedown(function(P) {
                P.stopPropagation();
                P.preventDefault();
                L = true;
                M = P.pageX - parseInt(o.css("left"), 10);
                u = P.pageY - parseInt(o.css("top"), 10)
            });
            $(document).mousemove(function(S) {
                if (L) {
                    S.stopPropagation();
                    S.preventDefault();
                    var U = S.pageX - M;
                    var T = S.pageY - u;
                    var R = parseInt(K.css("left"), 10),
                    X = R + K.prop("offsetWidth") - parseInt(O.css("left"), 10);
                    var W = parseInt(K.css("top"), 10),
                    P = W + K.prop("offsetHeight") - parseInt(O.css("top"), 10);
                    var V = Math.max(U, T);
                    var Q = V;
                    if (Q < p) {
                        Q = p
                    }
                    if (Q > X) {
                        Q = X
                    }
                    if (Q > P) {
                        Q = P
                    }
                    Q -= 2;
                    O.css({
                        height: Q,
                        width: Q
                    })
                }
            }).mouseup(function(P) {
                if (L) {
                    L = false;
                    P.stopPropagation();
                    P.preventDefault()
                }
            });
            $(".layeruploadface .uploaded .btn_commom").click(function(P) {
                P.preventDefault();
                $.ajax({
                    url: "/pass/auth/profile/commitUpload",
                    type: "POST",
                    data: {
                        userId: $(".na-num").text(),
                        passport_ph: b.get("passport_ph") || "",
                        passportsecurity_ph: b.get("passportsecurity_ph") || "",
                        passToken: b.get("passToken") || "",
                        uploadResult: N,
                        cropParam: (function() {
                            var S = parseInt(K.css("left"), 10),
                            U = K.prop("offsetWidth"),
                            X = O.prop("offsetWidth");
                            var Y = parseInt(K.css("top"), 10),
                            V = K.prop("offsetHeight"),
                            Z = O.prop("offsetHeight");
                            var R = parseInt(O.css("left"), 10) - S,
                            W = parseInt(O.css("top"), 10) - Y,
                            Q = R + X,
                            T = W + Z;
                            R /= U;
                            W /= V;
                            Q /= U;
                            T /= V;
                            if (R < 0) {
                                R = 0
                            }
                            if (R > 1) {
                                R = 1
                            }
                            if (W < 0) {
                                W = 0
                            }
                            if (W > 1) {
                                W = 1
                            }
                            if (Q < 0) {
                                Q = 0
                            }
                            if (Q > 1) {
                                Q = 1
                            }
                            if (T < 0) {
                                T = 0
                            }
                            if (T > 1) {
                                T = 1
                            }
                            return '{"x1":' + R + ',"y1":' + W + ',"x2":' + Q + ',"y2":' + T + "}"
                        })
                    },
                    dataType: "text",
                    success: function(Q) {
                        Q = Q.replace("&&&START&&&", "");
                        Q = $.parseJSON(Q);
                        if (Q.result === 0) {
                            $(".layeruploadface").showPopup();
                            location.reload(true)
                        } else {
                            $(".layeruploadface .uploaded .err_tip").hideError();
                            switch (Q.result) {
                            case 5200517:
                            case 5200518:
                            case 5200519:
                            case 5200520:
                                $(".layeruploadface .uploaded .sys_err").showError(Q.result);
                                break;
                            case 1200514:
                            case 1200516:
                                $(".layeruploadface .uploaded .bad_param").showError(Q.result);
                                break;
                            case 1200515:
                                $(".layeruploadface .uploaded .upload_failed").showError(Q.result);
                                break;
                            default:
                            }
                        }
                    }
                })
            });
            $(".layereditinfo .nickname").keypress(function(P) {
                if (P.keyCode === 13) {
                    P.preventDefault();
                    $(".layereditinfo .btn_commom").click()
                }
            })
        }
    });
    var c = i.$class({
        constructor: function() {},
        render: function() {
            this.uiBind()
        },
        uiBind: function() {},
        kick: function() {},
        onKick: function() {},
        requirePassword: function() {},
        untrust: function() {},
        onUntrust: function() {},
        findDevice: function() {},
        deleteRecord: function() {},
        editPassword: function() {}
    });
    var f = i.$class({
        constructor: function() {
            this.$bindingContainer = $("[_role=bindingContainer]");
            this.$a11nContainer = $("[_role=a11nContainer]")
        },
        render: function() {
            this.uiBind()
        },
        uiBind: function() {
            this.$bindingContainer.delegate("[_role=icon]", "click", i.proxy(function(o) {
                this.onClickBindingIcon($(o.target))
            },
            this));
            this.$a11nContainer.delegate("[_role=icon]", "click", i.proxy(function(o) {
                this.onClickA11NIcon($(o.target))
            },
            this))
        },
        onClickBindingIcon: function(p) {
            var o = p.attr("_name");
            Util.showPopup(o)
        },
        onClickA11NIcon: function(p) {
            var o = p.attr("_name");
            Util.showPopup(o)
        }
    });
    var g = i.$class({
        constructor: function() {},
        render: function() {
            this.uiBind()
        },
        uiBind: function() {}
    });
    var j = i.$class({
        constructor: function() {},
        showPopup: function(o) {
            $(o).show()
        },
        hidePopup: function(o) {
            $(o).hide()
        },
        fix: function(o) {
            if ($.browser.msie && +$.browser.version <= 6) {
                o.css({
                    position: "absolute"
                });
                var p = $(document);
                $win.bind("scroll resize", k.debounce(i.proxy(function() {
                    o.css({
                        top: p.scrollTop() + "px",
                        left: p.scrollLeft() + "px"
                    })
                },
                this), 500))
            }
        }
    });
    return {
        Security: h,
        Profile: n,
        LoginManager: c,
        BindingA11N: f,
        Services: g,
        Utils: j
    }
});