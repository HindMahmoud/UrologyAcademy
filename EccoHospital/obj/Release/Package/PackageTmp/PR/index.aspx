<%@ Page Title="" Language="C#" MasterPageFile="~/PR/MasterPage.master" AutoEventWireup="true" Inherits="PR_index" Codebehind="index.aspx.cs" %>

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
                            <h1 class="heading_title">الصفحة الرئيسية للعلاقات العامة</h1>

                            <div class="clearfix"><br /><br /><br /></div>
                           
                        <a href="adduser.aspx" style="background-color: darkorange">

                                <h4>اضافة مستخدمين </h4>


                            </a>
                          <a href="addDoctors.aspx" style="background-color: navy">

                                <h4>اضافة اطباء </h4>
                            </a>
                            <a href="lab.aspx" style="background-color: navy">

                                <h4>التحاليل </h4>


                            </a>

                            <a href="radd.aspx" style="background-color: navy">

                                <h4>الاشعة </h4>
                            </a>

                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

