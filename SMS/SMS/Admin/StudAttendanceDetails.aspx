﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="StudAttendanceDetails.aspx.cs" Inherits="SMS.Admin.StudAttendanceDetails" %>

<%@ Register Src="~/StudentAttendanceUserControl.ascx" TagPrefix="uc" TagName="StudentAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc:StudentAttendance ID="StudentAttendance1" runat="server" />

</asp:Content>