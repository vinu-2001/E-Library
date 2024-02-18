<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="E_Library.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/Library%20Wallpaper%201.png" class="img-fluid" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our 3 primary features -</b></p>
                    </center>
                </div>
            </div>
                
            <div class="row">
                <div class="col-md-4">
                    <center>
                    
                        <asp:ImageButton ID="ImageButton1" runat="server" width="150px" src="imgs/digital-inventory.png" OnClick="ImageButton1_Click" OnClientClick="return confirm('If you are not admin then you cannot Access this feature. If you are admin Click OK.')" />
                   
                        <h4>Book Inventory</h4>
                    <p class="text-justify">This is our Digital book inventory section.
                        Where you will get all books information in details.
                        To making it easy we have added such a awesome features.
                        This is only Admin feature.
                    </p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <a href="viewbook.aspx">
                    <img width="150px" src="imgs/search-online.png" /></a> 
                    <h4>Search Books</h4>
                    <p class="text-justify">This is our Digital Search Book feature.
                        Where you will get all books information in details.
                        To making it easy we have added such a awesome features.  
                    </p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <a href="defaulterlist.aspx">
                    <img width="150px" src="imgs/defaulters-list.png" /></a>
                    <h4>Defaulters-List</h4>
                    <p class="text-justify">This is Defaulter-List section.
                        Here we list the Defaulter names.
                        So please check your name and return our books.</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section>
        <img src="imgs/2ndHandImg.jpg" class="img-fluid"/>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Process</h2>
                        <p><b>We have simple step processes -</b></p>
                    </center>
                </div>
            </div>
                
            <div class="row">
                <div class="col-md-3">
                    <center>
                    <a href="usersignup.aspx">
                    <img width="150px" src="imgs/sign-up.png" />
                        </a>
                    <h4>Sign Up</h4>
                    <p class="text-justify">Here we have new member sign up page.
                        You are not member yet then hit the button and become a member.
                     </p>
                    </center>
                </div>
                <div class="col-md-3">
                    <center>
                        <a href="sellbook.aspx">
                    <img width="150px" src="imgs/sellbook.png" /></a>
                    <h4>Sell Books</h4>
                    <p class="text-justify">This is our main feature.
                        Sell your books here.
                        Become book seller and make profit.</p>
                    </center>
                </div>
                <div class="col-md-3">
                    <center>
                        <a href="buybook.aspx">
                    <img width="150px" src="imgs/buybook.png" /></a>
                    <h4>Buy Books</h4>
                    <p class="text-justify">Buy books from our store and read grab some knowledge.
                        Repeat<>Repeat.</p>
                    </center>
                </div>
                <div class="col-md-3">
                    <center>
                    <img width="150px" src="imgs/library.png" />
                    <h4>Visit Us</h4>
                    <p class="text-center">Know about us</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
