<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="storeInformation.aspx.cs" Inherits="NAM.Store.storeInformation" %>
 <%--Created by : Sahand Poursadeghi Khiavi--%>
<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant information</title>
     <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

     <!-- Info messages scripts-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/infoMessages.js"></script>

       <!-- Navbar style-->
    <link href="../css/navbar.css" rel="stylesheet" />

    <style>
        .first {
            border: 1px solid black;
            background-color: aquamarine;
            width: 100%;
            padding: 10px;
        }

        .second {
            width: 100%;
            border: 1px solid black;
            background-color: #F1F3F5;
            padding: 10px;
            font-size: x-large;
        }

        .grid {
            width: 100%;
            border: 1px solid black;
            background-color: #F1F3F5;
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
               width: 70%;
            }
        }

        @media screen and (max-width: 600px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 70%;
            }


            
        }

        @media screen and (max-width: 480px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 70%;
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
                            <img src="../images/NamLogo2.png" style="width: 20%" />
                        </a>
                        <ul class="nav-menu">
                            <li class="nav-item">
                                <a href="../index.aspx" class="nav-link">Startsidan </a>
                            </li>
                             <li class="nav-item">
                                <a href="storePanel.aspx" class="nav-link">Restaurant panel </a>
                            </li>
                             <li class="nav-item">
                                <a href="storeInformation.aspx" class="nav-link active">Restaurant information </a>
                            </li>
                             <li class="nav-item">
                                <a href="orderedProducts.aspx" class="nav-link">Beställda produkter</a>
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
                <h1>Resataurant Information
                    <br />
                    <br />
                   Här kan du se dina information samt ändra de.
                 </h1>
            </div>
         <br />
            <h2 class="first">Ändra din information</h2>
            <div class="second">
                <br />
                <label for="storeName">Restaurant namn:</label>
                <br />
                <input runat="server" class="egen" id="storeName" />
                <br />
                <label for="address">Address:</label>
                <br />
                <input runat="server" class="egen" id="address" />
                <br />
                <br />
                <button runat="server" id="edit_Btn" class="btnStyle">Ändra</button>
            </div>
               </center>

         <!--  footer -->
        <div class="copyright egen2">
            <p>© 2021 All Rights Reserved. NAM</p>
        </div>
        <!-- end footer -->

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

        <!-- SweetAlert2 scripts-->
        <script>
            function doneChange() {
                Swal.fire(
                    'Tack så mycket',
                    'Dina information har ändrats!',
                    'success'
                )
            }
        </script>
        <!-- End  SweetAlert2 scripts-->
     </form>
</body>
</html>
