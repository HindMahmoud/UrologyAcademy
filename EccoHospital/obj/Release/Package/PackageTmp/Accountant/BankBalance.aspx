<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="BankBalance.aspx.cs" Inherits="EccoHospital.Accountant.BankBalance" %>


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
                    <li class="bring_right"><a href="AddBank.aspx">البنوك</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <%
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                    int id = int.Parse(Request.QueryString["id"].ToString());
                    EccoHospital.Models.bank doc = db.bank.FirstOrDefault(a => a.id == id);

                 %>
            <div class="page_content">
                <h1 class="heading_title"><%=doc.name %></h1>

                <!--Start status alert-->
                
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                    <div class="col-lg-12" dir="rtl">

                      <div class="col-lg-2 " style="align-self:right">
                       <br />
            <asp:Button CssClass="btn btn-primary " OnClick="show_Click" ID="show" runat="server" Text="عرض" />
              
               
                    </div>
                        
                    <div class="col-lg-5" style="align-self:left">

                 
                                 الي
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator1" controltovalidate="to1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>

                       </div>
                        <div class="col-lg-5" style="align-self:right" >

                   
                              من
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator4" controltovalidate="from1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>
                           </div>
                        
                </div>
                        <div class="col-md-12">

                            <div class="col-md-3 pull-right">
                                <asp:DropDownList ID="ddltype" CssClass="form-control" runat="server">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="in">ايداع  </asp:ListItem>
                                    <asp:ListItem Value="out"> سحب</asp:ListItem>

                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3  pull-right">
                                <asp:TextBox ID="txt_value" CssClass="form-control" placeholder="المبلغ" runat="server"></asp:TextBox>
                                </div>
                             <div class="col-md-5 pull-right">
                                <asp:TextBox ID="txt_notes" CssClass="form-control" placeholder="ملاحظات" runat="server"></asp:TextBox>
                                </div>

                            <div class="col-md-1 pull-right">
                                <asp:Button ID="btn" OnClick="btn_Click" CssClass="btn btn-primary" Text="اضافه" runat="server"></asp:Button>
                                </div>
                        </div>
                         
                   </div>
                
                <div class="clearfix">
                </div>
               <%
                   var x = (from p in db.bank_balance where p.bank_id == id select p).OrderByDescending(a=>a.id).ToList();
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                //int po = Convert.ToInt32(Request.QueryString["pro"]);

                                x = (from p in db.bank_balance where p.bank_id == id&& p.date >= d1 && p.date <= d2 select p).OrderByDescending(a=>a.id).ToList();
                            }

                         double value = Math.Round(double.Parse((x.Sum(a => a.in_val) - x.Sum(a => a.out_val)).ToString()), 3);

                    %>
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                         <tr style="background-color:#d2f543; font-weight:bold">
                            <td colspan="3">الاجمالـــــــــــي</td>
                            <td><%=x.Sum(a => a.in_val) %></td>
                            <td><%=x.Sum(a => a.out_val) %></td>
                             
                            <td colspan="2" >اجمالي الرصيد</td>
                            <td><%= value %></td>

                             
                        </tr>
                        <tr class="bg-info">
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>البيان</td>
                            <td>مدين</td>
                            <td>دائن</td>
                            

                            <td>الرصيد</td>

                        </tr>
                        <%  
                            

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {


                                    var sumx = (from p in db.bank_balance where p.bank_id == id && p.id < item.id  select p).ToList();

                                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                    {
                                        DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                        DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                        sumx = (from p in db.bank_balance where p.bank_id == id && p.id < item.id && p.date >= d1 && p.date <= d2  select p).ToList();


                                    }

                                    DateTime d = DateTime.Parse(item.date.ToString());
                                    
                         double value2 = Math.Round(double.Parse(  ( sumx.Sum(a => a.in_val) - sumx.Sum(a => a.out_val) + (item.in_val - item.out_val)  ).ToString()), 3);

                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=item.date %></td>
                          
                            <td><%=item.type %></td>
                            <td class="bg-success"><%=item.in_val %></td>

                            <td class="bg-danger"><%=item.out_val %></td>
                           
                            <td><%=value2 %></td>

                        
                        </tr>
                        <%  i++;

                            }
                                %>
                       
                        <%
                            }
                            %>
                    </table>
                    </div>
                    
                    </div>
                </div>
            <%} %>
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
                td = tr[i].getElementsByTagName("td")[2];
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


