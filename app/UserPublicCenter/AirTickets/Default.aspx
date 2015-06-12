<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserPublicCenter.AirTickets.Default"
 MasterPageFile="~/MasterPage/AirTicket.Master"
 %>
 <asp:Content ID="c1" ContentPlaceHolderID="c1" runat="server">
 <div class="sidebar02_con">
    <%this.Page.Response.Redirect("http://jp.tongye114.com/"); %>
    	<div class="sidebar02_con_left">
        	<div class="sidebar02_con_left_c">
        	  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="60" align="center"><a href="/AirTickets/OrderManage/CurrentOrderList.aspx"><img alt="当前最新订单" src="<%=ImageServerPath %>/images/jipiao/btn001.jpg" width="158" height="43" /></a></td>
                  <td align="center"><a target="_blank" href="/PlaneInfo/PlaneListPage.aspx"><img alt="散客PNR预定" src="<%=ImageServerPath %>/images/jipiao/btn002.jpg" width="158" height="43" /></a></td>
                  <td align="center"><a target="_blank" href="/PlaneInfo/PlaneListPage.aspx"><img alt="散客票查询预订" src="<%=ImageServerPath %>/images/jipiao/btn003.jpg" width="158" height="43" /></a></td>
                </tr>
                <tr>
                  <td height="60" align="center"><a href="/AirTickets/TeamBook/TicketSearch.aspx"><img alt="团队预定/散拼" src="<%=ImageServerPath %>/images/jipiao/btn004.jpg" width="158" height="43" /></a></td>
                  <td align="center"><a href="#"><img alt="国际预定" src="<%=ImageServerPath %>/images/jipiao/btn005.gif" width="158" height="43" /></a></td>
                  <td align="center"><a href="#"><img alt="特价申请" src="<%=ImageServerPath %>/images/jipiao/btn006.jpg" width="158" height="43" /></a></td>
                </tr>
              </table>
       	      
              <div class="clearboth"></div>
              <div class="public_container">
                <ul class="public_Tab">
                    <li><a id="public_Tab1" href="javascript:;" class="default">航空公司公告</a></li>
                    <li><a id="public_Tab2" href="javascript:;">平台公告与活动</a></li>
                    <li><a id="public_Tab3" href="javascript:;">历史公告</a></li>
                </ul>
                  <div class="public_content" id="public_content1">
                  	<textarea name="textarea" id="textarea" cols="45" rows="5" style="overflow-y:auto">关于确保将国航不正常航班信息传递给旅客的通知 国航各销售代理人：
为提高国航服务品质，确保旅客接收到航班不正常信息，国航开通了手机短信方式将不正常航班通知到旅客。现对有关规定重申如下：
一 在出售客票或座位再确认时，务必将旅客手机号码输入到订座记录中；如果旅客不能提供手机号码，代理人要将自己的业务手机号码（此号码要24小时开通）输入到订座记录中。销售人员要将手机号码输入订座记录“OSI”组中。
输入格式：OSI：CA CTCT13XXXXXXXXX/Pn
（Pn表示手机号码适用于PNR中的第几位旅客）
注意：CTCT后面没有空格
中航信已采用屏蔽保护技术手段使OSI组信息不会被非订座代理人看到。
二 要及时处理本单位“SCQ”。当日所有的“Q”必须在当天处理完毕。
三 接收到国航发送的不正常航班信息手机通知短信后，负责将相关信息及时通知在本单位出票或确认座位且未留手机号码的旅客。
各销售代理人务必严格按操作格式输入旅客的手机号码，确保旅客手机号码的准确性和有效性。 
国航近期将上述规定进行专项检查，对于不按规定输入旅客手机号码者，按每个旅客处以2000元违约金；对于没有将国航航班不正常信息通知到旅客者，除赔偿旅客的经济损失外，再按每位旅客处以2000元违约金，二次未能将国航航班不正常信息通知到旅客者，取消其国航代理资格。
特此通知 发布日期：2010-12-05 
</textarea>
                  </div>
                  <div class="public_content_hidden" id="public_content2">
                  	<textarea name="textarea" id="textarea1" cols="45" rows="5" style="overflow-y:auto">登录MQ采购机票解决行程单问题


活动起止时间:
            2010年12月6日至2010年12月26日，为期20天。
参加活动的机票类型：
            国内常规散客机票政策，所有航空公司（不含春秋航空）。
申请商户范围： 所有提交申请的MQ用户。
申请流程：
           1.在下列用户名框中填写您的用户名，以作申请。
           2.每天登录MQ一次，累计登录10天，20天累计采购满20张机票便可以在活动结束日申请参加本活动。登录另有奖
           3.活动详情请加QQ1302354980。

活动结果公布方式：
网站机票栏目会有公布栏目，以及客服回访联系。
本活动解释权归同业114。
同业114咨询电话：0571-56893761 廖小姐 13685750464 徐先生 
（人工受理时间周一至周五9：00－17：30）
</textarea>
                  </div>
                  <div class="public_content_hidden" id="public_content3">
                  	<textarea name="textarea" id="textarea2" cols="45" rows="5" style="overflow-y:auto">暂无</textarea>
                  </div>
              </div>
       	  </div>
      </div>
    	<div class="sidebar02_con_right">
            <div class="sidebar02_con_right_c">
                <ul>
                
                	<li><a href="javascript:void(0)" style="vertical-align:middle;" onclick="window.open('<%=EyouSoft.Common.Utils.GetMQLink("27440")%>')" title="点击图标洽谈！"><img src="<%=ImageServerPath %>/images/jipiao/MQ_fw.jpg" /></a></li>
                    <%=FiveAdvImages %>
                </ul>
            </div>
        </div>
        <div class="clearboth"></div>
    </div>
    <script type="text/javascript">
    $(function(){
        var pretab="public_Tab",precontent="public_content",
        tabOnClass="default",tabHiddenClass="",contentOnClass="public_content",
        contentHidenClass="public_content_hidden";
        $(".public_Tab").find("a").mouseover(function(){
            var index = this.id.substr(this.id.length-1,1);
            $(".public_Tab ."+tabOnClass).removeClass(tabOnClass).addClass(tabHiddenClass);
            $(this).removeClass(tabHiddenClass).addClass(tabOnClass);
            
            $("."+contentOnClass).removeClass(contentOnClass).addClass(contentHidenClass);
            $("#"+precontent+index).removeClass(contentHidenClass).addClass(contentOnClass);
        });
    });
    </script>
 </asp:Content>
