<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminPanel.aspx.cs" Inherits="NAM.Admin.adminPanel" %>
 <%--Created by : Mohanad Oweidat--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Admin panel</title>
     <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- js -->
    <script src="../js/jquery-1.11.1.min.js"></script>
    <!-- End Js-->
    <!-- Info messages scripts-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/infoMessages.js"></script>
    <!-- Navbar style-->
    <link href="../css/navbar.css" rel="stylesheet" />

     <style>
        .first {
            border: 1px solid black;
            background-color: aquamarine;
            width: 50%;
            padding: 10px;
        }

        .second {
            width: 25%;
            border: 1px solid black;
            background-color: #F1F3F5;
            width: 50%;
            padding: 10px;
            font-size: x-large;
        }

        .clear {
            padding: 0.5%;
        }

        .btnStyle {
            margin: 4px;
            padding: 10px;
            background-color: aquamarine
        }

        .egen {
            padding: 10px;
        }

        @media screen and (max-width: 980px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 80%;
            }
        }

        @media screen and (max-width: 600px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 80%;
            }
        }

        @media screen and (max-width: 480px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 80%;
            }
        }

        /* Start footer rules */
        .egen2 {
             position: fixed;
            bottom: 0;
            width: 100%;
        }

        .copyright {
            background-color: aquamarine;
            padding: 20px 0px;
            margin-top: 90px;
        }

            .copyright p {
                color: #023023;
                font-size: 18px;
                line-height: 22px;
                text-align: center;
            }

            .copyright a:hover {
                color: #f70e0e
            }
        /* End footer rules */
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <!-- Navbar start-->
        <header class="header">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <nav class="navbar">
                        <a href="#" class="nav-logo">
                            <img src="../images/NamLogo2.png" style="width: 20%" /></a>
                        <ul class="nav-menu">
                            <li class="nav-item">
                                <a href="../index.aspx" class="nav-link">Startsidan
                                </a>
                            </li>
                            <li class="nav-item">
                                <button style="display: none" runat="server" id="logOut_Btn" class="nav-link btnStyle">
                                    Logga ut
                                </button>
                            </li>
                        </ul>
                        <div class="hamburger">
                            <span class="bar"></span>
                            <span class="bar"></span>
                            <span class="bar"></span>
                        </div>
                    </nav>
                </ContentTemplate>
            </asp:UpdatePanel>
        </header>
        <!-- End Navbar-->
         <br />
        <center>
            <div class="first">
                <h1>Admin Panel
                    <br />
                    <br />
                    <asp:Label ID="wlcLbl" runat="server"></asp:Label>
                </h1>
            </div>

             <div class="clear"></div>
            <h2 class="first">Anslutna restauranger/mataffärer/cafeer</h2>
            <div class="second">
               <h2><asp:Label ID="emptyGrid" runat="server"></asp:Label></h2> 
                <asp:GridView ID="connectedStoreGrid" CssClass="second" runat="server" BackColor="White" BorderColor="#336666"
                    BorderStyle="Outset" BorderWidth="3px" CellPadding="4" GridLines="Both">
                    <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>
                    <HeaderStyle BackColor="Aquamarine" Font-Bold="True" ForeColor="Black" BorderWidth="1" BorderColor="Black"></HeaderStyle>
                    <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>
                    <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>

             <div class="clear"></div>
            <h2 class="first">Lägg till en restaurang/mataffär/cafee</h2>
            <div class="second">
                <br />
                <label for="username">Användarnamn:</label>
                <br />
                <input runat="server" class="egen" id="username" />
                <br />
                <label for="email">E-post:</label>
                <br />
                <input runat="server" class="egen" id="email" />
                <br />
                <label for="pwd">Lösenord:</label>
                <br />
                <input runat="server" class="egen" id="pwd" />
                <br />
                <br />
                <button runat="server" id="add_Btn" class="btnStyle">Lägg till</button>
            </div>
                <div class="clear"></div>
         </center>

         <!--  footer -->
        <div class="copyright egen2">
            <p>© 2021 All Rights Reserved. NAM</p>
        </div>
        <!-- end footer -->

         <!-- SweetAlert2 scripts-->
        <script>
            function addStore() {
                Swal.fire(
                    'Tack så mycket',
                    'Kontot har skapats',
                    'success'
                )
            }

            function deleteStore() {
                Swal.fire(
                    'Klar',
                    'Kontot har tagits bort',
                    'success'
                )
            }

            function wrongStoreUsername() {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Användarnamnet som du angav är fel!'
                })
            }
        </script>
        <!-- End  SweetAlert2 scripts-->

       <!-- Navbar script-->
        <script>
            const hamburger = document.querySelector(".hamburger");
            const navMenu = document.querySelector(".nav-menu");
            hamburger.addEventListener("click", mobileMenu);

            function mobileMenu() {
                hamburger.classList.toggle("active");
                navMenu.classList.toggle("active");
            }

            const navLink = document.querySelectorAll(".nav-link");
            navLink.forEach(n => n.addEventListener("click", closeMenu));

            function closeMenu() {
                hamburger.classList.remove("active");
                navMenu.classList.remove("active");
            }
        </script>
        <!-- End Navbar script-->
    </form>
</body>
</html>
