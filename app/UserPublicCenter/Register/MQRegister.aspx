<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyUserRegister.aspx.cs" Inherits="UserPublicCenter.Register.CompanyUserRegister" EnableEventValidation="false" EnableViewState=true %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register src="../WebControl/ProvinceAndCityList.ascx" tagname="ProvinceAndCityList" tagprefix="uc3" %>
<%--<%@ Register Src="../WebControl/RegisterHead.ascx" TagName="RegisterHead" TagPrefix="uc2" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

     <link href="http://im.tongye114.com/css/yangshi.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
	.xinhao{ color:#FF0000;}
	.jutixx{background-image:url("../images/shurukuangbg.gif");background-position:right top;background-repeat:no-repeat;border:1px solid #A7A6AA;color:#000000;font-size:14px;font-weight:bold;height:12px;padding-top:5px;}
	.jutixx02{border:1px solid #A7A6AA;color:#000000;font-size:14px;font-weight:bold;height:12px;padding-top:5px;}
	.home{ font-size:12px; color:#FF6600; border:1px #FF6600 solid; background:#FFF2C0; display:block; width:85px;}
	.T{ font-size:14px; color:#FF3300; font-weight:bold; display:block; height:25px; text-indent:64px; line-height:25px; background:url(images/jionicon/xiadian.gif) no-repeat 50px top;}
	.radiosty { width:23px; height:23px;}
	.f14 { font-size:14px; font-weight:bold;}
    .style1
    {
        width: 13%;
    }
    .ff0000{ color:Red;}
#Layer1 {
	height:115px;
	position:absolute;
	right:10px;
	top:10px;
	width:480px;
	z-index:1;
	}
    </style>
</head>
<body>

    <form id="aspnetForm"  runat="server">
    
            <table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">            <tr>    <td width="473"><img src="http://im.tongye114.com/images/main_01.jpg" /></td>    <td width="530" align="right" background="http://im.tongye114.com/images/main_02.jpg" class="top"><a href="http://www.tongye114.com/" target="_blank" class="hei">同业114首页</a> | <a href="http://www.tongye114.com/CustomerCenter/" target="_blank" class="hei">客户服务</a> | <a  href='#' class="hei" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://im.tongye114.com/');">设为首页</a> | <a href="#" onclick="javascript:window.external.AddFavorite('http://im.tongye114.com','MQ官方网站')" title="收藏本站到你的收藏夹" class="hei">加入收藏</a></td>  </tr>        </table>        <table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">            <tr>    <td height="37" align="right" background="http://im.tongye114.com/images/main_04.gif"><table width="950" border="0" cellspacing="0" cellpadding="0" class="nav">      <tr>        <td width="132" height="37" align="center" class="nav-on"><a href="http://im.tongye114.com/" target="_blank">同业MQ首页</a></td>        <td width="132" height="37" align="center"><a href="http://im.tongye114.com/about.html" target="_blank">同业MQ介绍</a></td>        <td width="132" height="37" align="center"><a href="http://im.tongye114.com/xianlu.html" target="_blank">同业MQ线路</a></td>        <td width="132" height="37" align="center"><a href="http://im.tongye114.com/jipiao.html" target="_blank">同业MQ机票</a></td>        <td width="132" height="37" align="center"><a href="http://im.tongye114.com/jiudian.html" target="_blank">同业MQ酒店</a></td>        <td width="106" height="37" align="center"><a href="http://im.tongye114.com/app.html" target="_blank">帮助中心</a></td>        <td width="184">&nbsp;</td>      </tr>    </table></td>  </tr>        </table>        <table width="968" border="0" align="center" cellpadding="0" cellspacing="0" style="background:url(http://im.tongye114.com/images/41.gif) no-repeat 0 0; height:102px; margin-top:5px;">            <tr>    <td width="157" height="36">&nbsp;</td>    <td width="342"><table width="227" border="0" align="center" cellpadding="0" cellspacing="0">      <tr>        <td width="112" height="30" align="center">&nbsp;</td>        <td width="115" align="center"><span style="font-size:20px; color:#da0504; font-weight:bold; font-family:Arial;"><%= Request.QueryString["id"] %></span></td>      </tr>    </table></td>    <td width="469">&nbsp;</td>  </tr>        <tr>    <td>&nbsp;</td>    <td colspan="2" style="line-height:20px; color:#FFFFFF; font-size:14px; font-weight:bold;">我们是中国旅游同行研究中心，我们邀请您加入中国最大旅游交易平台<br />      平台以旅游交流交易为主，共同打造行业核心平台！<br />    平台核心软件同业MQ是国内唯一的旅游行业即时通讯工具，被同行亲切的誉为“旅游版的QQ”</td>  </tr></table>
    
    <div style=" margin:0 auto; width:970px;">
        <%--<uc2:RegisterHead ID="RegisterHead2" runat="server" />--%>

        <script type="text/javascript">
            function mouseovertr(o) {
                o.style.backgroundColor = "#FFF6C7";
            }
            function mouseouttr(o) {
                o.style.backgroundColor = ""
            }
        </script>

<%--        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center">
                    <img id="RegisterHeadimg" src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/join-1.gif"
                        width="956" height="30" />
                </td>
            </tr>
        </table>--%>
        <div style="border:2px #AFDFF6 solid;  width:968px; margin:5px auto 0 auto; position:relative;" id="divMain">
            <div id="divFristRegister">
            <table width="940" border="0" cellspacing="0" cellpadding="5"  class="maintop15" >
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="43px" style="height: 47px; width: 19%;">
                        <span class="ff0000">*</span>用户名：
                    </td>
                    <td align="left" style="height: 47px">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr height="35px">
                                <td width="11%">
                                    <input id="txtUserName" tabindex="1" name="txtUserName" type="text" min="5" max=""  class="bitian"
                                        size="20" value="<%= Request.QueryString["id"] %>"  onblur="Register.ckUserName(this,'2');"/>
                                </td>
                                <td width="89%">
                                    <div class="tist" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" /> <span id="errMsg_isExistSecondUserName" style="display: none" class="errmsg">该用户名已经存在,请输入其它用户名</span>
                                        5-20个字符(包括小写字母、数字、下划线)，不能为中文。一旦注册成功会员名不能修改，并且 <a href="http://im.tongye114.com" target="_blank">同业MQ</a> 亦可同步使用</div>
                                   
                              
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td height="32px" align="right" style="width: 19%">
                        <span class="ff0000">*</span>登录密码：
                    </td>
                    <td align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                    <input id="txtFristPassWord" tabindex="2" name="txtFristPassWord"                                         class="bitian" size="20" value="<%= Request.QueryString["id"] %>" />
                                </td>
                                <td width="89%">
                                    <div class="tist" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />
                                        密码由6-16位英文字母、数字、符号组成或组合而成。</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td height="32px" align="right" style="width: 19%">
                        <span class="ff0000">*</span>确认密码：
                    </td>
                    <td align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                    <input id="txtSecondPassWord" tabindex="3" name="txtSecondPassWord" value="<%= Request.QueryString["id"] %>"
                                        class="bitian" size="20" />
                                </td>
                                <td width="89%">
                                    <div class="tist" id="divSecondPassErr" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />
                                        请再输入一遍您上面输入的密码。</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="32px" style="width: 19%">
                       <span class="ff0000">*</span>真实姓名：
                    </td>
                    <td align="left">
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                  <input id="txtContactName" name="txtContactName" tabindex="6" type="text" class="bitian" size="20"/>
                                </td>
                                <td width="89%">
                                    <div class="tist" id="divTrueContactName" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />请输入您真实姓名！</div>
                                </td>
                            </tr>
                        </table>                            
                    </td>
                    
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="32px;" style="width: 19%">
                        <span class="ff0000">*</span>手机：
                    </td>
                    <td align="left">
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                  <input id="txtContactMobile" name="txtContactMobile" tabindex="9" type="text" class="bitian" size="20"/>
                                </td>
                                <td width="89%">
                                    <div class="tist" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />
                                        请输入真实的手机号码，获得同业114审核激活账号。</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
		<tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="32px" style="width: 19%">
                       <span class="ff0000">*</span>QQ：
                    </td>
                    <td align="left">
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                  <input id="qq" name="qq" tabindex="13" type="text" class="bitian" size="20" value='<%=Request.QueryString["Id"]%>'/>
                                </td>
                                <td width="89%">
                                    <div class="tist" id="div1" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />请输入您的QQ号码,多个QQ号用逗号隔开！</div>


                                </td>
                            </tr>
                        </table>                            
                    </td>
                    
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" style="width: 19%" height="32px">
                        <span class="ff0000">*</span>E-mail：
                    </td>
                    <td align="left">
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="11%">
                                  <input id="txtContactEmail" name="txtContactEmail"  tabindex="12" type="text" class="bitian" size="20"/>
                                </td>
                                <td width="89%">
                                    <div class="tist" id="div2" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif" width="16" height="16" /> <span id="errMsg_txtContactEmail" class="errmsg"></span><span id="errMsg_ExitEmail"
                            class="errmsg" style="display: none">该Email已经注册,请重新输入!</span>
                             请填写常用邮箱名，此项可以帮助您找回密码，获得同业114高效订单提醒！
                                  </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>       
        </div>
            <div id="divSecondRegister">
            <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15" >
                <tr  onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trCategory">
                  <td height="30" align="right" style="width: 168px"><span class="ff0000">*</span> 请选择类别：</td>
                    <td align="left"><%--onclick="javasript:location.href='join-buyers.html'" --%>
	                  <input  name="rdoCategory" type="radio" id="rdoCgs" value="1" class="radiosty" /><label for="rdoCgs" class="f14">采购商</label>
                          <input name="rdoCategory" type="radio" id="rdoGys" value="2" class="radiosty"/><label for="rdoGys" class="f14">供应商</label>
                        <input type="radio" name="rdoCategory" id="rdoSbgg" value="3" class="radiosty"/ style=" display:none"><label for="rdoSbgg" class="f14" id="lblsbgg" style=" display:none">随便逛逛</label>            <span id="spSelCategory" style="color:Red;"></span>
                    </td><%--onclick="javasript:location.href='join-visitors.html'" --%>                   
                    <td  align="left">
                        <div id="divcatetext" class="tist" style="display: none">
                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                width="16" height="16" />
                            <span id="spCateText"></span></div>
                    </td>                      
                </tr> 
            </table>
            <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15" id="tbyouke" style=" display:none">      
                <tr id="trCgsType" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" style=" display:none">
                    <td height="25" align="right" style="width: 19%"><span class="ff0000">*</span> 采购商类型：</td>
                    <td align="left">
                        <input name="rdoCgsType" value="2" checked="checked" type="radio"/>旅行社
                        <input name="rdoCgsType" value="10" type="radio"/>其他</td>
                </tr>
                <tr valign="middle" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trGysCategory" style=" display:none">
                    <td height="30" colspan="4" align="right">
                        <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" 
                            style="margin-bottom:15px; margin-top:10px;border-top:2px solid #B7D2DF; background:#EFF5F8; border-bottom:1px solid #B7D2DF">
                            <tr>
                              <td width="13%" align="right" style=" border-top:2px solid #B7D2DF; background:#EFF5F8; border-bottom:1px solid #B7D2DF"><span class="ff0000">*</span> 供应商类别：</td>
                              <td width="1%" style=" border-top:2px solid #B7D2DF; background:#EFF5F8; border-bottom:1px solid #B7D2DF">&nbsp;
                              </td>
                                  <td width="90%" align="left" style=" border-top:2px solid #B7D2DF; background:#EFF5F8; padding-bottom:8px; padding-top:3px; border-bottom:1px solid #B7D2DF">
                                    <table width="340" border="0" cellspacing="0" cellpadding="5">
                                        <tr>
                                          <td width="20%" align="left" valign="bottom">
                                            <%--<span class="home"><img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/gk.gif" width="25" height="15" /><strong>线路</strong><img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/lineico.gif" width="16" height="16" /></span>--%>
                                            <input type="radio" id="CompanyType1" name="radManageArea" value="0"/><label style="cursor: pointer" for="CompanyType1">线路</label>
                                            <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/icoline.gif" width="16" height="16" alt="线路"/>
                                          </td>
                                          <td width="20%" align="left" valign="bottom">
                                            <input type="radio" id="CompanyType10" name="radManageArea" value="9" /><label style="cursor: pointer" for="CompanyType10">机票</label>
                                            <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jipiao.gif" width="16" height="16" alt="机票"/></td>
                                          <td width="20%" align="left" valign="bottom">
                                             <input type="radio" id="CompanyType6" name="radManageArea" value="5" /><label style="cursor: pointer" for="CompanyType6">酒 店</label>
                                            <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jiudian.gif" width="17" height="15" alt="酒店" /></td>
                                      </tr>
                                        <tr>
                                          <td align="left" valign="bottom">
                                                <input type="radio" id="CompanyType5" name="radManageArea" value="4" /><label style="cursor: pointer" for="CompanyType5">景 区</label>
                                                <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jingqu.gif" width="16" height="14" alt="景区" /></td>
                                          <td align="left" valign="bottom">
                                                <input type="radio" id="CompanyType7" name="radManageArea" value="6" /><label style="cursor: pointer" for="CompanyType7">车队</label>
                                          <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/chedui.gif" width="20" height="14"  alt="车队" /></td>
                                          <td align="left" valign="bottom">
                                             <input type="radio" id="CompanyType8" name="radManageArea" value="7" /><label style="cursor: pointer" for="CompanyType8">旅游用品</label>
                                            <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/nvyouyp.gif" width="14" height="14"  alt="旅游用品"/></td>
                                      </tr>
                                  </table>
                                  <span id="errMsg_radManageArea" class="errmsg"></span>
                              </td>
                          </tr>
                      </table>  
              <tr valign="middle" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trXlgysCategory" style=" display:none">
                          <td height="30" align="right"><span class="ff0000">*</span> 线路供应商类别：</td>
                          <td align="left" colspan="2" height="30">

                              <input type="checkbox" name="chxLine" value="1" id="ckline1" onclick="Register.CheckLineCheckBox()";/><label for="ckline1">我是做专线的</label> 
                              <input type="checkbox" name="chxLine"  id="ckline2" value="3" onclick="Register.CheckLineCheckBox()";/><label for="ckline2"> 我是做地接的</label> &nbsp;&nbsp;&nbsp;&nbsp;
                              <span id="errMsg_chxLine" class="errmsg"></span></td>
              </tr> 
                      <input id="hdfZXandDj" name="hdfZXandDj" type="hidden"/>
                    </td>
                </tr>
                 <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td  align="right" height="25px" style="font-size:14px; width: 19%;">
                        <span class="ff0000">*</span>公司名称：
                    </td>
                    <td align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <input id="txtCompanyName" tabindex="15" name="txtCompanyName" type="text" class="bitian"
                                        size="50" />
                                </td>
                                <td>
                                    <div class="tist" style="display: none">
                                        <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                            width="16" height="16" />
                                        请输入您所在单位的全称，如：某某某旅行社。
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="25px" style="width: 19%">
                       许可证号：
                    </td>
                    <td align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="20%">
                                    <input id="txtLicenseNumber" name="txtLicenseNumber" type="text" tabindex="18" class="bitian1"
                                        size="20" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>       
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="25px" style="width: 19%">
                        <span class="ff0000">*</span>所在地：
                    </td>
                    <td align="left">
                     <uc3:provinceandcitylist ID="ProvinceAndCityList1" runat="server" />
                      <%--  <asp:DropDownList ID="ctl00_Main_ProvinceAndCityList1_ddl_ProvinceList" runat="server">
                            <asp:ListItem Value="0">省份</asp:ListItem>
                            <asp:ListItem Value="1">1111</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ctl00_Main_ProvinceAndCityList1_ddl_CityList" runat="server">
                            <asp:ListItem Value="0">城市</asp:ListItem>
                            <asp:ListItem Value="2">2222</asp:ListItem>
                        </asp:DropDownList>--%>
                        <span id="errMsg_Province" style="display: none" class="errmsg">请选择省份</span> <span
                            id="errMsg_City" style="display: none" class="errmsg">请选择城市</span>
                    </td>
                </tr>
                <tr id="trSellCity" style="display: none" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="25px" style="width: 19%">
                        <span class="ff0000">*</span>销售城市：
                    </td>
                    <td align="left" id="tdSellCity">
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="25px" style="width: 19%">
                        <span class="ff0000">*</span>办公地点：
                    </td>
                    <td align="left">
                        <input id="txtOfficeAddress" name="txtOfficeAddress" type="text" class="bitian1"
                            size="50" valid="required" errmsg="请输入办公地点"  tabindex="21" />
                        <span id="errMsg_txtOfficeAddress" class="errmsg"></span>
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height=25px" style="width: 19%" >
                        <span class="ff0000">*</span>电话：
                    </td>
                    <td align="left">
                        <input id="txtContactTel" name="txtContactTel" type="text" class="bitian1" size="20"
                            valid="required|isPhone" errmsg="请输入电话号码|请输入正确的电话号码" tabindex="24" />
                        <span id="errMsg_txtContactTel" class="errmsg"></span>
                       
                    </td>
                </tr>
<%--                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right">
                        <span class="ff0000">*</span><strong>手机：</strong>
                    </td>
                    <td align="left">
                        <input id="txtContactMobile" name="txtContactMobile" type="text" class="bitian1"
                            size="20" valid="required|isMobile" errmsg="请输入手机号码|请输入正确的手机号码" />
                        <span id="errMsg_txtContactMobile" class="errmsg"></span>
                    </td>
                </tr>--%>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td align="right" height="25px" style="width: 19%">
                       传真：
                    </td>
                    <td align="left">
                        <input id="txtContactFax" name="txtContactFax" type="text" class="bitian1" size="20"  tabindex="25"/>
                    </td>
                </tr>
                <tr id="trSellCityAndArea" style="display: none">
                    <td align="right" height="35px" style="width: 19%">
                        <strong>请选择您经营的线路区域</strong>
                    </td>
                    <td align="left" id="tdAllSellCityAndArea">
                    </td>
                </tr>
                <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trTicket" style=" display:none">
                    <td colspan="2" >
                         <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" 
                             style="margin-bottom:15px; margin-top:10px; margin-left: 10px;">
                          <tr>
                            <td align="right" style="background:#F3F7F9;" class="style1"><span class="xinhao">*</span>机票供应商填写项：</td>
                            <td style="background:#F3F7F9; ">&nbsp;</td>
                            <td width="85%" align="left" style="background:#F3F7F9; padding-bottom:8px; padding-top:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                              <tr>
                                <td width="21%" align="right">OFFICE号：</td>
                                <td width="79%" align="left"><input tabindex="28" name="txtOffice" id="txtOffice" type="text" class="bitian1" size="20" /></td>
                              </tr>
                              <tr>
                                <td align="right"><span style="background:#F3F7F9;"><span class="errmsg">*</span></span>代理级别：</td>
                                <td align="left"><input name="txtDlNumber" type="text" class="bitian1" size="20" id="txtDlNumber" />
                                    <span id="errMsg_txtDlNumber" class="errmsg"></span>        
                                </td>
                              </tr>
                              <tr>
                                <td align="right">供应上下班时间： </td>
                                <td align="left"><input name="txtWorkStartTime" tabindex="31" id="txtWorkStartTime" type="text" class="bitian1" size="9" />-<input  tabindex="34" name="txtWorkEndTime" id="txtWorkEndTime" type="text" class="bitian1" size="9" /></td>
                              </tr>
                              <tr>
                                <td align="right">QQ：</td>
                                <td align="left">  <input tabindex="37" id="txtContactQQ" name="txtContactQQ" type="text" class="bitian1" size="20" />
                                  MSN：<input tabindex="40" id="txtContactMSN" name="txtContactMSN" type="text" class="bitian1" size="20" /></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table>
                    </td>
                </tr>               
            </table>
            <table width="940" border="0" cellspacing="0" cellpadding="5"  class="maintop15">
              <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                    <td  align="right" style="font-size:14px; width: 160px;"  height="30px">
                        <span class="ff0000">*</span>验证码：
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtValidateCode" runat="server" CssClass="bitian" TabIndex="43" size="6"
                            MaxLength="4"></asp:TextBox>
                        <a title="刷新验证码" href="#" onclick="javascript:document.getElementById('<%=imgValidateCode.ClientID %>').src='/ValidateCode.aspx?ValidateCodeName=CompanyRegisterCode&id='+Math.random();$('#spanCodeisNull').hide();return false;">
                            <asp:Image ID="imgValidateCode" runat="server" />看不清，换一张</a>

                        <script language="javascript">
                            document.getElementById('<%= imgValidateCode.ClientID %>').src = '/ValidateCode.aspx?id=' + Math.random() + "&ValidateCodeName=CompanyRegisterCode";
                        </script>

                        <span id="spanCodeisNull" style="display: none" class="errmsg">请输入验证码</span> <span
                            id="spanCodeErr" style="display: none" class="errmsg">请输入正确的验证码</span>
                    </td>
              </tr>
                
<%--                <tr>
                    <td height="40" align="right" style="width: 160px">
                    </td>
                    <td align="left">
                        <input type="button" id="btnSecondRegister" value="同意以下服务条款，并提交注册" style="background: url(http://im.tongye114.com/images/40.gif);
                            width: 270px; height: 37px; border: none; font-size: 14px; font-weight: bold;
                            color: #ffffff; cursor: pointer" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          <%--  <a href="javascript:void(0);" onclick=" $('#RegisterHeadimg').attr('src', '<%=ImageServerPath %>/images/UserPublicCenter/join-1.gif'); $('#divFristRegister').show(); $('#divSecondRegister').hide(); return false;" style="text-decoration:underline">&lt;&lt;返回上一步</a>
                    </td>
                </tr>
                --%>
                  <tr>                    <td height="30" align="center">&nbsp;</td>                    <td height="50" colspan="2" align="left"><img style=" cursor:pointer" id="btnSecondRegister" src="http://im.tongye114.com/images/zccc.gif" width="143" height="35" /></td>                  </tr>
            </table>
          <table width="850px" border="0" align="center" cellpadding="0" cellspacing="0" style=" display:none">
                <tr>
                    <td align="left">
                        <input id="F_ckPact" name="checkbox" type="checkbox" value="checkbox" onclick="Register.ChangeckPoct();"
                            checked="true" />
                        <label for="F_ckPact" style="cursor: pointer">
                            阅读并同意以下条款</label><span class="errmsg" style="display: none" id="span_PactErr">同意以下条款才能完成注册</span>
                        <br />
                        <textarea readonly="readonly"  cols="130" rows="10">一、本服务协议双方为杭州易诺科技有限公司（下称“易诺科技”）与旅游同业交易平台(www.tongye114.com)用户，本服务协议具有合同效力。

    本服务协议内容包括协议正文及所有易诺科技已经发布的或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。 
    在本服务协议中没有以“规则”字样表示的链接文字所指示的文件不属于本服务协议的组成部分，而是其它内容的协议或有关参考数据，与本协议没有法律上的直接关系。 
    用户在使用易诺科技提供的各项服务的同时，承诺接受并遵守各项相关规则的规定。易诺科技有权根据需要不时地制定、修改本协议或各类规则，如本协议有任何变更，易诺科技将在网站上刊载公告，通知予用户。如用户不同意相关变更，必须停止使用“服务”。经修订的协议一经在旅游同业交易平台公布后，立即自动生效。各类规则会在发布后生效，亦成为本协议的一部分。登录或继续使用“服务”将表示用户接受经修订的协议。除另行明确声明外，任何使“服务”范围扩大或功能增强的新内容均受本协议约束。 
用户确认本服务协议后，本服务协议即在用户和易诺科技之间产生法律效力。请用户务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向易诺科技咨询。 
1)无论用户事实上是否在注册之前认真阅读了本服务协议，只要用户点击协议正本下方的“同意以上服务协议，并提交注册”按钮并按照易诺科技注册程序成功注册为用户，用户的行为仍然表示其同意并签署了本服务协议。 
2)本协议不涉及用户与易诺科技其它用户之间因网上交易而产生的法律关系及法律纠纷。 

二、 定义

旅游同业交易平台：有关旅游同业交易平台上的术语或图示的含义，详见旅游同业交易平台及关于旅游同业交易平台帮助。 
    用户及用户注册：用户必须是是具有合法经营资格的实体组织，或者具备完全民事行为能力的自然人。无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为易诺科技用户或超过其民事权利或行为能力范围从事交易的，其与易诺科技之间的服务协议自始无效，易诺科技一经发现，有权立即注销该用户，并追究其使用旅游同业交易平台“服务”的一切法律责任。用户注册是指用户登陆旅游同业交易平台，并按要求填写相关信息并确认同意履行相关用户协议的过程。用户因进行交易、获取有偿服务或接触旅游同业交易平台服务器而发生的所有应纳税赋，以及一切硬件、软件、服务及其它方面的费用均由用户负责支付。旅游同业交易平台仅作为交易地点。旅游同业交易平台仅作为用户物色交易对象，货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。易诺科技不能控制交易所涉及的商品、服务的质量、安全或合法性，商贸信息的真实性或准确性，以及交易方履行其在贸易协议项下的各项义务的能力。易诺科技并不作为买家或是卖家的身份参与买卖行为的本身。易诺科技提醒用户应该通过自己的谨慎判断确定登录商品、服务及相关信息的真实性、合法性和有效性。  
　


三、 用户权利和义务：

用户有权利拥有自己在旅游同业交易平台的用户名及密码，并有权利使用自己的用户名及密码随时登陆旅游同业交易平台。用户不得以任何形式擅自转让或授权他人使用自己的旅游同业交易平台用户名； 
    用户有权根据本服务协议的规定以及旅游同业交易平台上发布的相关规则利用旅游同业交易平台上交易平台查询商品及服务信息、发布交易信息、登录商品、参加网上商品竞买、与其它用户订立商品买卖合同、评价其它用户的信用、参加易诺科技的有关活动以及有权享受易诺科技提供的其它的有关信息服务； 
    用户在旅游同业交易平台上交易过程中如与其他用户因交易产生纠纷，可以请求易诺科技从中予以协调。用户如发现其他用户有违法或违反本服务协议的行为，可以向易诺科技进行反映要求处理。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求易诺科技提供相关资料； 
    用户有义务在注册时提供自己的真实资料，并保证诸如联系人、电子邮件地址、联系电话、联系地址、邮政编码等内容的有效性及安全性，保证易诺科技及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。用户保证不以他人资料在旅游同业交易平台进行注册或认证； 
    用户应当保证在使用旅游同业交易平台进行交易过程中遵守诚实信用的原则，不在交易过程中采取不正当竞争行为，不扰乱网上交易的正常秩序，不从事与网上交易无关的行为； 
    用户不应在旅游同业交易平台上恶意评价其他用户，或采取不正当手段提高自身的信用度或降低其他用户的信用度； 
    用户在旅游同业交易平台上不得发布各类违法或违规信息； 
    用户在旅游同业交易平台上不得买卖国家禁止销售的或限制销售的商品、不得买卖侵犯他人知识产权或其它合法权益的商品，也不得买卖违背社会公共利益或公共道德的、或是易诺科技认为不适合在旅游同业交易平台上销售的商品。 
    用户承诺自己在使用旅游同业交易平台时实施的所有行为均遵守国家法律、法规和易诺科技的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任； 
    用户同意，不对旅游同业交易平台上任何数据作商业性利用，包括但不限于在未经易诺科技事先书面批准的情况下，以复制、传播等方式使用在旅游同业交易平台站上展示的任何资料。

四、易诺科技的权利和义务：

易诺科技有义务在现有技术上维护整个网上交易平台的正常运行，并努力提升和改进技术，使用户网上交易活动得以顺利进行； 
    对用户在注册使用旅游同业交易平台上交易平台中所遇到的与交易或注册有关的问题及反映的情况，易诺科技应及时作出回复； 
    对于用户在旅游同业交易平台上的不当行为或其它任何易诺科技认为应当终止服务的情况，易诺科技有权随时作出删除相关信息、终止服务提供等处理，而无须征得用户的同意； 
    因网上交易平台的特殊性，易诺科技没有义务对所有用户的注册数据、所有的交易行为以及与交易有关的其它事项进行事先审查，但如存在下列情况： 
①用户或其它第三方通知易诺科技，认为某个具体用户或具体交易事项可能存在重大问题；
②用户或其它第三方向易诺科技告知交易平台上有违法或不当行为的，易诺科技以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为具有违法或不当性质的；
易诺科技有权根据不同情况选择保留或删除相关信息或继续、停止对该用户提供服务，并追究相关法律责任。
用户在旅游同业交易平台上交易过程中如与其它用户因交易产生纠纷，请求易诺科技从中予以调处，经易诺科技审核后，易诺科技有权通过电子邮件联系向纠纷双方了解情况，并将所了解的情况通过电子邮件互相通知对方； 
    用户因在旅游同业交易平台上交易与其它用户产生诉讼的，用户通过司法部门或行政部门依照法定程序要求易诺科技提供相关数据，易诺科技应积极配合并提供有关资料； 
    易诺科技有权对用户的注册数据及交易行为进行查阅，发现注册数据或交易行为中存在任何问题或怀疑，均有权向用户发出询问及要求改正的通知或者直接作出删除等处理； 
    经国家生效法律文书或行政处罚决定确认用户存在违法行为，或者易诺科技有足够事实依据可以认定用户存在违法或违反服务协议行为的，易诺科技有权在旅游同业交易平台及所在网站上以网络发布形式公布用户的违法行为； 
    对于用户在旅游同业交易平台发布的下列各类信息，易诺科技有权在不通知用户的前提下进行删除或采取其它限制性措施，包括但不限于以规避费用为目的的信息；以炒作信用为目的的信息；易诺科技有理由相信存在欺诈等恶意或虚假内容的信息；易诺科技有理由相信与网上交易无关或不是以交易为目的的信息；易诺科技有理由相信存在恶意竞价或其它试图扰乱正常交易秩序因素的信息；易诺科技有理由相信该信息违反公共利益或可能严重损害易诺科技和其它用户合法利益的； 
    许可使用权。 用户以此授予易诺科技独家的、全球通用的、永久的、免费的许可使用权利 (并有权对该权利进行再授权)，使易诺科技有权(全部或部份地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，和/或以现在已知或日后开发的任何形式、媒体或技术，将上述信息纳入其它作品内； 
    易诺科技会在用户的计算机上设定或取用易诺科技cookies。 易诺科技允许那些在旅游同业交易平台页上发布广告的公司到用户计算机上设定或取用 cookies 。 在用户登录时获取数据，易诺科技使用cookies可为用户提供个性化服务。 如果拒绝所有 cookies，用户将不能使用需要登录的易诺科技产品及服务内容。 
　　
五、服务的中断和终止：

用户同意，在易诺科技未向用户收取服务费的情况下，易诺科技可自行全权决定以任何理由 (包括但不限于易诺科技认为用户已违反本协议的字面意义和精神，或以不符合本协议的字面意义和精神的方式行事，或用户在超过90天的时间内未以用户的账号及密码登录网站等) 终止用户的“服务”密码、账户 (或其任何部份) 或用户对“服务”的使用，并删除（不再保存）用户在使用“服务”中提交的任何资料。同时易诺科技可自行全权决定，在发出通知或不发出通知的情况下，随时停止提供“服务”或其任何部份。账号终止后，易诺科技没有义务为用户保留原账号中或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户或第三方。此外，用户同意，易诺科技不就终止用户接入“服务”而对用户或任何第三者承担任何责任； 
    如用户向易诺科技提出注销旅游同业交易平台注册用户身份时，经易诺科技审核同意，由易诺科技注销该注册用户，用户即解除与易诺科技的服务协议关系。但注销该用户账号后，易诺科技仍保留下列权利： 
①用户注销后，易诺科技有权保留该用户的注册数据及以前的交易行为记录。
②用户注销后，如用户在注销前在旅游同业交易平台上存在违法行为或违反合同的行为，易诺科技仍可行使本服务协议所规定的权利；
在下列情况下，易诺科技可以通过注销用户的方式终止服务： 
①在用户违反本服务协议相关规定时，易诺科技有权终止向该用户提供服务。易诺科技将在中断服务时通知用户。但如该用户在被易诺科技终止提供服务后，再一次直接或间接或以他人名义注册为易诺科技用户的，易诺科技有权再次单方面终止向该用户提供服务；

②如易诺科技通过用户提供的信息与用户联系时，发现用户在注册时填写的电子邮箱已不存在或无法接收电子邮件的，经易诺科技以其它联系方式通知用户更改，而用户在三个工作日内仍未能提供新的电子邮箱地址的，易诺科技有权终止向该用户提供服务；

③一旦易诺科技发现用户注册数据中主要内容是虚假的，易诺科技有权随时终止向该用户提供服务；

④本服务协议终止或更新时，用户明示不愿接受新的服务协议的；

⑤其它易诺科技认为需终止服务的情况。

服务中断、终止之前用户交易行为的处理因用户违反法律法规或者违反服务协议规定而致使易诺科技中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理： 
①服务中断、终止之前，用户已经上传至旅游同业交易平台的商品尚未交易或尚未交易完成的，易诺科技有权在中断、终止服务的同时删除此项商品的相关信息；
②服务中断、终止之前，用户已经就其它用户出售的具体商品作出要约，但交易尚未结束，易诺科技有权在中断或终止服务的同时删除该用户的相关要约；
③服务中断、终止之前，用户已经与另一用户就具体交易达成一致，易诺科技可以不删除该项交易，但易诺科技有权在中断、终止服务的同时将用户被中断或终止服务的情况通知用户的交易对方。 

六、责任范围：

用户明确理解和同意，易诺科技不对因下述任一情况而导致的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害赔偿 (无论易诺科技是否已被告知该等损害赔偿的可能性)： 
    使用或未能使用“服务；第三方未经批准的接入或第三方更改用户的传输数据或数据；第三方对“服务”的声明或关于“服务”的行为；或非因易诺科技的原因而引起的与“服务”有关的任何其它事宜，包括疏忽。用户明确理解并同意，如因其违反有关法律或者本协议之规定，使易诺科技遭受任何损失，受到任何第三方的索赔，或任何行政管理部门的处罚，用户应对易诺科技提供补偿，包括合理的律师费用。 

七、隐私权政策：

适用范围： 
①在用户注册旅游同业交易平台账户时，用户根据易诺科技要求提供的个人注册信息；
②在用户使用易诺科技服务，参加易诺科技活动，或访问旅游同业交易平台页时，易诺科技自动接收并记录的用户浏览器上的服务器数值，包括但不限于IP地址等数据及用户要求取用的网页记录；
③易诺科技收集到的用户在易诺科技进行交易的有关数据，包括但不限于出价、购买、商品登录、信用评价及违规记录；
④易诺科技通过合法途径从商业伙伴处取得的用户个人数据。
信息使用： 
①易诺科技不会向任何人出售或出借用户的个人信息，除非事先得到用户得许可。
②易诺科技亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播用户的个人信息。任何用户如从事上述活动，一经发现，易诺科技有权立即终止与该用户的服务协议，查封其账号。 
③为服务用户的目的，易诺科技可能通过使用用户的个人信息，向用户提供服务，包括但不限于向用户发出产品和服务信息，或者与易诺科技合作伙伴共享信息以便他们向用户发送有关其产品和服务的信息（后者需要用户的事先同意）。

信息披露：
用户的个人信息将在下述情况下部分或全部被披露：
①经用户同意，向第三方披露； 
②如用户是合资格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；
③根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；
④如果用户出现违反中国有关法律或者网站政策的情况，需要向第三方披露；
⑤为提供你所要求的产品和服务，而必须和第三方分享用户的个人信息；
⑥其它易诺科技根据法律或者网站政策认为合适的披露；
⑦在旅游同业交易平台上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的， 易诺科技有全权可以决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。

信息安全： 
①易诺科技账户均有密码保护功能，请妥善保管用户的账户及密码信息； 
②在使用易诺科技服务进行网上交易时，用户不可避免的要向交易对方或潜在的交易对方提供自己的个人信息，如联络方式或者邮政地址。请用户妥善保护自己的个人信息，仅在必要的情形下向他人提供；
③如果用户发现自己的个人信息泄密，尤其是易诺科技账户及密码发生泄露，请用户立即联络易诺科技客服，以便易诺科技采取相应措施。

Cookie的使用： 
①通过易诺科技所设Cookie所取得的有关信息，将适用本政策；
②在易诺科技上发布广告的公司通过广告在用户计算机上设定的Cookies，将按其自己的隐私权政策使用。
政策修改：易诺科技保留对本政策作出不时修改的权利。 

管辖：
本服务条款之解释与适用，以及与本服务条款有关的争议，均应依照中华人民共和国法律予以处理，并以浙江省杭州市西湖区人民法院为第一审管辖法院。

</textarea>
                    </td>
                </tr>
                <tr>
                    <td height="30" align="left">
                    </td>
                </tr>
            </table>
        </div>
        <div id="Layer1"><A href="http://im.tongye114.com/IM/DownLoad/download.aspx"><img src="http://im.tongye114.com/images/downloadqunnei.gif" width="480" height="96" border=0 /><a></div>
         </div>
    </div>
    
    <table width="1003" border="0" align="center" cellpadding="0" cellspacing="0" class="bottom">  <tr>    <td align="center" class="bottom"><font color="#0065B3"><a href="http://www.tongye114.com/AboutUs/" target="_blank">关于我们</a> | <a href="http://corp.tongye114.com/">最新动态</a> | <a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://im.tongye114.com/');">设为首页</a> | <a href="IM/DownLoad/download.aspx">同业MQ下载</a></font><br />    Copyright ? 2008 版权所有 杭州易诺科技有限公司 <script language="JavaScript" src="http://s126.cnzz.com/stat.php?id=1125215&amp;web_id=1125215&amp;show=pic" charset="gb2312" type="text/javascript"></script>&nbsp;<img height="0" alt="" width="0" border="0" src="http://zs7.cnzz.com/stat.htm?id=1125215&amp;r=http%3A//www.tongye114.com/Register/CompanyUserRegister.aspx&amp;lg=zh-cn&amp;ntime=0.67142400 1283503185&amp;repeatip=576&amp;rtime=4&amp;cnzz_eid=84357694-1283137261-&amp;showp=1024x768&amp;st=48&amp;sin=http%3A//www.tongye114.com/Register/CompanyUserRegister.aspx&amp;res=0" /><br />    <img src="http://im.tongye114.com/images/360logo.gif" width="120" height="67" /></td>  </tr></table>
   
        <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>
        <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>
        <script type="text/javascript" src="<%=JsManage.GetJsFilePath("blogin") %>"></script>
    
        <script type="text/javascript">
        var CategoryText1 = "采购商用户可按同行结算价在线预订线路、机票、酒店、景点门票等产品。";
        var CategoryText2 = "供应商用户可在平台销售、购买产品，为确保您能顺利通过审核，请严格按要求填写。";
        var CategoryText3 = "此类用户只能逛平台的社区，不能查看同行结算价，同业MQ不能加好友。";

        var Register = {
            ckUserName: function(obj, Number) { //验证用户名是否存在
                var UserName = $.trim($(obj).val());
                if (UserName != "") {
                    var isExist = true;
                    $.ajax({
                        type: "GET",
                        async: false,
                        dataType: 'html',
                        url: "/Register/ExistUserName.ashx?UserName=" + UserName,
                        cache: false,
                        success: function(html) {
                            if (html == "True") {
                                if (Number == "1") {
                                    $("#span_txtUserName").show();
                                    $("#errMsg_isExistSecondUserName").hide();
                                } else {
                                    $("#errMsg_isExistSecondUserName").show();
                                }
                                isExist = false;
                            }
                        }
                    });
                    return isExist;
                }
            },
            ckisExistEmail: function(obj) {
                var Email = $.trim($(obj).val());
                if (Email != "") {
                    var isExist = true;
                    $.ajax({
                        type: "GET",
                        async: false,
                        dataType: 'html',
                        url: "/Register/ExistUserName.ashx?isEmail=1&Email=" + Email,
                        cache: false,
                        success: function(html) {
                            if (html == "True") {
                                $("#errMsg_ExitEmail").show();
                                isExist = false;
                            }
                        }
                    });
                    return isExist;
                }
            },
            ckInputisNull: function($obj, isOnclick, isSubmit) { //注册第一步（填写会员信息）时的验证
                var objValue = $.trim($obj.val());
                var isPassck = true;
                $obj.parent("td").next().find("div").hide();
                var objId = $obj.attr("id");
                if (objValue !== "") {
                    isPassck = this.validInputIsNull(objValue, objId, $obj, isOnclick);
                } else {
                    if (isSubmit) {
                        //                       Register.ckisExistEmail($obj);
                        //                       Register.ckUserName($obj);
                        isPassck = this.validInputIsNull(objValue, objId, $obj, isOnclick);
                    }
                }
                return isPassck;
            },
            validInputIsNull: function(objValue, objId, $obj, isOnclick) {
                var isPassck = true;
                if (objId == "txtUserName") {
                    if (Register.IsModifUserNameEmail(objId)) {
                        //用户名长度5-20
                        if (!Register.ckUserName($obj)) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        } else {
                            $("#errMsg_isExistSecondUserName").hide();
                        }
                        if (objValue.length < 5 || objValue.length > 20) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                        //用户名不能为中文
                        if (/.*[\u4e00-\u9fa5]+.*$/.test(objValue)) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                        if (isPassck) {
                            if ($("#span_txtUserName").css("display") == "none") {
                                if (!isOnclick) {
                                    var isExistUser = Register.ckUserName($obj, "1");
                                    if (!isExistUser) {
                                        isPassck = false;
                                    }
                                }
                            }
                        }
                    }
                } else if (objId == "txtFristPassWord") { //密码
                    var regexp = /^[a-zA-Z\W_\d]{6,16}$/; //6-16位英文字母、数字、符号或组合

                    if (!regexp.test(objValue)) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                    if (objValue == $.trim($("#txtSecondPassWord").val())) {
                        $("#divSecondPassErr").hide();
                    }
                }
                else if (objId == "txtSecondPassWord") {
                    //确认密码
                    if (objValue != $("#txtFristPassWord").val()) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                } else if (objId == "txtContactMobile") {  //手机号码
                    var regis = /^(13|15|18|14)\d{9}$/;
                    if (objValue == "" || !regis.test(objValue)) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                } else if (objId == "txtContactEmail") {  //Email
                    if (Register.IsModifUserNameEmail(objId)) {
                        var regis = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
                        if (!Register.ckisExistEmail($obj)) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                        if (objValue == "" || !regis.test(objValue || !Register.ckisExistEmail($obj))) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                    }
                } else if (objId == "txtCompanyName") { //公司名称
                    if (!$("#divSecondRegister").find("input[type='radio'][name='rdoCategory'][value='3']").attr("checked")) {
                        if (objValue == "") {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                    }
                } else if (objId == "txtContactName") {
                    if (objValue == "") {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }else if (objId=="qq"){
                      if (objValue == "") {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        } 
                }
                else {
                    if (isOnclick) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }
                return isPassck;
            },
            ckValidateCode: function() { //验证码
                var $CodeObj = $("#<%=txtValidateCode.ClientID %>");
                var CodeisTrue = true;
                if ($.trim($CodeObj.val()) == "") {
                    $("#spanCodeisNull").show();
                    CodeisTrue = false;
                } else {
                    var validResult = false;
                    var arrStrCookie = document.cookie;
                    for (var i = 0; i < arrStrCookie.split(";").length; i++) {
                        var temName = arrStrCookie.split(";")[i].split("=")[0];
                        var temCode = arrStrCookie.split(";")[i].split("=")[1];
                        if ($.trim(temName) == "CompanyRegisterCode") {
                            if (temCode == $.trim($CodeObj.val())) {
                                validResult = true;
                            }
                        }
                    }
                    if (!validResult) {
                        $("#spanCodeErr").show();
                        CodeisTrue = false;
                    }
                }
                return CodeisTrue;
            },
            ChangeckPoct: function() { //是否同意服务条款
                if (!$("#F_ckPact").attr("checked")) {
                    $("#span_PactErr").show();
                } else {
                    $("#span_PactErr").hide();
                }
            },
            GetSellCity: function() { //选择批发商且城市的时候 调用销售城市及线路区域
                var Isfinally = false;           //是否为选择专线,组团，地接

                var ProvinceId = $("#ProvinceAndCityList1_ddl_ProvinceList").val();
                var CityId = $("#ProvinceAndCityList1_ddl_CityList").val();
                var IsGys = $("#divSecondRegister").find("input[type='radio'][name='rdoCategory'][value='2']").attr("checked"); //选择类型为供应商

                var IsLineGys = $("#divSecondRegister").find("input[type='radio'][name='radManageArea'][value='0']").attr("checked"); //判断是否为线路
                var IsLine = $("#divSecondRegister").find("input[type='checkbox'][name='chxLine'][value='1']").attr("checked"); // 是否选择我是做专线的
                if (IsGys && IsLineGys && IsLine)   //选择专线
                {
                    Isfinally = true;
                } else {
                    return;
                }
                if (ProvinceId != "0" && CityId != "0" && Isfinally) {
                    //销售城市
                    $("#trSellCity").show();
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        url: "/Register/MQRegister.aspx?type=GetSaleCity&ProvinceId=" + ProvinceId,
                        cache: false,
                        success: function(html) {
                            $("#tdSellCity").html(html);
                            $("#tdSellCity").find("input[type='checkbox'][name='ckSellCity']").click(function() {
                                var ckSellCity = new Array();
                                $("#tdSellCity").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                    ckSellCity.push($(this).val());
                                });
                                if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                    $("#errMsgckSellCity").show();
                                }
                                else {
                                    $("#errMsgckSellCity").hide();
                                }
                            });
                            $("#inputOtherSaleCity").focus(function() {
                                $("#errMsgckSellCity").hide();
                            });
                            $("#inputOtherSaleCity").blur(function() {
                                var ckSellCity = new Array();
                                $("#tdSellCity").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                    ckSellCity.push($(this).val());
                                });
                                if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                    $("#errMsgckSellCity").show();
                                }
                            });

                        }
                    });

                    //经营线路区域
                    $("#trSellCityAndArea").show();
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        url: "/Register/MQRegister.aspx?type=GetTourArea&ProvinceId=" + ProvinceId + "&CityId=" + CityId + "&CityName=" + escape($("#ProvinceAndCityList1_ddl_CityList option:selected").text()),
                        cache: false,
                        success: function(html) {
                            $("#tdAllSellCityAndArea").html(html);
                        }
                    });

                } else {
                    $("#trSellCity").hide();
                    $("#trSellCityAndArea").hide();
                }
            },
            SetRegisterState: function() {
                $("#btnSecondRegister").val("资料填写完成！提交并进入系统");
                $("#btnSecondRegister").removeAttr("disabled");
            },
            SetCategroyShow: function(typeval, isLoad) { //根据类别显示显示的子类型            
                $("#divMain").find("input[type='radio'][name='rdoCategory']").each(function() { //验证供应商类别
                    if (isLoad == false) {
                        if ($(this).val() == typeval) {
                            $(this).attr("checked", "checked")
                        }
                    }
                });
                $("#txtOfficeAddress").attr("valid", "required");
                $("#txtOfficeAddress").attr("errmsg", "请输入办公地点");
                $("#txtContactTel").attr("valid", "required|isPhone");
                $("#txtContactTel").attr("errmsg", "请输入电话号码|请输入正确的电话号码");
                $("#txtOfficeAddress").attr("valid", "required");
                $("#txtOfficeAddress").attr("errmsg", "请输入办公地点");
                $("#txtDlNumber").removeAttr("valid");
                $("#txtDlNumber").removeAttr("errmsg");
                $("#trSellCityAndArea").hide();
                $("#trSellCity").hide();
                $("#trGysCategory").hide();
                $("#trXlgysCategory").hide();
                $("#trTicket").hide();
                if (typeval == 1) { //采购商     
                    $("#tbyouke").show();
                    $("#trCgsType").show();
                } else if (typeval == 2) {  //供应商         
                    $("#trGysCategory").show();
                    $("#tbyouke").show();
                    $("#trCgsType").hide();
                } else {     //游客 ：3
                    $("#tbyouke").hide();
                    $("#trCgsType").hide();
                    //移除验证
                    $("#tbyouke").find("input[type='text']").each(function() {
                        $(this).removeAttr("valid");
                        $(this).removeAttr("errmsg");
                    });
                }
            },

            GetCompanyType: function() {  //获取公司类型
                var cType = "";
                var mainCategory;
                $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']:checked").each(function() {
                    mainCategory = $(this).val();
                });
                if (mainCategory == "1") {  //采购商【组团社|2】;其它【其它采购商|10】
                    $("#divSecondRegister").find("input[type='radio'][name='rdoCgsType']:checked").each(function() {
                        cType = $(this).val();
                    });
                } else if (mainCategory == "2") {
                    var gysCate;
                    $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function() {
                        gysCate = $(this).val();
                    });
                    if (gysCate == "0") {  //专线和地接
                        var lineArr = new Array();
                        $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function() {
                            if ($(this).attr("checked")) {
                                lineArr.push($(this).val());
                            }
                        });
                        if (lineArr.length > 0) {
                            $("#hdfZXandDj").val(lineArr);
                        }
                        cType = 0;
                    } else {
                        cType = gysCate;
                    }
                } else {  //游客
                    cType = 11;
                }
                return cType;
            },
            ApplyCgsGys: function() {  //随便逛逛用户申请成为采购商或者供应商，初始化显示值
                var category = "<%=IsYkApplay%>";
                if (category == "1" || category == "2") {
                    $("#btnSecondRegister").val("同意以下服务条款，并提交申请");
                    $("#rdoSbgg").attr("disabled", "disabled");
                    $("#rdoSbgg").hide();
                    $("#lblsbgg").hide();
                    $("#txtUserName").val("<%=UserName %>");
                    $("#txtContactName").val("<%=TureName %>");
                    $("#txtContactMobile").val("<%=Mobile %>");
                    $("#txtContactEmail").val("<%=Email %>");
                    $("#txtUserName").attr("disabled", "disabled");

                } else {  //否则默认显示为随便广告，但不显示
                    category = "3";
                }
                return category;
            },
            IsModifUserNameEmail: function(ObjId) {  //判断申请是是否去验证用户名和Email唯一性
                var isModif = true;  //可以验证
                var category = "<%=IsYkApplay%>";
                if (category == "1" || category == "2") {
                    if (ObjId == "txtUserName") {
                        isModif = false;
                    }
                    if (ObjId == "txtContactEmail") {
                        if ($.trim($("#txtContactEmail").val()) == $.trim("<%=Email %>")) {
                            isModif = false;
                        }
                    }
                }
                return isModif;
            },
            CheckLineCheckBox: function() {    //验证线路类别选择
                var arrline = new Array();
                $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function() {
                    if ($(this).attr("checked")) {
                        arrline.push($(this).val());
                    }
                });
                var IsLine = false;
                if (arrline.length == 0) {
                    $("#errMsg_chxLine").html("请选择线路供应商类别");
                    $("#trSellCityAndArea").hide();
                    $("#trSellCity").hide()
                } else {
                    $("#errMsg_chxLine").html("");
                    for (var i = 0; i < arrline.length; i++) {
                        if (arrline[i] == "1") {
                            IsLine = true;
                            Register.GetSellCity();
                        } else {
                            if (IsLine == false) {
                                $("#trSellCityAndArea").hide();
                                $("#trSellCity").hide()
                            }
                        }
                    }
                }
            }
        };

        $(function() {

            Register.SetCategroyShow(Register.ApplyCgsGys(), true); //
            $("#divMain .bitian").focus(function() {  // $("#divFristRegister .bitian")
                var isSbgg = $("#rdoSbgg").attr("checked");  //选择随便逛逛，不验证公司名
                if ($.trim($(this).val()) == "") {
                    $(this).parent("td").next().find("div").removeClass().addClass("tist");
                    $(this).parent("td").next().find("div img").hide();
                    $(this).parent("td").next().find("div").show();
                }

                if (isSbgg) {
                    $("#txtCompanyName").parent("td").next().find("div").removeClass("tist");
                    $("#txtCompanyName").parent("td").next().find("div img").hide();
                    $("#txtCompanyName").parent("td").next().find("div").hide();
                }
                if ($(this).attr("id") == "txtUserName") {
                    $("#span_txtUserName").hide();
                }
                $("#spanCodeisNull").hide();
                $("#spanCodeErr").hide();
            });
            $("#divMain .bitian").blur(function() {
                Register.ckInputisNull($(this), true, false);
                if ($(this).attr("id") == "txtValidateCode") {
                    Register.ckValidateCode();
                }
            });

            $("#ProvinceAndCityList1_ddl_ProvinceList").change(function() {
                $("#errMsg_City").hide();
                $("#trSellCityAndArea").hide();
                if ($(this).val() != "0") {
                    $("#errMsg_Province").hide();
                } else {
                    $("#errMsg_Province").show();
                }
            });

            $("#ProvinceAndCityList1_ddl_CityList").change(function() {
                if ($("#errMsg_Province").val() != "0") {
                    if ($(this).val() != "0") {
                        $("#errMsg_City").hide();
                    } else {
                        $("#errMsg_City").show();
                    }
                } else {
                    $("#errMsg_Province").show();
                }
                //绑定销售城市及线路区域
                Register.GetSellCity();
            });

            FV_onBlur.initValid($("#btnSecondRegister").closest("form").get(0));
            $("#btnSecondRegister").click(function() {
                var form = $(this).closest("form").get(0);
                var isVaildTxt = true; //验证用户名，密码，手机，EMail,公司名称  
                $("#divMain .bitian").each(function() {
                    Register.ckInputisNull($(this), true, true);
                });
                // Register.ckValidateCode(); //验证验证码

                if (!ValiDatorForm.validator(form, "span")) {
                    isVaildTxt = false;
                }
                var typeval;  //类别
                $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']").each(function() { //验证供应商类别                
                    if ($(this).attr("checked")) {
                        typeval = $(this).val();
                    }
                });
                if (typeval == 3) {
                    $("#divMain .bitian").each(function() {  //验证用户名，密码，手机，EMail,公司名称
                        var contrId = $(this).attr("id");
                        if (contrId != "txtValidateCode" && contrId != "txtCompanyName") {
                            if (!Register.ckInputisNull($(this), true, true)) {
                                isVaildTxt = false;
                                return false;
                            }
                        }
                    })
                } else {
                    $("#divMain .bitian").each(function() {  //验证用户名，密码，手机，EMail,公司名称
                        var contrId = $(this).attr("id");
                        if (contrId != "txtValidateCode") {
                            if (!Register.ckInputisNull($(this), true, true)) {
                                isVaildTxt = false;
                                return false;
                            }
                        }
                    });
                }
                $("#spSelCategory").html("");
                if (typeval == "1") { //采购商，验证采购商类型
                    $("#errMsg_radManageArea").html("");
                    //验证省份和城市
                    if ($("#errMsg_Province").val() == "0") {
                        $("#errMsg_Province").show();
                        isVaildTxt = false;
                    } else {
                        $("#errMsg_Province").hide();
                        if ($("#errMsg_City").val() == "0") {
                            $("#errMsg_City").show();
                            isVaildTxt = false;
                        } else {
                            $("#errMsg_City").hide();
                        }
                    }
                } else if (typeval == "2") {  //供应商，验证供应商类别
                    var count = "-1";
                    $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function() { //验证供应商类别
                        count = $(this).val();
                    });
                    if (count == "-1") {  //没有选择采购商类型
                        $("#errMsg_radManageArea").html("请选择供应商类别");
                        isVaildTxt = false;
                    } else {
                        $("#errMsg_radManageArea").html("");
                        //验证省份和城市
                        if ($("#errMsg_Province").val() == "0") {
                            $("#errMsg_Province").show();
                            isVaildTxt = false;
                        } else {
                            $("#errMsg_Province").hide();
                            if ($("#errMsg_City").val() == "0") {
                                $("#errMsg_City").show();
                                isVaildTxt = false;
                            } else {
                                $("#errMsg_City").hide();
                            }
                        }
                        if (count == 0) {  //选择线路
                            //验证线路供应商类别
                            var arrline = new Array();
                            $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function() {
                                if ($(this).attr("checked")) {
                                    arrline.push($(this).val());
                                }
                            });
                            if (arrline.length == 0) {
                                $("#errMsg_chxLine").html("请选择线路供应商类别");
                                isVaildTxt = false;
                            } else {
                                var isLine = false;
                                for (var i = 0; i < arrline.length; i++) {
                                    if (arrline[i] == "1") {
                                        isLine = true;
                                    }
                                }
                                if (isLine) {  //线路，要验证销售城市，线路区域
                                    var ckCompanyType = new Array();
                                    $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']:checked").each(function() {
                                        ckCompanyType.push($(this).val());
                                    });
                                    if (ckCompanyType.length == 0) {
                                        isVaildTxt = false;
                                        $("#errMsg_ckCompanyType").show();
                                    } else {
                                        if ($("#errMsg_City").val() != "0") {
                                            if ($("#divSecondRegister").find("input[type='checkbox'][name='chxLine'][value='1']").attr("checked")) {
                                                var ckSellCity = new Array();
                                                $("#tdSellCity").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                                    ckSellCity.push($(this).val());
                                                });
                                                if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                                    isVaildTxt = false;
                                                    $("#errMsgckSellCity").show();
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                } else if (typeval == "3") {  //游客
                    typeval = 11;
                } else {
                    $("#spSelCategory").html("请选择类别");
                    return;
                }
                if (!Register.ckValidateCode()) {  //验证验证码
                    isVaildTxt = false;
                }
                if (!$("#F_ckPact").attr("checked")) {  //验证同意条款
                    $("#span_PactErr").show();
                    isVaildTxt = false;
                }
                var companyType = Register.GetCompanyType();  //获取公司类型
                //alert(isVaildTxt); 
                if (isVaildTxt) {
                    var addType = "add"
                    var category = "<%=IsYkApplay%>";  //是否为申请           
                    var MsgSucc = "注册成功！";
                    var MsgError = "注册失败！";
                    if (category == "1" || category == "2") {
                        addType = "update";
                        $("#btnSecondRegister").val("正在提交申请....");
                        MsgSucc = "申请成功！";
                        MsgError = "申请成功！";
                    } else {
                        $("#btnSecondRegister").val("正在提交注册....");
                    }
                    $("#btnSecondRegister").attr("disabled", "disabled");
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        data: $("#aspnetForm").serializeArray(),
                        url: "/Register/MQRegister.aspx?type=" + addType + "&companytype=" + companyType + "&id=" + "",
                        cache: false,
                        success: function(html) {
                            if (html == "1") { //成功                                  
                                alert(MsgSucc);
                                $("#btnSecondRegister").val("正在登录中....");
                                $("#btnSecondRegister").attr("disabled", "disabled");
                                blogin.ssologinurl = "<%=EyouSoft.Common.Domain.PassportCenter %>";
                                blogin2($("#txtUserName").val(), $("#txtFristPassWord").val(), "", "<%= EyouSoft.Common.Domain.UserPublicCenter %>/Register/RegisterSuccess.aspx?CityId=<%=CityId %>", function(message) {
                                    alert(message);
                                    Register.SetRegisterState();
                                });
                            }
                            else if (html == "3") {
                                alert("用户名已经存在!");
                                $("#txtSecondUserName").focus();
                                Register.SetRegisterState();
                            }
                            else if (html == "2") {
                                alert("邮箱已经存在!");
                                $("#txtContactEmail").focus();
                                Register.SetRegisterState();
                            } else {
                                alert(MsgError);
                                Register.SetRegisterState();
                            }
                        }
                    });
                }
            });
            $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']").each(function() {
                $(this).click(function() {
                    if ($(this).attr("checked")) {
                        $("#spSelCategory").html("");
                        Register.SetCategroyShow($(this).val(), false);
                        $("#divcatetext").show();
                        if ($(this).val() == "1") {
                            $("#spCateText").html(CategoryText1);
                        } else if ($(this).val() == "2") {
                            $("#spCateText").html(CategoryText2);
                        } else {
                            $("#spCateText").html(CategoryText3);
                        }
                    }
                    $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function() {
                        $(this).removeAttr("checked");
                    });
                    $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function() {
                        if ($(this).attr("checked")) {
                            $(this).removeAttr("checked");
                        }
                    });
                });
                $(this).blur(function() {
                    $("#spCateText").html(""); $("#divcatetext").hide();
                });
            });
            $("#divSecondRegister").find("input[type='radio'][name='radManageArea']").each(function() {
                $(this).click(function() {
                    if ($(this).attr("checked")) {
                        $("#errMsg_radManageArea").html("");
                        var seltype = $(this).val();
                        $("#trTicket").hide();
                        $("#trSellCity").hide();
                        $("#trSellCityAndArea").hide();
                        $("#txtDlNumber").removeAttr("valid");
                        $("#txtDlNumber").removeAttr("errmsg");
                        if (seltype == 0) {    //线路，需要显示线路供应商类别
                            $("#trXlgysCategory").show();
                            $("#txtDlNumber").removeAttr("valid");
                            $("#txtDlNumber").removeAttr("errmsg");
                        } else {
                            $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function() {
                                if ($(this).attr("checked")) {
                                    $(this).removeAttr("checked");
                                }
                            });
                            $("#trXlgysCategory").hide();
                            if (seltype == 9) {
                                $("#trTicket").show();
                                $("#txtDlNumber").attr("valid", "required");
                                $("#txtDlNumber").attr("errmsg", "请输入代理级别");
                            } else {
                                $("#txtDlNumber").removeAttr("valid");
                                $("#txtDlNumber").removeAttr("errmsg");
                            }
                        }
                    }
                });
            });
            //             $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){             
            //               $(this).click(function(){                   
            //                  if($(this).val()=="1"){
            //                    Register.GetSellCity();                   
            //                  }else{
            //                    $("#trSellCityAndArea").hide();
            //                    $("#trSellCity").hide()
            //                  }
            //               });
            //               $(this).blur(function(){            
            //                   Register.ValidCkLine();
            //               });
            //            });

            $("#<%=txtValidateCode.ClientID %>").bind("keypress", function(e) {
                if (e.keyCode == 13) {
                    $("#btnSecondRegister").click();
                    return false;
                }
            });
        });
        
  
    </script>
    </form>
</body>
</html>