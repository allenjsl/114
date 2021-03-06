﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using EyouSoft.Common;
using EyouSoft.Common.Function;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace UserBackCenter.RouteAgency
{
    /// <summary>
    /// 标准发布团队
    /// 罗丽娥  2010-06-25
    /// ----------------------
    /// 修改人：张新兵，修改时间：2011-02-14
    /// 修改内容：后台修改好某条子团线路信息保存后，跳到子团列表的页面
    /// </summary>
    public partial class AddStandardTour : EyouSoft.Common.Control.BackPage
    {
        protected string ImageServerPath = EyouSoft.Common.ImageManage.GetImagerServerUrl(1);
        private EyouSoft.SSOComponent.Entity.UserInfo UserInfoModel = null;
        private string CompanyId = "0",UserID = "0";
        protected string strRouteTheme = string.Empty, strSaleCity = string.Empty, strLeaveCity = string.Empty;
        protected StringBuilder strLocalInfo = new StringBuilder();
        protected string tblID = "AddStandardTour";
        protected int MaxTourDays = 0;
        protected string CollectionContect = string.Empty, MeetTourContect = string.Empty;

        /// <summary>
        /// 模板团ID
        /// </summary>
        protected string templateTourId = "";

        #region page_load
        protected void Page_Load(object sender, EventArgs e)
        {
            tblID = "AddStandardTour" + Guid.NewGuid().ToString();
            this.AddStandardTour_StandardPlan.ContainerID = tblID;
            this.AddStandardTour_tourpricestand.ContainerID = tblID;
            this.AddStandardTour_ServiceStandard.ContainerID = tblID;
            MaxTourDays = Utils.GetInt(System.Configuration.ConfigurationManager.AppSettings["MaxTourDays"]);
            if (SiteUserInfo != null)
            {
                UserInfoModel = SiteUserInfo;
                CompanyId = UserInfoModel.CompanyID;
                UserID = UserInfoModel.ID;
                this.AddStandardTour_tourpricestand.UserInfoModel = UserInfoModel;
                this.AddStandardTour_TourContactInfo.CompanyID = UserInfoModel.CompanyID;

                if (UserInfoModel.ContactInfo != null)
                {
                    this.AddStandardTour_TourContactInfo.ContactName = UserInfoModel.ContactInfo.ContactName;
                    this.AddStandardTour_TourContactInfo.ContactTel = UserInfoModel.ContactInfo.Tel;
                    this.AddStandardTour_TourContactInfo.ContactMQID = UserInfoModel.ContactInfo.MQ;
                }
                this.AddStandardTour_TourContactInfo.ContainerID = tblID;
            }
            this.Page.Title = "标准版发布团队信息";
            if (!Page.IsPostBack)
            {
                InitRouteArea();
                this.AddStandardTour_StandardPlan.ReleaseType = "AddStandardTour";
                if (!String.IsNullOrEmpty(Utils.InputText(Request.QueryString["TourID"])))
                {
                    InitTourInfo(Utils.InputText(Request.QueryString["TourID"]));
                }
                else
                {
                    strRouteTheme = InitRouteTopic(null);
                    strSaleCity = InitSaleCity(null);
                    strLeaveCity = InitLeaveCity(0);
                }
                if (!String.IsNullOrEmpty(Request.QueryString["TemplateTourID"]))
                {
                    this.AddStandardTour_TemplateTourID.Value = Request.QueryString["TemplateTourID"];
                }

                #region 权限处理
                //if (!this.CheckGrant(EyouSoft.Common.TravelPermission.专线_新增计划))
                //{
                //    Utils.ResponseNoPermit("对不起，您没有专线_新增计划权限");
                //    return;
                //}
                #endregion
            }
            if (!String.IsNullOrEmpty(Request.QueryString["flag"]))
            {
                string flag = Request.QueryString["flag"].ToString();
                if (flag.Equals("add", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Clear();
                    if (!IsCompanyCheck)
                    {
                        Response.Write("对不起，您的账号未审核，不能进行操作!");
                    }else{
                        Response.Write(InsertTourInfo());
                    }
                    Response.End();
                }
                else if (flag.Equals("Exist", StringComparison.OrdinalIgnoreCase))
                {
                    string RouteName = Utils.InputText(Request.QueryString["RouteName"]);
                    Response.Clear();
                    if (!String.IsNullOrEmpty(RouteName))
                    {
                        Response.Write(IsExists(RouteName));
                    }
                    else
                    {
                        Response.Write(false);
                    }
                    Response.End();
                }
            }
        }
        #endregion

        #region 绑定线路区域
        /// <summary>
        /// 绑定线路区域
        /// </summary>
        private void InitRouteArea()
        {
            // 用户信息
            if (UserInfoModel != null)
            {
                EyouSoft.IBLL.SystemStructure.ISysArea bll = EyouSoft.BLL.SystemStructure.SysArea.CreateInstance();
                IList<EyouSoft.Model.SystemStructure.SysArea> list = bll.GetSysAreaList(UserInfoModel.AreaId);
                if (list != null && list.Count > 0)
                {
                    foreach (EyouSoft.Model.SystemStructure.SysArea model in list)
                    {
                        this.AddStandardTour_RouteArea.Items.Add(new ListItem(model.AreaName, model.AreaId.ToString() + "|" + model.RouteType));
                    }
                }
                list = null;
                bll = null;
            }
        }
        #endregion

        #region 绑定线路主题
        /// <summary>
        /// 绑定线路主题
        /// </summary>
        private string InitRouteTopic(IList<int> RouteTopicIdList)
        {
            StringBuilder str = new StringBuilder();
            EyouSoft.IBLL.SystemStructure.ISysField bll = EyouSoft.BLL.SystemStructure.SysField.CreateInstance();
            IList<EyouSoft.Model.SystemStructure.SysFieldBase> list = bll.GetRouteTheme();
            if (list != null && list.Count > 0)
            {
                int i = 0;     // 如果i=0加验证
                foreach (EyouSoft.Model.SystemStructure.SysFieldBase model in list)
                {
                    int tmpTopicID = 0;
                    if (RouteTopicIdList != null)   // 修改或复制初始化
                    {
                        foreach (int TopicID in RouteTopicIdList)
                        {
                            if (TopicID == model.FieldId)
                            {
                                tmpTopicID = model.FieldId;
                                break;
                            }
                        }
                    }
                    if (i == 0)
                    {
                        if (tmpTopicID == model.FieldId)
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkRouteTopic{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkRouteTopic\" id=\"AddStandardTour_chkRouteTopic{0}\" value=\"{0}\" checked />{1}</label>", model.FieldId, model.FieldName);
                        }
                        else
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkRouteTopic{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkRouteTopic\" id=\"AddStandardTour_chkRouteTopic{0}\" value=\"{0}\" />{1}</label>", model.FieldId, model.FieldName);
                        }
                    }
                    else
                    {
                        if (tmpTopicID == model.FieldId)
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkRouteTopic{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkRouteTopic\" id=\"AddStandardTour_chkRouteTopic{0}\" value=\"{0}\" checked />{1}</label>", model.FieldId, model.FieldName);
                        }
                        else
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkRouteTopic{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkRouteTopic\" id=\"AddStandardTour_chkRouteTopic{0}\" value=\"{0}\" />{1}</label>", model.FieldId, model.FieldName);
                        }
                    }
                    i++;
                }
            }
            list = null;
            bll = null;
            return str.ToString();
        }
        #endregion

        #region 绑定销售城市
        /// <summary>
        /// 绑定销售城市
        /// </summary>
        private string InitSaleCity(IList<int> SaleCityIdList)
        {
            StringBuilder str = new StringBuilder();
            EyouSoft.IBLL.CompanyStructure.ICompanyCity bll = EyouSoft.BLL.CompanyStructure.CompanyCity.CreateInstance();
            IList<EyouSoft.Model.SystemStructure.CityBase> list = bll.GetCompanySaleCity(CompanyId);
            if (list != null && list.Count > 0)
            {
                int i = 0;
                foreach (EyouSoft.Model.SystemStructure.CityBase model in list)
                {
                    int tmpSaleCityID = 0;
                    if (SaleCityIdList != null)
                    {
                        int j = 0;
                        foreach (int SaleCityId in SaleCityIdList)
                        {
                            if (SaleCityId == model.CityId)
                            {
                                tmpSaleCityID = model.CityId;
                                break;
                            }
                        }
                    }
                    if (i == 0)
                    {
                        if (tmpSaleCityID == model.CityId)
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkSaleCity{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkSaleCity\" value=\"{0}\" id=\"AddStandardTour_chkSaleCity{0}\" checked valid=\"requireChecked\" errmsg=\"请选择销售城市!\" errmsgend=\"AddStandardTour_chkSaleCity\" />{1}</label>", model.CityId.ToString(), model.CityName);
                        }
                        else
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkSaleCity{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkSaleCity\" value=\"{0}\" id=\"AddStandardTour_chkSaleCity{0}\" valid=\"requireChecked\" errmsg=\"请选择销售城市!\" errmsgend=\"AddStandardTour_chkSaleCity\" />{1}</label>", model.CityId.ToString(), model.CityName);
                        }
                    }
                    else
                    {
                        if (tmpSaleCityID == model.CityId)
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkSaleCity{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkSaleCity\" value=\"{0}\" id=\"AddStandardTour_chkSaleCity{0}\" checked />{1}</label>", model.CityId.ToString(), model.CityName);
                        }
                        else
                        {
                            str.AppendFormat("<label for=\"AddStandardTour_chkSaleCity{0}\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_chkSaleCity\" value=\"{0}\" id=\"AddStandardTour_chkSaleCity{0}\" />{1}</label>", model.CityId.ToString(), model.CityName);
                        }
                    }
                    i++;
                }
            }
            return str.ToString();
        }
        #endregion 

        #region 绑定出港城市
        private string InitLeaveCity(int LeaveCity)
        {
            StringBuilder str1 = new StringBuilder();  // 当前公司注册时所在省份的出港城市
            StringBuilder str2 = new StringBuilder();  // 设置过的出港城市

            EyouSoft.IBLL.CompanyStructure.ICompanyCity bll = EyouSoft.BLL.CompanyStructure.CompanyCity.CreateInstance();
            IList<EyouSoft.Model.SystemStructure.CityBase> list = bll.GetCompanyPortCity(CompanyId);
            if (list != null && list.Count > 0)
            {
                int i = 0;
                foreach (EyouSoft.Model.SystemStructure.CityBase model in list)
                {
                    if (model.ProvinceId == UserInfoModel.ProvinceId)
                    {
                        if (LeaveCity == model.CityId)
                        {
                            if (i == 0)
                            {
                                str1.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" checked value=\"{0}\" valid=\"requiredRadioed\" errmsg=\"请选择出港城市!\" errmsgend=\"AddStandardTour_radPortCity\" />{1}</label>", model.CityId, model.CityName);
                            }
                            else
                            {
                                str1.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" checked value=\"{0}\" />{1}</label>", model.CityId, model.CityName);
                            }
                        }
                        else
                        {
                            if (i == 0)
                            {
                                str1.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" value=\"{0}\" valid=\"requiredRadioed\" errmsg=\"请选择出港城市!\" errmsgend=\"AddStandardTour_radPortCity\" />{1}</label>", model.CityId, model.CityName);
                            }
                            else
                            {
                                str1.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" value=\"{0}\" />{1}</label>", model.CityId, model.CityName);
                            }
                        }
                    }
                    else
                    {
                        if (LeaveCity == model.CityId)
                        {
                            if (i == 0)
                            {
                                str2.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" checked value=\"{0}\" valid=\"requiredRadioed\" errmsg=\"请选择出港城市!\" errmsgend=\"AddStandardTour_radPortCity\" />{1}</label>", model.CityId, model.CityName);
                            }
                            else
                            {
                                str2.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" checked value=\"{0}\" />{1}</label>", model.CityId, model.CityName);
                            }
                        }
                        else
                        {
                            if (i == 0)
                            {
                                str2.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" value=\"{0}\" valid=\"requiredRadioed\" errmsg=\"请选择出港城市!\" errmsgend=\"AddStandardTour_radPortCity\" />{1}</label>", model.CityId, model.CityName);
                            }
                            else
                            {
                                str2.AppendFormat("<label for=\"AddStandardTour_radPortCity{0}\" hideFocus=\"false\"><input type=\"radio\" name=\"AddStandardTour_radPortCity\" id=\"AddStandardTour_radPortCity{0}\" value=\"{0}\" />{1}</label>", model.CityId, model.CityName);
                            }
                        }
                    }
                    i++;
                }
            }
            if (str1.ToString() != string.Empty)
            {
                if (str2.ToString() != string.Empty)
                {
                    return str1.ToString() + "|" + str2.ToString() + "| <a href=\"javascript:void(0)\" onclick=\"TourModule.OpenDialog('设置常用出港城市','/RouteAgency/SetLeaveCity.aspx?ReleaseType=AddStandardTour&ContainerID=" + tblID + "&rnd='+ Math.random(),650,450);return false;\"><span class=\"huise\">更多</span></a>";
                }
                else
                {
                    return str1.ToString() + "| <a href=\"javascript:void(0)\" onclick=\"TourModule.OpenDialog('设置常用出港城市','/RouteAgency/SetLeaveCity.aspx?ReleaseType=AddStandardTour&ContainerID=" + tblID + "&rnd='+ Math.random(),650,450);return false;\"><span class=\"huise\">更多</span></a>";
                }
            }
            else
            {
                if (str2.ToString() != string.Empty)
                {
                    return str2.ToString() + "| <a href=\"javascript:void(0)\" onclick=\"TourModule.OpenDialog('设置常用出港城市','/RouteAgency/SetLeaveCity.aspx?ReleaseType=AddStandardTour&ContainerID=" + tblID + "&rnd='+ Math.random(),650,450);return false;\"><span class=\"huise\">更多</span></a>";
                }
                else
                {
                    return "<a href=\"javascript:void(0)\" onclick=\"TourModule.OpenDialog('设置常用出港城市','/RouteAgency/SetLeaveCity.aspx?ReleaseType=AddStandardTour&ContainerID=" + tblID + "&rnd='+ Math.random(),650,450);return false;\"><span class=\"huise\">更多</span></a>";
                }
            }
        }
        #endregion 

        #region 修改初始化团队信息
        /// <summary>
        /// 修改初始化团队信息
        /// </summary>
        /// <param name="TourID"></param>
        private void InitTourInfo(string TourID)
        {
            EyouSoft.IBLL.TourStructure.ITour bll = EyouSoft.BLL.TourStructure.Tour.CreateInstance();
            EyouSoft.Model.TourStructure.TourInfo model = bll.GetTourInfo(TourID);   // 如果是批量修改，初始化模板团信息
            if (model != null)
            {
                if (!String.IsNullOrEmpty(Utils.GetQueryStringValue("type")) && Utils.GetQueryStringValue("type") == "edit")
                {
                    //初始化当前计划的模板团ID
                    templateTourId = model.ParentTourID;

                    this.spanSelectDate.Visible = false;
                    this.spanSetTourNo.Visible = false;

                    if (model.ReleaseType == EyouSoft.Model.TourStructure.ReleaseType.Quick)
                    {
                        this.TabAddStandardTour.Visible = false;
                        this.TabAddQuickTour.Visible = true;
                    }
                    else
                    {
                        this.TabAddStandardTour.Visible = true;
                        this.TabAddQuickTour.Visible = false;
                    }

                    if (model.ParentTourID.Trim() == string.Empty)
                    {
                        this.AddStandardTour_TemplateTourID.Value = TourID;
                        this.spanAlreadyDate.Visible = true;
                        this.lblEditText.Text = "<a href=\"javascript:void(0);\" onclick=\"TourModule.OpenDateDialog('" + tblID + "');return false;\">点此查看</a> ";
                    }
                    else
                    {
                        this.AddStandardTour_hidTourID.Value = TourID;
                        this.spanAlreadyDate.Visible = false;
                        this.lblEditText.Text = model.LeaveDate.ToString("yyyy-MM-dd");
                    }

                    IList<EyouSoft.Model.TourStructure.ChildrenTourInfo> list = bll.GetChildrenTours(TourID);
                    if (list != null && list.Count > 0)
                    {
                        this.AddStandardTour_ChildTourCout.Text = list.Count.ToString();
                        DateTime[] TimeList = new DateTime[list.Count];
                        TimeList = (from c in list where true select c.LeaveDate).ToArray();
                        string[] TourCodeList = new string[list.Count];
                        TourCodeList = (from c in list where true select c.TourCode).ToArray();
                        IsoDateTimeConverter iso = new IsoDateTimeConverter();
                        iso.DateTimeFormat = "yyyy-M-d";
                        this.AddStandardTour_hidChildLeaveDateList.Value = JsonConvert.SerializeObject(TimeList, iso);
                        this.AddStandardTour_hidChildTourCodeList.Value = JsonConvert.SerializeObject(TourCodeList);
                        this.hidTourLeaveDate.Value = JsonConvert.SerializeObject(TimeList, iso);
                    }
                    else
                    {
                        this.hidTourLeaveDate.Value = "0";
                    }
                }
                for (int i = 0; i < this.AddStandardTour_RouteArea.Items.Count; i++)
                {
                    if (!String.IsNullOrEmpty(this.AddStandardTour_RouteArea.Items[i].Value))
                    {
                        if (model.AreaId == int.Parse(this.AddStandardTour_RouteArea.Items[i].Value.Split('|')[0].ToString()))
                        {
                            this.AddStandardTour_RouteArea.Items[i].Selected = true;
                        }
                    }
                }
                this.AddStandardTour_RouteName.Value = model.RouteName;
                this.AddStandardTour_txtTourDays.Value = model.TourDays.ToString();
                this.AddStandardTour_PeopleNumber.Value = model.PlanPeopleCount.ToString();

                strRouteTheme = InitRouteTopic(model.RouteTheme);
                strSaleCity = InitSaleCity(model.SaleCity);
                strLeaveCity = InitLeaveCity(model.LeaveCity);
                this.AddStandardTour_LeaveTraffic.Value = model.LeaveTraffic;
                //this.AddStandardTour_BackTraffic.Value = model.BackTraffic;
                //this.AddStandardTour_MeetTourContect.Value = model.MeetTourContect;
                //this.AddStandardTour_CollectionContect.Value = model.CollectionContect;
                CollectionContect = model.CollectionContect;
                MeetTourContect = model.MeetTourContect;
                // 报价等级
                this.AddStandardTour_tourpricestand.TourPriceDetails = model.TourPriceDetail;
                // 行程安排
                this.AddStandardTour_StandardPlan.TourStandardPlanInfo = model.StandardPlan;
                // 包含项目
                this.AddStandardTour_ServiceStandard.TourServiceStandardInfo = model.ServiceStandard;
                // 服务标准
                this.AddStandardTour_Service.Value = model.ServiceStandard.NotContainService;
                this.AddStandardTour_Remark.Value = model.ServiceStandard.SpeciallyNotice;
                // 线路负责人
                this.AddStandardTour_TourContactInfo.ContactName = model.TourContact;
                this.AddStandardTour_TourContactInfo.ContactTel = model.TourContactTel;
                this.AddStandardTour_TourContactInfo.ContactMQID = model.TourContacMQ;
                this.AddStandardTour_TourContactInfo.CompanyID = UserInfoModel.CompanyID;
                // 地接社信息
                if (model.LocalTravelAgency != null)
                {
                    IList<EyouSoft.Model.TourStructure.TourLocalityInfo> LocalList = model.LocalTravelAgency;
                    if (LocalList != null && LocalList.Count > 0)
                    {
                        foreach (EyouSoft.Model.TourStructure.TourLocalityInfo LocalModel in LocalList)
                        {
                            strLocalInfo.Append("<tr><td width=\"12%\" align=\"right\" class=\"shenglan\">地接社信息： </td>");
                            strLocalInfo.Append("<td align=\"left\" class=\"zhonglan\"><input name=\"AddStandardTour_LocalAgency\" value=\"" + LocalModel.LocalCompanyName + "\" type=\"text\" /> &nbsp;&nbsp;&nbsp;&nbsp;许可证号：&nbsp;&nbsp;<input name=\"AddStandardTour_License\" value=\"" + LocalModel.LicenseNumber + "\" type=\"text\" />&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;<input name=\"AddStandardTour_LocalAgencyTel\" value=\"" + LocalModel.ContactTel + "\" type=\"text\" />&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:void(0);\" onclick=\"TourModule.AddOnline(this);return false;\">增加一行</a> <a href=\"javascript:void(0);\" onclick=\"TourModule.Delline(this,'agency');return false;\">删除</a></td></tr>");
                        }
                    }
                }
                // 自动停收时间
                this.AddStandardTour_AutoOffDays.Value = model.AutoOffDays.ToString();               
            }
            model = null;
            bll = null;
        }
        #endregion 
        
        #region 判断线路名称是否存在
        private bool IsExists(string RouteName)
        {
            EyouSoft.IBLL.TourStructure.IRouteBasicInfo bll = EyouSoft.BLL.TourStructure.RouteBasicInfo.CreateInstance();
            return bll.Exists(UserInfoModel.CompanyID, RouteName);
        }
        #endregion

        #region 添加团队信息
        /// <summary>
        /// 添加团队信息
        /// </summary>
        /// <returns></returns>
        private bool InsertTourInfo()
        {
            bool IsResult = false;
            // 团队基本信息
            string hidTourID = Utils.GetFormValue(this.AddStandardTour_hidTourID.UniqueID);    // 用于判断是添加还是修改
            string TemplateTourID = Utils.GetFormValue(this.AddStandardTour_TemplateTourID.UniqueID);    // 需要修改的模板团ID
            string hidTourLeaveDate = Utils.GetFormValue(this.hidTourLeaveDate.UniqueID);

            string RouteArea = Utils.GetFormValue(this.AddStandardTour_RouteArea.UniqueID);
            string RouteName = Utils.GetFormValue(this.AddStandardTour_RouteName.UniqueID);
            string TourDays = Utils.GetFormValue(this.AddStandardTour_txtTourDays.UniqueID);
            string PeopleNumber = Utils.GetFormValue(this.AddStandardTour_PeopleNumber.UniqueID);
            string RouteTopic = Utils.GetFormValue("AddStandardTour_chkRouteTopic");
            string LeaveCity = Utils.GetFormValue("AddStandardTour_radPortCity");
            string SaleCity = Utils.GetFormValue("AddStandardTour_chkSaleCity");
            string LeaveTraffic = Utils.GetFormValue(this.AddStandardTour_LeaveTraffic.UniqueID);
            string Service = Utils.GetFormValue(this.AddStandardTour_Service.UniqueID);
            string Remark = Utils.GetFormValue(this.AddStandardTour_Remark.UniqueID);
            string CollectionContect = Utils.GetFormValue("AddStandardTour_CollectionContect");
            string MeetTourContect = Utils.GetFormValue("AddStandardTour_MeetTourContect");

            // 服务标准
            string ResideContent = Utils.GetFormValue("AddStandardTourResideContent");
            string DinnerContent = Utils.GetFormValue("AddStandardTourDinnerContent");
            string SightContent = Utils.GetFormValue("AddStandardTourSightContent");
            string CarContent = Utils.GetFormValue("AddStandardTourCarContent");
            string GuideContent = Utils.GetFormValue("AddStandardTourGuideContent");
            string TrafficContent = Utils.GetFormValue("AddStandardTourTrafficContent");
            string IncludeOtherContent = Utils.GetFormValue("AddStandardTourIncludeOtherContent");

            // 线路负责人
            string ContactName = Utils.GetFormValue("AddStandardTour_TourContact");
            string ContactTel = Utils.GetFormValue("AddStandardTour_TourContactTel");
            string ContactMQID = Utils.GetFormValue("AddStandardTour_TourContacMQ");
            string ContactUserName = Utils.GetFormValue("AddStandardTour_TourContactUserName");

            // 自动停收时间
            string AutoOffDays = Utils.GetFormValue(this.AddStandardTour_AutoOffDays.UniqueID);
            if (LeaveCity == null || LeaveCity == string.Empty)
                LeaveCity = "0";
            #region 线路区域处理
            string AreaName = string.Empty;
            int AreaID = 0;
            EyouSoft.Model.SystemStructure.AreaType Areatype = EyouSoft.Model.SystemStructure.AreaType.国内短线;
            if (!String.IsNullOrEmpty(RouteArea))
            {
                EyouSoft.IBLL.SystemStructure.ISysArea AreaBll = EyouSoft.BLL.SystemStructure.SysArea.CreateInstance();
                EyouSoft.Model.SystemStructure.SysArea AreaModel = AreaBll.GetSysAreaModel(int.Parse(RouteArea.Split('|')[0]));
                if (AreaModel != null)
                {
                    AreaID = AreaModel.AreaId;
                    AreaName = AreaModel.AreaName;
                    Areatype = AreaModel.RouteType;
                }
                AreaModel = null;
                AreaBll = null;
            }
            #endregion

            #region 线路主题
            IList<int> RouteThemeList = new List<int>();
            if (!String.IsNullOrEmpty(RouteTopic))
            {
                string[] strRouteTopic = RouteTopic.Split(',');
                foreach (string str in strRouteTopic)
                {
                    RouteThemeList.Add(int.Parse(str));
                }
            }
            #endregion

            #region 销售城市
            IList<int> SaleCityList = new List<int>();
            if (!String.IsNullOrEmpty(SaleCity))
            {
                string[] strSaleCity = SaleCity.Split(',');
                foreach (string str in strSaleCity)
                {
                    SaleCityList.Add(int.Parse(str));
                }
            }
            #endregion

            if (this.AddStandardTour_AddToRoute.Checked)
            {
                #region 回写线路信息
                try
                {
                    EyouSoft.Model.TourStructure.RouteBasicInfo RouteModel = new EyouSoft.Model.TourStructure.RouteBasicInfo();
                    RouteModel.ID = Guid.NewGuid().ToString();
                    RouteModel.AreaId = AreaID;
                    RouteModel.AreaType = Areatype;
                    RouteModel.CompanyID = UserInfoModel.CompanyID;
                    RouteModel.CompanyName = UserInfoModel.CompanyName;
                    RouteModel.ContactMQID = ContactMQID;
                    RouteModel.ContactName = ContactName;
                    RouteModel.ContactTel = ContactTel;
                    RouteModel.ContactUserName = ContactUserName;
                    RouteModel.IsAccept = false;
                    RouteModel.IssueTime = DateTime.Now;
                    RouteModel.LeaveCityId = int.Parse(LeaveCity);
                    RouteModel.OperatorID = UserInfoModel.ID;
                    RouteModel.PriceDetails = InsertRoutePriceDetail();
                    RouteModel.QuickPlan = string.Empty;
                    RouteModel.ReleaseType = EyouSoft.Model.TourStructure.ReleaseType.Standard;
                    RouteModel.RouteName = RouteName;
                    RouteModel.RouteTheme = RouteThemeList;
                    RouteModel.SaleCity = SaleCityList;
                    // 包含项目
                    // 服务标准
                    EyouSoft.Model.TourStructure.RouteServiceStandard RouteServiceModel = new EyouSoft.Model.TourStructure.RouteServiceStandard();
                    if (!String.IsNullOrEmpty(ResideContent)) RouteServiceModel.ResideContent = ResideContent;
                    if (!String.IsNullOrEmpty(DinnerContent)) RouteServiceModel.DinnerContent = DinnerContent;
                    if (!String.IsNullOrEmpty(CarContent)) RouteServiceModel.CarContent = CarContent;
                    if (!String.IsNullOrEmpty(SightContent)) RouteServiceModel.SightContent = SightContent;
                    if (!String.IsNullOrEmpty(GuideContent)) RouteServiceModel.GuideContent = GuideContent;
                    if (!String.IsNullOrEmpty(TrafficContent)) RouteServiceModel.TrafficContent = TrafficContent;
                    if (!String.IsNullOrEmpty(IncludeOtherContent)) RouteServiceModel.IncludeOtherContent = IncludeOtherContent;
                    if (!String.IsNullOrEmpty(Service)) RouteServiceModel.NotContainService = Service;
                    if (!String.IsNullOrEmpty(Remark)) RouteServiceModel.SpeciallyNotice = Remark;

                    RouteModel.ServiceStandard = RouteServiceModel;
                    RouteModel.StandardPlans = InsertRouteStandardPlan();
                    RouteModel.TourDays = int.Parse(TourDays);
                    EyouSoft.IBLL.TourStructure.IRouteBasicInfo RouteBll = EyouSoft.BLL.TourStructure.RouteBasicInfo.CreateInstance();
                    RouteBll.InsertRouteInfo(RouteModel);
                    RouteModel = null;
                    RouteBll = null;
                }catch{
                    MessageBox.ShowAndReturnBack(this, "线路回写失败", 1);
                    return false;
                }
                #endregion
            }
            EyouSoft.IBLL.TourStructure.ITour TourBll = EyouSoft.BLL.TourStructure.Tour.CreateInstance();
            // 服务标准
            EyouSoft.Model.TourStructure.TourServiceStandard TourServiceModel = new EyouSoft.Model.TourStructure.TourServiceStandard();
            if (!String.IsNullOrEmpty(ResideContent))TourServiceModel.ResideContent = ResideContent;
            if(!String.IsNullOrEmpty(DinnerContent))TourServiceModel.DinnerContent = DinnerContent;
            if(!String.IsNullOrEmpty(CarContent))TourServiceModel.CarContent = CarContent;
            if(!String.IsNullOrEmpty(SightContent))TourServiceModel.SightContent = SightContent;
            if(!String.IsNullOrEmpty(GuideContent))TourServiceModel.GuideContent = GuideContent;
            if(!String.IsNullOrEmpty(TrafficContent))TourServiceModel.TrafficContent = TrafficContent;
            if(!String.IsNullOrEmpty(IncludeOtherContent))TourServiceModel.IncludeOtherContent = IncludeOtherContent;
            if(!String.IsNullOrEmpty(Service))TourServiceModel.NotContainService = Service;
            if(!String.IsNullOrEmpty(Remark))TourServiceModel.SpeciallyNotice = Remark;
            
            #region 写入团队信息
            if (!String.IsNullOrEmpty(hidTourID) || !String.IsNullOrEmpty(TemplateTourID))   // 修改
            {
                if (!String.IsNullOrEmpty(TemplateTourID))  // 修改模板团
                {
                    EyouSoft.Model.TourStructure.TourInfo TourModel = new EyouSoft.Model.TourStructure.TourInfo();
                    TourModel.ID = TemplateTourID;
                    TourModel.AreaId = AreaID;
                    TourModel.AreaName = AreaName;
                    TourModel.AreaType = Areatype;
                    TourModel.AutoOffDays = int.Parse(AutoOffDays);
                    TourModel.CollectionContect = CollectionContect;
                    TourModel.CompanyID = CompanyId;
                    TourModel.CompanyName = UserInfoModel.CompanyName;
                    TourModel.CreateTime = DateTime.Now;
                    TourModel.LeaveCity = int.Parse(LeaveCity);
                    TourModel.LeaveTraffic = LeaveTraffic;
                    TourModel.MeetTourContect = MeetTourContect;
                    TourModel.OperatorID = UserID;
                    TourModel.PlanPeopleCount = int.Parse(PeopleNumber);
                    TourModel.QuickPlan = string.Empty;
                    TourModel.ReleaseType = EyouSoft.Model.TourStructure.ReleaseType.Standard;
                    TourModel.RouteName = RouteName;
                    TourModel.RouteTheme = RouteThemeList;
                    TourModel.SaleCity = SaleCityList;
                    // 服务标准
                    TourModel.ServiceStandard = TourServiceModel;
                    TourModel.StandardPlan = InsertStandardPlan();
                    TourModel.TourContacMQ = ContactMQID;
                    TourModel.TourContact = ContactName;
                    TourModel.TourContactTel = ContactTel;
                    TourModel.TourContacUserName = ContactUserName;
                    TourModel.TourDays = int.Parse(TourDays);
                    TourModel.TourNo = string.Empty;
                    TourModel.TourPriceDetail = InsertTourPriceDetail();
                    TourModel.TourState = EyouSoft.Model.TourStructure.TourState.收客;
                    TourModel.TourType = EyouSoft.Model.TourStructure.TourType.组团散拼;
                    TourModel.LocalTravelAgency = InsertLocality();
                    if (TourBll.UpdateTemplateTourInfo(TourModel) > 0)
                        IsResult = true;
                    TourModel = null;
                }
                else
                {    // 修改子团
                    #region
                    EyouSoft.Model.TourStructure.TourInfo TourModel = new EyouSoft.Model.TourStructure.TourInfo();
                    TourModel.ID = hidTourID;
                    TourModel.AreaId = AreaID;
                    TourModel.AreaName = AreaName;
                    TourModel.AreaType = Areatype;
                    TourModel.AutoOffDays = int.Parse(AutoOffDays);
                    TourModel.CollectionContect = CollectionContect;
                    TourModel.CompanyID = CompanyId;
                    TourModel.CompanyName = UserInfoModel.CompanyName;
                    TourModel.LeaveCity = int.Parse(LeaveCity);
                    TourModel.LeaveTraffic = LeaveTraffic;
                    TourModel.MeetTourContect = MeetTourContect;
                    TourModel.OperatorID = UserID;
                    TourModel.ParentTourID = TemplateTourID;
                    TourModel.PlanPeopleCount = int.Parse(PeopleNumber);
                    TourModel.QuickPlan = string.Empty;
                    TourModel.ReleaseType = EyouSoft.Model.TourStructure.ReleaseType.Standard;
                    TourModel.RouteName = RouteName;
                    TourModel.RouteTheme = RouteThemeList;
                    TourModel.SaleCity = SaleCityList;
                    // 服务标准
                    TourModel.ServiceStandard = TourServiceModel;
                    TourModel.StandardPlan = InsertStandardPlan();
                    TourModel.TourContacMQ = ContactMQID;
                    TourModel.TourContact = ContactName;
                    TourModel.TourContactTel = ContactTel;
                    TourModel.TourContacUserName = ContactUserName;
                    TourModel.TourDays = int.Parse(TourDays);
                    TourModel.TourNo = string.Empty;
                    TourModel.TourPriceDetail = InsertTourPriceDetail();
                    TourModel.TourState = EyouSoft.Model.TourStructure.TourState.收客;
                    TourModel.TourType = EyouSoft.Model.TourStructure.TourType.组团散拼;
                    TourModel.LocalTravelAgency = InsertLocality();
                    if (TourBll.UpdateTourInfo(TourModel) > 0)
                        IsResult = true;
                    TourModel = null;

                    #region 添加团队联系人
                    EyouSoft.IBLL.CompanyStructure.ITourContactInfo ContactBll = EyouSoft.BLL.CompanyStructure.TourContactInfo.CreateInstance();
                    EyouSoft.Model.CompanyStructure.TourContactInfo ContactModel = new EyouSoft.Model.CompanyStructure.TourContactInfo();
                    ContactModel.CompanyID = UserInfoModel.CompanyID;
                    ContactModel.ContactName = ContactName;
                    ContactModel.ContactTel = ContactTel;
                    ContactModel.ContactMQId = ContactMQID;
                    ContactModel.UserName = UserInfoModel.UserName;
                    ContactBll.Add(ContactModel);
                    #endregion

                    #endregion
                }
            }
            else
            {   // 添加
                #region 添加团队

                #region 子团信息
                IList<EyouSoft.Model.TourStructure.ChildrenTourInfo> ChildrensTourList = new List<EyouSoft.Model.TourStructure.ChildrenTourInfo>();
                if (!String.IsNullOrEmpty(hidTourLeaveDate))
                {
                    string[] tmpLeaveDate = hidTourLeaveDate.Split(',');

                    for (int i = 0; i < tmpLeaveDate.Length; i++)
                    {
                        if (!String.IsNullOrEmpty(tmpLeaveDate[i]))
                        {
                            EyouSoft.Model.TourStructure.ChildrenTourInfo ChildTour = new EyouSoft.Model.TourStructure.ChildrenTourInfo();
                            ChildTour.ChildrenId = Guid.NewGuid().ToString();
                            ChildTour.LeaveDate = Utils.GetDateTime(tmpLeaveDate[i]);
                            ChildTour.TourState = EyouSoft.Model.TourStructure.TourState.收客;
                            ChildrensTourList.Add(ChildTour);
                            ChildTour = null;
                        }
                    }
                }
                #endregion

                EyouSoft.Model.TourStructure.TourInfo TourModel = new EyouSoft.Model.TourStructure.TourInfo();
                TourModel.ID = Guid.NewGuid().ToString();
                TourModel.AreaId = AreaID;
                TourModel.AreaName = AreaName;
                TourModel.AreaType = Areatype;
                TourModel.AutoOffDays = int.Parse(AutoOffDays);
                TourModel.Childrens = ChildrensTourList;
                TourModel.CollectionContect = CollectionContect;
                TourModel.CompanyID = CompanyId;
                TourModel.CompanyName = UserInfoModel.CompanyName;
                TourModel.CreateTime = DateTime.Now;
                TourModel.LeaveCity = int.Parse(LeaveCity);
                TourModel.LeaveTraffic = LeaveTraffic;
                TourModel.MeetTourContect = MeetTourContect;
                TourModel.OperatorID = UserID;
                TourModel.PlanPeopleCount = int.Parse(PeopleNumber);
                TourModel.QuickPlan = string.Empty;
                TourModel.ReleaseType = EyouSoft.Model.TourStructure.ReleaseType.Standard;
                TourModel.RouteName = RouteName;
                TourModel.RouteTheme = RouteThemeList;
                TourModel.SaleCity = SaleCityList;
                // 服务标准
                TourModel.ServiceStandard = TourServiceModel;
                TourModel.StandardPlan = InsertStandardPlan();
                TourModel.TourContacMQ = ContactMQID;
                TourModel.TourContact = ContactName;
                TourModel.TourContactTel = ContactTel;
                TourModel.TourContacUserName = ContactUserName;
                TourModel.TourDays = int.Parse(TourDays);
                TourModel.TourNo = string.Empty;
                TourModel.TourPriceDetail = InsertTourPriceDetail();
                TourModel.TourState = EyouSoft.Model.TourStructure.TourState.收客;
                TourModel.TourType = EyouSoft.Model.TourStructure.TourType.组团散拼;
                TourModel.LocalTravelAgency = InsertLocality();
                if (TourBll.InsertTemplateTourInfo(TourModel) > 0)
                    IsResult = true;
                TourModel = null;

                #region 添加团队联系人
                EyouSoft.IBLL.CompanyStructure.ITourContactInfo ContactBll = EyouSoft.BLL.CompanyStructure.TourContactInfo.CreateInstance();
                EyouSoft.Model.CompanyStructure.TourContactInfo ContactModel = new EyouSoft.Model.CompanyStructure.TourContactInfo();
                ContactModel.CompanyID = UserInfoModel.CompanyID;
                ContactModel.ContactName = ContactName;
                ContactModel.ContactTel = ContactTel;
                ContactModel.ContactMQId = ContactMQID;
                ContactModel.UserName = ContactUserName;
                ContactBll.Add(ContactModel);
                #endregion

                #endregion
            }
            #endregion   
            return IsResult;
        }

        #region 报价信息
        #region 写入团队报价信息
        /// <summary>
        /// 写入团队报价信息
        /// </summary>
        private IList<EyouSoft.Model.TourStructure.TourPriceDetail> InsertTourPriceDetail()
        {
            string[] PriceStand = Utils.GetFormValues("drpPriceRank");
            string[] hidCustomerLevelID = Utils.GetFormValues("hidCustomerLevelID");

            IList<EyouSoft.Model.TourStructure.TourPriceDetail> priceList = new List<EyouSoft.Model.TourStructure.TourPriceDetail>();
            int i = 0;
            if (PriceStand != null)
            {
                foreach (string pricestand in PriceStand)
                {
                    IList<EyouSoft.Model.TourStructure.TourPriceCustomerLeaveDetail> list = new List<EyouSoft.Model.TourStructure.TourPriceCustomerLeaveDetail>();
                    EyouSoft.Model.TourStructure.TourPriceDetail priceModel = new EyouSoft.Model.TourStructure.TourPriceDetail();
                    priceModel.PriceStandId = pricestand;

                    foreach (string customerlevelid in hidCustomerLevelID)
                    {
                        string[] PeoplePrice = Utils.GetFormValues("PeoplePrice" + customerlevelid);
                        string[] ChildPrice = Utils.GetFormValues("ChildPrice" + customerlevelid);

                        EyouSoft.Model.TourStructure.TourPriceCustomerLeaveDetail model = new EyouSoft.Model.TourStructure.TourPriceCustomerLeaveDetail();
                        if (!String.IsNullOrEmpty(PeoplePrice[i]) && Utils.GetDecimal(PeoplePrice[i]) != 0)
                            model.AdultPrice = decimal.Parse(PeoplePrice[i]);
                        else
                            model.AdultPrice = 0;
                        if (!String.IsNullOrEmpty(ChildPrice[i]) && Utils.GetDecimal(ChildPrice[i]) != 0)
                            model.ChildrenPrice = decimal.Parse(ChildPrice[i]);
                        else
                            model.ChildrenPrice = 0;
                        model.CustomerLevelId = int.Parse(customerlevelid);
                        list.Add(model);
                        model = null;
                    }
                    priceModel.PriceDetail = list;
                    list = null;
                    priceList.Add(priceModel);
                    priceModel = null;
                    i++;
                }
            }
            return priceList;
        }
        #endregion

        #region 写入线路报价信息
        private IList<EyouSoft.Model.TourStructure.RoutePriceDetail> InsertRoutePriceDetail()
        {
            string[] PriceStand = Utils.GetFormValues("drpPriceRank");
            string[] hidCustomerLevelID = Utils.GetFormValues("hidCustomerLevelID");

            IList<EyouSoft.Model.TourStructure.RoutePriceDetail> priceList = new List<EyouSoft.Model.TourStructure.RoutePriceDetail>();
            int i = 0;
            if (PriceStand != null)
            {
                foreach (string pricestand in PriceStand)
                {
                    IList<EyouSoft.Model.TourStructure.RoutePriceCustomerLeaveDetail> list = new List<EyouSoft.Model.TourStructure.RoutePriceCustomerLeaveDetail>();
                    EyouSoft.Model.TourStructure.RoutePriceDetail priceModel = new EyouSoft.Model.TourStructure.RoutePriceDetail();
                    priceModel.PriceStandId = pricestand;

                    foreach (string customerlevelid in hidCustomerLevelID)
                    {
                        string[] PeoplePrice = Utils.GetFormValues("PeoplePrice" + customerlevelid);
                        string[] ChildPrice = Utils.GetFormValues("ChildPrice" + customerlevelid);

                        EyouSoft.Model.TourStructure.RoutePriceCustomerLeaveDetail model = new EyouSoft.Model.TourStructure.RoutePriceCustomerLeaveDetail();
                        if (!String.IsNullOrEmpty(PeoplePrice[i]) && Utils.GetDecimal(PeoplePrice[i]) != 0)
                            model.AdultPrice = decimal.Parse(PeoplePrice[i]);
                        else
                            model.AdultPrice = 0;
                        if (!String.IsNullOrEmpty(ChildPrice[i]) && Utils.GetDecimal(ChildPrice[i]) != 0)
                            model.ChildrenPrice = decimal.Parse(ChildPrice[i]);
                        else
                            model.ChildrenPrice = 0;
                        model.CustomerLevelId = int.Parse(customerlevelid);
                        list.Add(model);
                        model = null;
                    }
                    priceModel.PriceDetail = list;
                    list = null;
                    priceList.Add(priceModel);
                    priceModel = null;
                    i++;
                }
            }
            return priceList;
        }
        #endregion
        #endregion

        #region 行程信息
        /// <summary>
        /// 写入团队行程信息
        /// </summary>
        private IList<EyouSoft.Model.TourStructure.TourStandardPlan> InsertStandardPlan()
        {
            string[] DayJourney = Utils.GetFormValues("DayJourney");
            IList<EyouSoft.Model.TourStructure.TourStandardPlan> tourList = new List<EyouSoft.Model.TourStructure.TourStandardPlan>();

            // 写入团队行程信息     
            if (DayJourney != null)
            {
                foreach (string dayplan in DayJourney)
                {
                    EyouSoft.Model.TourStructure.TourStandardPlan model = new EyouSoft.Model.TourStructure.TourStandardPlan();
                    //model.PlanID = Guid.NewGuid().ToString();
                    model.PlanDay = int.Parse(dayplan);
                    model.PlanInterval = Utils.GetFormValue("SightArea" + dayplan);
                    model.Vehicle = Utils.GetFormValue("Vehicle" + dayplan);
                    model.TrafficNumber = Utils.GetFormValue("TrafficNumber" + dayplan);
                    model.House = Utils.GetFormValue("Resideplan" + dayplan);
                    model.Dinner = Utils.GetFormValue("DinnerPlan" + dayplan);
                    model.PlanContent = Utils.GetFormValue("JourneyInfo" + dayplan);
                    tourList.Add(model);
                    model = null;
                }
            }
            return tourList;
        }

        /// <summary>
        /// 写入线路行程信息
        /// </summary>
        private IList<EyouSoft.Model.TourStructure.RouteStandardPlan> InsertRouteStandardPlan()
        {
            string[] DayJourney = Utils.GetFormValues("DayJourney");
            IList<EyouSoft.Model.TourStructure.RouteStandardPlan> routeList = new List<EyouSoft.Model.TourStructure.RouteStandardPlan>();

            // 写入线路行程信息     
            if (DayJourney != null)
            {
                foreach (string dayplan in DayJourney)
                {
                    EyouSoft.Model.TourStructure.RouteStandardPlan model = new EyouSoft.Model.TourStructure.RouteStandardPlan();
                    //model.PlanID = Guid.NewGuid().ToString();
                    model.PlanDay = int.Parse(dayplan);
                    model.PlanInterval = Utils.GetFormValue("SightArea" + dayplan);
                    model.Vehicle = Utils.GetFormValue("Vehicle" + dayplan);
                    model.TrafficNumber = Utils.GetFormValue("TrafficNumber" + dayplan);
                    model.House = Utils.GetFormValue("Resideplan" + dayplan);
                    model.Dinner = Utils.GetFormValue("DinnerPlan" + dayplan);
                    model.PlanContent = Utils.GetFormValue("JourneyInfo" + dayplan);
                    routeList.Add(model);
                    model = null;
                }
            }
            return routeList;
        }
        #endregion

        #region 地接社信息
        /// <summary>
        /// 地接社信息
        /// </summary>
        /// <returns></returns>
        private IList<EyouSoft.Model.TourStructure.TourLocalityInfo> InsertLocality()
        {
            string[] LocalAgencyName = Utils.GetFormValues("AddStandardTour_LocalAgency");
            string[] License = Utils.GetFormValues("AddStandardTour_License");
            string[] LocalAgencyTel = Utils.GetFormValues("AddStandardTour_LocalAgencyTel");
            IList<EyouSoft.Model.TourStructure.TourLocalityInfo> list = new List<EyouSoft.Model.TourStructure.TourLocalityInfo>();
            if (LocalAgencyName != null)
            {
                for (int i = 0; i < LocalAgencyName.Length; i++)
                {
                    if (!String.IsNullOrEmpty(LocalAgencyName[i]))
                    {
                        EyouSoft.Model.TourStructure.TourLocalityInfo model = new EyouSoft.Model.TourStructure.TourLocalityInfo();
                        model.LocalCompanyName = LocalAgencyName[i];
                        model.LicenseNumber = License[i];
                        model.ContactTel = LocalAgencyTel[i];
                        model.OperatorId = UserInfoModel.ID;
                        list.Add(model);
                        model = null;
                    }
                }
            }
            return list;
        }
        #endregion
        #endregion
    }
}
