<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="unitacount.aspx.cs" Inherits="EccoHospital.Accountant.unitacount" %>
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
                    <li class="bring_right"><a href="#">الاستقبال </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">حساب الوحدة  </h1>
               
                <div class="form">
                    <div class="form-horizontal">
                      
                            <div class="row box box-group ">
                             <div class="col-md-12 bg-info">
                                           <h5>بحث بالتاريخ</h5>
                                 
                                <div class="col-md-3 pull-right">
                                     من  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="fromlab"  runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-3 pull-right">
                                     الي  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="tolab"  runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-2 pull-right">
                                        <br />
                                        
                                        <asp:Button ID="labbtn" OnClick="labbtn_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث   " /><br />
                                        <br />
                                    </div> 
                                    </div>
                                
                            </div>
                         </div>
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable">
                                            
                                        <tr class="bg-danger">
                                            <th>#</th>
                                            <th> التاريخ</th>
                                             <th> الخدمة</th>
                                             <th>اسم الطبيب/ الجراح</th>
                                             <th> سعر الوحدة</th>
                                        </tr>

                                          <% 
                                              DateTime d = DateTime.Now.Date;
                                              int i = 1;
                                              var x = (from p in db.patient_history

                                                       where p.service_name!="تحاليل" &&p.service_name!="أشعه"
                                                       select p).ToList();
                                             
                                              if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                              {
                                                  DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                                  DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                                  x = (from p in db.patient_history
                                                       where p.date>=d1 && p.date<=d2
                                                     
                                                       select p).ToList();
                                               }
                                               double y2 = Math.Round(double.Parse(x.Sum(a => a.unit_val).ToString()), 4);
                                              if (x != null)
                                              { foreach (var item in x)
                                                  {


                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%=item.date %></td>
                                 <td><%=item.service_name %></td>
                                 <td><%=item.doc_name %></td>
                                <td><%=item.unit_val %></td>
                                </tr>
                              <%  }
                                  }
                                  var surgx = (from p in db.Surgery_history
                                              
                                               select p).ToList();
                                   double DevEachSurg = 0;
                                  if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                  {
                                      DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);
                                      DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                      surgx = (from p in db.Surgery_history
                                               where p.date>=d1 && p.date<=d2
                                             
                                               select p).ToList();
                                  }
                                  if (surgx != null)
                                  {foreach (var c in surgx)
                                      { var f = (from n in db.device_history where n.surgery_id==c.id select n).ToList();
                                         
                                          if (f != null)
                                          {
                                             DevEachSurg = Math.Round(double.Parse(f.Sum(a => a.price).ToString()), 4);
                                          }
                                          
                                          %>
                                        <tr>
                                            <td></td>
                                            <td><%=Convert.ToDateTime(c.date).ToShortDateString() %></td>
                                            <td>عملية</td>
                                            <td><%=c.surgeon_name %></td>
                                            <td><%=DevEachSurg %></td>
                                        </tr>

                                     <% i++;}

                                      }

                                  %>
                                         <tr class="bg-success">
                                            <th colspan="2"> إجمالى الوحدة</th>
                                            <td colspan="2"><%=y2+DevEachSurg %></td>
                                        </tr>
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
