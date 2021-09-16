<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" MasterPageFile="~/External Clinics/MasterPage.master" Inherits="EccoHospital.External_Clinics.index" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">العيادات الخارجيه </a></li>
                        <li class="bring_right"><a href="">عيادة <%=Session["ClinicName"] %></a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">حجوزات اليوم</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div>
                       
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <%--<asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                --%>
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                                 <td >  اسم المريض </td>
                                 <td > اسم العيادة </td>
                                <td> نوع الخدمة </td>
                                 <td> السعر </td>
                                <td> الحالة </td>
                                 <td> حالة الدفع </td>
                                <td > ملف المريض </td>
                               
                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);
                                 var x = (from p in db.clinic_reception
                                          join h in db.patient_history
                                          on p.id equals h.details_id
                                          where h.type == "عيادات" && p.datenow >= d && p.datenow < dplus
                                          select new { p, h }).ToList();
                                 if (Session["role"].ToString() != "Admin")
                                 {
                                     if (Session["ClinicName"] != null)
                                     {
                                         string s = Session["ClinicName"].ToString();
                                         x = (from h in db.patient_history
                                              join p in db.clinic_reception
                                              on h.details_id equals p.id
                                              where h.type == "عيادات" && h.service_name == s
                                               && p.datenow >= d && p.datenow < dplus
                                              select new { p, h }).ToList();
                                     }
                                 }
                                 //var x = (from p in db.clinic_reception join h in db.patient_history on p.id equals h.details_id where p.datenow<=d &&p.datenow>=dplus && p.type=="عيادات"
                                 //  select new{p,h}).ToList();

                                 if (x != null)
                                 {
                                     int f = 0;

                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%=item.p.patient_name %></td>
                                 <td><%=item.p.clinic_name %></td>
                                <td><%=item.p.type %></td>
                                <td><%=item.p.price %></td>
                                
                               <td><%if (item.p.status == true)
                                        { %>
                                    <a href="index.aspx?idrec=<%=item.p.id %>" Class="btn btn-default" width:"100%" >Done</a>
                                    <%}
                                        else if (item.p.status == false)
                                        {
                                            f = 1;%>
                                    <a href="index.aspx?idrec=<%=item.p.id %>"
                                    Class="btn btn-primary">wait</a>
                                    <%}
                                      else if(item.p.status==true&&f!=1) { %>
                                      <a href="index.aspx?idrec=<%=item.p.id %>"
                                    Class="btn btn-danger">Enter</a>
                                    
                                    <%} %>
                                    </td>
                                  <td><%if (item.h.confirm_calc == true)
                                        { 
                                      Response.Write("تم الدفع");
                                       }
                                        else if (item.h.confirm_calc  == false)
                                        {
                                           Response.Write("لم يتم  الدفع");
                                    
                                    } %>
                                    </td>
                             <td>
                                  <%if (item.p.clinic_name != "نساء وتوليد")
                                      { %>
                                  <a href="profile.aspx?patid=<%=item.p.patient_id%>" style="color:brown;font-size:20px"  data-toggle="tooltip"
                                       data-placement="top" title="profile"><i class="fa fa-arrow-circle-left"></i> </a>
                               <%}
                                else
                              { %>
                                  <a href="profile2.aspx?patid=<%=item.p.patient_id%>" style="color:brown;font-size:20px"  data-toggle="tooltip"
                                       data-placement="top" title="profile"><i class="fa fa-arrow-circle-left"></i> </a>
                             <%} %>
                                  </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>

                    </div>
                </div>
            </div>
        </div>
        <!--/End Main content container-->
    <script>
     
        </script>
</asp:Content>
