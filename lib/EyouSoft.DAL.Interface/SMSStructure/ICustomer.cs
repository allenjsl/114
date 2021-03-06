﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EyouSoft.IDAL.SMSStructure
{
    /// <summary>
    /// 短信中心-客户信息及客户类型数据访问类接口
    /// </summary>
    /// Author:汪奇志 2010-03-26
    /// 增加GetMobiles函数 ，根据条件获取接收短信号--李焕超--2010-12-17
    public interface ICustomer
    {
        /// <summary>
        /// 插入客户类型信息,返回0插入失败,>0时为插入的类型编号
        /// </summary>
        /// <param name="categoryInfo">客户类型业务实体</param>
        /// <returns></returns>
        int InsertCategory(EyouSoft.Model.SMSStructure.CustomerCategoryInfo categoryInfo);

        /// <summary>
        /// 删除客户类型信息
        /// </summary>
        /// <param name="CategoryId">类型编号</param>
        /// <returns></returns>
        bool DeleteCategory(int CategoryId);

        /// <summary>
        /// 根据指定的公司编号获取公司的所有客户类型信息
        /// </summary>
        /// <param name="companyId">公司编号</param>
        /// <returns></returns>
        IList<EyouSoft.Model.SMSStructure.CustomerCategoryInfo> GetCategorys(string companyId);

        /// <summary>
        /// 插入客户信息
        /// </summary>
        /// <param name="customerInfo">客户信息业务实体</param>
        /// <returns>返回处理结果</returns>
        bool InsertCustomer(EyouSoft.Model.SMSStructure.CustomerInfo customerInfo);

        /// <summary>
        /// 根据指定条件获取客户信息
        /// </summary>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="pageIndex">当前页索引</param>
        /// <param name="recordCount">总记录数</param>
        /// <param name="companyId">公司编号</param>
        /// <param name="customerCompanyName">客户公司名称 为空时不做为查询条件</param>
        /// <param name="customerUserFullName">客户联系人姓名 为空时不做为查询条件</param>
        /// <param name="mobile">手机号码 为空时不做为查询条件</param>
        /// <param name="categoryId">客户类型编号 -1时不做为查询条件</param>
        /// <param name="source">客户来源</param>
        /// <param name="provinceId">省份ID</param>
        /// <param name="cityId">城市ID</param>
        /// <returns></returns>
        IList<EyouSoft.Model.SMSStructure.CustomerInfo> GetCustomers(int pageSize, int pageIndex, ref int recordCount, string companyId, string customerCompanyName, string customerUserFullName, string mobile, int categoryId, EyouSoft.Model.SMSStructure.CustomerInfo.CustomerSource source, int provinceId, int cityId);

        /// <summary>
        /// 获取客户总数
        /// </summary>
        /// <returns></returns>
        int GetCustomersCount();

        /// <summary>
        /// 根据指定条件获取接收短信号信息
        /// </summary>
        /// <param name="companyId">公司编号</param>
        /// <param name="mobile">手机号码 为空时不做为查询条件</param>
        /// <param name="categoryId">客户类型编号 -1时不做为查询条件</param>
        /// <param name="source">客户来源</param>
        /// <param name="provinceId">省份ID</param>
        /// <param name="cityId">城市ID</param>
        /// <returns></returns>
        IList<EyouSoft.Model.SMSStructure.AcceptMobileInfo> GetMobiles(string companyId, string mobile, int categoryId, EyouSoft.Model.SMSStructure.CustomerInfo.CustomerSource source, int provinceId, int cityId);

        /// <summary>
        /// 删除客户信息
        /// </summary>
        /// <param name="customerId">客户编号</param>
        /// <returns></returns>
        bool DeleteCustomer(string customerId);

        /// <summary>
        /// 获取客户信息
        /// </summary>
        /// <param name="customerId">客户编号</param>
        /// <returns></returns>
        EyouSoft.Model.SMSStructure.CustomerInfo GetCustomerInfo(string customerId);

        /// <summary>
        /// 更新客户信息
        /// </summary>
        /// <param name="customerInfo">客户信息业务实体</param>
        /// <returns>返回处理结果</returns>
        bool UpdateCustomer(EyouSoft.Model.SMSStructure.CustomerInfo customerInfo);

        /// <summary>
        /// 判断客户手机号码是否存在
        /// </summary>
        /// <param name="companyId">公司编号</param>
        /// <param name="mobile">客户号码</param>
        /// <param name="customerId">客户编号</param>
        /// <returns></returns>
        bool IsExistsCustomerMobile(string companyId, string mobile, string customerId);
    }
}
