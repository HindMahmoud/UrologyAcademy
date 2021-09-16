﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="SearchPayment.aspx.cs" Inherits="EccoHospital.Accountant.SearchPayment" %>




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
                    <li class="bring_right"><a href="SearchPayment.aspx">عرض كل المصروفات</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">عرض كل المصروفات</h1>

                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="leave_moneyall.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:linkbutton class="btn-xs btn-danger  " visible="false" onclick="delbtn_Click" id="delbtn" runat="server">نعم</asp:linkbutton>
                    <asp:linkbutton class="btn-xs btn-warning  " visible="false" onclick="cancel_Click" runat="server" id="cancel">لا</asp:linkbutton>
                </div>
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
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>البيان</td>
                            <td>المبلغ</td>
                            <td>البند</td>

                            <td>الملاحظات</td>
                            <td>اسم المستخدم</td>

                            <td colspan="2">التحكم</td>

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from p in db.Acc_save
                                     join pp in db.payementList on p.paylist_id equals pp.id
                                     where p.in_value==0  select new { p,pp.name}).ToList();
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                //int po = Convert.ToInt32(Request.QueryString["pro"]);

                                x = (from p in db.Acc_save
                                     join pp in db.payementList on p.paylist_id equals pp.id
                                     where  p.date >= d1 && p.date <=d2 && p.in_value==0 select new { p,pp.name}).ToList();
                            }

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.p.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=d.ToShortDateString() %></td>
                          
                            <td><%=item.p.title %></td>
                            <td><%=item.p.out_value %></td>
                            <td><%=item.name %></td>

                            <td><%=item.p.notes %></td>
                            <td><%=item.p.user_name %></td>


                         <%
                                    if (Session["role"].ToString()=="Financial Manager"||Session["role"].ToString() == "Admin")
                                    {
                                     %>
                                 <td>
                                    
                                     <a href="addPayment.aspx?edit=<%=item.p.id%>" class="glyphicon glyphicon-edit" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                </td>
                                 <%} %>
                                <%
                                    if (Session["role"].ToString() == "Financial Manager"||Session["role"].ToString() == "Admin")
                                    {
                                     %>
                                <td>
                                    
                                     <a href="SearchPayment.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                                
                                <%} %>
                        </tr>
                        <%  i++;
}
                                %>

                        <tr>

                            <td colspan="3"> الاجمالي  </td>
                            <td><%=x.Sum(a=>a.p.out_value) %></td>
                            <td colspan="5"></td>
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
