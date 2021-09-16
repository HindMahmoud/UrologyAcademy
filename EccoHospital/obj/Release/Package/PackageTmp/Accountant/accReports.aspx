<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="accReports.aspx.cs" Inherits="EccoHospital.Accountant.accReports" %>








<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">

         $(function () {
             initdropdown();
         })
         function initdropdown() {
            $(".js-example-placeholder-single").select2({
                placeholder: "...اختار",
                allowClear: true
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                      <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">  بحث ايرادات </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">تقرير حسابات  </h1>

                      
                     <div class="col-md-4 pull-right">
                          من:
             <asp:TextBox ID="txt_from" TextMode="Date" CssClass="form-control " runat="server" ></asp:TextBox>
                                    </div>
                     <div class="col-md-4 pull-right">
                          الي:
             <asp:TextBox ID="txt_to" TextMode="Date" CssClass="form-control " runat="server" ></asp:TextBox>
                                    </div>
                    <div class="col-md-12 pull-right">
                        </div>
                    <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="btn" CssClass="btn btn-primary " OnClick="btn_Click" Text="تقرير عمليات" runat="server" ></asp:Button>
                                    </div>
                      <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button1" CssClass="btn btn-primary " OnClick="Button1_Click" Text="تقرير حضانه" runat="server" ></asp:Button>
                                    </div>

                     <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button2" CssClass="btn btn-primary " OnClick="Button2_Click" Text=" تقرير عيادات اجمالي" runat="server" ></asp:Button>
                                    </div>

                    <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button3" CssClass="btn btn-primary " OnClick="Button3_Click" Text=" تقرير عيادات تفصيلي" runat="server" ></asp:Button>
                                    </div>
                    <div class="col-md-12"></div>
                     <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button4" CssClass="btn btn-success " OnClick="Button4_Click" Text=" تقرير عنايه " runat="server" ></asp:Button>
                                    </div>

                      <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button5" CssClass="btn btn-success " OnClick="Button5_Click" Text=" تقرير حضان " runat="server" ></asp:Button>
                                    </div>
                    <div class="col-md-2 pull-right">
                         <br />
             <asp:Button ID="Button6" CssClass="btn btn-success " OnClick="Button6_Click" Text="  تقرير عمليات " runat="server" ></asp:Button>
                                    </div>
                  </div>
                </div>
       </div>
    </asp:Content>
