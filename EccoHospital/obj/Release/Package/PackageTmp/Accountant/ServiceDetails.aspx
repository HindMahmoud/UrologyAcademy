<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceDetails.aspx.cs" Inherits="EccoHospital.Accountant.ServiceDetails" %>




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
<form id="form23" runat="server">    
     <%  if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["n"])))
         {
             string n=Request.QueryString["n"].ToString();
                 %>
   <div class="container-fluid">
        <h1 class="heading_title">تقرير <%=n %> </h1>
                     <input type="button" value="Print" class="btn btn-primary hidden-print" onClick="window.print()">
                    

        <%

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
            {
                DateTime d3 = Convert.ToDateTime(Request.QueryString["date1"]);

                DateTime d4 = Convert.ToDateTime(Request.QueryString["date2"]);
                                %>
                        <h2><%DateTime v = Convert.ToDateTime(d3.ToShortDateString());
                                Response.Write(v.Day+"/"+v.Month+"/"+v.Year);

                            %> :  <%DateTime b = Convert.ToDateTime(d4.ToShortDateString());
                                      Response.Write(b.Day+"/"+b.Month+"/"+b.Year); %></h2>
                        <%
                            }


                            EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            DateTime d = DateTime.Now.Date;
                            DateTime dplus = d.AddDays(1);


                            var x = (from p in db.patient_history
                                     join pp in db.service
                                     on p.service_id equals pp.id
                                     where pp.dep_name == n
                                     && p.date >= d && p.date < dplus
                                     select p).ToList();


                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                x = (from p in db.patient_history
                                     join pp in db.service
                                     on p.service_id equals pp.id
                                     where pp.dep_name == n && p.date >= d1 && p.date <= d2

                                     select p).ToList();
                            }
                            var xx = (from s in db.service where s.dep_name==n select s).ToList();

                            if (x != null)
                            {
                                     %>
                             
          <table class="table table-bordered" id="mytable">
                            <tr>
                               <td colspan="4"></td>

                                
                                 <%
                                     foreach (var item2 in xx)
                                     {
                                      %>
                                <td><%=item2.name %></td>

                                <%
                                    }
                                     %>
                            </tr>

              <tr>

                   <td>#</td>
                              
                               
                                
                                 <td>اسم المريض</td>
                                
                                 <td> السعر</td>
                                
                              
                                 <td> التاريخ</td>
                   <%
                       foreach (var item2 in xx)
                       {
                                      %>
                                <td style="background-color:#0094ff"></td>

                                <%
                                    }
                                     %>

              </tr>
                                     <%
                                         int i = 1;
                                         foreach (var item in x)
                                         {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                               
                                <td><%=item.price %></td>
                                
                               

                                <td><%=item.date %></td>

                                 <%
                                     foreach (var item2 in xx)
                                     {
                                      %>

                                <%
                                    if (item.service_id == item2.id)
                                    {
                                     %>
                                <td style="background-color:aquamarine"><%=item.price %></td>

                                <%}
                                    else {
                                     %>
                                <td></td>
                                <%} %>
                                <%
                                    }
                                     %>

                                 
                                
                            </tr>
                              <%  i++;
                                  } %>
              <tr>
                  <td colspan="4"></td>
                   <%
                       foreach (var item2 in xx)
                       {

                                      %>
                                <td style="background-color:#0094ff"><%=x.Where(a => a.service_id == item2.id).Sum(a => a.price) %></td>

                                <%
                                    }
                                     %>
              </tr>
              <%
                  }%>
                           
                        </table>


   </div>
    <%} %>
    </form>
       </body>


                    

