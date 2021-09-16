<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="RoomsTicket.aspx.cs" Inherits="EccoHospital.Accountant.RoomsTicket" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <% if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["n"])))
                {
                       
                        string n = Request.QueryString["n"].ToString();
                       %>
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">  حساب <%=n %></a></li>
                    </ul>
                </div>
                <%
                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
                    {
                        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                        int x = int.Parse(Request.QueryString["t_id"].ToString());
                        EccoHospital.Models.room_history p2 = db.room_history.Where(a => a.ticketId == x).FirstOrDefault();
                        EccoHospital.Models.ticket t = db.ticket.Where(a => a.code == x).FirstOrDefault();

                     %>
                <div class="page_content">
                     <h1 class="heading_title">تذكره <%=p2.ticketId %>  <%=n %></h1>
                <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="SurguryAdd.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                 <div class="content">
                     <%
                         
                          var price = p2.price.ToString();

                    DateTime now = DateTime.Now;
                    DateTime fromdt = Convert.ToDateTime(p2.from_date.ToString());
                    var hours = (now - fromdt).TotalHours;
                    var days = (now - fromdt).TotalDays;

                    int xxx = (int)hours/24;
                   var day = xxx.ToString();
                    double h = Math.Round(days-xxx, 4);
                    double h2 = Math.Round((hours % 24), 4);

                  var hour = (h2).ToString();
                    double too = double.Parse((days * p2.price).ToString());
                   var totalin =  Math.Round(too,2).ToString();

                          %>
                     <div class="col-md-4 pull-right">
                     <table class="table table-bordered">
                         <tr>
                             <td>اسم المريض</td>
                             <td><%=p2.p_name.ToString() %></td>

                         </tr>
                          <tr>
                             <td>اسم الطبيب المحول</td>
                             <td><%=t.doc_name.ToString() %></td>

                         </tr>
                         <tr>
                              <td>ملاحظات</td>
                             <td><%=p2.notes.ToString() %></td>
                         </tr>
                         <tr>
                              <td>رقم ال<%=n %></td>
                             <td><%=p2.room_name.ToString() %></td>
                         </tr>
                         
                          <tr>
                              <td>التاريخ </td>
                             <td><%=p2.from_date.ToString() %></td>
                         </tr>
                          <tr>
                              <td>عدد الايام </td>
                             <td><%=day %></td>

                               <td>عدد الساعات </td>
                             <td><%=hour %></td>
                         </tr>
                          <tr>
                              <td>سعر اليوم </td>
                             <td><%=price %></td>

                               <td>اجمالي اقامه  </td>
                             <td><%=totalin %></td>
                         </tr>
                         
                     </table>

                 </div>
                     <div class="col-md-8 pull-right">
                         <div class="col-md-6 pull-right">
                            الخدمات:
             <asp:DropDownList ID="ddl_lab" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ddl_lab_TextChanged"></asp:DropDownList>
                                    
                         </div>
                         <div class="col-md-6 pull-right">
                            طبيب:
             <asp:DropDownList ID="ddl_doc" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    
                         </div>
                         <div class="col-md-6 pull-right">
                             نسبه الطبيب:
                                     <asp:TextBox  Text="0" class="form-control" id="txt_per"  runat="server" ></asp:TextBox>
                                </div>
                         <div class="col-md-6 pull-right">
                           عدد المرات :
                                     <asp:TextBox  Text="1" class="form-control" id="txt_time" placeholder=" عدد المرات  " runat="server" ></asp:TextBox>
                                </div>
                         <div class="col-md-6 pull-right">
                             السعر:
                                    <asp:TextBox  Text="1"  class="form-control" id="txt_price" placeholder=" السعر  " runat="server" ></asp:TextBox>
                                </div>
                          <div class="col-md-6 pull-right">
                                    <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    
                                </div>
                    </div>
                  <div class="col-md-12 pull-right">
                      
                           <%
                               var ticketlist = (from s in db.patient_history
                                                 where s.ticketId == x && (s.type != "عمليات" && s.type != "حضانه" && s.type != "عنايه")
                                                 select s).ToList();


                               if (ticketlist != null)
                               {
                                %>
                       <table class="table table-bordered">

                         <tr>
                             <th>اسم الخدمه</th>
                             <th>عدد المرات </th>
                             <th>سعر   </th>
                             <th>الاجمالي   </th>
                             <th>تاريخ   </th>
                             <th>الطبيب   </th>
                             <th>نسبته   </th>


                             <th>المستخدم   </th>

                             
                         </tr>
                           <% foreach (var item in ticketlist)
                               {
                                        %>
                           <tr>
                               <td><%=item.service_name %></td>
                               <td><%=item.time_no %></td>
                               <td><%=item.time_price %></td>
                               <td><%=item.price %></td>
                               <td><%=item.date %></td>
                               <td><%=item.doc_name %></td>
                               <td><%=item.doc_value %></td>


                               <td><%=item.user_name %></td>
                               <td>
                                    
                                     <a href="RoomsTicket.aspx?n=<%=n %>&&t_id=<%=x %>&&edit=<%=item.id%>" class="glyphicon glyphicon-edit" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                </td>
                                <td>
                                    
                                     <a href="RoomsTicket.aspx?n=<%=n %>&&t_id=<%=x %>&&id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                           </tr>

                           <%} %>
                           </table>
                       <table  class="table table-bordered">
                            <tr>
                             <th>الاجمالي</th>
                             <td><%=ticketlist.Sum(a => a.price) %></td>

                         </tr>
                            <tr>
                             <th>المسدد</th>
                             <td><%=p2.insurance_val.ToString() %></td>

                         </tr>
                            <tr>
                             <th>الباقي</th>
                             <td><%=ticketlist.Sum(a => a.price) - p2.insurance_val %></td>

                         </tr>

                        </table>
                      <%} %>

                  </div>
                      <div class="col-md-12">
                         <h3><a href="Ticketmed.aspx?t_id=<%=x %>">اجمالي العلاج <i class="fa fa-medkit"></i></a></h3>
                         <div class="col-md-3 pull-right"> اجمالي العلاج
                             <asp:TextBox ID="txtmed" CssClass="form-control" runat="server"></asp:TextBox>

                         </div>
                          <div class="col-md-3 pull-right"> 
                               <asp:Button ID="btnsave" CssClass="btn btn-primary" OnClick="btnsave_Click" Text="حفظ العلاج" runat="server"></asp:Button>

                         </div>
                         <div class="col-md-3 pull-right"> 
                               <asp:Button ID="btnConfirm" CssClass="btn btn-primary" OnClick="btnConfirm_Click" Text="تأكيد " runat="server"></asp:Button>

                         </div>


                     </div>
                       </div>
                    


                   

                  
                </div>
                <%} %>
            </div>
        </div>
    <%} %>
   
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
      <script>

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
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


        function myFunction3() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search3");
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







