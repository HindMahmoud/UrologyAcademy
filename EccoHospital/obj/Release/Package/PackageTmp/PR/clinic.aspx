<%@ Page Title="" Language="C#" MasterPageFile="~/PR/MasterPage.master" AutoEventWireup="true" Inherits="PR_clinic" CodeBehind="clinic.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities(); %>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">العلاقات العامة </a></li>
                </ul>
            </div>


            <!--Start status alert-->
            <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                <a href="clinic.aspx" class="alert-link">حسناً</a> . </div>
            <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-danger"><strong>خطأ!</strong> لم يتم الحفظ. </div>
            <!--/End status alert-->

            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">اضافة عيادة   </h1>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                    <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:LinkButton class="btn-xs btn-success  " OnClick="reload_Click" ID="reload" runat="server">حسناُ</asp:LinkButton>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                      <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    
                </div>
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                        <div class="col-lg-12">
                        </div>
                        <div class="clearfix"></div>



                        <asp:Panel ID="formContent" runat="server">

                            <br />
                            <div class="row box box-group ">
                                <div class="col-md-12 bg-info">




                                    <div class="col-md-3 pull-right">
                                        اسم العيادة:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="name1" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="req" ControlToValidate="name1" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3 pull-right">
                                        سعر الكشف  :
              <asp:TextBox CssClass="form-control" ID="KPrice" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator1" ControlToValidate="KPrice" ErrorMessage="ادخل سعر الكشف ">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3 pull-right">
                                        سعر الاعادة  :
              <asp:TextBox CssClass="form-control" ID="EPrice" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator2" ControlToValidate="EPrice" ErrorMessage="ادخل سعر الاعادة ">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3 pull-right">
                                        سعر الاستدعاء  :
              <asp:TextBox CssClass="form-control" ID="estPrice" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="RequiredFieldValidator3" ControlToValidate="estPrice" ErrorMessage="ادخل سعر الاستدعاء ">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <br />
                                    <asp:Button ID="btnSave" OnClick="btnSave_Click"  CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                    <br />
                                </div>
                                <div>
                                    <h1 class="heading_title">عرض كل العيادات</h1>

                                    <!--Start status alert-->
                                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                                        <a href="add_user.aspx" class="alert-link">حسناً</a> . </div>
                                   <%-- <div runat="server" visible="false" id="Div3" role="alert" class="alert alert-danger">
                                        <strong>هل انت متأكد من الحذف ؟</strong>
                                        <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                                        <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                                    </div>--%>
                                    <!--/End status alert-->
                                    <%--<div class="form-group">
                                        <div class="col-sm-12 left_text">
                                            <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />

                                        </div>
                                    </div>--%>
                                    <div class="wrap">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td>#</td>

                                                <td>الاسم</td>
                                                <td>سعر الكشف</td>
                                                <td>سعر الأعاده</td>
                                                <td>سعر الأستدعاء</td>
                                                 <td>اسم المستخدم</td>

                                            </tr>
                                            <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                                DateTime d = DateTime.Now.Date;
                                                var x = (from p in db.clinic


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
                                                <td><%=item.price1 %></td>
                                                <td><%=item.price2 %></td>
                                                <td><%=item.price3 %></td>
                                                <td><%=item.user_name %></td>

                                                <td>
                                                    <a href="clinic.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                                        data-placement="top" title="تعديل"></a>
                                                    <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                                                    --%>     <a href="clinic.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                                        data-placement="top" title="حذف"></a>
                                                </td>
                                            </tr>
                                            <%  i++;
                                                }
                                            }%>
                                        </table>

                                    </div>

                                </div>

                            </div>

                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

