<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/External Clinics/MasterPage.master" CodeBehind="ReportReserveClinic.aspx.cs" Inherits="EccoHospital.External_Clinics.ReportReserveClinic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .form-horizontal {
        margin-right:2px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home ">العيادات الخارجية</span></li>
                    <li class="bring_right"><a href="">  تقرير الحجوزات لعيادة <%=Session["ClinicName"] %> </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title"> تقرير حجوزات <% %>   </h1>
                
                <!--Start status alert-->
    <div class="form-horizontal">
       <div class="col-md-4 pull-right" >
            اسم العيادة
             <asp:DropDownList ID="DropDownList1" validationgroup='a'  clientidmode="Static" cssclass="form-control" runat="server"></asp:DropDownList>
            </div>
        <div class="col-md-4 pull-right">
            من
         <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>
       </div>
        <div class="col-md-4 pull-right" >
           
                الي
             <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>
        </div>
         
        <div class="col-md-12 text-center">
            <br />
            <asp:Button CssClass="btn btn-success" OnClick="show_Click" ID="show" Width="100px" runat="server" Text="عرض" />
       <asp:Button CssClass="btn btn-default" OnClick="button1_Click" ID="Button1" Width="100px" runat="server" Text="طباعه" />
     
            <br />
             </div>
    </div>
<br />
                <br />
    <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <%--<h3 class="box-title">تقرير لعيادة </h3>
              --%>

            </div>
                <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                    string g = Convert.ToString(Session["ClinicName"]);
                    var  x = (from PP in db.clinic_reception

                              select PP  ).ToList();
                    if (g!=""&&Session["role"].ToString()!="Admin")
                    {
                        x = (from PP in db.clinic_reception
                             where PP.clinic_name == g
                             select PP).ToList();

                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) && String.IsNullOrEmpty(Convert.ToString(Request.QueryString["clinicName"])))
                        {
                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                            DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                            x = (from PP in db.clinic_reception
                                 where PP.date >= d1 && PP.date <= d2
                                 select PP).ToList();

                        }


                    }
                    else {
                        string cname = "";
                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) && String.IsNullOrEmpty(Convert.ToString(Request.QueryString["clinicName"])))
                        {
                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                            DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                            x = (from PP in db.clinic_reception
                                 where PP.date >= d1 && PP.date <= d2
                                 select PP).ToList();

                        }
                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["clinicName"])))
                        {
                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                            DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                            cname = Convert.ToString(Request.QueryString["clinicName"]);
                            x = (from PP in db.clinic_reception
                                 where PP.clinic_name == cname && PP.date >= d1 && PP.date <= d2
                                 select PP).ToList();

                        }
                        if (String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["clinicName"])))
                        {
                            cname = Convert.ToString(Request.QueryString["clinicName"]);
                            x = (from PP in db.clinic_reception
                                 where PP.clinic_name == cname
                                 select PP).ToList();

                        }

                    }
                         %>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                <tr> 
                          <td>#</td>
                          <td>اسم المريض</td>
                          <td> اسم الطبيب</td>
                          <td> اسم العيادة</td>
                          <td> التـــــــــاريخ</td>
                          <td> نوع الخدمة</td>
                          <td> سعر الخدمة</td>

                </tr>
                       <% if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                   
                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=item.patient_name %></td>
                            <td><%=item.doctor_name %></td>
                             <td><%=item.clinic_name %></td>
                            <td><%DateTime r = Convert.ToDateTime(item.date);
                                    Response.Write(r.Day + "/" + r.Month + "/" + r.Year); %></td>
                           <td><%=item.type %></td>
                           <td><%=item.price %></td>
                            
                           
                        </tr>
                        <%  i++;
    }
                                %>
                       

                        <%
    }
                            %>
              </table>
               
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

                </div>
            </div>
        </div>
    


 <%--   <script>

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
    </script>--%>
        
        
</asp:Content>


