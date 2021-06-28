<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="NAM.signUp" %>
<%--Created by : Bojana Filipovic--%>
<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Skapa ett konto</title>

     <!-- Font -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
    <!-- End font -->
    <!-- Info messages scripts-->
     <script src="js/infoMessages.js"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>


    <!-- SignUp style -->
    <style type="text/css">
        /* Start footer rules */
        .egen {
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .copyright {
            background-color: #fff;
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
        /* Start Global rules */
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        /* End Global rules */

        /* Start body rules */
        body {
            background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            background-attachment: fixed;
            background-repeat: no-repeat;
            font-family: 'Vibur', cursive;
            /*   the main font */
            font-family: 'Abel', sans-serif;
            opacity: .95;
            /* background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%); */
        }



        /* |||||||||||||||||||||||||||||||||||||||||||||*/
        /* //////////////////////////////////////////// */

        /* End body rules */

        /* Start form  attributes */
        form {
            width: 450px;
            min-height: 500px;
            height: auto;
            border-radius: 5px;
            margin: 2% auto;
            box-shadow: 0 9px 50px hsla(20, 67%, 75%, 0.31);
            padding: 2%;
            background-image: linear-gradient(-225deg, #E3FDF5 50%, #FFE6FA 50%);
        }
            /* form Container */
            form .con {
                display: -webkit-flex;
                display: flex;
                -webkit-justify-content: space-around;
                justify-content: space-around;
                -webkit-flex-wrap: wrap;
                flex-wrap: wrap;
                margin: 0 auto;
            }

        /* the header form form */
        header {
            margin: 2% auto 10% auto;
            text-align: center;
        }
            /* Login title form form */
            header h2 {
                font-size: 250%;
                font-family: 'Playfair Display', serif;
                color: #3e403f;
            }
            /*  A welcome message or an explanation of the login form */
            header p {
                letter-spacing: 0.05em;
            }



        /* //////////////////////////////////////////// */
        /* //////////////////////////////////////////// */


        .input-item {
            background: #fff;
            color: #333;
            padding: 14.5px 0px 15px 9px;
            border-radius: 5px 0px 0px 5px;
        }



        /* Show/hide password Font Icon */
        #eye {
            background: #fff;
            color: #333;
            margin: 5.9px 0 0 0;
            margin-left: -20px;
            padding: 15px 9px 19px 0px;
            border-radius: 0px 5px 5px 0px;
            float: right;
            position: relative;
            right: 1%;
            top: -.2%;
            z-index: 5;
            cursor: pointer;
        }
        /* inputs form  */
        input[class="form-input"] {
            width: 240px;
            height: 50px;
            margin-top: 2%;
            padding: 15px;
            font-size: 16px;
            font-family: 'Abel', sans-serif;
            color: #5E6472;
            outline: none;
            border: none;
            border-radius: 0px 5px 5px 0px;
            transition: 0.2s linear;
        }

        input[id="txt-input"] {
            width: 250px;
        }
        /* focus  */
        input:focus {
            transform: translateX(-2px);
            border-radius: 5px;
        }

        /* //////////////////////////////////////////// */
        /* //////////////////////////////////////////// */

        /* input[type="text"] {min-width: 250px;} */
        /* buttons  */
        button {
            display: inline-block;
            color: #252537;
            width: 280px;
            height: 50px;
            padding: 0 20px;
            background: #fff;
            border-radius: 5px;
            outline: none;
            border: none;
            cursor: pointer;
            text-align: center;
            transition: all 0.2s linear;
            margin: 7% auto;
            letter-spacing: 0.05em;
        }
        /* Submits */
        .submits {
            width: 48%;
            display: inline-block;
            float: left;
            margin-left: 2%;
        }

        /*       Forgot Password button FAF3DD  */
        .frgt-pass {
            background: transparent;
        }

        /*     Sign Up button  */
        .sign-up {
            background: #B8F2E6;
        }


        /* buttons hover */
        button:hover {
            transform: translatey(3px);
            box-shadow: none;
        }

        /* buttons hover Animation */
        button:hover {
            animation: ani9 0.4s ease-in-out infinite alternate;
        }

        @keyframes ani9 {
            0% {
                transform: translateY(3px);
            }

            100% {
                transform: translateY(5px);
            }
        }
    </style>
    <!-- End  SignUp style -->

</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay">
             <!-- SignUp form-->
            <form>
                 <div class="con">
                     <button class="btn submits sign-up">
                        <a href="index.aspx">Startsidan</a>
                         <i class="fa fa-home" aria-hidden="true"></i>
                    </button>
                     <header class="head-form">
                        <h2>Skapa ett konto</h2>
                         <br />
                        <p>Var vänlig och fyll i dina uppgifter!</p>
                    </header>
                     <br>
                    <div class="field-set">
                         <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                         <input class="form-input" id="username" runat="server" type="text" placeholder="Användarnamn" required>
                        <br>
                         <span class="input-item">
                            <i class="fa fa-mail-bulk"></i>
                        </span>
                         <input class="form-input" id="email" runat="server" type="text" placeholder="E-post" required>
                        <br />
                         <span class="input-item">
                            <i class="fa fa-key"></i>
                        </span>
                         <input class="form-input" runat="server" type="password" placeholder="Lösenord" id="pwd" name="password" required>
                         <span>
                            <i class="fa fa-eye" aria-hidden="true" type="button" id="eye"></i>
                        </span>
                        <br>
                         <button class="log-in" runat="server" id="signUp_Btn">Skapa ett konto</button>
                    </div>
                     <div class="other">
                          <button class="btn sign-up" runat="server" id="logIn_Btn">
                            Har ett konto redan?  Logga in 
                             <i class="fa fa-user" aria-hidden="true"></i>
                        </button>
                         <br />
                          <asp:Label ID="doneLbl" runat="server"></asp:Label>
                         <br />
                          <button class="btn sign-up" visible="false" runat="server" id="newLogIn_btn">
                             Logga in 
                             <i class="fa fa-user" aria-hidden="true"></i>
                        </button>
                      </div>
                 </div>
              </form>
        </div>
          <!--  footer -->
                  <div class="copyright egen">
                    <p>© 2021 All Rights Reserved. NAM</p>
                </div>
          <!-- end footer -->

          <%-- Show/hide password onClick of button using Javascript only--%>
         <script type="text/javascript">
             // Show/hide password onClick of button using Javascript only
            // https://stackoverflow.com/questions/31224651/show-hide-password-onclick-of-button-using-javascript-only
             function show() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'text');
            }

            function hide() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'password');
            }

            var pwShown = 0;

            document.getElementById("eye").addEventListener("click", function () {
                if (pwShown == 0) {
                    pwShown = 1;
                    show();
                } else {
                    pwShown = 0;
                    hide();
                }
            }, false);
           </script>
    </form>
</body>
</html>
