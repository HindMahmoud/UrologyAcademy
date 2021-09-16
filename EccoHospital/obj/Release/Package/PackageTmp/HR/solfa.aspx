<%@ Page Title="" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="solfa.aspx.cs" Inherits="EccoHospital.solfa" %>
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
       <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">  الموظفون</a></li>
                        <li class="bring_right"><a href="">اضافة سلفة جديدة</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content ">

                    <h1 class="heading_title">اضافة سلفة جديدة</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم الحفظ بنجاح!</strong><br /> <a href="solfa.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="row form  " dir="rtl">
                      
                       

                        <div class="form-group">
                                <div class="col-sm-3 pull-right">
                                <label for="input3" class=" control-label bring_right left_text">الموظف</label>

                                     <asp:DropDownList ToolTip="select2"  ID="importerss" required  CssClass="form-control js-example-placeholder-single  select2 " runat="server">
                                
                            </asp:DropDownList>
                                </div>
                             </div>
                            <div class="form-group">
                                <div class="col-sm-3 pull-right">
                                <label for="input3" class=" control-label bring_right left_text">التاريخ</label>

                                     <asp:TextBox   ID="date"  required  TextMode="Date" CssClass="form-control " runat="server">
                                
                            </asp:TextBox>
                                </div>
                                </div>

                                 <div class="form-group">
                                <div class="col-sm-6 pull-right">
                                <label for="input3" class=" control-label bring_right left_text">البيان</label>

                                     <asp:TextBox   ID="txttitle"  required  CssClass="form-control " runat="server"> </asp:TextBox>
                                </div>
                                 </div>
                            <div class="form-group">
                                <div class="col-sm-3 pull-right">
                                <label for="input3" class=" control-label bring_right left_text">اجمالي المبلغ</label>

                                     <asp:TextBox   ID="txttotal"  required  CssClass="form-control " runat="server"> </asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="text-danger"  ID="RegularExpressionValidator2"
    ControlToValidate="txttotal" runat="server"
    ErrorMessage="خطأ " 
    ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
</asp:RegularExpressionValidator>
                                </div>
                                
                                 </div>
                      
                           
   
                               <div class="form-group">
                                <div class="col-sm-3 pull-right">
                                <label for="input3" class=" control-label bring_right left_text">عدد الاقساط </label>

                                     <asp:TextBox  TextMode="Number"  ID="txtInstalNO" Text="0"   required  CssClass="form-control " runat="server"> </asp:TextBox>
                                </div>
                                 </div>
                             

                          
                           


                <div class="form-group">
                                <div class="col-sm-12 ">
                                     <asp:Button ID="btn" CssClass="btn btn-success center-block" OnClick="btn_Click" runat="server" Text="حفظ" />
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
           
        </div>
                    </div>
                </div>
           </div>
    
</asp:Content>
