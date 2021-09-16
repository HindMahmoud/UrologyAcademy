<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/lab/MasterPage.master" CodeBehind="external_lab_reception.aspx.cs" Inherits="EccoHospital.lab.external_lab_reception" %>
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
    <style>
        .lb {
            padding-right:39px
        }
            .lb label {
                margin-left:4px
            }
        .header {margin:auto auto;padding:2px 0px;border-bottom:2px solid #E64759;width:20%;text-align:center
        }
    </style>
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
                       
                        <li class="bring_right"><a href="">  حجز تحاليل </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content" style="margin-bottom:1px">

                    <h3 class="header">حجز تحاليل</h3>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="external_lab_reception.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form" style="padding-top:25px;padding-bottom: 2px">
                        <div class="form-horizontal">
                            <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                           
                     <%if (String.IsNullOrEmpty(Request.QueryString["p_id"])&&String.IsNullOrEmpty(Request.QueryString["p_idedit"]))
                       {%>
                                <div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">كود المريض </label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txt_code" placeholder="كود المريض " OnTextChanged="txt_code_TextChanged" AutoPostBack="true"  runat="server"></asp:TextBox>
                                    <asp:Label runat="server" Visible="false" CssClass="text-danger"  ID="lblticket"></asp:Label>
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" ToolTip="select" OnTextChanged="patientlist_SelectedIndexChanged" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>
        <%} %>
     </ContentTemplate>

   </asp:UpdatePanel>


                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم التحليل   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_lab" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ddl_lab_TextChanged"></asp:DropDownList>
                                    </div>
              </div>
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
            اسم الطبيب   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddldoctors"  CssClass="form-control js-example-placeholder-single select2" runat="server" >
             </asp:DropDownList>
                                    
                                    </div>
              </div>

                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> السعر  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" Enabled="false" placeholder=" السعر  " runat="server" >
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> اسم الطبيب المحول  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="docName" Enabled="false" placeholder=" اسم الطبيب المحول  " runat="server" >
                                </div>
                            </div>
                             <div class="form-group">
                                
                               
                                 <div class="col-md-9">
                                     <label for="input0" class="col-sm-4 control-label bring_right left_text"> السعر النهائي  </label>
                                    
                                      <input  type="text" class="form-control" ClientIDMode="Static" id="priceDis"  placeholder=" السعر النهائي  " runat="server" >
                                 </div>
                                  <div class="col-sm-3">
                                    <label for="input0" class="col-sm-2 control-label bring_right left_text"> الخصم  </label>
                                    <asp:TextBox  class="form-control" id="discount" ClientIDMode="Static" placeholder=" الخصم  " AutoPostBack="true"  runat="server" OnTextChanged="discount_TextChanged" >0</asp:TextBox>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn"  CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                       <%if (String.IsNullOrEmpty(Request.QueryString["p_id"]))
                           { %>
                    <div>

                        <h3 class="header">عرض كل التحاليل</h3>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="lab_reception.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                   <%--   <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>
                                </div>
                            </div>--%>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>اسم المريض</td>
                               <td>اسم الطبيب المحول</td>
                                 <td> التحليل</td>
                                 <td> السعر</td>
                                 <td> التاريخ</td>
                                 <td>اسم المستخدم</td>
                                <td></td>
                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
    DateTime d = DateTime.Now.Date;

    var x = (from p in db.patient_history
             join n in db.lab_history on p.details_id equals n.id
             where p.type == "تحاليل"
             
             select new { p, n.docNmae }).ToList();

    if (x != null)
    {
        int i = 1;
        foreach (var item in x)
        {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p.p_name %></td>
                                <td><%=item.docNmae %></td>
                                <td><%=item.p.service_name %></td>
                                <td><%=item.p.price %></td>
                                <td><% DateTime f = Convert.ToDateTime(item.p.date);
    Response.Write(f.Day + "/" + f.Month + "/" + f.Year); %>

                                </td>

                                <td><%=item.p.user_name %></td>


                                 <td>
                                    <a href="labprofile.aspx?p_id=<%=item.p.p_id%>" style="color:brown;font-size:20px"  data-toggle="tooltip"
                                       data-placement="top" title="profile"><i class="fa fa-arrow-circle-left"></i> </a>
                            </td>
                                 
                                <td>
                                    <a href="external_lab_reception.aspx?edit=<%=item.p.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="external_lab_reception.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                            </tr>
                              <%  i++;
        }
    }%>
                           
                        </table>

                    </div>

                    </div>
                    <%} %>
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
       <script type='text/javascript'>
    $(function ()
    {
        $('#discount').keyup(function ()
        {
            $('#priceDis').text($(this).val());
        });
    });
</script>
</asp:Content>










