<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="defaulterlist.aspx.cs" Inherits="E_Library.defaulterlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
       
          <div class="row">
              <div class="col-sm-12">
                  <center><h3>Defaulter-List</h3></center>
                  <div class="row">
                      <div class="col-sm-12 col-md-12">
                             <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="true">
                                 <asp:Label ID="Label1" runat="server" Text="Defaulters Name and Details are Highlighted in LightRed">
                                 </asp:Label>
                            </asp:Panel>
                      </div>
                  </div>
                  <br />
                  <div class="row">
                      <div class="col" >
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" >
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book  Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                      </div>
                  </div>
                 <a href="homepage.aspx"><<< Back to Home</a><br />
                <br />
              </div>
          </div>
    
    </div>

</asp:Content>
