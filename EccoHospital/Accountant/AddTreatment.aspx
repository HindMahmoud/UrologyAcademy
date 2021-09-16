<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="AddTreatment.aspx.cs" Inherits="EccoHospital.Accountant.AddTreatment" %>



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
                       
                        <li class="bring_right"><a href="">اضافه اجمالي ادويه</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title"> اوديه و مستلزمات داخلي</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="AddTreatment.aspx" class="alert-link">حسناً</a> . </div>
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
    <div class="form-group">
         <label for="input0" class="col-sm-2 control-label bring_right left_text"> حساب</label>
    <div class="col-md-10 pull-right">
       
             <asp:DropDownList ID="ddl_type" AutoPostBack="true" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged"  CssClass="form-control js-example-placeholder-single select2" runat="server" >
                 <asp:ListItem></asp:ListItem>
                 <asp:ListItem Value="doc">طرف طبيب</asp:ListItem>
                 <asp:ListItem Value="hos">طرف مستشفي</asp:ListItem>

             </asp:DropDownList>
        </div>
        </div>
    <div class="form-group" id="docdiv" runat="server" visible="false">
         <label for="input0" class="col-sm-2 control-label bring_right left_text"> الطبيب</label>
     <div class="col-md-10 pull-right" >
        
             <asp:DropDownList ID="docList" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
       </div>
        </div>
    </ContentTemplate>
                                  </asp:UpdatePanel>

                                

                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> الاجمالي  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" placeholder=" الاجمالي  " runat="server" >
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> ملاحظات  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_note" placeholder=" ملاحظات  " runat="server" >
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
                        <h1 class="heading_title">ادويه و مستلزمات داخلي</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="rad_reception.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                   
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> البيان</td>
                                 <td> الاجمالي</td>
                                 <td> التاريخ</td>

                                <td></td>
                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.patient_history 
                                          where p.type=="علاج"

                                          select p  ).ToList();

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

                                 
                                <td>
                                       <a href="AddTreatment.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
                                                        <div class="modal-content bg-blue-gradient">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">اضافه مريض</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row box box-group bg-info ">
                                <div class="col-md-12 ">
                                    <h3> البيانات الشخصية</h3>
                                   
                                   
                                  
                                   
                                     <div class="col-md-3 pull-right">
                                        اسم المريض:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="name1" runat="server"></asp:TextBox>
                                        
                                    </div>
                               
                                <div class="col-md-3 pull-right">
                                   
                                    نوع المريض:
                       <asp:DropDownList   ID="type" ClientIDMode="Static" AppendDataBoundItems="true" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server" >
                           
                           
                           <asp:ListItem>داخلى</asp:ListItem>

                           

                       </asp:DropDownList>
                                   
                                    
                                </div>
                          <div class="col-md-3 pull-right">
                                    
                                    النوع :
                       <asp:DropDownList   ID="gender" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>ذكر</asp:ListItem>

                           <asp:ListItem>أنثى</asp:ListItem>

                       </asp:DropDownList>
                                   
                                    
                                </div>

                                
                                      <div class="col-md-3 pull-right">
                                         السن :
            <asp:TextBox ID="age" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                    
                                </div>

<div class="clearfix"></div>
                                <div class="col-md-3 pull-right">
                                    الجنسيه:
            <asp:TextBox CssClass="form-control" ID="nationalty" Text="مصرى" runat="server"></asp:TextBox>
                                    
                                </div>
                               <div class="col-md-3 pull-right">
                                    رقم التليفون  :
           <asp:TextBox CssClass="form-control" ID="mob" runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-3 pull-right">
                                    
                                    المحافظة :
                       <asp:DropDownList   ID="gov" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>القاهرة</asp:ListItem>

                           <asp:ListItem>الاسكندرية</asp:ListItem>
                           <asp:ListItem>المنيا</asp:ListItem>

                           <asp:ListItem>اسيوط</asp:ListItem>
                           <asp:ListItem>سوهاج</asp:ListItem>
                           <asp:ListItem>الاقصر</asp:ListItem>
                           <asp:ListItem>قنا</asp:ListItem>
                           <asp:ListItem>اسوان</asp:ListItem>

                       </asp:DropDownList>
                                   
                                    
                                </div>
 <div class="col-md-3 pull-right">
                                    
                                    المدينة :
                   
              <asp:TextBox CssClass="form-control" ID="city" runat="server"></asp:TextBox>
                                   
                                    
                                </div>

                                     <div class="col-md-3 pull-right">
                                    العنوان  :
              <asp:TextBox CssClass="form-control" ID="address" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div class="col-md-3 pull-right">
                                     رقم البطاقة :
              <asp:TextBox CssClass="form-control" ID="ssi_st" runat="server"></asp:TextBox>
                                    
                                   
                                </div>
                                       <div class="col-md-3 pull-right">
                                    
                                    الحالة الاجتماعية :
                       <asp:DropDownList   ID="social" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>أعزب</asp:ListItem>

                           <asp:ListItem>متزوج</asp:ListItem>

                       </asp:DropDownList>
                                   
                                  
                                </div>
                                      <div class="col-md-3 pull-right">
                                    الوظيفه  :
           <asp:TextBox CssClass="form-control" ID="job" runat="server"></asp:TextBox>
                                   
                                </div>
                                
                                    </div>
                               
                                    <div class="col-md-3">
                                        <br />
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click"  CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                        <br />
                                    </div>
                                   
                        
                            </div>
                                                                </div>

                                                            <div class="modal-footer">

                                                               
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">اغلاق</button>
                                                            </div>
                                                        </div>

                                                    </div>

            </div>
        
                     <br /><br />
                     <br /><br />

                    </div>
                        </div>
                      </asp:Panel>
        <!--/End Main content container-->
</asp:Content>







