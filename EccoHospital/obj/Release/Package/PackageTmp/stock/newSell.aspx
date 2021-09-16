﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newSell.aspx.cs" Inherits="EccoHospital.stock.newSell" MasterPageFile="~/stock/HomeStock.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home ">اذن صرف</span></li>
                    <li class="bring_right"><a href=""> اذن صرف </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">اضافة اذن صرف   </h1>
                 <asp:Label Visible="false" ID="num" runat="server" Text=""></asp:Label>
                <!--Start status alert-->
    <div class="form-horizontal">
        
        <div class="col-md-4 pull-right">
            الصنف:
           
           <asp:DropDownList ID="name"  CssClass="form-control" runat="server" ></asp:DropDownList>
            <%--DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eccoConnectionString %>" SelectCommand="SELECT * FROM [medicin]"></asp:SqlDataSource>--%>
        </div>
        <div class="col-md-4 pull-right">
           الكمية :
            <asp:TextBox  CssClass="form-control" ID="qty" runat="server"></asp:TextBox>
        </div>
      <div class="col-md-4 text-center">
            <br />
            <asp:Button CssClass="btn btn-primary" width="100px" OnClick="Button1_Click" ID="Button1" runat="server" Text="اضافه" />
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">اذن صرف :# <asp:Label  ID="invid" runat="server" Text=""></asp:Label></h3>
               <%-- <asp:Button ID="show" OnClick="show_Click" runat="server" Text="show"  CssClass=" btn bg-aqua"/>
                --%>
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="search..">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>--%>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                  <% 
                      EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                      int ii= int.Parse(invid.Text);
                      var x = (from s in db.invoice_items where s.inv_id == ii select s).ToList();
                      //DateTime d = DateTime.Now.Date;
                      //var x = (from ss in db.medicin select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr style="background-color:lightgray">
                  
                   <th>#</th>
              <th>الصنف</th>
             
              <th>الكميه</th>
            
             
              <th></th>
              <th></th>


                </tr>

   
       <% foreach (var item in x)
        { %>
                  <tr>
                  <td><%=item.id %></td>
                   
                 <td><%=item.name %></td>
                <td><%=item.quantity %></td>
              
                <td><a  href="newSell.aspx?edititem=<%=item.id %>">  <i class="fa fa-edit "></i></a></td>
            
                 <td><a href="newSell.aspx?delitem=<%=item.id %>">  <i class="fa fa-trash-o text-red"></i></a></td>

                    

                </tr>
                  
   <% }
        }
    %>
               
              </table>
                <hr style="height:2%;border-top-color:indianred" />
                 <div style="margin-right:3%;float:right;"> <label>القسم</label><asp:DropDownList Width="200px" ID="DropDownList1" CssClass="form-control" runat="server" ></asp:DropDownList></div>
               
                   <div style="float:left;margin:2% 3%">
                <asp:button runat="server" ID="btn_addImport" Text="حفظ " OnClick="btn_addImport_Click" width="100px" cssclass="btn btn-success pull-right"/> 
                </div>
            
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

                </div>
            </div>
        </div>
    


    <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
        
        
</asp:Content>
