<%@ Page Title="" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="FingerPrintDetails.aspx.cs" Inherits="EccoHospital.FingerPrintDetails" %>
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
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">
                    <h1 class="heading_title">سجل حضور و انصراف</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم الحفظ بنجاح!</strong><br /> <a href="comeleavesearch.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->

                    
                     <div class="col-md-4">
                        الموظف
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <asp:DropDownList runat="server" class="form-control pull-right" ID="emp" ClientIDMode="Static"></asp:DropDownList>
                    </div>
                        <!-- /.input group -->

                    </div> 
                                    <div class="col-md-4">
                        الي
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-clock-o"></i>
                        </div>
                        <asp:TextBox TextMode="date" runat="server" class="form-control pull-right" ID="demo2" ClientIDMode="Static"></asp:TextBox>
                    </div>
                        <!-- /.input group -->

                    </div> 
       <div class="col-md-4">
           من
                    <div class="input-group">

                                   <div class="input-group-addon">
                            <i class="fa fa-clock-o"></i>
                        </div>
                        
                    <asp:TextBox TextMode="date" ValidationGroup='a' CssClass="form-control" ID="from1" ClientIDMode="Static" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator
                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='a' ID="RequiredFieldValidator1" ControlToValidate="from1" ErrorMessage="ادخل تاريخ  ">
                        </asp:RequiredFieldValidator>
                    </div>
   
                    <div class="col-md-12">
                       
                        <div class="col-md-3 pull-right">
                            <asp:Button CssClass="btn btn-primary" OnClick="show_Click" ID="show" runat="server" Text="عرض" />
                        </div>
                       

                            <%--<asp:Button CssClass="btn btn-success" OnClick="print_Click" ID="print" runat="server" Text="طباعة الكل" />--%>
         <%
             if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
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
              <%--<h3 class="box-title">سجل بيانات العاملين  </h3>--%>
                <%--<span id="dt1" runat="server"></span>--%> 
              <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                    <br />
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="search..">

                  <br />
                </div>
              </div>
            </div>
            <!-- /.box-header -->
         <div class="wrap">
                        <table class="table table-bordered" id="mytable" style="text-align:center">
                  <% 
                     EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                      //  string m = Request.QueryString["m"];

                      //DateTime f = Convert.ToDateTime(from1.Text);
                      //DateTime f2 = f.AddMonths(1);
                      //join
                      //  var x = (from ss in db.employee  where  ss.id != 0 && ss.del != true   select new { ss} ).ToList();
                      var x2 = (from aa in db.monthdetails join
                                a in db.employee on aa.code equals a.code
                                where aa.date>= da && aa.date <= da2  select new { aa ,a}).ToList();


                      if(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])))
                      {
                          int ddd=int.Parse(Convert.ToString(Request.QueryString["emp_id"]));
                          x2 = (from aa in db.monthdetails join
                                a in db.employee on aa.code equals a.code
                                where aa.date>= da && aa.date <= da2 && a.id==ddd  select new { aa ,a}).ToList();


                      }

                      if (x2 != null)
                      {

                       %>
                <tr class="bg-info">
                  
                    <th style="text-align:center"> #</th>
                  <th style="text-align:center">الاسم</th>
                  <th style="text-align:center">مسمي وظيفي</th>
                
                    <th style="text-align:center">التاريخ</th>
                
                    <th style="text-align:center">حضور</th>
                    <th style="text-align:center">انصراف</th>
                    <th style="text-align:center">عدد ساعات الحضور</th>

                    <th style="text-align:center">عدد دقايق الحضور</th>

                    <th style="text-align:center">عدد دقائق الخصم</th>
                    <th style="text-align:center">عدد دقائق الاضافه</th>

                     


                </tr>
                  <%

                      int i = 1;
                      
                      double shortmm_sum = 0;
                      double extramm_sum = 0;
                      foreach (var item in x2)
                      {
                          double shortmm = 0;
                      double extramm = 0;
                          // DateTime date =Convert.ToDateTime( item.birth_date.ToString());
                          // DateTime date2 =Convert.ToDateTime( item.start_date.ToString());
                          DateTime d1 = Convert.ToDateTime(item.aa.date);
                          DateTime d2 = Convert.ToDateTime(item.aa.come);
                          DateTime d3 = Convert.ToDateTime(item.aa.go);
                          DateTime ds = DateTime.Now.Date;


                          double hourshould = 0,attH=0;
                          if(item.a.hour_of_work!=null)
                              hourshould  = double.Parse(item.a.hour_of_work.ToString());
                          attH = double.Parse(item.aa.attendhours.ToString());

                          double diff = (hourshould - attH);
                          //  comeleave f1 = ;
                          //
                          if(diff>0)
                          {
                              shortmm = diff*60;
                          }else
                          {
                              extramm = diff *60* -1;
                          }
                          // DateTime dtt = DateTime.Parse(f1.date.ToString());

                          //if (db.comeleave.Any(a => a.date == ds && a.emp_id == item.ss.id))
                          //{

                          
                       %>
                 <%-- <tr class="bg-lime">
                                <%}
    else
    { %>--%>
                            <tr >
       <%--                         <%}
         %>--%>
                   <td > <%=i %></td>

                 <%--<td><% Response.Write(item.id); %></td>
                 --%>
                
                  <td><%=item.a.name %></td>
                  <td><%=item.a.job_title %></td>

                                  <td><%= d1.ToString("yyyy/MM/dd")%></td>

                                 <td><%=d2.ToShortTimeString()%></td>

                                 <td><%=d3.ToShortTimeString()%></td>
                                 <td><%=item.aa.attendhours%></td>
                                 <td><%=item.aa.attentMintues%></td>
                                 <td><%=shortmm%></td>

                                 <td><%=extramm%></td>

                                <%-- <td><%=item.aa.shortMinutes%></td>
                                 <td><%=item.aa.extraMinutes%></td>--%>




                 


                
                  

                </tr>

                     
                    <% i++;
                             shortmm_sum += shortmm;
                       extramm_sum += extramm;
                                }%>
                             <% if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])))
                          {
                                      int ddd=int.Parse(Convert.ToString(Request.QueryString["emp_id"]));
                              %>
 <tr >
       <%--                         <%}
         %>--%>

     <%
         double monNum = 0;
         var xmonth = (from ff in db.month_days where ff.date >= da && ff.date <= da2 select ff).FirstOrDefault();
         if(xmonth!=null)
         {
             monNum = int.Parse(xmonth.workDays.ToString());
         }


    %>
                   <td colspan="2" > اجمالي</td>
     <td colspan="2"><%=x2.Count() %> عدد ايام الحضور</td>
     <td colspan="2"><%=monNum-x2.Count() %>عدد ايام الغياب</td>


                
                                 <td><%=x2.Sum(w=>w.aa.attendhours)%></td>
     <td><%=x2.Sum(w=>w.aa.attentMintues)%></td>
     <%--<td><%=x2.Sum(w=>w.aa.shortMinutes)%></td>
     <td><%=x2.Sum(w=>w.aa.extraMinutes)%></td>--%>
                               
     <td><%=Math.Round(shortmm_sum,3) %></td>
     <td><%=Math.Round(extramm_sum,3) %></td>


             

                </tr>
                            <%
                                var hours = x2.FirstOrDefault().a.hour_of_work;
                                double absentday = monNum - x2.Count();

                                double hh = 0, hourprice = 0, minprice=0;
                                if (hours != null)
                                    hh = double.Parse(hours.ToString());
                                hourprice = Math.Round( double.Parse(x2.FirstOrDefault().a.hour_value.ToString()),2);
                                minprice = Math.Round(hourprice / 60,4);
                                double sumattenth = double.Parse(x2.Sum(w => w.aa.attendhours).ToString());
                                double salv = hourprice * sumattenth;
                                 %>
                            <tr class="text-danger bg-warning">

                                <td colspan="2" >  اجمالي الراتب</td>
                                <td > <%=salv %></td>
                                  <td colspan="2" >  سعر ساعه العمل </td>
                                <td > <%=hourprice %></td>
                                <td  >  سعر  الدقيقه </td>
                                <td > <%=minprice %></td>
                               <%-- <td><%=x2.Sum(w=>w.aa.shortMinutes)*minprice%></td>
     <td><%=x2.Sum(w=>w.aa.extraMinutes)*minprice%></td>--%>
                                <td><%=shortmm_sum*minprice %></td>
                                <td><%=extramm_sum*minprice %></td>

                            </tr>
                            <tr class="text-danger bg-warning">
                            <%var dis = (from j in db.sanc_list where j.del==false && j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();
                                var addition = (from j in db.add_list where j.del==false && j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();

                                var loans = (from j in db.loan_installment

                                             where j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();

                                //var vacn = (from j in db.usual_vacation

                                //            where j.emp_id == ddd && j.date >= da && j.date <= da2 select j).ToList();


                                   %>
                                <td colspan="2" >  اجمالي الاضافات</td>
                                <td > <%=addition.Sum(a=>a.add_value) %></td>
                                <td colspan="2" >  اجمالي الجزاءت</td>
                                <td > <%=dis.Sum(a=>a.sanc_value) %></td>
                                <%
                                    double addv =double.Parse( addition.Sum(a => a.add_value).ToString());

                                    //double extrv = double.Parse(x2.Sum(w => w.aa.extraMinutes).ToString()) * minprice;
                                    double extrv = extramm_sum * minprice;

                                    double dissv =double.Parse( dis.Sum(a=>a.sanc_value).ToString());

                                    double absent = hourprice*absentday*hh;

                                   // double shortV = double.Parse(x2.Sum(w => w.aa.shortMinutes).ToString()) * minprice;
                                    double shortV = shortmm_sum * minprice;

                                    double loansv = double.Parse(loans.Sum(a => a.value).ToString());

                                    double total =  Math.Round( salv + extrv + addv - (dissv + absent + shortV+loansv),3);
                                     %><td >  اجمالي الغياب  </td>
                                <td > <%=absent %></td>
                                
                                </tr>
                                                        <tr class="text-danger bg-warning">


                              <%--  <th colspan="2" style="text-align:center">عدد ايام  الاجازات</th>
                                                                 <td><%=vacn.Sum(w => w.days_no)%></td>--%>
                                             <td  colspan="2" >   سلف </td>
                                <td > <%=loansv %></td>

 <td colspan="2"  >  صافي الراتب </td>
                                <td colspan="2" > <%=total %></td>
                            </tr>
                            <tr>
                                <td colspan="6">للتفاصيل <i class="fa fa-arrow-circle-left"></i></td>
                                <td colspan="6"> <a href="salarydetials.aspx?emp_id=<%=ddd %>&&date1=<%=xd1 %>&&date2=<%=xd2 %>">اضغط هنا</a></td>

                            </tr>
                           <tr>
                               <td colspan="6">صرف الراتب </td>
                               <td colspan="4">
                                   <asp:TextBox ID="txt_sal" CssClass="form-control" Text="0" runat="server"></asp:TextBox>
                               </td>
                               <td colspan="2">
                                   <asp:Button ID="btn_save" OnClick="btn_save_Click" CssClass="btn btn-primary" runat="server" Text="صرف" />
                                  
                               </td>
                           </tr>


                            <%} %>
                            <%
                            }
                        }
    %>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
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
