<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="index" Codebehind="index.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الصفحة الرئيسية</a></li>

                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success">
                    <strong>تم بنجاح</strong><br />
                    <a href="chatpage.aspx" class="alert-link">حسناً</a> .
                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    
                </div>
                <!--/End status alert-->


                <div class="page_content">
                    <div class="page_content">
                        <div class="quick_links text-center">
                            <h1 class="heading_title">الصفحة الرئيسية</h1>

                            <div class="clearfix"><br /><br /><br /></div>
                            <a href="/reception/index.aspx" style="background-color: cornflowerblue">


                                <h4>البيانات الطبية</h4>

                            </a>
                        
                             <a href="/PR/index.aspx" style="background-color: darkkhaki">


                                <h4>العلاقات العامة</h4>

                            </a>

                          <a href="/lab/index.aspx" style="background-color: navy">


                                <h4>التحاليل الطبية</h4>

                            </a>

                              <a href="/rad/index.aspx" style="background-color: cadetblue">


                                <h4>الاشعة </h4>

                            </a>
                           <a href="/Accountant/index.aspx" style="background-color: cadetblue">


                                <h4>الحسابات </h4>

                            </a>

                      <!--      <a href="list.aspx" style="background-color: navy">

                                <h4>غرف العمليات  </h4>


                            </a>

                            <a href="typeCard.aspx" style="background-color: navy">

                                <h4>العناية المركزة</h4>


                            </a>
                            <a href="returnadd.aspx" style="background-color: navy">

                                <h4>الحضانات</h4>


                            </a>
                            <a href="destroyAdd.aspx" style="background-color: navy">

                                <h4>المعمل  </h4>


                            </a>
                            <a href="detroySearch.aspx" style="background-color: navy">

                                <h4>الاشعة  </h4>


                            </a>
                            <a href="importadd.aspx" style="background-color: darkorange">

                                <h4> مواعيد الاطباء</h4>


                            </a>

                            <a href="importAddSearch.aspx" style="background-color: darkorange">

                                <h4> زيارة الاطباء </h4>


                            </a>


                            <a href="exchangeItems.aspx" style="background-color: deepskyblue">

                                <h4>حساب تذكرة </h4>


                            </a>
                            <a href="exchangeSearch.aspx" style="background-color: deepskyblue">

                                <h4>اضافة تقرير طبى</h4>


                            </a>
                            <a href="receiveItems.aspx" style="background-color: deepskyblue">

                                <h4>بحث المرضى</h4>


                            </a>
                            <a href="receiveItems.aspx" style="background-color: hotpink">

                                <h4>التقارير</h4>


                            </a>
                          
-->

         <img class=" img-circle center-block " style="width:350px;height:200px"  src="img/academy.png" />


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

