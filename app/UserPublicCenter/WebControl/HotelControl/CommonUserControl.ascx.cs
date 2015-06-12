﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserPublicCenter.HotelManage
{
    /// <summary>
    /// 酒店常识控件
    /// 功能：显示酒店常识信息
    /// 创建人：戴银柱
    /// 创建时间： 2010-12-06 
    /// </summary>
    public partial class CommonUserControl : System.Web.UI.UserControl
    {
        //当前城市ID
        private int _cityId;

        public int CityId
        {
            get { return _cityId; }
            set { _cityId = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                
            }
        }
    }
}