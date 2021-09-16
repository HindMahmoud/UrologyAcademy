<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="PaymentReport.aspx.cs" Inherits="EccoHospital.Accountant.PaymentReport" %>






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
                    <li class="bring_right"><a href="index.aspx">إدارة الحسابات</a></li>
                    <li class="bring_right"><a href="PaymentReport.aspx">تقريرالمصروفات</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">عرض كل المصروفات</h1>

                <!--Start status alert-->
               
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                    <div class="col-lg-12" dir="rtl">

                    
                        
                    <div class="col-lg-6" style="align-self:left">

                 
                                 الي
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator1" controltovalidate="to1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>

                       </div>
                        <div class="col-lg-6" style="align-self:right" >

                   
                              من
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator4" controltovalidate="from1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>
                           </div>
                </div>
                         
                   </div>
                
                <div class="clearfix">
                </div>
                <div class="form-group">
                    <div class="col-sm-12 ">
                       
            <asp:Button CssClass="btn btn-primary " OnClick="show_Click" ID="show" runat="server" Text="عرض" />
              
                <%-- <%      if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                                                                                         {
                                                                                                             DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                                                                                             DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                             %>--%>
                        <%--<asp:button id="print" cssclass="btn btn-success" onclick="print_Click" runat="server" text="طباعة" />--%>

                        <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                    </div>
                </div>
                    <div class="col-md-3  pull-right">
              
                        <input name="table_search" id="search" class="form-control" onkeyup="myFunction1()" placeholder="بحث بالبند" type="text" />
                        </div>
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr style="background-color:#eee9e9">
                            <th>#</th>

                           
                            <th>البنـــــــــــــــد</th>

                           

                            <th>الاجمالي</th>

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from s in db.payementList select s).ToList();
                            var zz = (from p in db.Acc_save where p.paylist_id!=null&& p.in_value == 0  select p).ToList();
                            double yy = 0;
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                zz = (from p in db.Acc_save where p.paylist_id!=null&& p.in_value == 0 && p.date>=d1 && p.date<=d2 select p).ToList();


                            }
                                yy = Math.Round(double.Parse(zz.Sum(a => a.out_value).ToString()), 4);

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    int id = int.Parse(item.id.ToString());

                                    var z = (from p in db.Acc_save where p.in_value == 0 && p.paylist_id == id select p).ToList();


                                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                                    {
                                        DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                        DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                        //int po = Convert.ToInt32(Request.QueryString["pro"]);
                                        z = (from p in db.Acc_save where p.in_value == 0 && p.paylist_id == id && p.date>=d1 && p.date<=d2 select p).ToList();
                                        zz = (from p in db.Acc_save where p.paylist_id!=null&& p.in_value == 0 && p.date>=d1 && p.date<=d2 select p).ToList();


                                    }
                                    double y = Math.Round(double.Parse(z.Sum(a => a.out_value).ToString()), 4);

                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                          
                            <td><%=item.name %></td>
                            <td><%=y %></td>


                          

                      
                        </tr>
                        <%  i++;
}
                                %>
                        <tr style="background-color:#ffd800" >

                            <td colspan="2">الاجمــــالي </td>
                            <td><%=yy %></td>
                        </tr>
                        <%
    }
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


