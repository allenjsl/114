﻿using System;
using System.Collections;
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
using System.Text;
using EyouSoft.IBLL.SystemStructure;
using System.Collections.Generic;
using EyouSoft.Model.SystemStructure;
using EyouSoft.Model.CompanyStructure;

namespace SiteOperationsCenter.LineManage
{
    /// <summary>
    /// 运营后台 散客订单统计列表查询
    /// 蔡永辉 2011-12-22
    /// </summary>
    public partial class FitStatistics : EyouSoft.Common.Control.YunYingPage
    {
        /// <summary>
        /// 分页
        /// </summary>
        protected int currentPage = 0;
        /// <summary>
        /// 操作该页面的权限
        /// </summary>
        protected bool IsGrantUpdate = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentPage = Utils.GetInt(Request.QueryString["Page"]);
            string action = Utils.GetQueryStringValue("action");//ajax请求类型
            if (!IsPostBack)
            {
                BindDropDownList();
            } 

            if (!string.IsNullOrEmpty(action))
            {
                switch (action)
                {
                    case "GetLineByType"://获取线路根据类型
                        GetLineByType();
                        break;
                    case "GetCompanyByLine"://获取专线商根据线路
                        GetCompanyByLine();
                        break;
                }
            }
        }


        #region 根据专线类型获取专线
        protected void GetLineByType()
        {
            string argument = Utils.GetQueryStringValue("argument");
            ISysArea bll = EyouSoft.BLL.SystemStructure.SysArea.CreateInstance();
            int type = Utils.GetInt(argument, 0);
            IList<SysArea> list = bll.GetSysAreaList((AreaType)type);
            StringBuilder strb1 = new StringBuilder("{tolist:[");
            foreach (SysArea item in list)
            {
                strb1.Append("{\"AreaId\":\"" + item.AreaId + "\",\"AreaName\":\"" + item.AreaName + "\"},");
            }
            Response.Clear();
            Response.Write(strb1.ToString().TrimEnd(',')+"]}");
            Response.End();
        }

        #endregion

        #region 获取专线商根据线路
        protected void GetCompanyByLine()
        {
            int areaid = Utils.GetInt(Utils.GetQueryStringValue("argument"));
            QueryNewCompany Searchmodel = new QueryNewCompany();
            if (areaid != 0)
                Searchmodel.AreaId = areaid;
            IList<CompanyDetailInfo> list = EyouSoft.BLL.CompanyStructure.CompanyInfo.CreateInstance().GetAllCompany(0, Searchmodel);
            StringBuilder strb = new StringBuilder("{tolist:[");
            foreach (Company item in list)
            {
                strb.Append("{\"ID\":\"" + item.ID + "\",\"CompanyName\":\"" + item.CompanyName + "\"},");
            }
            Response.Clear();
            Response.Write(strb.ToString().TrimEnd(',') + "]}");
            Response.End();
        }

        #endregion

        #region 绑定列表

        protected void BindDropDownList()
        {
            //线路类型
            foreach (EnumObj item in EnumObj.GetList(typeof(AreaType)))
            {
                if (Utils.GetInt(item.Value) < 3)
                {
                    this.DropSearchLineType.Items.Add(new ListItem(item.Text, item.Value));
                }
            }
            this.DropSearchLineType.Items.Insert(0, new ListItem("线路类型", "-1"));
        }

        #endregion
    }
}
