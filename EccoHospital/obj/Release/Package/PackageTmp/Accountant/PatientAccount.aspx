<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="PatientAccount.aspx.cs" Inherits="EccoHospital.Accountant.PatientAccount" %>
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
      
     <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="index.aspx">إدارة الحسابات</a></li>
                    <li class="bring_right"><a href="PatientAccount.aspx">  حساب تذكره</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title"> حساب تذكره </h1>

                <div class="form">
                    <div class="form-horizontal">
                        <div class="rtl bg-danger text-red">
                            <asp:ValidationSummary ValidationGroup="a" runat="server"
                                HeaderText="برجاء مراجعه المدخلات:" />
                            <asp:ValidationSummary ValidationGroup="b" runat="server"
                                HeaderText="برجاء مراجعه المدخلات:" />

                        </div>
                        <div class="col-md-12">

                             <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>


                                    <div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">كود التذكره </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="txt_code" placeholder="كود التذكره " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                    <asp:Label runat="server" Visible="false" CssClass="text-danger"  ID="lblticket"></asp:Label>
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>

    <div class="col-xs-3 pull-left">
        <br />
        <asp:Button ID="btn_deltails" CssClass="btn btn-primary"  OnClick="btn_deltails_Click"  runat="server" Text="تفاصيل" />
        </div>
                     </ContentTemplate>
                                 </asp:UpdatePanel>
                        </div>
                

                        </div>
                    </div>










</div>
            </div>
        </div>
    
       
</asp:Content>
