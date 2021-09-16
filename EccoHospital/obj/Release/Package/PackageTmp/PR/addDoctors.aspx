<%@ Page Title="" Language="C#" MasterPageFile="~/PR/MasterPage.master" AutoEventWireup="true" Inherits="PR_addDoctors" Codebehind="addDoctors.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--<% EccoHospitalEntities db = new EccoHospitalEntities(); %>--%>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="#">العلاقات العامة </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h2 class="heading_title" >اضافة طبيب   </h2>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                  <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                   <%-- <strong>هل انت متأكد من الحذف ؟</strong>--%>
                    <%--  <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    --%>
                </div>
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                       
             

                   <%--     <asp:Panel ID="message2" CssClass="col-md-6 pull-right " runat="server" Visible="false">

                            <div class="modal-content  ">
                                <div class="modal-header bg-danger ">

                                    <h4 class="modal-title ">Fail</h4>
                                </div>
                                <div class="modal-body bg-danger">
                                    <p>تمت الاضافه بالرقم القومي مسبقا</p>
                                    <br />
                                    <asp:Button CssClass=" btn bg-danger" OnClick="Button1_Click" ID="Button1" runat="server" Text="OK" />


                                </div>
                            </div>


                        </asp:Panel>--%>
                        <asp:Panel ID="formContent" runat="server">

                            <br />
                            <div class="row box box-group ">
                                <div class="col-md-12 bg-info">
                                    <h3> البيانات الشخصية</h3>
                                   
                                    <div class="col-md-3 pull-right">
                                        اسم الطبيب:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="txt_name" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" ValidationGroup="a" runat="server" ID="req" ControlToValidate="txt_name" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>
                                    </div>
                            
                               <div class="col-md-3 pull-right">
                                    رقم التليفون  :
           <asp:TextBox CssClass="form-control" ID="mob" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ValidationGroup="a" CssClass="text-red" ID="RegularExpressionValidator2"
                                        ControlToValidate="mob" runat="server"
                                        ErrorMessage=" خطأ في  رقم الهاتف ادخل 11 رقم"
                                        ValidationExpression="^\d{11}$">
                                    </asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" ValidationGroup="a" runat="server" ID="RequiredFieldValidator1" ControlToValidate="mob" ErrorMessage="ادخل رقم التليفون  ">
                                        </asp:RequiredFieldValidator>
                                </div>
                                    
                                     <div class="col-md-3 pull-right">
                                    العنوان  :
              <asp:TextBox CssClass="form-control" ID="address" runat="server"></asp:TextBox>
                                
                                    </div>
                                
                                     <div class="col-md-12 bg-danger">
                                    <h3>خاص بنسبة الطبيب </h3>
                           <%EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                               var t = (from m in db.service select m).ToList();
                               int ii = 0;%>
                                         <table class="table-bordered">
                                            <%-- <tr>
                                                 <th>اسم الخدمة</th>
                                                  <th>السعر </th>
                                                 
                                             </tr>--%>
                                             
                                             <tr>
                                                 <td >
                                                     
                                                    <%-- <asp:Panel ID="Panel1" runat="server">
                                                        </asp:Panel>
                                                       --%>
                                                
                                                     <asp:Panel ID="pnlTextBoxes" runat="server">
                                                        </asp:Panel>
                                                 </td>
                                             </tr>
                                             
                                       
                                         
                                         <%
//foreach (var y in t) {
                                   %>
                                        <%-- <tr> 
                                   <td> <%--<%=y.name%>  :</td><td>
                                     

              <asp:TextBox CssClass="form-control" ID="txt" Text="0" runat="server"></asp:TextBox>
                             
                              </td>
                              </tr>  --%>             
                              <%

//ii++; } %>
                                               </table>
<%--
                                          <div class="col-md-3 pull-right">
                                   
                                    القسم :
                       <asp:DropDownList   ID="deplist" ClientIDMode="Static" AppendDataBoundItems="true" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server" >
                         
                       </asp:DropDownList>
                                   
                                </div>--%>

                                             <%--<div class="col-md-2 pull-right">
                                    نسبة التشخيصي  :
              <asp:TextBox CssClass="form-control" ID="T_percent" runat="server"></asp:TextBox>--%>
                                  <%--  <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator5" ControlToValidate="T_percent" ErrorMessage="ادخل نسبة التشخيصي ">
                                    </asp:RequiredFieldValidator>--%>
                                <%--</div>--%>
                                        
                                         
                                       <%--  <div class="col-md-2 pull-right">
                                    نسبة الفحصي  :
              <asp:TextBox CssClass="form-control" ID="F_percent" runat="server"></asp:TextBox>--%>
                                  <%--  <asp:RequiredFieldValidator
                                        CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator2" ControlToValidate="F_percent" ErrorMessage="ادخل نسبة الفحصي ">
                                    </asp:RequiredFieldValidator>--%>
                                             
                               <%-- </div>--%>
                                     
                                    </div>
                               
                                    <div class="col-md-3">
                                        <br />
                                        <asp:Button ID="btnSave" ValidationGroup="a" OnClick="btnSave_Click"  CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                        <br />
                                    </div>
                                   
                       
                            </div>


                            <div>

                                <h1 class="heading_title">عرض كل الأطباء</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addDoctors.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong> 
                         <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <%--<asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />--%>
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>الاسم</td>
                                 <td>التليفون</td>
                                 <td>العنوان</td>
                                 
                                
                               
                                <td>اسم المستخدم</td>

                            </tr>
                             <%   DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.doctor
                                          
                                          select  p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {
                                        

                                          %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.name %></td>
                                <td><%=item.phone %></td>
                                <td><%=item.address %></td>
                               
                                 <td><%=item.user_name %></td>

                                <td>
                                    <a href="addDoctors.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="addDoctors.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>


                            </div>




                                </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script>
        $('#,#date').daterangepicker({
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

