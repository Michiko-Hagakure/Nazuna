<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarksDetailsUserControl.ascx.cs" Inherits="SMS.MarksDetailsUserControl" %>


<div style="background: url(''); width:100%; height:720px; background-repeat: no-repeat; background-size: cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h2 class="text-center">Marks Details</h2>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-4">
                <label for="ddlClass">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required!" 
                    ControlToValidate="ddlClass" InitialValue="Select Class" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-md-4">
                <label for="txtRoll">Student Roll Number</label>
                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Student Number" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Get Marks" OnClick="btnAdd_Click" />
            </div>
        </div>
        
        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-10">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display!"
                    AutoGenerateColumns="False" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="ClassName" HeaderText="Class">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="RollNo" HeaderText="Roll Number">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="OutOfMarks" HeaderText="Out Of Marks">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>