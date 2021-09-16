<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destroyStockReport.aspx.cs" Inherits="EccoHospital.stock.destroyStockReport" MasterPageFile="~/stock/HomeStock.Master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .form-horizontal {
        margin-right:2px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home ">  تقرير الهالك</span></li>
                    <li class="bring_right"><a href="">  تقرير الهالك </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title"> تقرير الهالك   </h1>
                
                <!--Start status alert-->
    <div class="form-horizontal">
      
        <div class="col-md-6 pull-right">
            من
         <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>
       </div>
        <div class="col-md-6 pull-right" >
           
                الي
             <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>
        </div>
         
        <div class="col-md-12 text-center">
            <br />
            <asp:Button CssClass="btn btn-primary" OnClick="show_Click" ID="show" Width="200px" runat="server" Text="عرض" />
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">تقرير الهالك</h3>
               <%-- <asp:Button ID="show" OnClick="show_Click" runat="server" Text="show"  CssClass=" btn bg-aqua"/>
                --%>
             <%-- <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="search..">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>--%>

            </div>
                <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                           var  x = (from PP in db.stock_destroy
                                      select PP ).ToList();
                          if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                x = (from PP in db.stock_destroy
                                    where  PP.date >= d1 && PP.date <= d2
                                         select PP ).ToList();

                            }

                         %>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                <tr> 
                          <td>#</td>
                          <td>اســـــــــــــــم الصنف</td>
                          <td> الكميه</td>
                          <td> التـــــــــاريخ</td>
                          <td> المصدر</td>
                          <td> عهده</td>

                </tr>
                       <% if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                   
                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=item.prod_name %></td>
                            <td><%=item.qty %></td>
                            <td><%=item.date %></td>
                           <td><%=item.source %></td>
                           <td><%=item.dep_name %></td>
                            
                           
                        </tr>
                        <%  i++;
    }
                                %>
                       

                        <%
    }
                            %>
              </table>
               
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

                </div>
            </div>
        </div>
    


 <%--   <script>

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
    </script>--%>
        
        
</asp:Content>


