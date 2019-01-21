(function ($) {
    var userLocale = "ko";

    $(function () {









        $("#portletSettingButton").click(function (event) {
            var portletType = 'CARD';

            if (portletType == 'CARD') {
                location.href = "/portal/main/mainEdit.do";
            } else if (portletType == 'PORTLET') {
                spro.showModalFrame(
                    "/portal/listPortlet/portletConfig/portletSetting.do",
                    "",
                    function (obj) {
                        if (obj == "success") {
                            location.reload();
                        }
                    },
                    options = {
                        title: "포틀릿 설정",
                        width: 700,
                        height: 640
                    }
                );
            } else {
                location.href = "/portal/main/mainEdit.do";
            }
        });

        $("#portletSettingButton2").click(function (event) {
            var portletType = 'CARD';

            if (portletType == 'CARD') {
                location.href = "/portal/main/mainEdit.do";
            } else if (portletType == 'PORTLET') {
                spro.showModalFrame(
                    "/portal/listPortlet/portletConfig/portletSetting.do",
                    "",
                    function (obj) {
                        if (obj == "success") {
                            location.reload();
                        }
                    },
                    options = {
                        title: "포틀릿 설정",
                        width: 700,
                        height: 640
                    }
                );
            } else {
                location.href = "/portal/main/mainEdit.do";
            }
        });





        $("#mainTopHelpButtion").click(function (event) {
            location.href = "/support/customer/serviceGuide/serviceGuideMainView.do";
        });


        $.ajax({
            type: "GET",
            url: "/js/worldClockTimezone.min.js",
            dataType: "json",
            success: function (data) {
                var timezoneList = data.worldclock;
                var userCountryCode = "South Korea",
                    userCityCode = "Seoul";

                var nation = timezoneList[userCountryCode],
                    city = nation.citylist[userCityCode];

                $("div.time-setting").data("timezoneList", timezoneList)
                    .data("timezone", {
                        code: "Asia/Seoul",
                        countryCode: userCountryCode,
                        cityCode: userCityCode
                    });
            }
        });

        var arrTime = "2019-01-17 10:41:17".split(" "),
            date = arrTime[0].split("-"),
            time = arrTime[1].split(":");

        var nowTime = new Date(parseInt(date[0], 10), parseInt(date[1], 10) - 1, parseInt(date[2], 10), parseInt(time[0], 10), parseInt(time[1], 10), parseInt(time[2], 10)),
            jclockOptions = {
                format: "%Y.%m.%d",
                seedTime: nowTime.getTime()
            };

        $('#jclockDate').jclock(jclockOptions);

        jclockOptions.format = "%P %l:%M:%S";
        $("#jclockTime").jclock(jclockOptions);




        $(".date", ".time-setting").click(function (event) {
            var $container = $(this).parent();

            if (!$("#clock-bubble").is(":visible")) {
                $('.bubble').hide();
            }

            if (!$("#clock-bubble", $container).is("*")) {
                $('<div id="clock-bubble" class="bubble"/>').appendTo($container)
                    .load("/portal/main/timezone.do")
                    .click(function (event) {
                        event.stopPropagation();
                    });

            } else {
                $("#clock-bubble").toggle();
            }
        });

        $("body").click(function (event) {
            if ($(event.target).closest(".date").get(0) != $(".date", ".time-setting").get(0)) {
                $("#clock-bubble").hide();
            }
        });




        $('#themeMenuButton').click(function (e) {
            executionBlur(this);

            if (!$("#theme-tooltip").is(":visible")) {}

            if (!$("#theme-tooltip").is("*")) {
                $(document.body).loading();
                var $container = $(this).closest("div");
                $.ajax({
                    async: false,
                    method: "get",
                    url: "/portal/main/viewTheme.do",
                    success: function (html) {
                        $container.append(html);

                        $("#theme-tooltip").click(function (event) {
                            event.stopPropagation();
                        });
                    },
                    complete: function () {
                        setTimeout(function () {
                            $(document.body).loaded();
                        }, 500);
                    }
                });

            }

            $('#theme-tooltip').toggle();
        });

        $("body").click(function (event) {
            if ($(event.target).get(0) != $('#themeMenuButton').get(0)) {
                $("#theme-tooltip").hide();
            }
        });




        $(".notice-doc").children("h2").click(function (event) {
            $("#noticeBubble").toggle();
        });

        $("#noticeBubble").click(function (event) {
            event.stopPropagation();
        });

        $("body").click(function (event) {
            var header = $(".notice-doc").children("h2").get(0);
            if (event.target != header && $(event.target).parent().get(0) != header) {
                $("#noticeBubble").hide();
            }
        });

        if ("0" == "0") {
            $('#mainNoticeDiv').vTicker();
        }

        $("#noticeoff").click(function (event) {
            updateUserNoticeConfig("1");
            $("#noticeoff").css("btn active");
            $("#noticeon").css("btn");
            location.reload();
        });

        $("#noticeon").click(function (event) {
            updateUserNoticeConfig("0");
            $("#noticeon").css("btn active");
            $("#noticeoff").css("btn");
            location.reload();
        });

        updateUserNoticeConfig = function (onoff) {
            $.ajax({
                url: "/support/tenant/user/updateUserNoticeConfig.do",
                data: {
                    onoff: onoff
                },
                type: "post",
                dataType: "html",
                success: function (result) {
                    if (result == "success") {

                    }
                },
                error: function () {}
            });
        };



        $("#portletTypeUl > li > button").click(function (event) {
            if (!$(this).parent().hasClass("selected")) {
                var portletType = $(this).attr("data-portlet-type");

                $.ajax({
                    url: "/support/tenant/userConfig/updatePortletType.do",
                    data: {
                        'portletType': portletType
                    },
                    type: "post",
                    success: function (result) {
                        location.href = "/portal/main/main.do";
                    },
                    error: function () {}
                });
            }
        });


        if ($.cookie("pvHint") != 1) {
            $("#portletTypeUl").after('<span class="hint">' +
                '<img src="/images/common/hint.gif" alt="" usemap="#mapAccountBanner">' +
                '<map name="mapAccountBanner" id="mapAccountBanner">' +
                '<area alt="portlet view" shape="rect" coords="6,8,57,27" href="#" />' +
                '<area alt="close" shape="rect" coords="61,2,75,21" href="#" />' +
                '</map>' +
                '</span>');

            $("area", "#mapAccountBanner").click(function (event) {
                event.preventDefault();

                if ($(this).attr("alt") == "close") {
                    $("#mapAccountBanner").closest("span.hint").remove();
                    $.cookie("pvHint", "1", {
                        path: "/portal/main/",
                        expires: new Date(9999, 12, 31, 0, 0, 0)
                    });
                } else {
                    $("#portletTypeUl > li > button:eq(1)").click();
                }
            });
        }




        // 		$("[data-toggle1=tooltip]").tooltip();



    });
})(jQuery);