﻿<%@ Page Title="最新旅游动态" Language="C#" MasterPageFile="~/master/T4.Master" AutoEventWireup="true"
    CodeBehind="NewsList.aspx.cs" Inherits="SeniorOnlineShop.template4.NewsList" %>

<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPage" TagPrefix="cc2" %>
<%@ Import Namespace="EyouSoft.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="linetj">
        <div class="linetjtk">
            <div class="linetjth">
                最新旅游动态
                <table width="220" border="0" align="right" cellpadding="0" cellspacing="0" style="margin-top: -7px;
                    *margin-top: -22px;">
                    <tr>
                        <td width="150" align="right">
                            <input type="text" value='<%= Utils.GetQueryStringValue("k").Length>0?Utils.GetQueryStringValue("k"): "请输入关键字"%>'
                                id="txtKeyWord" size="25" />
                        </td>
                        <td width="70" align="center">
                            <input type="button" id="Search" value="搜索" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="linetjxx">
                <table width="660" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left: 10px;">
                    <tr>
                        <td width="330" align="left">
                            <table width="660" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="30">
                                        <asp:Literal runat="server" ID="ltrHeadLink"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="90" valign="top">
                                        <asp:Repeater runat="server" ID="RpTripGuides">
                                            <ItemTemplate>
                                                <div class="tixing">
                                                    <div class="hd">
                                                        <div class="info">
                                                            <h5>
                                                                <a href='<%# Utils.GenerateShopPageUrl2("/News_" + Eval("ID"), cMaster.CompanyId)%>'>
                                                                    <%# Utils.GetText2(EyouSoft.Common.Function.StringValidate.LoseHtml(Eval("Title").ToString()), 18, false)%></a>
                                                            </h5>
                                                            <div class="conlist">
                                                                <%--<a style="color: #999;" href='<%# Utils.GenerateShopPageUrl("/template4/News.aspx?newid=" + Eval("ID"), cMaster.CompanyId)%>'>
                                                                    <%# Utils.GetText2(EyouSoft.Common.Function.StringValidate.LoseHtml(string.Format("{0}", Eval("ContentText"))), 55, true)%>
                                                                </a>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr runat="server" id="DataEmpty" visible="false" style="padding-top: 20px; padding-bottom: 20px;">
                                    <td align="center">
                                        暂无匹配数据！
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div class="digg">
                                <cc2:ExporPageInfoSelect ID="ExporPageInfoSelect1" PageStyleType="NewButton" runat="server" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var newsList = {
            search: function() {
                var k = $("#txtKeyWord").val() == "请输入关键字" ? "" : $("#txtKeyWord").val();
                var cid = "<%= cMaster.CompanyId %>";
                window.location.href = "/template4/NewsList.aspx?" + $.param({ k: k, cid: cid });
                return false;
            }
        };
        $(function() {
            $("#Search").click(function() {
                return newsList.search();
            });
            $("#txtKeyWord").blur(function() {
                if ($.trim($(this).val()) == "")
                    $(this).val("请输入关键字");
            });
            $("#txtKeyWord").focus(function() {
                if ($.trim($(this).val()) == "请输入关键字")
                    $(this).val("");
            });
            $("#txtKeyWord").bind("keypress", function(e) {
                if (e.keyCode == 13) {
                    $("#Search").click();
                    return false;
                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GuidebookPlaceHolder" runat="server">
</asp:Content>
