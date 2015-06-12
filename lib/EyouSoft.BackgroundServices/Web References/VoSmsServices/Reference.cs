﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:2.0.50727.3053
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// 此源代码是由 Microsoft.VSDesigner 2.0.50727.3053 版自动生成。
// 
#pragma warning disable 1591

namespace EyouSoft.BackgroundServices.VoSmsServices {
    using System.Diagnostics;
    using System.Web.Services;
    using System.ComponentModel;
    using System.Web.Services.Protocols;
    using System;
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="ServiceSoap", Namespace="http://tempuri.org/")]
    public partial class Service : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback SendSmsOperationCompleted;
        
        private System.Threading.SendOrPostCallback SendSms2OperationCompleted;
        
        private System.Threading.SendOrPostCallback SendSms3OperationCompleted;
        
        private System.Threading.SendOrPostCallback IsIncludeKeyWordOperationCompleted;
        
        private System.Threading.SendOrPostCallback QuerySMSLeftOperationCompleted;
        
        private System.Threading.SendOrPostCallback ChangePWdOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetMOOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public Service() {
            this.Url = global::EyouSoft.BackgroundServices.Properties.Settings.Default.EyouSoft_BackgroundServices_VoSmsServices_Service;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event SendSmsCompletedEventHandler SendSmsCompleted;
        
        /// <remarks/>
        public event SendSms2CompletedEventHandler SendSms2Completed;
        
        /// <remarks/>
        public event SendSms3CompletedEventHandler SendSms3Completed;
        
        /// <remarks/>
        public event IsIncludeKeyWordCompletedEventHandler IsIncludeKeyWordCompleted;
        
        /// <remarks/>
        public event QuerySMSLeftCompletedEventHandler QuerySMSLeftCompleted;
        
        /// <remarks/>
        public event ChangePWdCompletedEventHandler ChangePWdCompleted;
        
        /// <remarks/>
        public event GetMOCompletedEventHandler GetMOCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SendSms", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int SendSms(string enterpriseid, string mobile, string content, string account, string pwd) {
            object[] results = this.Invoke("SendSms", new object[] {
                        enterpriseid,
                        mobile,
                        content,
                        account,
                        pwd});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void SendSmsAsync(string enterpriseid, string mobile, string content, string account, string pwd) {
            this.SendSmsAsync(enterpriseid, mobile, content, account, pwd, null);
        }
        
        /// <remarks/>
        public void SendSmsAsync(string enterpriseid, string mobile, string content, string account, string pwd, object userState) {
            if ((this.SendSmsOperationCompleted == null)) {
                this.SendSmsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnSendSmsOperationCompleted);
            }
            this.InvokeAsync("SendSms", new object[] {
                        enterpriseid,
                        mobile,
                        content,
                        account,
                        pwd}, this.SendSmsOperationCompleted, userState);
        }
        
        private void OnSendSmsOperationCompleted(object arg) {
            if ((this.SendSmsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SendSmsCompleted(this, new SendSmsCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SendSms2", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int SendSms2(string enterpriseId, string mobile, string content, string account, string pwd, string subservicecode) {
            object[] results = this.Invoke("SendSms2", new object[] {
                        enterpriseId,
                        mobile,
                        content,
                        account,
                        pwd,
                        subservicecode});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void SendSms2Async(string enterpriseId, string mobile, string content, string account, string pwd, string subservicecode) {
            this.SendSms2Async(enterpriseId, mobile, content, account, pwd, subservicecode, null);
        }
        
        /// <remarks/>
        public void SendSms2Async(string enterpriseId, string mobile, string content, string account, string pwd, string subservicecode, object userState) {
            if ((this.SendSms2OperationCompleted == null)) {
                this.SendSms2OperationCompleted = new System.Threading.SendOrPostCallback(this.OnSendSms2OperationCompleted);
            }
            this.InvokeAsync("SendSms2", new object[] {
                        enterpriseId,
                        mobile,
                        content,
                        account,
                        pwd,
                        subservicecode}, this.SendSms2OperationCompleted, userState);
        }
        
        private void OnSendSms2OperationCompleted(object arg) {
            if ((this.SendSms2Completed != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SendSms2Completed(this, new SendSms2CompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/SendSms3", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int SendSms3(string enterpriseid, string subservicecode, string mobile, string content, string account, string pwd, string smsid) {
            object[] results = this.Invoke("SendSms3", new object[] {
                        enterpriseid,
                        subservicecode,
                        mobile,
                        content,
                        account,
                        pwd,
                        smsid});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void SendSms3Async(string enterpriseid, string subservicecode, string mobile, string content, string account, string pwd, string smsid) {
            this.SendSms3Async(enterpriseid, subservicecode, mobile, content, account, pwd, smsid, null);
        }
        
        /// <remarks/>
        public void SendSms3Async(string enterpriseid, string subservicecode, string mobile, string content, string account, string pwd, string smsid, object userState) {
            if ((this.SendSms3OperationCompleted == null)) {
                this.SendSms3OperationCompleted = new System.Threading.SendOrPostCallback(this.OnSendSms3OperationCompleted);
            }
            this.InvokeAsync("SendSms3", new object[] {
                        enterpriseid,
                        subservicecode,
                        mobile,
                        content,
                        account,
                        pwd,
                        smsid}, this.SendSms3OperationCompleted, userState);
        }
        
        private void OnSendSms3OperationCompleted(object arg) {
            if ((this.SendSms3Completed != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.SendSms3Completed(this, new SendSms3CompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/IsIncludeKeyWord", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string IsIncludeKeyWord(string content) {
            object[] results = this.Invoke("IsIncludeKeyWord", new object[] {
                        content});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void IsIncludeKeyWordAsync(string content) {
            this.IsIncludeKeyWordAsync(content, null);
        }
        
        /// <remarks/>
        public void IsIncludeKeyWordAsync(string content, object userState) {
            if ((this.IsIncludeKeyWordOperationCompleted == null)) {
                this.IsIncludeKeyWordOperationCompleted = new System.Threading.SendOrPostCallback(this.OnIsIncludeKeyWordOperationCompleted);
            }
            this.InvokeAsync("IsIncludeKeyWord", new object[] {
                        content}, this.IsIncludeKeyWordOperationCompleted, userState);
        }
        
        private void OnIsIncludeKeyWordOperationCompleted(object arg) {
            if ((this.IsIncludeKeyWordCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.IsIncludeKeyWordCompleted(this, new IsIncludeKeyWordCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/QuerySMSLeft", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int QuerySMSLeft(string enterpriseid, string account, string pwd) {
            object[] results = this.Invoke("QuerySMSLeft", new object[] {
                        enterpriseid,
                        account,
                        pwd});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void QuerySMSLeftAsync(string enterpriseid, string account, string pwd) {
            this.QuerySMSLeftAsync(enterpriseid, account, pwd, null);
        }
        
        /// <remarks/>
        public void QuerySMSLeftAsync(string enterpriseid, string account, string pwd, object userState) {
            if ((this.QuerySMSLeftOperationCompleted == null)) {
                this.QuerySMSLeftOperationCompleted = new System.Threading.SendOrPostCallback(this.OnQuerySMSLeftOperationCompleted);
            }
            this.InvokeAsync("QuerySMSLeft", new object[] {
                        enterpriseid,
                        account,
                        pwd}, this.QuerySMSLeftOperationCompleted, userState);
        }
        
        private void OnQuerySMSLeftOperationCompleted(object arg) {
            if ((this.QuerySMSLeftCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.QuerySMSLeftCompleted(this, new QuerySMSLeftCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/ChangePWd", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int ChangePWd(string enterpriseid, string account, string oldpwd, string newpwd) {
            object[] results = this.Invoke("ChangePWd", new object[] {
                        enterpriseid,
                        account,
                        oldpwd,
                        newpwd});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void ChangePWdAsync(string enterpriseid, string account, string oldpwd, string newpwd) {
            this.ChangePWdAsync(enterpriseid, account, oldpwd, newpwd, null);
        }
        
        /// <remarks/>
        public void ChangePWdAsync(string enterpriseid, string account, string oldpwd, string newpwd, object userState) {
            if ((this.ChangePWdOperationCompleted == null)) {
                this.ChangePWdOperationCompleted = new System.Threading.SendOrPostCallback(this.OnChangePWdOperationCompleted);
            }
            this.InvokeAsync("ChangePWd", new object[] {
                        enterpriseid,
                        account,
                        oldpwd,
                        newpwd}, this.ChangePWdOperationCompleted, userState);
        }
        
        private void OnChangePWdOperationCompleted(object arg) {
            if ((this.ChangePWdCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.ChangePWdCompleted(this, new ChangePWdCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetMO", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetMO(string account, string pwd) {
            object[] results = this.Invoke("GetMO", new object[] {
                        account,
                        pwd});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetMOAsync(string account, string pwd) {
            this.GetMOAsync(account, pwd, null);
        }
        
        /// <remarks/>
        public void GetMOAsync(string account, string pwd, object userState) {
            if ((this.GetMOOperationCompleted == null)) {
                this.GetMOOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetMOOperationCompleted);
            }
            this.InvokeAsync("GetMO", new object[] {
                        account,
                        pwd}, this.GetMOOperationCompleted, userState);
        }
        
        private void OnGetMOOperationCompleted(object arg) {
            if ((this.GetMOCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetMOCompleted(this, new GetMOCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void SendSmsCompletedEventHandler(object sender, SendSmsCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SendSmsCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SendSmsCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void SendSms2CompletedEventHandler(object sender, SendSms2CompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SendSms2CompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SendSms2CompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void SendSms3CompletedEventHandler(object sender, SendSms3CompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class SendSms3CompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal SendSms3CompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void IsIncludeKeyWordCompletedEventHandler(object sender, IsIncludeKeyWordCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class IsIncludeKeyWordCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal IsIncludeKeyWordCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void QuerySMSLeftCompletedEventHandler(object sender, QuerySMSLeftCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class QuerySMSLeftCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal QuerySMSLeftCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void ChangePWdCompletedEventHandler(object sender, ChangePWdCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class ChangePWdCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal ChangePWdCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    public delegate void GetMOCompletedEventHandler(object sender, GetMOCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "2.0.50727.3053")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetMOCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetMOCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591