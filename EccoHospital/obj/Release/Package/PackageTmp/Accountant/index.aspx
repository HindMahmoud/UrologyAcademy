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


                                    <%--<div class="col-lg-4 pull-right  "style="background-color: #2980b9">--%>

                                       
                                        <a href="reportdoctors.aspx" style="background-color:cornflowerblue">
                                            <h4>   حساب الاطباء<%--<i class=" fa  fa-list"></i>--%></h4>
                                        </a>
                                        <a href="repoort.aspx" style="background-color:darkseagreen">
                                            <h4> التقارير<%-- <i class=" fa  fa-file"></i>--%></h4>
                                        </a>
                                    <%--</div>

                                       <div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                        <%--<a href="addPayment.aspx" style="background-color:crimson">
                                            <h4> اضافه مصروف<%--<i class=" fa  fa-file"></i>--</h4>
                                        </a>
                                    <%--</div>
                                        <div class="col-lg-4 pull-right  "style="background-color: #808080">--

                                        <a href="SearchPayment.aspx" style="background-color:darkturquoise">
                                            <h4> بحث مصروفات--%><%--<i class=" fa  fa-file"></i>--</h4>
                                        </a>
                                  <%--  </div>
                                            <div class="col-lg-4 pull-right  "style="background-color: #808080">--%>

                                       
                                    <%--</div>
                                    
<%--                                        <div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                      <%--  <a href="SurgeryCalcu.aspx" style="background-color:powderblue">
                                            <h4>  حساب عمليات<%--<i class=" fa  fa-file"></i>--</h4>
                                        </a>--%>
                                   <%-- </div>
                                        <div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                       
                                    <%--</div>
                                       <div class="col-lg-4 pull-right  "style="background-color: #808080">--%>

                 <%--                       <a href="CareCalcu.aspx" style="background-color:mediumaquamarine">
                                            <h4> حساب عنايه <%--<i class=" fa  fa-file"></i>--</h4>
                                        </a>
                                    <%--</div>
                                        <div class="col-lg-4 pull-right  "style="background-color: #2980b9">--

                                        <a href="NurseryCalc.aspx" style="background-color:mediumpurple">
                                            <h4> حساب حضان <%--<i class=" fa  fa-calculator"></i>--</h4>
                                        </a>--%>
                                    <%--</div>--%>
                                      <%-- //////old comment<div class="col-lg-4 pull-right  "style="background-color: #2980b9">

                                        <a href="RoomCalcu.aspx" style="color: white">
                                            <h3> حساب اقامه علاجيه <i class=" fa  fa-calculator"></i></h3>
                                        </a>
                                    </div>--%>
                                       <%--<div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                        <%--<a href="IncomeReport.aspx" style="background-color:coral">
                                            <h4>   تقرير ايردات<%--<i class=" fa  fa-money"></i>--</h4>
                                        </a>--%>
                                    <%--</div>
                                       <div class="col-lg-4 pull-right  "style="background-color: #808080">--%>

<%--                                         <a href="PaymentReport.aspx" style="background-color:powderblue">
                                            <h4> تقرير مصروفات <%--<i class=" fa  fa-dollar"></i></h4>--%>
                                        <%--</a>--%>
                                    <%--</div>--%>
                                     <%-- ////////old comment <div class="col-lg-4 pull-right  "style="background-color: #808080">

                                        <a href="AddTreatment.aspx" style="color: white">
                                            <h3> حساب ادويه داخلي <i class=" fa  fa-file"></i></h3>
                                        </a>
                                    </div>--%>
                                       <%--<div class="col-lg-4 pull-right  "style="background-color: #2980b9">--%>

                                       <%-- <a href="DailyIncomes.aspx" style="background-color:crimson">
                                            <h4>   استلام ايراد يومي <%--<i class=" fa  fa-calculator"></i></h4>
                                        </a>--%>
                                   <%-- </div>
                                       <div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                       <%-- <a href="paylist.aspx" style="background-color:mediumaquamarine">
                                            <h4>    لائحه مصروفات<%--<i class=" fa  fa-money"></i></h4>
                                        </a>--%>
                                    <%--</div>
                                        <div class="col-lg-4 pull-right  "style="background-color: #ff6a00">--%>

                                       <%-- <a href="IncomesSearch.aspx" style="background-color:mediumpurple">
                                            <h4>    بحث ايرادات<%--<i class=" fa  fa-money"></i>-</h4>
                                        </a>--%>
                                    <%--</div>
                                    
                                       <div class="col-lg-4 pull-right  "style="background-color: #2980b9">--%>

                                      <%--  <a href="accReports.aspx" style="background-color:powderblue">
                                            <h4>  تقارير <%--<i class=" fa  fa-calculator"></i>--</h4>
                                        </a>--%>
                                    <%--</div>--%>
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

