<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report2.aspx.cs" Inherits="EccoHospital.stock.report2" MasterPageFile="~/stock/HomeStock.Master"%>



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
                    <li class="bring_right"><span class="glyphicon glyphicon-home "> تقرير شراء</span></li>
                    <li class="bring_right"><a href="">  تقرير شراء </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title"> تقرير شراء   </h1>
                
                <!--Start status alert-->
    <div class="form-horizontal">
      
        <div class="col-md-4 pull-right">
            من
         <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>
       </div>
        <div class="col-md-4 pull-right" >
           
                الي
             <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>
        </div>
          <div class="col-md-4 pull-right" >
            رقم الفاتورة
             <asp:textbox validationgroup='a' cssclass="form-control" id="Textbox1" clientidmode="Static" runat="server"></asp:textbox>
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
              <h3 class="box-title">تقرير شراء</h3>
               <%-- <asp:Button ID="show" OnClick="show_Click" runat="server" Text="show"  CssClass=" btn bg-aqua"/>
                --%>
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="بحث بالصنف">
                  </div>
                </div>
                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>--%>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                  <%

                      EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                    var x= (from PP in db.stadd_items where PP.status == 1
                                 group PP by new { PP.inv_id,PP.prod_name} into g  select new {g.Key,sum=g.Sum(A=>A.quantity) } ).ToList();
                    
                      if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["from"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["to"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["num"])))
                      {
                          DateTime fromd = Convert.ToDateTime(Request.QueryString["from"].ToString());
                          DateTime to = Convert.ToDateTime(Request.QueryString["to"].ToString());
                          int codeInvoice = int.Parse(Request.QueryString["num"].ToString());
                          x = (from PP in db.stadd_items
                               join f in db.stadd on PP.inv_id equals f.id
                               where PP.status == 1 && f.date >=fromd && f.date <= to && f.id == codeInvoice
                               group PP by new { PP.inv_id, PP.prod_name } into g
                               select new { g.Key, sum = g.Sum(A => A.quantity) }).ToList();
                      }
                      else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["from"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["to"])) && String.IsNullOrEmpty(Convert.ToString(Request.QueryString["num"])))
                      {
                          DateTime fromd = Convert.ToDateTime(Request.QueryString["from"].ToString());
                          DateTime to = Convert.ToDateTime(Request.QueryString["to"].ToString());
                         // int codeInvoice = int.Parse(Request.QueryString["num"].ToString());
                          x = (from PP in db.stadd_items
                               join f in db.stadd on PP.inv_id equals f.id
                               where PP.status == 1 && f.date >= fromd && f.date <= to
                               group PP by new { PP.inv_id, PP.prod_name } into g
                               select new { g.Key, sum = g.Sum(A => A.quantity) }).ToList();
                      }
                       else if (String.IsNullOrEmpty(Convert.ToString(Request.QueryString["from"])) && String.IsNullOrEmpty(Convert.ToString(Request.QueryString["to"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["num"])))
                      {
                         
                          int codeInvoice = int.Parse(Request.QueryString["num"].ToString());
                        x = (from PP in db.stadd_items
                               join f in db.stadd on PP.inv_id equals f.id
                               where PP.status == 1 && f.id==codeInvoice
                               group PP by new { PP.inv_id, PP.prod_name } into g
                               select new { g.Key, sum = g.Sum(A => A.quantity) }).ToList();
                      }
                     

                         %><tr>
                              <td>#</td>

                            <td>اسم الصنف</td>
                             <td>رقم الفاتورة</td>
                             <td>اجمالي الكميه  </td>
                             <td>سعر الوحدة</td>
                             <td>اجمالي السعر</td>
                          </tr>
                        <% if (x != null)
                            {
                                int i = 1;
                                double totals = 0;
                                foreach (var item in x)
                                {
                                    var total =(from  d in db.stadd_items where d.prod_name==item.Key.prod_name select d).FirstOrDefault();
                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=item.Key.prod_name %></td>

                            <td><%=item.Key.inv_id %></td>
                            <td><%=item.sum %></td>
                            <td><%=total.price %></td>
                            <td><%=total.totalprice %></td>
                          <%totals = totals + double.Parse(total.totalprice.ToString()); %>
                        </tr>
                        <%  i++;
                         %>           
                            
                       
                     <% }%>
                      <tr  style="text-align:center;background-color:aquamarine">
                       <td></td>   
                      <td colspan="3">اجمالي </td>
                      <td colspan="3"><%=totals %></td>
                     </tr>
                           <% }
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

