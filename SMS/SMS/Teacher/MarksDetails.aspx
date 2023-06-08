<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMst.Master" AutoEventWireup="true" CodeBehind="MarksDetails.aspx.cs" Inherits="SMS.Teacher.MarksDetails" %>

<%@ Register Src="~/MarksDetailsUserControl.ascx" TagPrefix="uc" TagName="MarksDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<h1>New Grades Details</h1>--%>
    <uc:MarksDetails runat="server" ID="MarksDetail1" />


</asp:Content>
