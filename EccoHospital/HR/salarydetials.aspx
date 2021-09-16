<%@ Page Title="" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="salarydetials.aspx.cs" Inherits="EccoHospital.salarydetials" %>
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
                        <li class="bring_right"><a href="">حضور و انصراف </a></li>
                        <li class="bring_right"><a href="">سجل البصمه</a></li>
                        <li class="bring_right"><a href="">كشف الراتب </a></li>

                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">
                    <h1 class="heading_title">تفاصيل الراتب</h1>
                    

                    <div class="col-md-12">
                       
                     

                            <%--<asp:Button CssClass="btn btn-success" OnClick="print_Click" ID="print" runat="server" Text="طباعة الكل" />--%>
         <%
             EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

             if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
             {
                 DateTime da = Convert.ToDateTime(Request.QueryString["date1"]);

                 DateTime da2 = Convert.ToDateTime(Request.QueryString["date2"]);

                 string xd1 = Request.QueryString["date1"];
                 string xd2 = Request.QueryString["date2"];

              %>
                        </div>
    <div class="col-lg-12" style="overflow-x:auto;">
          <div class="box">
            <div class="box-header">
              
            </div>
            <!-- /.box-header -->
         <div class="wrap">
                        <table class="table table-bordered" id="mytable" style="text-align:center">
                  <% 
                      //  string m = Request.QueryString["m"];

                      //DateTime f = Convert.ToDateTime(from1.Text);
                      //DateTime f2 = f.AddMonths(1);
                      //join
                      //  var x = (from ss in db.employee  where  ss.id != 0 && ss.del != true   select new { ss} ).ToList();


                      double monNum = 0;
                      var xmonth = (from ff in db.month_days where ff.date >= da && ff.date <= da2 select ff).FirstOrDefault();
                      if(xmonth!=null)
                      {
                          monNum = int.Parse(xmonth.workDays.ToString());
                      }
                      int ddd = int.Parse(Convert.ToString(Request.QueryString["emp_id"]));
                      EccoHospital.Models.employee emmp = db.employee.FirstOrDefault(h => h.id == ddd);
                      var x2 = (from aa in db.monthdetails join
                            a in db.employee on aa.code equals a.code
                                where aa.date >= da && aa.date <= da2 && a.id == ddd select new { aa, a }).ToList();



                      var main = x2.FirstOrDefault().a.usual_balance;
                      var hours = x2.FirstOrDefault().a.hour_of_work;
                      double absentday = monNum - x2.Count();

                      double hh = 0, hourprice = 0, minprice = 0;
                      if (hours != null)
                          hh = double.Parse(hours.ToString());
                      hourprice = Math.Round(double.Parse(emmp.hour_value.ToString()), 2);
                      minprice = Math.Round(hourprice / 60,4);
                      double sumattenth = double.Parse(x2.Sum(w => w.aa.attendhours).ToString());
                      double salv = hourprice * sumattenth;

                      var dis = (from j in db.sanc_list where j.del == false && j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();
                      var addition = (from j in db.add_list where j.del == false && j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();
                      var loans = (from j in db.loan_installment

                                   where j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();

                      //var vacn = (from j in db.usual_vacation

                      //            where j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();


                      double addv = double.Parse(addition.Sum(a => a.add_value).ToString());

                      double extrv = double.Parse(x2.Sum(w => w.aa.extraMinutes).ToString()) * minprice;
                      double dissv = double.Parse(dis.Sum(a => a.sanc_value).ToString());

                      double absent = hourprice * absentday * hh;

                      double shortV = double.Parse(x2.Sum(w => w.aa.shortMinutes).ToString()) * minprice;
                      double loansv = double.Parse(loans.Sum(a => a.value).ToString());

                      double total =  Math.Round( salv + extrv + addv - (dissv + absent + shortV+loansv),3);
                      if (x2 != null)
                      {

                       %>
                <tr class="bg-info">
                  
                   
                  <th style="text-align:center">الاسم</th>
                  <th style="text-align:center">مسمي وظيفي</th>
                  <th style="text-align:center"> سعر ساعه العمل</th>
                  <th style="text-align:center">سعر الدقيقه </th>
                
                    <th style="text-align:center">عدد ايام الحضور</th>

                    <th style="text-align:center">عدد ايام الغياب</th>

                    <th style="text-align:center">عدد دقائق الخصم</th>
                    <th style="text-align:center">عدد دقائق الاضافه</th>
                   <%-- <th style="text-align:center">عدد ايام  الاجازات</th>--%>


                    

                </tr>
                  <%

                      int i = 1;





                          %>
                            <tr >
      
                
                  <td><%=emmp.name %></td>
                  <td><%=emmp.job_title %></td>
                                <td > <%=hourprice %></td>
                                <td > <%=minprice %></td>
                          <td><%=x2.Count() %> </td>
     <td><%=monNum - x2.Count() %></td>
        <td><%=x2.Sum(w => w.aa.shortMinutes)%></td>
     <td><%=x2.Sum(w => w.aa.extraMinutes)%></td>
     <%--<td><%=vacn.Sum(w => w.days_no)%></td>--%>

                                


                
                  

                </tr>

                     
                    <% i++;

                        }%>
                             <% if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])))
                                 {

                              %>
 
                            
                            <tr class="text-danger bg-warning">

                                <td colspan="2" >  اجمالي الراتب</td>
                                <td > <%=salv %></td>
                                  
                                <td colspan="2" > ######</td>
                                <td > <%=absent %></td>
                                 <td><%=x2.Sum(w => w.aa.shortMinutes) * minprice%></td>
     <td><%=x2.Sum(w => w.aa.extraMinutes) * minprice%></td>
                                <td  > ######</td>

                            </tr>
                            <tr class="text-danger bg-warning">
                            <%           

                                   %>
                                <td colspan="2" >  اجمالي الاضافات</td>
                                <td > <%=addition.Sum(a => a.add_value) %></td>
                                <td colspan="2" >  اجمالي الجزاءت</td>
                                <td > <%=dis.Sum(a => a.sanc_value) %></td>
                               <td  >   سلف </td>
                                <td > <%=loansv %></td>
                                <td>######</td>
                                </tr>
                            <tr class="text-danger bg-warning">

                                 <td  colspan="2" >  صافي الراتب </td>
                                <td > <%=total %></td>
                            </tr>
                            
                            <%} %>
                            <%


    %>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
                    <div class="col-lg-6">
                          <table class="table table-bordered" id="mytable" style="text-align:center">
                  <% 
                      int ddd2 = int.Parse(Convert.ToString(Request.QueryString["emp_id"]));
                      EccoHospital.Models.employee emmp2 = db.employee.FirstOrDefault(h => h.id == ddd);
                      


                      


                      if(dis != null)
                      {

                       %>
                <tr class="bg-info">
                  
                    <th style="text-align:center"> #</th>
                  <th style="text-align:center">الاسم</th>
                  
                
                    <th style="text-align:center">التاريخ</th>
                
                    <th style="text-align:center">بيان الجزاء</th>
                    <th style="text-align:center">القيمه</th>
                    

                </tr>
                  <%

                      int i = 1;

                      foreach (var item in dis)
                      {

                          // DateTime date =Convert.ToDateTime( item.birth_date.ToString());
                          // DateTime date2 =Convert.ToDateTime( item.start_date.ToString());
                          DateTime d1 = Convert.ToDateTime(item.date);
                      
                          DateTime ds = DateTime.Now.Date;
%>
                            <tr >
       
                   <td > <%=i %></td>

                

                
                  <td><%=item.emp_name %></td>
                 

                                  <td><%= d1.ToString("yyyy/MM/dd")%></td>
                  <td><%=item.sanc_name %></td>
                  <td><%=item.sanc_value %></td>

                </tr>

                     
                    <% i++;

                        }%>
                             

                          
                            <%} %>
                           
               
              </table>
                    </div>
                     <div class="col-lg-6">
                             <table class="table table-bordered" id="mytable" style="text-align:center">
                  <% 
                      
                      


                      


                      if(addition != null)
                      {

                       %>
                <tr class="bg-info">
                  
                    <th style="text-align:center"> #</th>
                  <th style="text-align:center">الاسم</th>
                  
                
                    <th style="text-align:center">التاريخ</th>
                
                    <th style="text-align:center">بيان الاضافه</th>
                    <th style="text-align:center">القيمه</th>
                    

                </tr>
                  <%

                      int i = 1;

                      foreach (var item in addition)
                      {

                          // DateTime date =Convert.ToDateTime( item.birth_date.ToString());
                          // DateTime date2 =Convert.ToDateTime( item.start_date.ToString());
                          DateTime d1 = Convert.ToDateTime(item.date);
                      
                          DateTime ds = DateTime.Now.Date;
%>
                            <tr >
       
                   <td > <%=i %></td>

                

                
                  <td><%=item.emp_name %></td>
                 

                                  <td><%= d1.ToString("yyyy/MM/dd")%></td>
                  <td><%=item.add_name %></td>
                  <td><%=item.add_value %></td>

                </tr>

                     
                    <% i++;

                        }%>
                             

                          
                            <%} %>
                           
               
              </table>
                    </div>
                    <%} %>
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
     <script>
            $('#').daterangepicker({
                "singleDatePicker": true,
                "showDropdowns": true,
                //"timePicker": true,
                "timePickerIncrement": 5,
                "autoApply": true,

                "locale": {
                    "format": "DD/MM/YYYY",

                }
            });
        </script>
</asp:Content>
