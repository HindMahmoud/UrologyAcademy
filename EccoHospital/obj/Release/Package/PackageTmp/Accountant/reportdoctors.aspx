<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Accountant/Home.Master" CodeBehind="reportdoctors.aspx.cs" Inherits="EccoHospital.Accountant.reportdoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

                <h1 class="heading_title">تقارير  </h1>
               
                <div class="form">
                    <div class="form-horizontal">
                      
                            <div class="row box box-group ">
                                <h5>حساب اطباء</h5>
                                <div class="col-md-12 bg-info">
                                 
                                <div class="col-md-3 pull-right">
                                     اسم الطبيب :
                                    <asp:DropDownList  ID="ddldoctors"  ToolTip="select" CssClass="form-control " runat="server">
                                        </asp:DropDownList>
                                    </div>
                                <div class="col-md-3 pull-right">
                                     من  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="servfrom"  runat="server"></asp:TextBox>
                                    
                                </div>
                                <div class="col-md-3 pull-right">
                                     الي  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="servto"  runat="server"></asp:TextBox>
                                    
                                </div>
                                   <div class="col-md-2 pull-right">
                                        <br />
                                        
                                        <asp:Button ID="search" OnClick="search_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث   " /><br />
                                        <br />
                                    </div>   
                                </div>
                                 
                            </div>
                         </div>
                           <div class="col-lg-12 "style="overflow-x:scroll">
                               <table class="table table-hover table-bordered" id="mytable">
                                            
                                        <tr class="bg-danger">
                                            <th>#</th>
                                            <th>اسم الطبيب</th>
                                             <th> اسم الخدمة </th>
                                             <th> نوع الخدمة </th>
                                              <th>اسم المريض</th>
                                            <th>سعر الخدمة </th>
                                           
                                             <th> المستشفي</th>
                                             <th> الطبيب</th>
                                            <th> الصيانه</th>
                                             <th> الوحدة</th>
                                             <th> التاريخ</th>
                                        </tr>
                                 <%  



                                     if (!string.IsNullOrEmpty(Request.QueryString["docname"]) || (!String.IsNullOrEmpty(Request.QueryString["servfrom"]) && !String.IsNullOrEmpty(Request.QueryString["servto"])))
                                     {
                                         var x = (from ss in db.patient_history  join n in db.doctor on ss.doc_id equals n.id where ss.serTypee!="اشعه" && ss.serTypee!="تحاليل" select ss).ToList();
                                         if (!string.IsNullOrEmpty(Request.QueryString["docname"]) && (string.IsNullOrEmpty(Request.QueryString["servfrom"]) && string.IsNullOrEmpty(Request.QueryString["servto"])))
                                         {
                                             string c = Request.QueryString["docname"].ToString();
                                             x = (from ss in db.patient_history  join n in db.doctor on ss.doc_id equals n.id where ss.doc_name == c&& ss.serTypee!="اشعه" && ss.serTypee!="تحاليل" select ss).ToList();
                                         }
                                         else if (!string.IsNullOrEmpty(Request.QueryString["docname"]) && (!string.IsNullOrEmpty(Request.QueryString["servfrom"]) && !string.IsNullOrEmpty(Request.QueryString["servto"])))
                                         {
                                             string c = Request.QueryString["docname"].ToString();
                                             DateTime fromrad = Convert.ToDateTime(Request.QueryString["servfrom"].ToString());
                                             DateTime torad = Convert.ToDateTime(Request.QueryString["servto"].ToString());
                                             x = (from ss in db.patient_history  join n in db.doctor on ss.doc_id equals n.id where ss.doc_name == c && ss.date >= fromrad && ss.date < torad && ss.serTypee!="اشعه" && ss.serTypee!="تحاليل" select ss ).ToList();

                                         }
                                         else if (string.IsNullOrEmpty(Request.QueryString["docname"]) && (!string.IsNullOrEmpty(Request.QueryString["servfrom"]) && !string.IsNullOrEmpty(Request.QueryString["servto"])))
                                         {
                                             DateTime fromrad = Convert.ToDateTime(Request.QueryString["servfrom"].ToString());
                                             DateTime torad = Convert.ToDateTime(Request.QueryString["servto"].ToString());
                                             x = (from ss in db.patient_history  join n in db.doctor on ss.doc_id equals n.id where ss.date >= fromrad && ss.date < torad && ss.serTypee!="اشعه" && ss.serTypee!="تحاليل" select  ss ).ToList();

                                         }

                                         if (x != null)
                                         {

                       %>
                                
                                    <br />

                                   
                                          <%
                                              if (x != null)
                                              {
                                                  int i = 1;
                                                  double tothos = 0;
                                                  double totdoc = 0;
                                                  double totals = 0;
                                                   double totunit = 0;
                                                  double totmaint = 0;
                                                  foreach (var item in x)
                                                  {
                           %> 

                                        <tr>
                                             <td><%=i %></td>
                                             <td><%=item.doc_name %></td>
                                            <td><%=item.service_name %></td>
                                            <td><%=item.serTypee %></td>
                                            <td><%=item.p_name %></td>
                                             <td><%=item.price %></td>
                                      
                                             <td><%=item.hos_value %></td>
                                            <td><%=item.doc_value %></td>
                                              <td><%=item.main_val %></td>
                                            <td><%=item.unit_val %></td>
                                            <td><%DateTime d = Convert.ToDateTime(item.date);
                                                    Response.Write(d.Day + "/" + d.Month + "/" + d.Year); %></td>
                                            <%totdoc += double.Parse(item.doc_value.ToString());
                                                tothos += double.Parse(item.hos_value.ToString());
                                                totmaint+=double.Parse(item.main_val.ToString());
                                                totunit+=double.Parse(item.unit_val.ToString());
                                                totals = totdoc + tothos+totmaint+totunit;

                                                 %>
                                        </tr>
 <% i++;
                 }
                 %><tr>
              <td class="bg-success">اجمالي  الطبيب :</td>
              <td class="bg-success">اجمالي  المستشفي :</td>
             <td class="bg-success">اجمالي  الصيانه :</td>
              <td class="bg-success">اجمالي  الوحدة :</td>
             <td class="bg-success">الاجمالي :</td>
            
           </tr>
              <tr>
              <td class="text-success"><%=totdoc %></td>
              <td class="text-success"><%=tothos %></td>
                  <td class="text-success"><%=totmaint %></td>
              <td class="text-success"><%=totunit %></td>
             <td class="bg-warning"><%=totals %></td>
             
           </tr>
                               </table>
                                        <%
             }
         }
     } %>
                     
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