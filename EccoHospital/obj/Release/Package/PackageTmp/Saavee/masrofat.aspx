<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="masrofat.aspx.cs" Inherits="EccoHospital.Saavee.masrofat" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">إدارة الخزنه</a></li>
                        <li class="bring_right"><a href="">المصروفات</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">المصروفات</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="masrofat.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                          
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">بيان </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_byan" placeholder="بيان " runat="server" >
                                </div>

                                <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="req" ControlToValidate="txt_byan" ErrorMessage="ادخل البيان  ">
                                        </asp:RequiredFieldValidator>
                            </div>

                                <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">القيمه  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_value" placeholder="القيمه  " runat="server" >
                                   
                                    
                                </div>
                                    <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txt_value" ErrorMessage="ادخل القيمه  ">
                                        </asp:RequiredFieldValidator>
                            </div>


                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             البند    </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddlpay" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>

                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">ملاحظات  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txt_notes" TextMode="MultiLine" class="form-control" placeholder="ملاحظات"  runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <!--/End Main content container-->
</asp:Content>





