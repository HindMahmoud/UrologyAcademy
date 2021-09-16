<%@ Page Title="" Language="C#" MasterPageFile="~/pr/MasterPage.master" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="EccoHospital.PR.adduser" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">إدارة المستخدمين </a></li>
                        <li class="bring_right"><a href="">إضافة مستخدم جديد</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">إضافة مستخدم جديد</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الاسم </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_name" placeholder="الاسم " runat="server" >
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المستخدم </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_user" placeholder="اسم المستخدم " runat="server" >
                                </div>
                            </div>
                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> الرقم السرى </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_password" placeholder="الرقم السرى  " runat="server" >
                                </div>
                            </div>

                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> صلاحيه </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="privlsit" CssClass="form-control" runat="server">
                                        
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="Admin">اداره</asp:ListItem>
                                        <asp:ListItem Value="Reception">استقبال</asp:ListItem>
                                        <asp:ListItem Value="PR">علاقات عامه</asp:ListItem>
                                        <asp:ListItem Value="Doctor">طبيب</asp:ListItem>
                                        <asp:ListItem Value="Lab">معمل</asp:ListItem>
                                        <asp:ListItem Value="Rad">اشعه</asp:ListItem>
                                       <%-- <asp:ListItem Value="Pharmacy"> صيدليه</asp:ListItem>--%>
                                        <asp:ListItem  Value="Accountant">محاسب</asp:ListItem>

                                     <%--   <asp:ListItem  Value="Save">خزنه</asp:ListItem>--%>
                                        <%--<asp:ListItem  Value="Financial Manager">مدير مالي</asp:ListItem>--%>


                                       <%-- <asp:ListItem Value="HR" >شئون موظفين</asp:ListItem>
                                         <asp:ListItem Value="External Clinics" >عيادات خارجيه</asp:ListItem>--%>
                                         <%--<asp:ListItem Value="Nursery" >تمريض</asp:ListItem>--%>
                                     <%--    <asp:ListItem Value="Blood" >بنك الدم</asp:ListItem>--%>


                                        
                                       
                          </asp:DropDownList>
                              </div>
                            </div>

                            <%-- <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> عيادة </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="clinicID" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>--%>


                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h1 class="heading_title">عرض كل المستخدمين</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                     <%-- <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <<%--asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                
                                </div>
                            </div>--%>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>الاسم</td>
                                 <td>اسم المستخدم</td>
                                 <td> الرقم السرى</td>
                                 <td>  صلاحيه</td>
                                
                                 <td>  </td>


                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.user 


                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.name %></td>
                                <td><%=item.user_name %></td>
                                <td><%=item.password %></td>
                                <td><%=item.priv %></td>



                                 
                                <td>
                                    <a href="adduser.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="adduser.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
        <!--/End Main content container-->
</asp:Content>






