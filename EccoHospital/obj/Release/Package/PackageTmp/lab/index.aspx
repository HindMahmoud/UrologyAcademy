<%@ Page Title="" Language="C#" MasterPageFile="~/lab/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EccoHospital.lab.index" %>

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
                            <h1 class="heading_title">الصفحة الرئيسية  للتحاليل</h1>

                            <div class="clearfix"><br /><br /><br /></div>
                            <%-- <a href="lab_reception.aspx" style="background-color: navy">

                                <h4>حجز  داخلي   </h4>


                            </a>--%>
                            <a href="external_lab_reception.aspx" style="background-color: navy">

                                <h4>حجز تحليل   </h4>


                            </a>
                            <a href="dr_lab.aspx" style="background-color: navy">


                                <h4>نتيجه التحليل  </h4>

                            </a>

                               <a href="lab_today.aspx" style="background-color: navy">


                                <h4> تحاليل اليوم  </h4>

                            </a>

                              <a href="lab_search.aspx" style="background-color: navy">


                                <h4>  تقارير التحاليل  </h4>

                            </a>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

