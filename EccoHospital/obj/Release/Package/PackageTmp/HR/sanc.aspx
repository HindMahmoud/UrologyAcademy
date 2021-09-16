<%@ Page Title="إضافة جزائات" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="sanc.aspx.cs" Inherits="EccoHospital.sanc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">إدارة الجزائات</a></li>
                    <li class="bring_right"><a href="">إضافة جزائات</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">إضافة جزائات</h1>


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="sanc.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                </div>
                <!--/End status alert-->


                <div class="form">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="input0" class="col-sm-2 control-label bring_right left_text">الجزاء </label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" id="txt_name" placeholder="الاسم " runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input0" class="col-sm-2 control-label bring_right left_text">قيمة الخصم </label>
                            <div class="col-sm-10">
                                <input required type="text" class="form-control" id="txt_value" placeholder="القيمة " runat="server">
                                <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator1"
                                    ControlToValidate="txt_value" runat="server"
                                    ErrorMessage="خطأ في ادخال القيمة"
                                    ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-12 left_text">
                                <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                </div>
                <div class="wrap">
                    <table class="table table-bordered">
                        <tr>
                            <td>#</td>

                            <td>الجزاء</td>
                            <td>القيمة</td>
                            <td>التحكم</td>

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            DateTime d = DateTime.Now.Date;
                            var x = (from p in db.sanctions
                                     where p.del == false


                                     select p).ToList();

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {


                        %>
                        <tr>
                            <td><%=i %></td>

                            <td><%=item.title %></td>
                            <td style="text-align: center"><%=item.value %></td>

                            <td>
                                <a href="sanc.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                    data-placement="top" title="تعديل"></a>
                                <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                                --%>     <a href="sanc.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
    </div>

    <!--/End Main content container-->
</asp:Content>
