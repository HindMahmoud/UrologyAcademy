<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="clinicReport.aspx.cs" Inherits="EccoHospital.Accountant.clinicReport" %>


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

   <div class="container-fluid">
        <h1 class="heading_title">تقرير عيادات اجمالي</h1>
                    
                     <input type="button" value="Print" class="btn btn-primary hidden-print" onClick="window.print()">

        <%

                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                            {
                                DateTime d3 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d4 = Convert.ToDateTime(Request.QueryString["date2"]);
                                %>
                        <h2><%Response.Write(Convert.ToDateTime(d3.ToShortDateString()).Day + "/" + Convert.ToDateTime(d3.ToShortDateString()).Month + "/" + Convert.ToDateTime(d3.ToShortDateString()).Year);  %> :  <%Response.Write(Convert.ToDateTime(d4.ToShortDateString()).Day+"/"+Convert.ToDateTime(d4.ToShortDateString()).Month+"/"+Convert.ToDateTime(d4.ToShortDateString()).Year); %></h2>
                        <%
                            }
                             %>
       <table class="table table-bordered" id="mytable">
                        <tr style="background-color:#eee9e9">
                            <th>#</th>

                           
                            <th>العيــــــــــــاده</th>

                           

                            <th>الاجمالي</th>

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from s in db.clinic select s).ToList();
                            var zz = (from p in db.clinic_reception where p.clinic_id!=null select p).ToList();
                            double yy = 0;
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                zz = (from p in db.clinic_reception where p.clinic_id!=null&& p.date>=d1 && p.date<=d2 select p).ToList();


                            }
                                yy = Math.Round(double.Parse(zz.Sum(a => a.price).ToString()), 4);

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    int id = int.Parse(item.id.ToString());

                                    var z = (from p in db.clinic_reception where p.clinic_id == id select p).ToList();


                                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                                    {
                                        DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                        DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                        //int po = Convert.ToInt32(Request.QueryString["pro"]);
                                        z = (from p in db.clinic_reception where p.clinic_id == id && p.date>=d1 && p.date<=d2 select p).ToList();
                                        zz = (from p in db.clinic_reception where p.clinic_id == id  && p.date>=d1 && p.date<=d2 select p).ToList();


                                    }
                                    double y = Math.Round(double.Parse(z.Sum(a => a.price).ToString()), 4);

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

    </form>
       </body>


                    
