<%@ Page Title="سجل الاضافات لموظف" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="addEmp.aspx.cs" Inherits="EccoHospital.addEmp" %>
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
                    <li class="bring_right"><a href="">إدارة الاضافات</a></li>
                    <li class="bring_right"><a href="">سجل الاضافات لموظف  </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">سجل الاضافات لموظف  </h1>

                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="sancEmp.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:linkbutton class="btn-xs btn-danger  " visible="false" onclick="delbtn_Click" id="delbtn" runat="server">نعم</asp:linkbutton>
                    <asp:linkbutton class="btn-xs btn-warning  " visible="false" onclick="cancel_Click" runat="server" id="cancel">لا</asp:linkbutton>
                </div>
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                    <div class="col-lg-12" dir="rtl">

                    
                        
                   <%-- <div class="col-lg-6" >--%>
                         <div class="form-group">
                                <label for="input3" class="col-sm-2 control-label bring_right left_text">اسم الموظف :</label>
                                <div class="col-sm-10">
            
                                    <asp:DropDownList ToolTip="select2" ID="emp" required CssClass="form-control js-example-placeholder-single" runat="server" >
                                     

                                    </asp:DropDownList>

                                   
                                </div>
                            </div>
                 
                  
                   
                
                <div class="clearfix">
                </div>
                <div class="form-group">
                    <div class="col-sm-12 ">
                       
            <asp:Button CssClass="btn btn-primary " OnClick="show_Click" ID="show" runat="server" Text="عرض" />
              
                 <%      if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])) )
                     {
                         int emp_id = int.Parse(Request.QueryString["emp_id"]);
                         EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                         //var ee = (from p in db.sanc_list 
                         //            where p.del == false && p.emp_id == emp_id


                         //            select p.emp_name).FirstOrDefault();
                                %>
                        <asp:button id="print" cssclass="btn btn-success" onclick="print_Click" runat="server" text="طباعة" />

                        <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                    </div>
                </div>
                    <div class="col-md-12">
              
            <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالتاريخ ..">
                  <br />

                  <input type="text" name="table_search" id="search2" class="form-control pull-left" onkeyup="myFunction2()" placeholder="بحث بنوع الاضافة ..">
                  <br />

                </div>
                  </div>
                        </div>
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                            <td>نوع الاضافة</td>
                            <td>المبلغ</td>
                            <td>اسم المستخدم</td>
                           
                            <td>التحكم</td>

                        </tr>
                        <% 
                            var x = (from p in db.add_list 
                                     where p.del == false && p.emp_id == emp_id


                                     select p).ToList();

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=d.ToShortDateString() %></td>

                            <td><%=item.add_name %></td>
                            <td><%=item.add_value %></td>
                            <td><%=item.user_name %></td>
                           
                            <td>
                               
                                <a href="add_addition.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                    data-placement="top" title="تعديل"></a>
                               
                                <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                                --%>     <a href="addEmp.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                    data-placement="top" title="حذف"></a>
                            </td>
                        </tr>
                        <%  i++;
}
    }
                            %>
                    </table>
                    </div>
                    <%} %>
                    </div>
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
      <script>

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2];
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
