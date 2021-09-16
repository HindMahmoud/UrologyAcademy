<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportInvoice.aspx.cs" Inherits="EccoHospital.stock.ReportInvoice"  MasterPageFile="~/stock/HomeStock.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    
                    <li class="bring_right"><a href="ReportInvoice.aspx">المبيعات</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <%EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                    int depid = int.Parse(Request.QueryString["depId"].ToString());
                    var namedep = (from dd in db.departments where dd.id == depid select dd.name).First(); %>
                <h1 class="heading_title"> قسم <%=namedep %></h1>

                <!--Start status alert-->
               <%-- <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="leave_moneyall.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:linkbutton class="btn-xs btn-danger  " visible="false" onclick="delbtn_Click" id="delbtn" runat="server">نعم</asp:linkbutton>
                    <asp:linkbutton class="btn-xs btn-warning  " visible="false" onclick="cancel_Click" runat="server" id="cancel">لا</asp:linkbutton>
                </div>--%>
             
                <div class="form-group">
                    <div class="col-sm-12 ">
                      
                    </div>
                </div>
                  <%--  <div class="col-md-3  pull-right">
              
                        <input name="table_search" id="search" class="form-control" onkeyup="myFunction1()" placeholder="بحث بالبند" type="text" />
                        </div>--%>
                <div class="table-responsive no-padding">
                    <table class="table table-hover" id="mytable">
                        <tr>
                            <td>اسم الصنف</td>
                            <td>الكمية</td>
                        </tr>
                        <%  
                           
                            var x = (from s in db.invoice_items join i in db.invoice on s.inv_id equals i.id where s.order_status == 1 && i.total2==depid group s by new { s.name } into g select new { n = g.Key.name, sum = g.Sum(a => a.quantity) }).ToList();
                            //(from p in db.invoice join invitem in db.invoice_items on p.idnum equals invitem.inv_id  group invitem.inv_id by invitem.inv_id into g select new { g.Key ,g}).ToList();
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["depId"])))
                            {

                                int d2 = int.Parse(Request.QueryString["depId"]);
                                x = (from s in db.invoice_items join i in db.invoice on s.inv_id equals i.id where s.order_status == 1 && i.total2==depid group s by new { s.name } into g select new { n = g.Key.name, sum = g.Sum(a => a.quantity) }).ToList();
                                //(from p in db.invoice join invitem in db.invoice_items on p.idnum equals invitem.inv_id group invitem.inv_id by invitem.inv_id into g select new { g.Key ,g}).ToList();

                            }

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {
                                   

                        %>
                        <tr style="text-align: center">
                            <td><%=item.n %></td>
                            <td><%=item.sum %></td>
                           
                        
                       <%--  <td>--%>
                                    
                                     <%--<a href="addPayment.aspx?edit=<%=item.p.id%>" class="glyphicon glyphicon-edit" data-toggle="tooltip"--%>
                                       <%--data-placement="top" title="تعديل"></a>--%>
                               <%-- </td>--%>
                                 <%} %>
                                <%
    if (Session["role"].ToString() == "Financial Manager" || Session["role"].ToString() == "Admin")
    {
                                     %>
                                <%--<td>
                                    
                                     <%--<a href="SearchPayment.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"--%>
                                       <%--data-placement="top" title="حذف"></a>
                                </td>--%>
                                
                                <%} %>
                        </tr>
                        <%  i++;
}
                                %>

                       
                        <%
   // }
                  %>
                    </table>
                    </div>
                    
                    </div>
                </div>
            </div>
        </div>

    <!--/End Main content container-->
     <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[4];
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
      <script>

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5];
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


