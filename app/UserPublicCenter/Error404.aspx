﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="UserPublicCenter.Error404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>404错误页面</title>
<%Response.Status = "404 not found"; %>
<style type="text/css">
body{ margin:150px auto; vertical-align:middle; background:#dbdbdb;}
.font16Red{ color:#840101; font-size:16px;}
.bottom a{ display:block; font-size:14px; color:#000000; font-weight:bold; text-decoration:none; text-align:center; background:url(images/404images/btn.gif) no-repeat center center; width:96px; height:32px; line-height:32px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="503" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="images/404images/top.gif" width="503" height="116" /></td>
          </tr>

          <tr>
            <td style="background:url(images/404images/centerbg.gif) repeat-y center center;"><table width="503" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" rowspan="2" align="center" valign="top"><img src="images/404images/biaoqing.gif" width="130" height="96" /></td>
                <td height="40" colspan="2" align="left"><img src="images/404images/wenzi.gif" /></td>
                </tr>
              <tr>
                <td height="79" colspan="2" align="center" valign="top"><a href="http://www.tongye114.com/" class="font16Red">您可以点此查看更多内容</a></td>

              </tr>
              <tr class="bottom">
                <td width="26" height="40" align="center">&nbsp;</td>
                <td width="143" align="right"><a href="http://www.tongye114.com/">返回首页</a></td>
                <td width="134" align="center"><a href="http://www.tongye114.com/sitemap/">网站地图</a></td>
                <td width="200" align="left"><a href="http://www.tongye114.com/CustomerCenter/">联系我们</a></td>
              </tr>

            </table></td>
          </tr>
          <tr>
            <td><img src="images/404images/bottom.gif" width="503" height="25" /></td>
          </tr>
        </table>
    </div>
    </form>
</body>
</html>