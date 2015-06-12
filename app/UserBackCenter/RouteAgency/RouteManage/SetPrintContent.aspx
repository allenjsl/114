﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetPrintContent.aspx.cs" ValidateRequest="false"
    Inherits="UserBackCenter.RouteAgency.RouteManage.SetPrintContent" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
</head>
<body>
<style type="text/css">
        body
        {
            color: #000000;
            font-size: 12px;
            font-family: "宋体";
            background: #fff;
            margin: 0px;
            background: url(<%=ImageServerPath %>/images/lura4.gif);
            background-repeat: no-repeat;
            background-position: 0px 80px;
        }
        img
        {
            border: thin none;
        }
        table
        {
            border-collapse: collapse;
        }
        td
        {
            font-size: 12px;
            line-height: 18px;
            color: #000000;
        }
        .headertitle
        {
            font-family: "黑体";
            font-size: 25px;
            line-height: 120%;
            font-weight: bold;
        }
        .baocun_an
        {
            font-size: 12px;
            color: #000000;
            background-image: url(<%=ImageServerPath %>/images/baocun.gif);
            float: none;
            height: 24px;
            width: 103px;
            border: 0px;
        }
        #divPrint table
        {
            width: 790px;
        }
    </style>
    <form id="form1" runat="server">
    <div id="divPrintPageBody">
        <input type="hidden" id="txtFontSize" name="txtFontSize" value="12" />
        <input type="hidden" id="txtLineHeight" name="txtLineHeight" value="18" />
        <input type="hidden" id="txtPrintHTML" name="txtPrintHTML" />
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 10px;">
            <tr>
                <td height="31" valign="bottom" bgcolor="#FFE08B" style="border-bottom: 1px solid #DCAE30;">
                    <table width="767" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="155" align="left">
                                调整行间距：<a href="javascript:void(0)" onclick="printConfig.setLineHeight(true)">+加大</a>
                                <a href="javascript:void(0)" onclick="printConfig.setLineHeight(false)">-减小</a>
                            </td>
                            <td width="154" align="center">
                                字体大小：<a href="javascript:void(0)" onclick="printConfig.setFontSize(true)">+加大</a>
                                <a href="javascript:void(0)" onclick="printConfig.setFontSize(false)">-减小</a>
                            </td>
                            <td width="173" align="right">
                                <a title="自动设置 A4 纸张、打印时出现表格、自动设置页眉和页角为空,不出现网址。" href="<%=EyouSoft.Common.Domain.ServerComponents %>/PrintTemplate/printSetup.zip">
                                    打印控件安装</a>
                            </td>
                            <td width="206" align="center" valign="bottom">
                                <a href="javascript:void(0)" onclick="printConfig.printPage()">
                                    <img src="<%=ImageServerPath %>/images/zjprint.gif" alt="直接打印" width="80" height="22"
                                        border="0" /></a> <a href="javascript:void(0)" onclick="return printConfig.wordPrint()">
                                            <img src="<%=ImageServerPath %>/images/dcprint.gif" alt="导出为word格式文件，在word里编辑打印"
                                                width="80" height="22" border="0" /></a>
                            </td>
                            <td width="79" align="right">
                                <a href="javascript:void(0)" onclick="printConfig.printPreview()">打印预览</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="1000" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
                <td width="200" rowspan="3" align="right" valign="top">
                    <table width="83%" border="0" align="right" cellpadding="0" cellspacing="0" style="margin-top: 90px;"
                        id="tblFloating">
                        <tr>
                            <td align="left" style="color: #999999;">
                                勾选复选框隐藏指定项目<br />
                                打勾为隐藏，不打勾为显示
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="color: #999999;">
                                <input type="checkbox" name="chkPriceInfo" id="chkPriceInfo" onclick="printConfig.setHS({'chkPriceInfo':['tblPriceInfo']})" /><label
                                    for="chkPriceInfo">报价信息</label><br />
                                <input type="checkbox" name="chkServiceStandard" id="chkServiceStandard" onclick="printConfig.setHS({'chkServiceStandard':['divServiceStandard','pnlServeice']},{'chkContainsItems':['<%=trContainsItems.ClientID %>'],'chkNotContainsItems':['<%=trNotContainsitems.ClientID %>']})" /><label
                                    for="chkServiceStandard">服务标准及说明</label><br />
                                <input type="checkbox" name="chkContainsItems" id="chkContainsItems" onclick="printConfig.setHS({'chkContainsItems':['<%=trContainsItems.ClientID %>']})" /><label
                                    for="chkContainsItems">包含项目</label><br />
                                <input type="checkbox" name="chkNotContainsItems" id="chkNotContainsItems" onclick="printConfig.setHS({'chkNotContainsItems':['<%=trNotContainsitems.ClientID %>']})" /><label
                                    for="chkExpenseItems">其它说明</label><br />
                                <input type="checkbox" name="chkChildServiceItems" id="chkChildServiceItems" onclick="printConfig.setHS({'chkChildServiceItems':['<%=trChildServiceItems.ClientID %>']})" /><label
                                    for="chkChildServiceItems">备注</label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="800">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="2%" align="left">
                                <img src="<%=ImageServerPath %>/images/printboxt-l.gif" width="16" height="37" style="vertical-align: bottom" />
                            </td>
                            <td width="97%" background="<%=ImageServerPath %>/images/printboxt-m.gif">
                                &nbsp;
                            </td>
                            <td width="1%" align="right">
                                <img src="<%=ImageServerPath %>/images/printboxt-r.gif" width="6" height="37" style="vertical-align: bottom" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="border-left: 1px solid #C9C9C9; border-bottom: 1px solid #C9C9C9; border-right: 5px solid #808080;
                    padding-bottom: 10px;">
                    <div id="divPrint">
                        <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="35" align="center">
                                                <span class="headertitle">
                                                    <asp:Label ID="lblCompanyName" runat="server"></asp:Label></span>&nbsp;&nbsp;&nbsp;&nbsp;许可证号：<asp:Label
                                                        ID="lblLicense" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Tel：<asp:Label ID="lblContactTel" runat="server"></asp:Label>
                                                Fax：<asp:Label ID="lblContactFax" runat="server"></asp:Label>地址：<asp:Label ID="lblAddress"
                                                    runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
                                        <tr>
                                            <td colspan="2" align="center">
                                                <strong style="font-size: 14px;">
                                                    <asp:Label ID="lblRouteName" runat="server"></asp:Label></strong> 天数：<asp:Label ID="lblTourDays"
                                                        runat="server"></asp:Label>天
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="720" border="0" align="center" cellspacing="1" bgcolor="#FFFFFF" id="tblPriceInfo">
                                        <asp:Literal ID="ltrPriceDetail" runat="server"></asp:Literal>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:PlaceHolder runat="server" ID="plhItinerary">
                                        <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
                                            <tr>
                                                <td width="61" align="center" bgcolor="#00D9D9">
                                                    <strong>日程</strong>
                                                </td>
                                                <td align="center" bgcolor="#00D9D9">
                                                    <strong>行程安排</strong>
                                                </td>
                                            </tr>
                                            <asp:Literal ID="ltrTourPlan" runat="server"></asp:Literal>
                                        </table>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder ID="plhPlan" runat="server" Visible="false">
                                        <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
                                            <tr>
                                                <td align="center" bgcolor="#00D9D9">
                                                    <strong>行程安排</strong>
                                                </td>
                                            </tr>
                                            <asp:Literal ID="ltrTourPlan1" runat="server"></asp:Literal>
                                        </table>
                                    </asp:PlaceHolder>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlServeice" runat="server">
                                        <table width="720" border="0" cellspacing="0" cellpadding="0" align="left">
                                            <tr runat="server">
                                                <td colspan="2" align="left" bgcolor="#F8EEE6" style="border-bottom: 1px solid #E3CAB7;">
                                                    <strong>服务标准及说明：<img src="<%=ImageServerPath %>/images/ttt.gif" width="15" height="16" /></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table width="720" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#cccccc">
                                                        <tr id="trContainsItems" runat="server">
                                                            <td width="86" align="right">
                                                                包含项目：
                                                            </td>
                                                            <td width="604" align="left">
                                                                <asp:Literal ID="ltrContainContent" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                        <tr id="trNotContainsitems" runat="server">
                                                            <td align="right">
                                                                其他说明：
                                                            </td>
                                                            <td align="left">
                                                                <asp:Literal ID="ltrStandardService" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlRemark" runat="server">
                                        <table width="720" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#cccccc"
                                            id="trChildServiceItems" runat="server">
                                            <tr bgcolor="#f6e5a9">
                                                <td align="left">
                                                    备注：
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Literal ID="ltrRemark" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="60%" height="40" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="42%" align="center">
                                <input name="Submit3" type="button" class="baocun_an" value="直接打印" onclick="printConfig.printPage()">
                            </td>
                            <td width="11%">
                                &nbsp;
                            </td>
                            <td width="47%" align="center">
                                <asp:Button runat="server" ID="btnWordPrint" CssClass="baocun_an" Text="导出到word"
                                    OnClientClick="printConfig.wordPrint()" OnClick="btnWordPrint_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="divPrintBody" style="display: none">
    </div>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("floating") %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            //将左侧提示信息设置成跟随页面滚动而滚动
            $("#tblFloating").floating({ position: "left", top: 50, left: 35, width: 163 });
        });

        var printConfig = {
            config: { maxFontSize: 16, minFontSize: 10, maxLineHeight: 25, minLineHeight: 15 },
            printPreviewHTML: '',
            //设置字体大小 isIncrease=true 加大 isIncrease=false 减小
            setFontSize: function(isIncrease) {
                var currentFontSize = parseInt($("#txtFontSize").val());
                var toFontSize = isIncrease ? currentFontSize + 1 : currentFontSize - 1;

                if (!isIncrease && toFontSize < this.config.minFontSize) {
                    alert("已调整至最小字体" + this.config.minFontSize + "像素");
                    return;
                }

                if (isIncrease && toFontSize > this.config.maxFontSize) {
                    alert("已调整至最大字体" + this.config.maxFontSize + "像素");
                    return;
                }

                $("#divPrint td").css({ 'font-size': toFontSize + 'px' });
                $("#txtFontSize").val(toFontSize);
            },
            //设置行间距 isIncrease=true 加大 isIncrease=false 减小
            setLineHeight: function(isIncrease) {
                var currentLineHeight = parseInt($("#txtLineHeight").val());
                var toLineHeight = isIncrease ? currentLineHeight + 1 : currentLineHeight - 1;

                if (!isIncrease && toLineHeight < this.config.minLineHeight) {
                    alert("已调整至最小行间距" + this.config.minLineHeight + "像素");
                    return;
                }

                if (isIncrease && toLineHeight > this.config.maxLineHeight) {
                    alert("已调整至最大行间距" + this.config.maxLineHeight + "像素");
                    return;
                }

                $("#divPrint td").css({ 'line-height': toLineHeight + 'px' });
                $("#txtLineHeight").val(toLineHeight);
            },
            //设置隐藏或显示
            setHS: function(parentParms, childParms) {
                for (var chkId in parentParms) {
                    for (var i = 0; i < parentParms[chkId].length; i++) {
                        $("#" + chkId).attr("checked") ? $("#" + parentParms[chkId][i]).hide() : $("#" + parentParms[chkId][i]).show();
                    }
                }

                if (childParms == 'undefined') {
                    return;
                }

                for (var chkParentId in parentParms) {
                    var isChecked = $("#" + chkParentId).attr("checked");
                    if (!isChecked) { isChecked = false; }

                    for (var chkChildId in childParms) {
                        $("#" + chkChildId).attr("checked", isChecked);

                        for (var i = 0; i < childParms[chkChildId].length; i++) {
                            isChecked ? $("#" + childParms[chkChildId][i]).hide() : $("#" + childParms[chkChildId][i]).show();
                        }

                        if (isChecked) {
                            $("#" + chkChildId).attr("disabled", "disabled");
                        } else {
                            $("#" + chkChildId).removeAttr("disabled");
                        }
                    }
                }
                $("#tblFloating").floating({ position: "left", top: 50, left: 35, width: 163 });
            },
            //直接打印
            printPage: function() {
                this.setPrintHTML();
                //隐藏原始页面内容
                $("#divPrintPageBody").hide();
                //显示打印的内容
                $("#divPrintBody").html($("#txtPrintHTML").val()).show();
                //去掉页面背景
                $("body").css({ "background": "none" });
                //打印
                if (window.print != null) {
                    window.print();
                } else {
                    alert('没有安装打印机');
                }
                //还原页面内容
                window.setTimeout(function() {
                    $("#divPrintBody").hide().html('');
                    $("#divPrintPageBody").show();
                    $("body").css({ "background": "url(<%=ImageServerPath %>/images/lura4.gif)", "background-repeat": "no-repeat", "background-position": "0px 80px" });
                }, 1000);
            },
            //打印预览
            printPreview: function() {
                this.setPrintHTML();
                window.open("PrintPreview.aspx", '行程单打印预览', 'height=700,width=1020,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
            },
            //word方式打印
            wordPrint: function() {
                this.setPrintHTML();
                //alert($("#txtPrintHTML").val());
                document.getElementById("<%=btnWordPrint.ClientID %>").click();
                return false;
            },
            //设置打印内容
            setPrintHTML: function() {
                var printHTML = $("#divPrint").html();
                $("#divPrintBody").html(printHTML);
                //替换掉打印内容的价格input
                $("#divPrintBody  #tblPriceInfo").find("input").each(function() {
                    var v = this.value;
                    $(this).parent().html("<div>" + v + "元／人</div>");
                });
                //替换掉打印内容的价格标准的删除图片
                $("#divPrintBody #tblPriceInfo").find("img").each(function() {
                    $(this).parent().hide();
                });
                $("#txtPrintHTML").val($("#divPrintBody").html());
                $("#divPrintBody").html('');
            },
            //删除报价信息
            deletePriceInfo: function(obj) {
                $(obj).parent().parent().hide();
            }
        };
    </script>

    </form>
</body>
</html>
