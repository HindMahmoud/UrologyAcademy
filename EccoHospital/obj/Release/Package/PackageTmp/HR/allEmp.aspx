<%@ Page Title="عرض كل الموظفين" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="allEmp.aspx.cs" Inherits="EccoHospital.allEmp" %>
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
                        <li class="bring_right"><a href="">إدارة الموظفين</a></li>
                        <li class="bring_right"><a href="allEmp.aspx">عرض كل الموظفين</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">
                    <h1 class="heading_title">عرض كل الموظفين</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم الحفظ بنجاح!</strong><br /> <a href="add_user.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                      <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                    <br />
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالمعمل..">

                  <br />
                </div>
                    <div class="wrap">
                        <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                <td>الاسم</td>
                                <td>الرقم القومى</td>
                                <td>الهاتف</td>

                                <td>العنوان</td>
                                <td>الوظيفة</td>
                               
                                <td>المؤهل</td>

                                <td>الراتب الكلى</td>
                                <td>القسم</td>
                                 <td>تاريخ التعيين</td>
                                <td>User Name</td>
                                

                                <td>التحكم</td>

                            </tr>
                             <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 var x = (from p in db.employee  where p.del == false


                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {
                                 DateTime d = DateTime.Parse(item.date.ToString());


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.name %></td>
                                <td><%=item.ssn %></td>
                                <td><%=item.phone %></td>
                                 <td><%=item.address %></td>
                                <td><%=item.job_title %></td>
                                 <td><%=item.qualification %></td>
                                <td><%=item.total_money %></td>
                                 
                                <td><%=item.dep_name %></td>
                                <td><%=d.ToShortDateString() %></td>
                                 
                                <td><%=item.user_name %></td>
                               
                                <td>
                                    <a href="addEmployee.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                    <a href="allEmp.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                                    <a href="allEmp.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

<%--                        <nav class="text-center">
                            <ul class="pagination">
                                <li class="disabled"><a aria-label="Previous" href="#"><span aria-hidden="true">»</span></a>
                                </li>
                                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a aria-label="Next" href="#"><span aria-hidden="true">«</span></a></li>
                            </ul>
                        </nav>--%>
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
                td = tr[i].getElementsByTagName("td")[8];
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
