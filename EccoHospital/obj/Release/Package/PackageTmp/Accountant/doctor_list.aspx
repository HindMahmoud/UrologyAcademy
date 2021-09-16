<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="doctor_list.aspx.cs" Inherits="EccoHospital.Accountant.doctor_list" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                    <li class="bring_right"><a href="">الحسابات </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

               
                <div class="form">
                    <div class="form-horizontal">
                        

                  
                        <asp:Panel ID="formContent" runat="server">

                            <br />
                        


                            <div>

                                <h1 class="heading_title">عرض كل الأطباء</h1>
                    
                    <!--Start status alert-->
                                  <div class="col-md-3  pull-right">
              
                        <input name="table_search" id="search" class="form-control" onkeyup="myFunction1()" placeholder="بحث بالاسم" type="text" />
                        </div>
                    
                    <div class="wrap">
                        <table class="table table-bordered" id="mytable">
                            <tr style="background-color:#dcd7d7">
                                <th>#</th>
                               
                                <th>الاســــــــــــــــــــــــــــــم</th>
                                 <th>التليفون</th>
                                 
                                 
                               
                                <th>القسم</th>
                                <th>الحســــــــــاب</th>

                             




                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.doctor

                                          join s in db.departments
                                          on p.dep_id equals s.id
                                          join ss in db.clinic
                                          on p.clinic_id equals ss.id
                                          select new { p, clin = ss.name, dep = s.name }).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {

                                         int xx = int.Parse(item.p.id.ToString());
                                         var doc_Acc = (from f in db.doctor_account where f.doc_id == xx select f).ToList();
                                         double value = Math.Round(double.Parse((doc_Acc.Sum(a => a.in_val) - doc_Acc.Sum(a => a.out_val)).ToString()), 3);

                           %> 
                            <tr>
                                <td style="background-color:#dcd7d7"><%=i %></td>
                              
                                <td><a href="DocBalance.aspx?id=<%=item.p.id %>"</a><%=item.p.name %></td>
                                <td><%=item.p.phone %></td>
                                
                                <td><%=item.dep %></td>
                                <td><%=value %></td>

                                




                                 
                                
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
