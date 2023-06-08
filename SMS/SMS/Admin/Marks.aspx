<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SMS.Admin.Marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background: url(''); width:100%; height:720px; background-repeat: no-repeat; background-size: cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h2 class="text-center">Add Marks</h2>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-4">
                <label for="ddlClass">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required!" 
                    ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label for="txtSubject">Class Subjects</label>
                 <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required!" 
                    ControlToValidate="ddlSubject" InitialValue="Select Subject" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-4 mt-2">
                <label for="txtRoll">Student Roll Number</label>
                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number" required></asp:TextBox>
            </div>

             <div class="col-md-4 mt-2">
                <label for="txtStudMarks">Total Marks(Student Marks</label>
                <asp:TextBox ID="txtStudMarks" runat="server" CssClass="form-control" placeholder="Enter Total Marks" required></asp:TextBox>
            </div>

             <div class="col-md-4 mt-2">
                <label for="txtOutOfMarks">Out Of Marks</label>
                <asp:TextBox ID="txtOutMarks" runat="server" CssClass="form-control" placeholder="Enter Out Of Marks" required></asp:TextBox>
            </div>

        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Marks" OnClick="btnAdd_Click" />
            </div>
        </div>
        
        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display!"
                    AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ExamId"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                    DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" 
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged">
                                    <asp:ListItem>Select Class</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMS %>" 
                                    SelectCommand="SELECT * FROM [Class]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Subject">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSubjectGv" runat="server" CssClass="form-control"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Roll Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRollNoGv" runat="server" CssClass="form-control" Text='<%# Eval("RollNo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total Marks">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStudMarksGv" runat="server" CssClass="form-control" Text='<%# Eval("TotalMarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TotalMarks") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Out Of Marks">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOutOfMarksGv" runat="server" CssClass="form-control" Text='<%# Eval("OutOfMarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("OutOfMarks") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>


                        <asp:CommandField CausesValidation="false" ShowEditButton="True" HeaderText="Operation">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:CommandField>
                        </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
