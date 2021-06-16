﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="NAM.aboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Om oss</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />

    <!-- Info messages scripts-->
    <script src="js/infoMessages.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- End  Info messages scripts-->

    <!-- Navbar style-->
    <link href="css/navbar.css" rel="stylesheet" />

    <!-- Shared style-->
    <link href="css/egen.css" rel="stylesheet" />

    <!-- Footer style-->
    <style>
        /*##### Global Classes #####*/

        /*The footer will stay at the  bottom*/
        .egen {
            height: 100%
        }

        * {
            margin: 0;
            padding: 0;
        }

        .clearfix {
            clear: both;
        }

        .center {
            text-align: center;
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

        .clr1 {
            background: #FFFFFF;
            color: #333743;
        }

        .clr2 {
            background: #F1F3F5;
            color: #8F94A3;
        }

        .clr3 {
            background: #3E4352;
            color: #BDC3CF;
        }

        .clr4 {
            background: #636A7D;
            color: #E3E7F2;
        }

        .clr5 {
            background:;
            color: #F1F3F5;
        }

        .clr6 {
            background:;
            color: #39B5A1;
        }

        .clr7 {
            background:;
            color: #D45245;
        }

        a {
            color: #BDC3CF;
            text-decoration: none;
        }

            a:hover {
                color: #ffffff;
                text-decoration: underline;
            }

            a:visited {
            }

        /*##### Footer Structure #####*/
        .bo-wrap {
            clear: both;
            width: auto;
        }

        .bo-footer {
            clear: both;
            width: auto;
            padding: 5px;
            width: 960px;
            margin: 0 auto;
        }

        .bo-footer-social {
            text-align: center;
            line-height: 1px;
        }

        .bo-footer-smap {
            width: 300px;
            float: left;
            padding: 5px 10px;
            text-align: left;
            font-size: 18px;
        }

        .bo-footer-uonline {
            width: 300px; /* Account for margins + border values */
            float: left;
            padding: 5px 10px;
            text-align: center;
        }

        .bo-footer-power {
            width: 300px;
            padding: 5px 10px;
            float: left;
            text-align: right;
            font-size: 14px;
            color: #636A7D;
            vertical-align: middle;
        }

        .bo-footer-copyright {
            text-align: center;
            color: #BDC3CF
        }



        /*##### Footer Responsive #####*/
        /* for 980px or less */
        @media screen and (max-width: 980px) {

            .bo-footer {
                width: 95%;
                padding: 1% 2%;
            }

            .bo-footer-smap {
                width: 46%;
                padding: 1% 2%;
            }

            .bo-footer-uonline {
                width: 46%;
                padding: 1% 2%;
                float: right;
                text-align: right;
            }

            .bo-footer-power {
                clear: both;
                padding: 1% 2%;
                width: auto;
                float: none;
                text-align: center;
            }

            .egen {
                /* position: fixed;*/
                bottom: 0;
                width: 100%;
                height: auto
            }
        }
        /* for 700px or less */
        @media screen and (max-width: 600px) {

            .bo-footer-smap {
                width: auto;
                float: none;
                text-align: center;
            }

            .bo-footer-uonline {
                width: auto;
                float: none;
                text-align: center;
            }

            .bo-footer-power {
                width: auto;
                float: none;
                text-align: center;
            }

            .egen {
                /*position: fixed;*/
                bottom: 0;
                width: 100%;
                height: auto
            }
        }
        /* for 480px or less */
        @media screen and (max-width: 480px) {
            .egen {
                /* position: fixed;*/
                bottom: 0;
                width: 100%;
                height: auto
            }
        }
    </style>

    <!-- Content style-->
    <style>
        .first {
            width: 25%;
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
            font-size: x-large
        }

        .third {
            width: 25%;
            font-size: x-large
        }

        .fourth {
            width: 25%;
            border: 1px solid black;
            background-color: #F1F3F5;
            width: 50%;
            padding: 10px;
            font-size: x-large
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
            <a href="#" class="nav-logo"><img src="images/NamLogo2.png" style ="width:20%"/></a>
            <ul class="nav-menu">
                   <li class="nav-item">
                    <a href="index.aspx" class="nav-link ">
                        Startsidan
                    </a>
                </li>
                <li class="nav-item">
                    <a href="aboutUs.aspx" class="nav-link active">
                        Om oss
                    </a> 
                </li>
                <li class="nav-item">
                    <a href="contactUs.aspx" class="nav-link">
                        Kontakta oss
                    </a>
                </li>
                   <li class="nav-item">
                    <button runat="server" id="logIn_Btn" class="nav-link btnStyle"> 
                        Logga in 
                     </button>  
                    <button style="display:none" runat="server"  id="dash_Btn" class="nav-link btnStyle">
                         Panel
                      </button> 
                 </li>
                <li class="nav-item">
                     <button runat="server" id="signUp_Btn" class="nav-link btnStyle">
                         Skapa ett konto
                      </button> 
                   <button style="display:none" runat="server"  id="logOut_Btn" class="nav-link btnStyle">
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

         <!--Start content-->
          <main>
           <center>
              <br />
              <div class="first">
                    <h1>TEAMET BAKOM NAM</h1>
               </div>
              <br />
              <div class="second">
                  <br />
                  <p>
                      Vi är 3 stycken miljömedvetna, ambitiösa <br />
                      personer som brinner för att minska dagens <br />
                      gigantiska matsvinn. Dels genom <br />
                      personliga handlingar som att inte lita <br />
                      blint på "bäst före datum" men också <br />
                      genom användningen av vår webbsida <br />
                      NAM
                  </p>
              </div>
              <div class="third">
                  <br />
                  <h1>Dreams & visions</h1>
                  <h3>"Set your goals high and don't stop until you get there"</h3>
                  
              </div>
               <br />
               <div class="fourth">
                   <p>
                      Vi drömmer såklart om <br />
                      att uppnå en minskat matsvinn på <br />
                      ett sätt som är enkelt för alla, och <br />
                      som verkan kostar i tid eller <br />
                      pengar. Men vi hoppas även på <br />
                      att vårt arbete ska öka kunskapen <br />
                      om matsvinnets negativa <br />
                      mjlöpåverkan.
                  </p>
               </div>
              <br />
           </center>
            </main>
        <!-- End content-->

            <!-- Start footer-->
        <div class="egen">
            <div class="bo-wrap clr4">
                <div class="bo-footer">
                    <div class="bo-footer-social"></div>
                </div>
            </div>
            <div class="bo-wrap clr3">
                <div class="bo-footer">
                    <div class="bo-footer-smap">
                        | <a href="Policy.aspx">Policy</a> |
                    </div>
                    <div class="bo-footer-uonline">
                        <script id="_wautoy">
                            var _wau = _wau || [];
                            _wau.push(["small", "p6egqc1t5bze", "toy"]);
                            (function () {
                                var s = document.createElement("script"); s.async = true;
                                s.src = "http://widgets.amung.us/small.js";
                                document.getElementsByTagName("head")[0].appendChild(s);
                            })();
                        </script>
                    </div>
                    <div class="bo-footer-power">
                        Powered By  - <a href="#">NAM Developers</a>
                        <br />
                        <a href="#">+46- 768307878</a>
                        <br />
                        <a href="#">Malmö, Sverige</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="bo-wrap clr4">
                <div class="bo-footer">
                    <div class="bo-footer-copyright">&copy;2021 NAM  All rights reserved.</div>
                </div>
            </div>
        </div>    
        <!-- End footer-->

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
    </form>
</body>
</html>
