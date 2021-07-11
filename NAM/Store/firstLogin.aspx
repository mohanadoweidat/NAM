<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firstLogin.aspx.cs" Inherits="NAM.Store.firstLogin" %>
 <%--Created by : Mohanad Oweidat--%>
<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Första inloggning</title>
     <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <!-- Content style-->
    <style>
        .first {
            border: 1px solid black;
            background-color: aquamarine;
            width: 50%;
            padding: 10px;
        }

        .second {
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
            border: 1px solid black;
            background-color: #F1F3F5;
            width: 50%;
            padding: 10px;
            font-size: x-large
        }

        .btnStyle {
            margin: 4px;
            padding: 10px;
            background-color: aquamarine
        }

        .egen {
            padding: 10px;
        }

        .clear {
            padding: 0.5%;
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
     <!-- Footer style-->
    <style>
        /* Start footer rules */
        .egen2 {
            /*  position: fixed;
            bottom: 0;
            width: 100%;*/
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
          <center>
                <img src="../images/NamLogo2.png" style="width: 10%" />
              <div class="first">
                <h1>Information om din restaurant/mataffär/cafee
                 </h1>
            </div>

              <div class="clear"></div>
             <h2 class="first">Var vänlig och fyll i alla fälten</h2>
            <div class="second">
                <br />
                <label for="storeName">Restaurant/mataffär/cafee- Namn:</label>
                <br />
                <input runat="server" class="egen" id="storeName" />
                <br />
                <br />
                <label for="address">Address:</label>
                <br />
                <input runat="server" class="egen" id="address" />
                <br />
                 <br />
                <button runat="server" id="add_Btn" class="btnStyle">Spara</button>
            </div>
            </center>
         <!--  footer -->
        <div class="copyright egen2">
            <p>© 2021 All Rights Reserved. NAM</p>
        </div>
        <!-- end footer -->
    </form>
</body>
</html>
