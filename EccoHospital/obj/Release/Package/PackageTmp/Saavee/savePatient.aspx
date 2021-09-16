<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="savePatient.aspx.cs" Inherits="EccoHospital.Saavee.savePatient" %>


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
                       
                        <li class="bring_right"><a href="">مريض خارجي</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title"> مريض خارجي</h1>


              

                    <div class="form">
                        <div class="form-horizontal">
                            <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                            <div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList Width="50%" AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>
     

                    <div class="form-group">
                                
                                <div class="col-sm-10">
                                   <asp:Button runat="server" OnClick="btn_enter_Click" ID="btn_enter" CssClass="btn btn-primary" Text=" تسجيل"></asp:Button>
                                    </div>
                            </div>
     </ContentTemplate>

   </asp:UpdatePanel>


                          
                    </div>
                </div>
          </div>
                </div>
       </div>
    
      <asp:Panel runat="server" ID="bb">
                         <div class="row">
    <div class="col-lg-12">

        
        <div id="myModal1" class="modal fade" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content ">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" style="float:left;font-size:30px">&times;</button>
                                                                <h4 class="modal-title">اضافه مريض</h4>
                                                            </div>
                                                            <div class="modal-body ">
                                                                <div class="row box box-group bg-info ">
                                <div class="col-md-12">
                                    <h3> البيانات الشخصية</h3>
                                   <div class="col-md-4 pull-right">
                                        اسم المريض:
                                    <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="namepat" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" EnableClientScript="False" ForeColor="Red" ID="req" ControlToValidate="namepat" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>
                                         <%--<asp:label runat="server" Visible="false" ID="Label1" style="color:red">ادخل الاسم </asp:label>--%>
                                   
                                    </div>
                                     <div class="col-md-4 pull-right">
                                         الرقم القومي :
                                       <asp:TextBox ID="natPatient" CssClass="form-control"  runat="server"></asp:TextBox>
                                      <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator1"
                                        ControlToValidate="natPatient" runat="server"
                                        ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                        ValidationExpression="^\d{14}$">
                                    </asp:RegularExpressionValidator>
                                  </div>
                               
                                 <div class="col-md-4 pull-right">
                                         السن:
                                       <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                  </div>
                                    </div>
                                                                    <br />
                                      <div class="col-md-12 bg-info">
                                       <div class="col-md-4 pull-right">
                                       
                                          رقم التليفون 1 :
                                         <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                                                     <div class="col-md-4 pull-right">
                                         رقم التليفون 2 :
                                         <asp:TextBox ID="mobiletxt" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                     
                                    <div class="col-md-4 pull-right" style="float:right">
                                          المحافظة :
                                         <asp:TextBox ID="govv" CssClass="form-control" runat="server"></asp:TextBox>
                                     </div>
                                    
                                     
                                    <br />
                                     <div class="col-md-4 pull-right">
                                        المركز :
                                       <asp:TextBox ID="m" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                         </div>
                          

                                            <div class="modal-footer">
                                                
                                              <asp:Button type="button" runat="server" ID="btnSave" class="btn btn-danger" style="float:left;"  OnClick="btnSave_Click" Text="حفظ"/>
                                           </div>
                                   </div>
                           
                                                                    
                 </div>
                                                            </div>

            </div>
        
                     <br /><br />
                     <br /><br />

                    </div>
                        </div>
                             </div>
                      </asp:Panel>
        <!--/End Main content container-->
</asp:Content>






