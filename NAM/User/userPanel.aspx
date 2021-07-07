<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPanel.aspx.cs" Inherits="NAM.User.userPanel" %>
<%--Created by : Bojana Filipovic--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Användarens panel</title>
       <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- Info messages scripts-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/infoMessages.js"></script>

     <!-- Navbar style-->
    <link href="../css/navbar.css" rel="stylesheet" />

       <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <style>
        .first {
            border: 1px solid black;
            background-color: aquamarine;
            width: 100%;
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
                                <a href="../index.aspx" class="nav-link">Startsidan </a>
                             </li>
                            <li class="nav-item">
                                <a href="userPanel.aspx" class="nav-link active">Användarens panel</a>
                             </li>
                              <li class="nav-item">
                                <a href="userOrders.aspx" class="nav-link">Dina beställningar</a>
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
                <h1>Användarens Panel
                    <br />
                    <br /> Du är inloggad som: 
                    <asp:Label ID="wlcLbl" runat="server"></asp:Label>
                </h1>
            </div>

            <div class="clear"></div>
            <h2 class="first">Produkter att beställa</h2>
           
              <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="table-responsive text-center">
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
              <asp:GridView CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" ID="orderGrid" runat="server"
                BackColor="White" ShowFooter="false" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt namn">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt beskrivning">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("productDesc") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt bild">
                        <ItemTemplate>
                            <asp:Image ID="Image1" Width="30%" runat="server" ImageUrl='<%#"data:Image/png;base64, " +
                                        Convert.ToBase64String((byte[]) Eval("productImage"))%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Orginal pris">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("oldPrice") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ny pris">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("newPrice") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="H&#228;mtningstiden">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("pickupTime") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Antal tillg&#228;ngliga">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="&#214;nskat antal">
                        <ItemTemplate>
                            <asp:TextBox plceholder="Ange hur många du vill ha av produkten" TextMode="Number" ID="userQuantity" runat="server"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S&#228;ljs av">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("storeName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Åtgärder">
                         <ItemTemplate>
                            <asp:LinkButton ID="orderBtn" OnClick="orderBtn_Click" runat="server" CommandName='<%# Eval("product_Id") %>' ToolTip="En knapp för att beställa">Beställ</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table class="table table-striped table-bordered table-hover">
                        <tr style="background-color: mediumaquamarine;">
                            <th scope="col">Produkt id
                            </th>
                            <th scope="col">Produkt namn
                            </th>
                            <th scope="col">Produkt beskrivning
                            </th>
                            <th scope="col">Produkts bild
                            </th>
                            <th scope="col">Original pris
                            </th>
                            <th scope="col">Ny pris
                            </th>
                            <th scope="col">Hämtningstid
                            </th>
                            <th scope="col">Antalet
                            </th>
                        </tr>
                        <tr>
                            <td colspan="7" align="center">Det finns inga produkter att beställa!
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <FooterStyle BackColor="White" ForeColor="#333333"></FooterStyle>

                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                </asp:GridView>
                      </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SOURCE1" runat="server" ConnectionString='<%$ ConnectionStrings:MSSQL500015ConnectionString %>' SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
              </div>
          </div>
        </div>
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
        <!-- End Navbar script-->

        <!-- SweetAlert2 scripts-->
        <script>
            function doneOrder() {
                Swal.fire({
                    icon: 'info',
                    title: 'Klar...',
                    text: 'Din beställning har lagts till.\nDu kan hitta de i användarens beställningar!',
                    footer: '<a href="userOrders.aspx">Mina beställningar</a>'
                })
            }


            function errorQuantity() {
                Swal.fire({
                    icon: 'error',
                    title: 'Fel...',
                    text: 'Var vänlig och ange giltig antal summa!'
                })
            }


            function errorEmptyQuantity() {
                Swal.fire({
                    icon: 'error',
                    title: 'Fel...',
                    text: 'Var vänlig och fyll i antal fältet!'
                })
            }

            function errorSoldOut() {
                Swal.fire({
                    icon: 'error',
                    title: 'Fel...',
                    text: 'Den här produkten har sålts och är slut, välj en annan tack!'
                })
            }
        </script>
    </form>
</body>
</html>
