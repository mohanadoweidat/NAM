<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="storePanel.aspx.cs" Inherits="NAM.Store.storePanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Restaurant Panel</title>
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

        .line{
          text-decoration: line-through;
        }

        .second {
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
                width: 100%;
            }

            
        }

        @media screen and (max-width: 600px) {

            .first,
            .second,
            .third,
            .fourth {
                width: 100%;
            }

            
            
        }

        @media screen and (max-width: 480px) {

            .first,
            .second,
            .third,
            .fourth {
               width: 100%;
            }

            
        }

        /* Start footer rules */
        /*.egen2 {
             position: fixed;
            bottom: 0;
            width: 100%;
        }*/

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
                                <a href="storePanel.aspx" class="nav-link active">Restaurant panel </a>
                            </li>
                             <li class="nav-item">
                                <a href="storeInformation.aspx" class="nav-link">Restaurant information</a>
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
                <h1>Resataurant Panel
                    <br />
                    <br />
                   Välkommen tillbaka: <asp:Label ID="wlcLbl" runat="server"></asp:Label>
                 </h1>
            </div>

            <div class="clear"></div>
             <h2 class="first">
                 Hantera produkter: <br />
                 Du kan lägga till en produkt eller redigera samt ta bort!
             </h2>
             <br />

              <div class="container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="table-responsive text-center">
                  <asp:GridView style="width:100%" CssClass="table table-striped table-bordered table-hover"  AutoGenerateColumns="False" ID="GridView1" runat="server" BackColor="White" BorderColor="#336666"
                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                    ShowFooter="True"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting"
                    OnRowEditing="GridView1_RowEditing"
                   OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Produkt id" ItemStyle-CssClass="hidden-">
                            <EditItemTemplate>
                                <asp:Label  ID="Label7" runat="server" Text='<%# Eval("product_Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Enabled="false" ID="TextBox6" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Produkt namn">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("productName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Produkt beskrivning">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("productDesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("productDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Produkt bild">
                             <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <center>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                                </center>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="30%" runat="server" ImageUrl='<%#"data:Image/png;base64, " +
                                        Convert.ToBase64String((byte[]) Eval("productImage"))%>' />
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Orginal pris">
                            <EditItemTemplate>
                                <asp:TextBox TextMode="Number" min="0" ID="TextBox3" runat="server" Text='<%# Eval("oldPrice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox min="0" TextMode="Number" ID="TextBox9" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" CssClass="line"  min="0" runat="server" Text='<%# Eval("oldPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ny pris">
                            <EditItemTemplate>
                                <asp:TextBox TextMode="Number" min="0" ID="TextBox4" runat="server" Text='<%# Eval("newPrice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox TextMode="Number" min="0" ID="TextBox10" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("newPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="H&#228;mtningstid">
                            <EditItemTemplate>
                                <asp:TextBox TextMode="Time" ID="TextBox5" runat="server" Text='<%# Eval("pickupTime") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox TextMode="Time" ID="TextBox11" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label  ID="Label6" runat="server" Text='<%# Eval("pickupTime") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Antalet">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" TextMode="Number" runat="server" Text='<%# Eval("quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox13" TextMode="Number" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="&#197;tg&#228;rder">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update">Uppdatera</asp:LinkButton>
                                 
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Avbryta</asp:LinkButton>
                                
                            </EditItemTemplate>
                            <FooterTemplate>
                                
                                <asp:LinkButton ID="addBtn" runat="server" CommandName="Insert" OnClick="addBtn_Click">Lägg till</asp:LinkButton>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Redigera</asp:LinkButton>
                                
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Tabort</asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                     <EmptyDataTemplate>
                         <table  class="table table-striped table-bordered table-hover">
                <tr style="background-color: mediumaquamarine;">
                    <th scope="col">
                        Produkt id
                    </th>
                    <th scope="col">
                        Produkt namn
                    </th>
                    <th scope="col">
                        Produkt beskrivning
                    </th>
                     <th scope="col">
                        Produkts bild
                    </th>
                     <th scope="col">
                        Original pris
                    </th>
                     <th scope="col">
                       Ny pris
                    </th>
                     <th scope="col">
                       Hämtningstid
                    </th>
                     <th scope="col">
                       Antalet
                    </th>
                </tr>
                <tr>
                    <td colspan = "7" align = "center">
                     Det finns inga produkter!
                    </td>
                </tr>
                <tr>
                    <td>
                     <asp:TextBox Enabled="false" ID="productID" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox  ID="productNameBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                       <asp:TextBox  ID="productDescBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUploadBox" runat="server" />
                    </td>
                    <td>
                         <asp:TextBox TextMode="Number" min="0"  ID="oldPriceBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Number" min="0" ID="newPriceBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Time"  ID="pickUpTimeBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Number"  ID="antaletBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                   <tr>
                     <td colspan = "7" align = "center">
                          <asp:Button ID="add_Empty" OnClick="add_Empty_Click" CssClass="btnStyle" runat="server" Text="Lägg till" />
                    </td>
            </tr>
            </table>
                    </EmptyDataTemplate>

                    <FooterStyle BackColor="Aquamarine" ForeColor="#333333"></FooterStyle>

                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" BackColor="#336666" ForeColor="White"></PagerStyle>

                    <RowStyle BackColor="White" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                </asp:GridView>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:MSSQL500015ConnectionString %>' DeleteCommand="DELETE FROM [Products] WHERE [product_Id] = @product_Id" InsertCommand="INSERT INTO [Products] ([productName], [productDesc], [productImage], [oldPrice], [newPrice], [pickupTime], [storeName]) VALUES (@productName, @productDesc, @productImage, @oldPrice, @newPrice, @pickupTime, @storeName)" SelectCommand="SELECT * FROM [Products] WHERE ([storeName] = @storeName)" UpdateCommand="UPDATE [Products] SET [productName] = @productName, [productDesc] = @productDesc, [productImage] = @productImage, [oldPrice] = @oldPrice, [newPrice] = @newPrice, [pickupTime] = @pickupTime, [storeName] = @storeName WHERE [product_Id] = @product_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="product_Id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="productName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="productDesc" Type="String"></asp:Parameter>
                        <asp:Parameter Name="productImage" Type="Object"></asp:Parameter>
                        <asp:Parameter Name="oldPrice" Type="String"></asp:Parameter>
                        <asp:Parameter Name="newPrice" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Time" Name="pickupTime"></asp:Parameter>
                        <asp:Parameter Name="storeName" Type="String"></asp:Parameter>
                    </InsertParameters>
                     <SelectParameters>
                         <asp:ControlParameter ControlID="wlcLbl" Name="storeName" PropertyName="Text" Type="String" />
                     </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="productName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="productDesc" Type="String"></asp:Parameter>
                        <asp:Parameter Name="productImage" Type="Object"></asp:Parameter>
                        <asp:Parameter Name="oldPrice" Type="String"></asp:Parameter>
                        <asp:Parameter Name="newPrice" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Time" Name="pickupTime"></asp:Parameter>
                        <asp:Parameter Name="storeName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="product_Id" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
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

         <!-- SweetAlert2 scripts-->
        <script>
            function doneEditing() {
                Swal.fire(
                    'Tack så mycket',
                    'Produkten har uppdaterats',
                    'success'
                )
            }

            function doneDelete() {
                Swal.fire(
                    'Klar',
                    'Produkten har tagits bort',
                    'success'
                )
            }

            function doneAdd() {
                Swal.fire(
                    'Klar',
                    'Produkten har lagts till',
                    'success'
                )
            }
        </script>
        <!-- End  SweetAlert2 scripts-->

         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
