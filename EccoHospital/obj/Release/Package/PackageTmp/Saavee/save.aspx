<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="save.aspx.cs" Inherits="EccoHospital.Saavee.save" %>

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
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">إدارة الخزنه</a></li>
                        <li class="bring_right"><a href="">اضافه مبلغ تامين</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">اضافه مبلغ تامين</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="save.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
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
                           <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">مبلغ التأمين </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" readonly  id="txt_old" placeholder="مبلغ التأمين " runat="server" >
                                   
                                    
                                </div>
                            </div>

                           <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">التاريخ </label>
                                <div class="col-sm-10">
                                    <asp:TextBox    class="form-control"   id="datetxt" textMode="Date" runat="server" ></asp:TextBox>
                                   
                                    
                                </div>
                            </div>
     </ContentTemplate>

   </asp:UpdatePanel>

                               


                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">المبلغ </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_value" placeholder="المبلغ " runat="server" >
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





