<%@ Page Title="إضافة جزائات لموظف" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="add_sanc.aspx.cs" Inherits="EccoHospital.add_sanc" %>
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
                    <li class="bring_right"><a href="">إضافة جزائات لموظف</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title"> إضافة جزائات لموظف</h1>


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="add_sanc.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                </div>
                <!--/End status alert-->


                <div class="form">
                    <div class="form-horizontal">
                         <div class="form-group">
                                <label for="input3" class="col-sm-2 control-label bring_right left_text">اسم الموظف :</label>
                                <div class="col-sm-10">
            
                                    <asp:DropDownList ToolTip="select2" ID="emp" required CssClass="form-control js-example-placeholder-single" runat="server" >
                                       

                                    </asp:DropDownList>

                                    
                                </div>
                            </div>
                        <div class="form-group">
                                <label for="input3" class="col-sm-2 control-label bring_right left_text">الجزاء:</label>
                                <div class="col-sm-10">
            
                                    <asp:DropDownList AutoPostBack="true" ToolTip="select2" OnSelectedIndexChanged="sancc_SelectedIndexChanged" ID="sancc" required AppendDataBoundItems="true" CssClass="form-control js-example-placeholder-single" runat="server" DataSourceID="SqlDataSource2" DataTextField="title" DataValueField="id">
                                        <asp:ListItem></asp:ListItem>


                                    </asp:DropDownList>


                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:eccoConnectionString %>' SelectCommand="SELECT [id], [title] FROM [sanctions] WHERE ([del] = @del)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="False" Name="del" Type="Boolean"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
              
            </div>
        </div>
    </div>

    <!--/End Main content container-->
</asp:Content>
