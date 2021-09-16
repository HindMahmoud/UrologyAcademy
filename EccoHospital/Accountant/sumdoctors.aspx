<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sumdoctors.aspx.cs" MasterPageFile="~/Accountant/Home.Master" Inherits="EccoHospital.Accountant.sumdoctors" %>

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
     <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities(); %>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="#">الحسابات </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">الاطباء </h1>
               
                <div class="form">
                  
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable">
                                            
                                        <tr class="bg-danger">
                                            <th>#</th>
                                            <th> اسم الطبيب</th>
                                             <th> المبلغ</th>
                                             <th>التفاصيل</th>
                                             
                                        </tr>

                                          <% 
                                              DateTime d = DateTime.Now.Date;
                                              int i = 1;
                                             
                                             var x= (from s in db.patient_history group s by new { s.doc_name } into g select new { n = g.Key.doc_name, sum = g.Sum(a => a.doc_value) ,summ=g.Sum(a=>a.doc_value)}).ToList();

                                              if (x != null)
                                              { foreach (var item in x)
                                                  {
                                                     

                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%=item.n %></td>
                                 <td><%=item.sum %></td>
                                <td><a href="reportdoctors.aspx?docname=<%=item.n %>">التفاصيل</a></td>
                                </tr>
                              <%  }
                                  }
                                 %>
                              </table>
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
