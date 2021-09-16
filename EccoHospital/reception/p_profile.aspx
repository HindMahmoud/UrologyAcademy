<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" Inherits="reception_p_profile" Codebehind="p_profile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <% EccoHospital.Models.EccoHospitalEntities  db = new EccoHospital.Models.EccoHospitalEntities(); %>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الاستقبال </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title"> حجز جديد   </h1>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                  <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <%--  <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    --%>
                </div>
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                        <div class="col-lg-12">
                        </div>
                        <div class="clearfix"></div>
                    
                        <asp:Panel ID="formContent" runat="server">

                            <br />
                            <div class="row box box-group ">
                               
                                <div class="col-md-12 bg-danger">
                                    <h3>خاص بالمستشفى </h3>
                              
     

                              
                                <div class="col-md-3 pull-right">
                                     تاريخ االدخول :
            <asp:TextBox CssClass="form-control" TextMode="Date" ID="date1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator6" ControlToValidate="date1" ErrorMessage="ادخل تاريخ الدخول ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                              <div class="col-md-3 pull-right">
                                    محول من دكتور  :
            <asp:DropDownList   ID="redirected" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>

                         

                       </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator8" ControlToValidate="redirected" ErrorMessage="ادخل الدكتور المحول منه  ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3 pull-right">
                                   قسم العلاج:
           <asp:DropDownList   ID="dep" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>

                         

                       </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator1" ControlToValidate="dep" ErrorMessage="ادخل قسم العلاج ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                  <div class="col-md-3 pull-right">
                                   اسم الدكتور :
           <asp:DropDownList   ID="doctor" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>

                         

                       </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator9" ControlToValidate="doctor" ErrorMessage="ادخل اسم الدكتور ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                     
                               <div class="col-md-3 pull-right">
                                     تاريخ الخروج :
            <asp:TextBox CssClass="form-control" TextMode="Date" ID="date2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator10" ControlToValidate="date2" ErrorMessage="ادخل تاريخ الخروج ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                    
                                   <div class="col-md-3 pull-right">
                                      مبلغ التأمين :
            <asp:TextBox CssClass="form-control" TextMode="Number" ID="price" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator12" ControlToValidate="price" ErrorMessage="ادخل مبلغ التأمين  ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                   <div class="col-md-3 pull-right">
                                      ملاحظات  :
            <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="notes" runat="server"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator14" ControlToValidate="price" ErrorMessage="ادخل مبلغ التأمين  ">
                                    </asp:RequiredFieldValidator>--%>
                                </div>
                                     <div class="col-md-3 pull-right">
                                   اسم شركة التعاقد :
           <asp:DropDownList   ID="company" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>

                         

                       </asp:DropDownList>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator14" ControlToValidate="company" ErrorMessage="ادخل شركة التعاقد  ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                    </div>
                                  <div class="col-md-12 bg-success">
                                    <h3>  المقيم بالمستشفى أو الضامن</h3>
                                   
                                   
                                  
                                   
                                     <div class="col-md-3 pull-right">
                                        اسم قريب المريض:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="name2" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator15" ControlToValidate="name2" ErrorMessage="ادخل اسم قريب المريض  ">
                                        </asp:RequiredFieldValidator>
                                    </div>
               
                                
                                      <div class="col-md-3 pull-right">
                                         درجة القرابة :
            <asp:TextBox ID="relative" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator18" ControlToValidate="relative" ErrorMessage="ادخل درجة القرابة  ">
                                    </asp:RequiredFieldValidator>
                                </div>

                              
                                <div class="col-md-3 pull-right">
                                    العنوان:
            <asp:TextBox CssClass="form-control" ID="address2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator19" ControlToValidate="address2" ErrorMessage="ادخل العنوان للقريب ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                       <div class="col-md-3 pull-right">
                                     رقم البطاقة :
              <asp:TextBox CssClass="form-control" ID="ssi2" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator4"
                                        ControlToValidate="ssi2" runat="server"
                                        ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                        ValidationExpression="^\d{14}$">
                                    </asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator22" ControlToValidate="ssi2" ErrorMessage="ادخل الرقم القومى للقريب ">
                                    </asp:RequiredFieldValidator>
                                </div>
                               <div class="col-md-3 pull-right">
                                    رقم التليفون  :
           <asp:TextBox CssClass="form-control" ID="mob2" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator3"
                                        ControlToValidate="mob2" runat="server"
                                        ErrorMessage=" خطأ في  رقم الهاتف ادخل 11 رقم"
                                        ValidationExpression="^\d{11}$">
                                    </asp:RegularExpressionValidator>
                                </div>
                                     
                                      <div class="col-md-3 pull-right">
                                    الوظيفه  :
           <asp:TextBox CssClass="form-control" ID="job2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator24" ControlToValidate="job2" ErrorMessage="ادخل الوظيفة  للقريب  ">
                                    </asp:RequiredFieldValidator>
                                </div>
                                         
                                    </div>
                                <div class="col-md-12" >
                                    <div class="col-md-6 clearfix"></div>
                                    <div class="col-md-3">
                                        <br />
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" OnClientClick="target='_blank';" CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                        <br />
                                    </div>
                                   
                            </div>
                            </div>
                            
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

