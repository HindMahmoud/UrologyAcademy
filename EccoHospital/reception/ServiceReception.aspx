<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="ServiceReception.aspx.cs" Inherits="EccoHospital.reception.ServiceReception" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                      <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">حجز خدمات</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">حجز خدمات</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="ServiceReception.aspx" class="alert-link">حسناً</a> . </div>
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
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>
     </ContentTemplate>

   </asp:UpdatePanel>


                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم الخدمه   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_lab" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ddl_lab_TextChanged"></asp:DropDownList>
                                    </div>
              </div>

                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> السعر  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" placeholder=" السعر  " runat="server" >
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h1 class="heading_title">عرض كل الخدمات</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="ServiceReception.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                     <%-- <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                
                                </div>
                            </div>--%>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                               
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                 <td> السعر</td>
                                 <td> التاريخ</td>
                                <td> اسم المستخدم</td>
                                 <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                
                                 var x = (from p in db.patient_history
                                          where p.type=="خدمات" 

                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                                <td><%=item.service_name %></td>
                                <td><%=item.price %></td>
                                <td><%=item.date %></td>
                                <td><%=item.user_name %></td>


                                 
                                <td>
                                    <a href="ServiceReception.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="ServiceReception.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

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
                                    <asp:TextBox CssClass="form-control" ID="namepata" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" EnableClientScript="False" ForeColor="Red" ID="req" ControlToValidate="namepata" ErrorMessage="ادخل الاسم  ">
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
                                                
                                              <asp:Button  runat="server" ID="btnSave" class="btn btn-danger" style="float:left;"   Text="حفظ"/>
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






