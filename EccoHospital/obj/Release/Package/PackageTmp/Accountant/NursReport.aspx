<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="NursReport.aspx.cs" Inherits="EccoHospital.Accountant.NursReport" %>







<!DOCTYPE html>
<html lang="ar">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hospital</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/icon.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/ar.css" rel="stylesheet" class="lang_css arabic">
     <link rel="stylesheet" href="../dist/fonts/fonts-fa.css">
    <link rel="stylesheet" href="../dist/css/1.css">
    <link rel="stylesheet" href="../dist/css/2.css">
    
    <script src="../js/jquery-2.1.4.min.js"></script>
    <link href="../plugins/select2/select2.min.css" rel="stylesheet" />
 <%--    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/icon.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/ar.css" rel="stylesheet" class="lang_css arabic">--%>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      <style>
          tr {
              text-align: center;
          }

          td {
              text-align: center;
          }

          th {
              text-align: center;
          }
      </style>
    
</head>




   <body>  
<form id="form22" runat="server">    

   <div class="container-fluid">
           
               

                    
                   
                    <div>
                        <h1 class="heading_title">تقرير الحضان</h1>
                    

                         <%

                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                            {
                                DateTime d3 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d4 = Convert.ToDateTime(Request.QueryString["date2"]);
                                %>
                        <h2><%Response.Write(Convert.ToDateTime(d3.ToShortDateString()).Day + "/" + Convert.ToDateTime(d3.ToShortDateString()).Month + "/" + Convert.ToDateTime(d3.ToShortDateString()).Year);  %> :  <%Response.Write(Convert.ToDateTime(d4.ToShortDateString()).Day + "/" + Convert.ToDateTime(d4.ToShortDateString()).Month + "/" + Convert.ToDateTime(d4.ToShortDateString()).Year); %></h2>
                        <%
                            }
                             %>
                    <!--Start status alert-->
                    
                    <!--/End status alert-->
                    
                    <div class="wrap"  >
                         <div class="col-md-12">
              
            <div class="box-tools hidden-print">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالمريض  ..">
                  <br />

                  
                  <input type="text" name="table_search" id="search3" class="form-control pull-left" onkeyup="myFunction3()" placeholder="بحث بالطبيب  ..">
                    <br />
                    <input type="button" value="Print" class="btn btn-primary" onClick="window.print()">
                </div>
                  </div>
                        </div>
                        <table style="overflow-x:scroll;" class="table table-responsive table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                
                                 
                                
                                <td> التاريخ</td>
                                <td>المستخدم</td>

                                
                                <td>الاقامه</td>
                                <td>التنفس الصناعي</td>
                                <td>العلاج  </td>
                                <td>فوتو </td>
                                <td>الاكسجين </td>
                                <td>تغير الدم</td>
                                <td>اشعه عاديه</td>
                                <td>تحاليل </td>

                                <td>مصاريف اداريه </td>
                                <td>مصاريف رعايه</td>
                                <td>رسم دخول الحضان</td>
                                <td>اجهزه اخري</td>
                                <td>اجمالي المستحق</td>
                                
                                <td>التامين</td>
                                <td>الباقي</td>



                                 
                                



                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);


                                 var x = (from p in db.patient_history
                                          join pp in db.room_history
                                          on p.details_id equals pp.id
                                          where p.type=="حضانه"
                                         
                                          select new { p,pp } ).OrderByDescending(a=>a.p.id).ToList();


                                   if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                      x = (from p in db.patient_history
                                          join pp in db.room_history
                                          on p.details_id equals pp.id
                                          where p.type=="حضانه" && p.date>=d1 &&p.date<=d2

                                          select new { p,pp} ).OrderByDescending(a=>a.p.id).ToList();
                                 }

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {



                           %> 
                           
                                  <tr>
                                
                                <td><%=i %></td>
                              
                                <td><%=item.p.p_name %></td>
                                <td><%=item.p.service_name %></td>
                               

                                <td><%=item.p.date %></td>
                                <td><%=item.p.user_name %></td>

                                <td><%=item.pp.total %></td>
                                <td><%=item.pp.artificialBreath_val %></td>
                                <td><%=item.pp.treat_val %></td>

                                <td><%=item.pp.foto_val %></td>
                                <td><%=item.pp.oxcegin_val %></td>
                                <td><%=item.pp.blood_change_val %></td>

                                <td><%=item.pp.xray_val %></td>
                                <td><%=item.pp.lab_val %></td>
                                

                                
                                <td><%=item.pp.admistrations_val %></td>
                                
                                
                                <td><%=item.pp.care_val %></td>
                                <td><%=item.pp.enter_val %></td>
                               


                                <td><%=item.pp.dev_val %></td>
                                
                                <td><%=item.pp.total_val %></td>

                                <td><%=item.pp.insurance_val %></td>
                                <td><%=item.pp.reminder_val %></td>




        
                            </tr>
                              <%  i++;}
                                      %>
                            <tr style="background-color:#ffd800;font-size:larger">

                                <td colspan="5">الاجمالــــــــي</td>
                               
                               
                                <td ><%=x.Sum(a=>a.pp.total) %></td>
                                <td ><%=x.Sum(a=>a.pp.artificialBreath_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.treat_val) %></td>

                                <td ><%=x.Sum(a=>a.pp.foto_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.oxcegin_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.blood_change_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.xray_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.lab_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.admistrations_val) %></td>


                                <td ><%=x.Sum(a=>a.pp.care_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.enter_val) %></td>


                                <td ><%=x.Sum(a=>a.pp.dev_val) %></td>

                                <td ><%=x.Sum(a=>a.pp.total_val) %></td>

                              
                                <td ><%=x.Sum(a=>a.pp.insurance_val) %></td>
                                <td ><%=x.Sum(a=>a.pp.reminder_val) %></td>


                            </tr>
                            <%
    }%>
                           
                        </table>

                    </div>

                    </div>
               
         
        </div>

   
    </form>
    </body>
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

    </html>






