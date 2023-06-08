<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="EmpAttendanceDetails.aspx.cs" Inherits="SMS.Admin.EmpAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background: url(''); width:100%; height:720px; background-repeat: no-repeat; background-size: cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h2 class="text-center">Teacher Attendance Details</h2>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-4">
                <label for="txtSubject">Teacher</label>
                 <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Teacher is Required!" 
                    ControlToValidate="ddlTeacher" InitialValue="Select Teacher" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label for="txtSubject">Month</label>
                <asp:TextBox ID="txtMonth" CssClass="form-control" runat="server" TextMode="Month" required></asp:TextBox>
            </div>

            

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" 
                    OnClick="btnCheckAttendance_Click" />
            </div>
        </div>
        
        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display!"
                    AutoGenerateColumns="False">

                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <%--<asp:BoundField DataField="Status" HeaderText="Status">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>--%>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="label1" Text='<%# Boolean.Parse(Eval("Status").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        
                        </Columns>

                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
