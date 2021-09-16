<%@ Page Title="" Language="C#" MasterPageFile="~/rad/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EccoHospital.rad.index" %>


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
                            <h1 class="heading_title">الصفحة الرئيسية  للأشعه</h1>

                            <div class="clearfix"><br /><br /><br /></div>


                             <%-- <a href="rad_reception.aspx" style="background-color: navy">

                                <h4>حجز داخلي  </h4>
                             </a>--%>
                             <a href="external_rad.aspx" style="background-color: navy">

                                <h4>حجز اشعة  </h4>
                             </a>

                            <a href="dr_rad.aspx" style="background-color: navy">


                                <h4>نتيجه الأشعه  </h4>

                            </a>

                              <a href="rad_today.aspx" style="background-color: navy">


                                <h4> أشعه اليوم  </h4>

                            </a>
                             <a href="rad_search.aspx" style="background-color: navy">


                                <h4> تقارير الأشعه  </h4>

                            </a>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

