<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="tickets.aspx.cs" Inherits="EccoHospital.reception.tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <%int CurrentMonth = DateTime.Now.Date.Month; %>
                    <li class="bring_right"><a href="#"> تذاكر شهر <%=CurrentMonth %></a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">بحث في التذاكر بالشهر</h1>

                <!--Start status alert-->
             
                <!--/End status alert-->
              
                    <div class="form-horizontal">
              
          <div class="col-sm-12 left_text">
                                   
                                    <div class="col-md-4 pull-right">
                                         <label class="pull-right">من:</label>
                                       <asp:TextBox ID="from1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-4 pull-right">
                                         <label class="pull-right">الي:</label>
                                        <asp:TextBox ID="to1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
 
                            
                            
 
                                    <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="btnSearch"   CssClass="btn btn-primary" Text="بحث" runat="server" OnClick="btnSearch_Click"></asp:Button>
                                    </div>
                                    
                                </div>
                        </div>
                <br />
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr style="background-color:azure">
                            <td>#</td>
                            <td>رقم التذكرة</td>
                            <td>اسم المريض</td>
                            <td>تاريخ التذكرة</td>
                            <td>تاريخ الخروج</td>
                            <td>اسم المستخدم</td>
                         </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from i in db.ticket  where i.Date.Value.Month==CurrentMonth&&i.del!=true select i).ToList();
                            if (!String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);
                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                x=(from i in db.ticket  where i.Date>=d1&&i.Date<=d2&&i.del!=true select i).ToList();
                            }
                            else if (String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                            {
                                DateTime d1 = DateTime.Now;
                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                x=(from i in db.ticket  where i.Date>=d1&&i.Date<=d2&&i.del!=true select i).ToList();
                            }
                            else  if (String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);
                                DateTime d2 = DateTime.Now;
                                x=(from i in db.ticket  where i.Date>=d1&&i.Date<=d2&&i.del!=true select i).ToList();
                            }
                            DateTime DD;
                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.Date.ToString());
                                   


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            
                            <td><%=item.code %></td>
                            <td><%=item.patient_name %></td>
                            <td><%Response.Write(d.Day + "/"+d.Month+"/" +d.Year); %></td>
                            <td> 
                            <% 
                            if (item.out_date != null)
                                  {
                               %>  
                                    
                             
                                 <%DD = DateTime.Parse(item.out_date.ToString());
                                     Response.Write(DD.Day + "/" + DD.Month + "/" + DD.Year); %>
                               <%} %>
                                </td>
                            <td><%=item.user_name %></td>
                            <td><a href="addTicket.aspx?edit=<%=item.id%>" ><i class="fa fa-edit" title="تعديل"></i></a></td>
                        </tr>
                        <%  i++;
        }
    
                            %>
                    </table>
                    </div>
                    <%} %>
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


