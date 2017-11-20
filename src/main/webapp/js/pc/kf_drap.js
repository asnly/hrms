jQuery.fn.extend({
    Drap: function (opts) {
        var _self = this, _this = jQuery(this), posX = 0, posY = 0;
        opts = jQuery.extend({
            DrapMove: null,
            IsLimit: false,
            Callback: function () { }
        }, opts || {});
        _self.mousemove = function (e) {
            e.stopPropagation();
            if (/msie/.test(navigator.userAgent.toLowerCase())) { e = window.event; }
            var x = e.clientX - posX;
            var y = e.clientY - posY;
            if (opts.IsLimit) {
                if (x < 0) {
                    x = 0;
                }
                if (y < 0) {
                    y = 0;
                }
                if (x > (jQuery(document).width() - _this.width() - 2)) {
                    x = (jQuery(document).width() - _this.width() - 2);
                }
                if (y > (jQuery(document).height() - _this.height() - 2)) {
                    y = (jQuery(document).height() - _this.height() - 2);
                }
            }
            _this.css("left", x + "px");
            _this.css("top", y + "px");
//            _this.find(opts.DrapMove).text("top:" + y + ",left:" + (x + _this.width()))
        }
        _this.find(opts.DrapMove).mousedown(function (e) {
            e.stopPropagation();
            if (/msie/.test(navigator.userAgent.toLowerCase())) { e = window.event; }
            posX = e.clientX - parseInt(_this.css('left'));
            posY = e.clientY - parseInt(_this.css('top'));
            jQuery(document).mousemove(function (ev) {
                _self.mousemove(ev);
            });
        });
        jQuery(document).mouseup(function () {
            jQuery(document).unbind("mousemove");
            opts.Callback();
        });
        _this.find(opts.DrapMove).css("cursor", "move");
    }
});