<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="addTicket.aspx.cs" Inherits="EccoHospital.reception.addTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

         .auto-style1 {
            right: 0px;
            top: -50px;
            padding-right: 2%;
        }
        

    </style>
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
     <script  type="text/javascript">
         $("#ticketname").keydown(function () {

             $('#lblticket').text = "";
         });
        
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        $('#Patients').on('change',function (e) {
            var selectedValue = $('#Patients').val();
            console.log("Value of dropdown is: " + selectedValue);
    });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities(); %>

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

                <h1 class="heading_title">اضافة مريض جديد  </h1>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                  <strong>تم ادخال البيانات بنجاح <a href="addTicket.aspx">حسنا</a>!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <%--<asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>--%>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                   
                </div>
                <!--/End status alert-->

                <div class="form" >
                        <div class="form-horizontal">
                        <div class="col-lg-12">
                                 <div class="row box box-group bg-info " >
                                <div class="col-md-12 ">
                                    <h3>  البيانات الشخصية للمريض</h3>
                                   
                                    <div class="col-md-3 pull-right">
                                        اسم المريض:
                                    <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="namepat" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" EnableClientScript="False" ForeColor="Red" ID="req" ControlToValidate="namepat" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>--%>
                                         <asp:label runat="server" Visible="false" ID="Label1" style="color:red">ادخل الاسم </asp:label>
                                   
                                    </div>
                                 <div class="col-md-3 pull-right">
                                         الرقم القومي :
                                       <asp:TextBox ID="natPatient" CssClass="form-control" AutoPostBack="true" runat="server" OnTextChanged="natPatient_TextChanged"></asp:TextBox>
                                      <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator1"
                                        ControlToValidate="natPatient" runat="server"
                                        ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                        ValidationExpression="^\d{14}$">
                                    </asp:RegularExpressionValidator>
                                     <asp:Label runat="server" Visible="false" ID="labssi" ForeColor="red">موجود مسبقا</asp:Label>
                                  </div>
                                     <div class="col-md-1 pull-right">
                                         السن:
                                       <asp:TextBox ID="age" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                  </div>
                                     <div class="col-md-1 pull-right">
                                        النوع :
                                      
                                         <asp:RadioButtonList CssClass="aa" ID="gender" runat="server" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="1">انثي</asp:ListItem>
                                             <asp:ListItem Value="2">ذكر</asp:ListItem>

                                        </asp:RadioButtonList>
                                  </div>
                                     <div class="col-md-2 pull-right">
                                          رقم التليفون 1 :
                                         <asp:TextBox ID="txtPhone" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtPhone_TextChanged" runat="server"></asp:TextBox>
                                           <asp:Label runat="server" Visible="false" ID="labphone" ForeColor="red">موجود مسبقا</asp:Label>
                                  
                                     </div>
                                     <div class="col-md-2 pull-right">
                                         رقم التليفون 2 :
                                         <asp:TextBox ID="mobiletxt" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                   
                                 <div class="clearfix"></div>
                                    
                                    <div class="col-md-3 pull-right">
                                          المحافظة :
                                         <asp:TextBox ID="govv" CssClass="form-control" runat="server"></asp:TextBox>
                                     </div>
                                     <div class="col-md-3 pull-right">
                                        المدينة :
                                       <asp:TextBox ID="m" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                     <div class="col-md-3 pull-right">
                                        القرية :
                                       <asp:TextBox ID="vall" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                  
                                     <div class="col-md-3 pull-right">
                                        اخري :
                                       <asp:TextBox ID="othertxt" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                   
                              <div class="col-md-12">
                                         <div class="auto-style1">
                                        
                                                 <h3>بيانات المرافق</h3>
                                        
                                                <br />
                                                 <div class="col-md-3 pull-right">
                                                 اسم المرافق :
                                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                   
                                                 </div>

                                                <div class="col-md-3 pull-right">
                                                 الهاتف :
                                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                                   
                                                 </div>

                                                 <div class="col-md-3 pull-right">
                                                 رقم البطاقة :
                                                       <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                                                       <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator3"
                                                    ControlToValidate="TextBox3" runat="server"
                                                    ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                                    ValidationExpression="^\d{14}$">
                                                </asp:RegularExpressionValidator>
                                                 </div>
                                                 <div class="col-md-2 pull-right">
                                                 السن :
                                                       <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                                   
                                                 </div>
                                                <br />
                                         <div class="col-md-12 pull-right">
                                            صلة القرابة :      
                                          <asp:TextBox CssClass="form-control" style="width:22%" ID="TextBox5" runat="server"></asp:TextBox>
                                  
                                                 </div>
                                         </div>
                             </div>
                                   </div>
                                     
                                      <div class="col-md-12 " style="text-align:left" >
                                        <br />
                                       
                                       <asp:Button ID="btnSavepatient"  CssClass="btn btn-info"  Width="100px" runat="server" Text=" حفظ  " OnClientClick="target='_blank;'" OnClick="btnSavepatient_Click1" /><br />
                                        <br />
                                    </div>
                        </div>
                </div>
                    </div>
                  <br /> 
                <div class="clearfix"></div>
                
                </div>
                    </div>
                
               
               
            </div>
        
   

     

    <script>
        $('#date').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            //"timePicker": true,
            "timePickerIncrement": 5,
            "autoApply": true,

            "locale": {
                "format": "DD/MM/YYYY",

            }
        });
    </script>

   
</asp:Content>


