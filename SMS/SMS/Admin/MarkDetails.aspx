<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="SMS.Admin.MarkDetails" %>

<%@ Register Src="~/MarksDetailsUserControl.ascx" TagPrefix="uc" TagName="MarksDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc:MarksDetails runat="server" ID="MarksDetail1" /> 


</asp:Content>
