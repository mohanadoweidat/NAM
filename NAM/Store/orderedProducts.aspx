<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderedProducts.aspx.cs" Inherits="NAM.Store.orderedProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Beställda produkter</title>
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
                                <a href="storeInformation.aspx" class="nav-link">Restaurant information </a>
                            </li>
                             <li class="nav-item">
                                <a href="orderedProducts.aspx" class="nav-link active">Beställda produkter</a>
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
                <h1>Beställda produkter för: 
                    <br />
                    <asp:Label ID="storeNameLbl" runat="server"></asp:Label>
                    <br />
                   Här kan du se dina beställda produkter.
                 </h1>
            </div>
         <br />
               <h2 class="first">Beställningar</h2>
               <div class="container-fluid">
  <div class="row">
      <div class="col-lg-12">
        <div class="table-responsive text-center">
                   <asp:GridView CssClass="table table-striped table-bordered table-hover" ShowFooter="true" 
                      AutoGenerateColumns="False" ID="ordersGrid" runat="server" BackColor="White" BorderColor="#DEDFDE" 
                      BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                     <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

                    <Columns>
                        <asp:TemplateField HeaderText="Order ID">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("order_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Produkt ID">
                            <ItemTemplate>
                                <asp:Label ID="PID" runat="server" Text='<%# Eval("product_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Produkt namn">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Produkt pris">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("productPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hämtningstid">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("pickupTime") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Antalet">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Totala priset">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("totalAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Beställaren">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("customerName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>

                     <EmptyDataTemplate>
                         <table  class="table table-striped table-bordered table-hover">
                <tr style="background-color: mediumaquamarine;">
                    <th scope="col">
                        Order ID
                    </th>
                     <th scope="col">
                        Produkt ID
                    </th>
                    <th scope="col">
                        Produkt namn
                    </th>
                    <th scope="col">
                       Produkt pris
                    </th>
                     <th scope="col">
                        Hämtningstid
                    </th>
                     <th scope="col">
                       Antalet
                    </th>
                     <th scope="col">
                      Totala priset
                    </th>
                     <th scope="col">
                      Beställaren
                    </th>
                </tr>
                <tr>
                    <td colspan = "7" align = "center">
                     Det finns inga beställningar!
                    </td>
                </tr>
                  </table>  
                         </EmptyDataTemplate>

                    <FooterStyle BackColor="#CCCC99"></FooterStyle>

                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black"></PagerStyle>

                    <RowStyle BackColor="#F7F7DE"></RowStyle>

                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
          </div>
        </div>
          </div>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MSSQL500015ConnectionString %>' SelectCommand="orders_getOrders_Store_sp" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="storeNameLbl" PropertyName="Text" Name="storeName" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
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
    </form>
</body>
</html>
