<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EccoHospital.Accountant.index" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="index.aspx">الصفحة الرئيسية </a></li>
                   
                     </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <div class="page_content">
                    <div class="quick_links text-center">
                                   
                            <div class="col-lg-12 pull-right table-bordered">
                                <div class="col-lg-12 quick_links">
                                    <div class="col-lg-12 pull-right">

                                        <h1 class="heading_title"> الوصول السريع</h1>
                                    </div>
                                  
                                </div>

                                   <div class="col-lg-12 quick_links">
                                        <a href="sumdoctors.aspx" style="background-color:cornflowerblue">
                                            <h4>   حساب الاطباء<%--<i class=" fa  fa-list"></i>--%></h4>
                                        </a>
                                        <a href="unitacount.aspx" style="background-color:darkseagreen">
                                            <h4>   تقرير الوحدة<%--<i class=" fa  fa-list"></i>--%></h4>
                                        </a>
                                        <a href="repoort.aspx" style="background-color:cornflowerblue">
                                            <h4> التقارير<%-- <i class=" fa  fa-file"></i>--%></h4>
                                        </a>
                             
                                </div>
                               
                            </div>
                         
                        </div>
                   
                </div>
            </div>
        </div>
        <!--/End Main content container-->



    </div>

    <!--/End body container section-->
</asp:Content>

