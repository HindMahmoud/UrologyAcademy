<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="patientInfo.aspx.cs" Inherits="EccoHospital.Accountant.patientInfo" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                      <%--<li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>--%>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> حساب مريض</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <%
                        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();


                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                        {

                            int id = int.Parse(Request.QueryString["id"].ToString());
                            EccoHospital.Models.ticket tt = db.ticket.FirstOrDefault(A => A.code == id);

                            EccoHospital.Models.patient PPP = db.patient.FirstOrDefault(A => A.id ==tt.patient_id );
                         %>

                    <h1 class="heading_title"> <%=tt.code %> : <%=PPP.name %>   </h1>

                     <div class="col-md-6 pull-right">
                         <h4 class="text-center " style="font-weight:bold">خدمات</h4>
                         <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                            <td>النوع</td>
                         
                            <td>الخدمه</td>
                            <td>المبلغ</td>
                            

                        </tr>
                        <%   DateTime today = DateTime.Now.Date;
                            DateTime todayplus = today.AddDays(1);
                            var xx = (from p in db.patient_history where  p.ticketId ==id  && p.type!="عمليات" && p.type!="حضانه" &&p.type!="عنايه"  select p).ToList();

                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                //int po = Convert.ToInt32(Request.QueryString["pro"]);

                                xx = (from p in db.patient_history where p.ticketId ==id  && p.type!="عمليات" && p.type!="حضانه" &&p.type!="عنايه" && p.date >= d1 && p.date <=d2  select p).ToList();
                            }

                            if (xx != null)
                            {
                                int i = 1;
                                foreach (var item in xx)
                                {

                                    DateTime d = DateTime.Parse(item.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=d.ToLocalTime() %></td>
                          
                            <td><%=item.type %></td>
                            <td><%=item.service_name %></td>

                            <td><%=item.price %></td>
                          

                        
                        </tr>
                        <%  i++;
}
                                %>
                        <tr>
                            <td colspan="4"> الاجمالــــــــي</td>
                            <td><%=xx.Sum(a=>a.price) %></td>
                        </tr>
                        <%
    }
                            %>
                    </table>
                    </div>
                    
                    </div>


                    <div class="col-md-6 pull-right">
                        <h4 class="text-center " style="font-weight:bold"> سداد</h4>
                         <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>البيان</td>
                            <td>المبلغ</td>
                            

                        </tr>
                        <%  
                            var x = (from p in db.savee where  p.ticketId==tt.code  && p.out_value==0   select p).ToList();

                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                //int po = Convert.ToInt32(Request.QueryString["pro"]);

                                x = (from p in db.savee where  p.ticketId==tt.code  && p.date >= d1 && p.date <=d2 && p.out_value==0 select p).ToList();
                            }

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=d.ToLocalTime() %></td>
                          
                            <td><%=item.title %></td>
                            <td><%=item.in_value %></td>
                          

                        
                        </tr>
                        <%  i++;
}
                                %>
                        <tr>
                            <td colspan="3"> الاجمالــــــــي</td>
                            <td><%=x.Sum(a=>a.in_value) %></td>
                        </tr>
                        <%
    }
                            %>
                    </table>
                    </div>
                    
                    </div>
                   

                 
                     
                    <%} %>
                  
                </div>
            </div>
        </div>

  
</asp:Content>









