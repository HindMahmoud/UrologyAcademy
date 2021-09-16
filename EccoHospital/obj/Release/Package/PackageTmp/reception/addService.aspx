<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="addService.aspx.cs" Inherits="EccoHospital.PR.addService" %>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">إدارة الخدمات</a></li>
                        <li class="bring_right"><a href="">إضافة خدمه جديده</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">إضافة خدمه جديده</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addService.aspx" class="alert-link">حسناً</a> . </div>
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
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">السعر </label>
                                <div class="col-sm-10">
                                    <input required type="text" value="0" class="form-control" id="txt_price" placeholder="السعر " runat="server" >
                                </div>
                            </div>
                     
                              <div class="form-group">
                       <label for="input0" class="col-sm-2 control-label bring_right left_text">النوع </label>

                                <div class="col-sm-10">
                                        <asp:DropDownList  ID="DropDownList1" ToolTip="select" CssClass="form-control" runat="server">    
                                       <asp:ListItem Value="تشخيصي">
                                           تشخيصي
                                       </asp:ListItem>
                                        <asp:ListItem Value="علاجي">
                                           علاجي
                                       </asp:ListItem>
                                       </asp:DropDownList>
                                     </div>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator1" ControlToValidate="DropDownList1" ErrorMessage="اختر النوع  ">
                                        </asp:RequiredFieldValidator>
                                       </div>
                           <%--  <div class="form-group">
                               <div class="col-sm-6">
                                    <label for="input0" class="col-sm-2 control-label bring_right left_text">نسبة الدكتور </label>
                                
                                    <input required type="text" value="0" class="form-control" id="Text1" placeholder="نسبة الدكتور " runat="server" >
                                </div>
                                 <div class="col-sm-6">
                                      <label for="input0" class="col-sm-2 control-label bring_right left_text">نسبة المستشفي </label>
                                
                                    <input required type="text" value="0" class="form-control" id="Text2" placeholder="نسبة المستشفي " runat="server" >
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
                        <h1 class="heading_title">عرض كل الخدمات</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addService.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                      <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالنوع  ..">
                  <br />
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <table id="mytable" class="table table-bordered">
                            <tr>
                                <th>#</th>
                               
                                <th colspan="6">الاسم</th>
                                 <th>السعر</th>
                             <th>النوع</th>
                                <th>اسم المستخدم</th>
                              
                                <th></th>
                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.service 


                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td colspan="6"><%=item.name %></td>
                                <td><%=item.price %></td>
                                 <td><%=item.serType %></td>
                                  <td><%=item.user_name %></td>
                                
                                 
                                <td>
                                    <a href="addService.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="addService.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
    <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3];
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





