<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="policy.aspx.cs" Inherits="NAM.policy" %>
 <%--Created by : Mohanad Oweidat--%>
<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NAM-Policy</title>

        <!-- Footer style-->
    <style>
        /*##### Global Classes #####*/

        /*The footer will stay at the bottom*/
        .egen {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: auto
        }

        body {
            background-image: url('images/background_s.png');
            background-repeat: repeat;
        }

        * {
            margin: 0;
            padding: 0px;
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
                position: fixed;
                bottom: 0;
                width: 100%;
                height: auto
            }

            /*The wil give some empty space before the footer start.*/
            .content {
                min-height: calc(150vh - 10px);
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
                position: fixed;
                bottom: 0;
                width: 100%;
                height: auto
            }

            /*The wil give some empty space before the footer start.*/
            .content {
                min-height: calc(160vh - 10px);
            }
        }
        /* for 480px or less */
        @media screen and (max-width: 480px) {
            .egen {
                position: fixed;
                bottom: 0;
                width: 100%;
                height: auto
            }

            /*The wil give some empty space before the footer start.*/
            .content {
                min-height: calc(140vh - 10px);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
          <center>
              <br />
            <h1>INTEGRITETSPOLICY</h1>
            <img src="images/NamLogo.png" />
             
            <h1>Uppgifterna vi samlar in om användare:</h1>
            <h2>Det finns flera områden på webbplatsen och / eller i programmet där du kan bli ombedd att ange personlig information som användare som:</h2>
            <h4>- Ditt namn<br />
                - E-post <br />
                - Lösenord <br />
           </h4>
             <h1>När du använder NAM som restaurang bör du tillåta att prgrammet får åtkomst till din personliga information som:</h1>
            
            <h4>
                - Namn<br />
                - Din restaurang adress<br />
                - E-post<br />
                - Telefonnummer<br />
            </h4>
            <h4>-----------------------------------------------------------------------------------------------------------------------------------</h4>
            <h1>Under inga omständigheter kommer NAM att sälja eller dela personlig information om dig eller någon person eller organisation utom:</h1>
            <h3> * Supportteamet som kommer att kontakta dig för att få hjälp och löser ditt problem på rätt sätt.</h3>
            <h3>
                Om du har några frågor, vänligen kontakta oss på  <a href='mailto:companycompanymh2020@gmail.com'>companycompanymh2020@gmail.com</a> för att hjälpa dig vidare med ditt problem.<br />
                eller genom att klicka här: <a href="contactUs.aspx">Kontakt sidan</a> <br />
             </h3>
            <br />
            <br />
            <br />
            <br />
            <h1>Tack för att ni använder NAM!</h1>
         </center>
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
                <a href="index.aspx">Satartsidan</a> | <a href="contactUs.aspx">Kontakta oss</a>
	          </div>
	          <div class="bo-footer-uonline">
                   <script id="_wautoy">
                       var _wau = _wau || [];
                       _wau.push(["small", "p6egqc1t5bze", "toy"]);
                       (function (){
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
              </div>
    </form>
</body>
</html>
