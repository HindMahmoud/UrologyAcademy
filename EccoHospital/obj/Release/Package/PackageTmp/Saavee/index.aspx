<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EccoHospital.Saavee.index" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الصفحة الرئيسية </a></li>
                     <%if (Session["role"].ToString() == "Accountant")
                        { %>
                  <li class="" style="color:black;float:left"><a><asp:HyperLink runat="server" NavigateUrl="~/Accountant/index.aspx">العودة الي الرئيسية</asp:HyperLink>  </a></li>
                  <%} %>

                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success">
                    <strong>تم بنجاح</strong><br />
                    <a href="#" class="alert-link">حسناً</a> .
                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    
                </div>
                <!--/End status alert-->


                <div class="page_content">
                    <div class="page_content">
                        <div class="quick_links text-center">
                            <h1 class="heading_title">الصفحة الرئيسية  للخزنه</h1>

                            <div class="clearfix"><br /><br /><br /></div>

                            <a href="AddTicketSavee.aspx" style="background-color: navy">

                                <h4>اضافة مريض جديد    </h4>

                            </a>
                                <a href="save.aspx" style="background-color: navy">

                                <h4>اضافه مبلغ تامين   </h4>

                            </a>
                             <a href="RecBalance.aspx" style="background-color: navy">

                                <h4>الخزنه   </h4>

                            </a>

                                   <a href="masrofat.aspx" style="background-color: navy">

                                <h4>اضافه مصروف   </h4>

                            </a>

                          <a href="search_payment.aspx" style="background-color: navy">

                                <h4>بحث المصروفات   </h4>

                            </a>

                            <a href="SearchIncome.aspx" style="background-color: navy">

                                <h4>بحث ايرادات   </h4>

                            </a>
                            <a href="patientPay.aspx" style="background-color: navy">

                                <h4>حساب مريض داخلي    </h4>

                            </a>
                             <a href="ClinicResrv.aspx" style="background-color: navy">

                                <h4>حجز عيادات    </h4>

                            </a>
                           <%-- <a href="t7sel.aspx" style="background-color: navy">

                                <h4>تحصيل   </h4>

                            </a>--%>
                            <a href="savePatient.aspx" style="background-color: navy">

                                <h4>خدمات مريض خارجي    </h4>

                            </a>
                            <%-- <a href="lab_reserv.aspx" style="background-color: navy">

                                <h4>حجز تحاليل خارجي    </h4>

                            </a>

                             <a href="rad_reserv.aspx" style="background-color: navy">

                                <h4>حجز اشعه خارجي    </h4>

                            </a>
                            <a href="ServiceReserv.aspx" style="background-color: navy">

                                <h4>حجز خدمات استقبال    </h4>

                            </a>--%>
                             <a href="TransferConfirm.aspx" style="background-color: navy">

                                <h4>ايراد الصيدليه     </h4>

                            </a>
                               <a href="returnReserv.aspx" style="background-color: navy">

                                <h4>  مرتجع حجز عيادات    </h4>

                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

