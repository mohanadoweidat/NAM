<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userOrders.aspx.cs" Inherits="NAM.User.userOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Anvädarens beställningar</title>

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
                                <a href="../index.aspx" class="nav-link">Startsidan </a>
                             </li>
                            <li class="nav-item">
                                <a href="userPanel.aspx" class="nav-link ">Användarens panel</a>
                             </li>
                              <li class="nav-item">
                                <a href="userOrders.aspx" class="nav-link active">Dina beställningar</a>
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
             <h2 class="first">Dina beställningar:</h2>
     <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive text-center">
            <asp:GridView ShowFooter="false" ID="ordersGrid" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Both">
                <Columns>
                    <asp:TemplateField HeaderText="Beställnings ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("order_Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt ID">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt Namn">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Produkt pris">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("productPrice") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hämtningstiden">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("pickupTime") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Antalet">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Totala priset">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("totalAmount") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Säljaren">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("storeName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table class="table table-striped table-bordered table-hover">
                        <tr style="background-color: mediumaquamarine;">
                            <th scope="col">Beställlnings id
                            </th>
                            <th scope="col">Produkt id
                            </th>
                            <th scope="col">Produkt namn
                            </th>
                            <th scope="col">Produkt pris
                            </th>
                            <th scope="col">Hämtningstiden
                            </th>
                            <th scope="col">Antalet
                            </th>
                            <th scope="col">Totala priset
                            </th>
                            <th scope="col">Säljaren
                            </th>
                         </tr>
                        <tr>
                            <td colspan="7" align="center">Det finns inga beställda produkter!
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
            </div>
          </div>
        </div>
       </div>
      </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MSSQL500015ConnectionString %>' SelectCommand="orders_getOrders_User_sp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter SessionField="logged_User" Name="username" Type="String"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>

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
