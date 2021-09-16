<%@ Page Title="" Language="C#" MasterPageFile="~/PR/MasterPage.master" AutoEventWireup="true" Inherits="PR_user" Codebehind="user.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs ">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">العلاقات العامة </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">اضافة مستخدمين </h1>
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success">
                        <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                    </div>
                   <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <%--  <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    --%>
                </div>
                <!--/End status alert-->
                    <div class="form">
                        <div class="form-horizontal">
                            <div runat="server" class="rtl bg-danger text-red">
                                <asp:ValidationSummary runat="server"
                                    HeaderText="برجاء مراجعه المدخلات:" />

                            </div>
                   

              
                   
                        <div class="col-md-12">

                        <div class="col-md-6 pull-right">
                            الاسم:
                            <asp:TextBox ID="name" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12"></div>
                             <div class="col-md-6 pull-right">
                            اسم المستخدم:
                            <asp:TextBox ID="user" required CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12"></div>
                             <div class="col-md-6 pull-right">
                            الرقم السرى:
                            <asp:TextBox ID="pass" required TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-12"></div>

                         <div class="col-md-6 pull-right">
                            الصلاحيات:
                            <asp:DropDownList ToolTip="select2"  ID="role" required AppendDataBoundItems="true" CssClass="form-control js-example-placeholder-single" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>ادارة</asp:ListItem>
                                <asp:ListItem>علاقات عامة</asp:ListItem>
                                <asp:ListItem>معمل</asp:ListItem>
                                <asp:ListItem>اشعة</asp:ListItem>
                                <asp:ListItem>استقبال</asp:ListItem>
                               





                                
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-12"></div>


                         <div class="col-md-6 pull-right">
                           <br />
                             <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="حفظ" />
                        </div>
                    </div>
                   
                   
          </div>
          </div>
          </div>
          </div>
  </div>
    
    <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</asp:Content>

