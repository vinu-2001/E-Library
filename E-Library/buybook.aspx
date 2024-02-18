<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="buybook.aspx.cs" Inherits="E_Library.buybook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Selling Books List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [sell_book]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" InsertVisible="False" >
                                        
                                        <ItemStyle Font-Bold="True" />
                                        
                                        </asp:BoundField>
                                        
                                      
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">

                                                             <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div> 

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Seller Name -<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("seller_name") %>'></asp:Label>
                                                                    &nbsp;| Author -<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    &nbsp;| Publisher -<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>

                                                                </div>
                                                            </div> 

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Genre -<asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language -<asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                    &nbsp;| Publish Date -<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Book Condition -<asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("book_condition") %>'></asp:Label>
                                                                    &nbsp;| Book Ratings -<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_ratings") %>'></asp:Label>
                                                                    &nbsp;| Pages -<asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("pages") %>'></asp:Label>

                                                                </div>
                                                            </div> 

                                                             <div class="row">
                                                                <div class="col-12">

                                                                    Original Price -<asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("o_price") %>'></asp:Label>
                                                                    &nbsp;| Selling Price -<asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("s_price") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            
                                                             <div class="row">
                                                                <div class="col-12">

                                                                    Payment Options: Contact -<asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("p_contact") %>'></asp:Label>
                                                                    &nbsp;| UPIs -<asp:Label ID="Label15" runat="server" Font-Bold="True" Text='<%# Eval("p_upis") %>'></asp:Label>

                                                                </div>
                                                            </div> 

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Book Description -<asp:Label ID="Label11" runat="server" Font-Bold="true" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" CssClass="img-fluid " runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                      
                                        
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Buy Book</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" width="150px" height="150px" src="imgs/buybook.png"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                         
                        <div class="row">

                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox Class="form-control mr-1" ID="TextBox7" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton1" class="btn btn-primary"  runat="server" OnClick="LinkButton1_click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <%--<asp:LinkButton ID="LinkButton1" class="btn btn-primary"  runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox12" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                       <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        
                        &nbsp

                        <div class="row">

                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Marathi" Value="Marathi"></asp:ListItem>
                                        <asp:ListItem Text="Sanskrit" Value="Sanskrit"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                        <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                        <asp:ListItem Text="Gujrati" Value="Gujrati"></asp:ListItem>
                                        <asp:ListItem Text="Bangali" Value="Bangali"></asp:ListItem>
                                        <asp:ListItem Text="Mandarin" Value="Mandarin"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" Class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" Class="form-control" runat="server"></asp:TextBox>
                                </div>

                                <label>Publish Date</label>
                                <div class="form-group">
                                     <asp:TextBox Class="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                              <asp:ListBox ID="ListBox1" Class="form-control" runat="server" SelectionMode="Multiple" Rows="5"><asp:ListItem Text="Action" Value="Action" />
                              <asp:ListItem Text="Adventure" Value="Adventure" />
                              <asp:ListItem Text="Comic Book" Value="Comic Book" />
                              <asp:ListItem Text="Self Help" Value="Self Help" />
                              <asp:ListItem Text="Motivation" Value="Motivation" />
                              <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                              <asp:ListItem Text="Wellness" Value="Wellness" />
                              <asp:ListItem Text="Crime" Value="Crime" />
                              <asp:ListItem Text="Drama" Value="Drama" />
                              <asp:ListItem Text="Fantasy" Value="Fantasy" />
                              <asp:ListItem Text="Horror" Value="Horror" />
                              <asp:ListItem Text="Poetry" Value="Poetry" />
                              <asp:ListItem Text="Personal Development" Value="Personal Development" />
                              <asp:ListItem Text="Romance" Value="Romance" />
                              <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                              <asp:ListItem Text="Suspense" Value="Suspense" />
                              <asp:ListItem Text="Thriller" Value="Thriller" />
                              <asp:ListItem Text="Art" Value="Art" />
                              <asp:ListItem Text="Autobiography" Value="Autobiography" />
                              <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                              <asp:ListItem Text="Health" Value="Health" />
                              <asp:ListItem Text="History" Value="History" />
                              <asp:ListItem Text="Math" Value="Math" />
                              <asp:ListItem Text="Textbook" Value="Textbook" />
                              <asp:ListItem Text="Science" Value="Science" />
                              <asp:ListItem Text="Travel" Value="Travel" /></asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Book Condition</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="As new" Value="As new"></asp:ListItem>
                                        <asp:ListItem Text="Fine" Value="Fine"></asp:ListItem>
                                        <asp:ListItem Text="Very good" Value="Very good"></asp:ListItem>
                                        <asp:ListItem Text="Good" Value="Good"></asp:ListItem>
                                        <asp:ListItem Text="Fair" Value="Fair"></asp:ListItem>
                                        <asp:ListItem Text="Poor" Value="Poor"></asp:ListItem>
                                        <asp:ListItem Text="Ex-library" Value="Ex-library"></asp:ListItem>
                                        <asp:ListItem Text="Book club" Value="Book club"></asp:ListItem>
                                        <asp:ListItem Text="Binding copy" Value="Binding copy"></asp:ListItem>
                                    </asp:DropDownList>
                                   
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Book Ratings</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control"  ID="DropDownList3" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="1 Star" Value="1 Star"></asp:ListItem>
                                        <asp:ListItem Text="2 Star" Value="2 Star"></asp:ListItem>
                                        <asp:ListItem Text="3 Star" Value="3 Star"></asp:ListItem>
                                        <asp:ListItem Text="4 Star" Value="4 Star"></asp:ListItem>
                                        <asp:ListItem Text="5 Star" Value="5 Star"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>


                      

                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox11" runat="server" placeholder="Pages" TextMode="Number" ReadOnly="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                          <div class="row">

                                  <div class="col-md-4">
                                <label>Original Price</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox9" runat="server" placeholder="Rs" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Selling Price</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox10" runat="server" placeholder="Rs" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                           <div class="col-md-4">
                               &nbsp

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox3" runat="server" placeholder="Book Description" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success"  runat="server" Text="Add to Cart" OnClick="Button1_click" />
                                <%--<asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />--%>
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
