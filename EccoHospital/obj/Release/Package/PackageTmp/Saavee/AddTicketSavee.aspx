<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Saavee/Home.Master" CodeBehind="AddTicketSavee.aspx.cs" Inherits="EccoHospital.Saavee.AddTicketSavee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        

        .auto-style1 {
            right: 0px;
            top: -50px;
            padding-right:2%
        }
        .pull-right{padding:3px;padding-top:0px}

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
                    <li class="bring_right"><a href="">الخزينة </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">اضافة تذكرة جديدة  </h1>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                  <strong>تم ادخال البيانات بنجاح <a href="AddTicketSavee.aspx">حسنا</a>!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <%--<asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>--%>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <%--  <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    --%>
                </div>
                <!--/End status alert-->

                <div class="form" >
                        <div class="form-horizontal">
                        <div class="col-md-12">
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
                                       <asp:TextBox ID="natPatient" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator1"
                                        ControlToValidate="natPatient" runat="server"
                                        ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                        ValidationExpression="^\d{14}$">
                                    </asp:RegularExpressionValidator>
                                  </div>
                                     <div class="col-md-1 pull-right">
                                         السن:
                                       <asp:TextBox ID="age" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                  </div>
                                     <div class="col-md-2 pull-right">
                                          رقم التليفون 1 :
                                         <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                    <div class="col-md-2 pull-right">
                                         2 رقم التليفون :
                                         <asp:TextBox ID="mobiletxt" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                 <div class="clearfix"></div>
                                    <div class="col-md-3 pull-right">
                                          المحافظة :
                                         <asp:TextBox ID="govv" CssClass="form-control" runat="server"></asp:TextBox>
                                     </div>
                                     <div class="col-md-3 pull-right">
                                        المركز :
                                       <asp:TextBox ID="m" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                              
                                      <div class="col-md-12 " style="text-align:left" >
                                        <br />
                                       
                                       <asp:Button ID="btnSavepatient"  CssClass="btn btn-info"  Width="100px" runat="server" Text=" حفظ  " OnClick="btnSavepatient_Click1" /><br />
                                        <br />
                                    </div>
                                    </div>
                             </div>
                        </div>
                </div>
                    </div>
                  <br /> 
                <div class="clearfix"></div>
                <div class="form">
                        <div class="form-horizontal">
                        <div class="col-lg-12">
                                 <div class="row box box-group bg-info ">
                                <div class="col-md-12 ">
                                    <h3 runat="server" id="h3"> بيانات التذكرة</h3>
                                   
                                    <br/>
                                   
                                      
                                     <%--<div class="col-md-3 pull-right">
                                           
                                       رقم التذكرة:
                                      <asp:TextBox placeholder="رقم التذكرة "  ToolTip="رقم التذكرة " CssClass="form-control" ID="ticketname" Height="30px" runat="server" ></asp:TextBox>
                                   <asp:label runat="server" Visible="false" ID="lblticket" style="color:red">ادخل رقم التذكرة </asp:label>
                                        
                                    </div>--%>
                                     <div class="col-md-3 pull-right">
                                   
                                    اختيار من المرضي :
                                      <asp:DropDownList   ID="Patients"   AppendDataBoundItems="True"  CssClass=" Patients form-control js-example-placeholder-single select2" runat="server"  >
                                      </asp:DropDownList>
                                      <asp:label runat="server" Visible="false" ID="LblPat" style="color:red">اختار من المرضي </asp:label>
                                          </div>
                                     <div class="col-md-3 pull-right">
                                     نوع المريض:
                                       <asp:DropDownList   ID="type" ClientIDMode="Static" AppendDataBoundItems="true"  ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server" >
                                           <asp:ListItem></asp:ListItem>
                           
                                           <asp:ListItem>داخلى</asp:ListItem>

                                           <asp:ListItem>خارجى</asp:ListItem>

                                       </asp:DropDownList>
                                  </div>
                                     <div class="col-md-3 pull-right">
                                   
                                    الطبيب المحول :
                                      <asp:DropDownList   ID="doctos" ClientIDMode="Static" AppendDataBoundItems="True" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server"  DataTextField="name" DataValueField="id"  >
                                      </asp:DropDownList>
                                   </div>
                                    
                                  <br />
 <br /> <br /> <br /> <br />
                                      
                                 <div class="col-md-3 pull-right" style="margin-top:5px">      
                                    اختيار نوع التعامل  : <asp:label runat="server" Visible="false" ID="lbeltype" style="color:red">اختار نوع التعامل </asp:label>
                                    <br />
                                     <asp:RadioButton ID="r1" runat="server" groupname="typepat" Text="شركة"  AutoPostBack="true" OnCheckedChanged="r1_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:RadioButton ID="r2" Checked="true" runat="server" groupname="typepat" Text="فردي" />
                                        <%--<asp:RadioButtonList ID="RadioButtonList2" runat="server" display="block"  OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                            <asp:ListItem runat="server" ID="r1"  name="typePat" >شركة</asp:ListItem>
                                            <asp:ListItem runat="server" ID="r2" name="typePat">فردي</asp:ListItem>
                                        </asp:RadioButtonList>--%>
                                     </div> 
                                    <div class="col-md-3 pull-right">  
                                       
                                         اختيار من الشركات
                                        <asp:DropDownList  Enabled="false" ID="comps" style="float:left" ClientIDMode="Static" AppendDataBoundItems="True" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server"  DataTextField="name" DataValueField="id"  >
                                      </asp:DropDownList>
                                         </div>
                                    <div class="col-md-3 pull-right">  
                                     <br />
                                           <asp:Button ID="Button2"  enabled="false" cssClass="btn btn-info " runat="server" Text="+" OnClick="Button2_Click"/>       
                                      
                                    </div>
                                  
                                    <br />
                                    <br />
                                   </div>
                                    <div class="auto-style1">
                                         <br />
                                          <br />
                                        <hr />
                                                 <h3>بيانات المرافق</h3>
                                        
                                                <br />
                                                 <div class="col-md-3 pull-right">
                                                 اسم المرافق :
                                                       <asp:TextBox CssClass="form-control" ID="Rel_name" runat="server"></asp:TextBox>
                                   
                                                 </div>

                                                <div class="col-md-3 pull-right">
                                                 الهاتف :
                                                       <asp:TextBox CssClass="form-control" ID="Rel_phone" runat="server"></asp:TextBox>
                                   
                                                 </div>

                                                 <div class="col-md-3 pull-right">
                                                 رقم البطاقة :
                                                       <asp:TextBox CssClass="form-control" ID="National_id" runat="server"></asp:TextBox>
                                                       <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator2"
                                                    ControlToValidate="National_id" runat="server"
                                                    ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                                    ValidationExpression="^\d{14}$">
                                                </asp:RegularExpressionValidator>
                                                 </div>
                                                 <div class="col-md-2 pull-right">
                                                 السن :
                                                       <asp:TextBox CssClass="form-control" ID="Rel_age" runat="server"></asp:TextBox>
                                   
                                                 </div>
                                                <br />
                                         <div class="col-md-12 pull-right">
                                            صلة القرابة :      
                                          <asp:TextBox CssClass="form-control" style="width:22%" ID="Rel_num" runat="server"></asp:TextBox>
                                  
                                                 </div>
                                        
                                         <div class="col-md-12" style="width:136px">
                                        <br />
                                        <asp:Button ID="saveTicket"   CssClass="btn btn-info" Width="100px" runat="server" Text=" حفظ  " OnClick="saveTicket_Click" /><br />
                                         <br />
                                    </div>
                                        
                                        <div class="col-md-12"><br /><br /></div>
                                 </div>
                                    
                     
                                     
                                    
                                    <div class="clearfix"></div>
                             </div>
                     </div>
                                     </div>
                        </div>
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
