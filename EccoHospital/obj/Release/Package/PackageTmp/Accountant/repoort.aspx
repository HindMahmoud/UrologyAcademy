<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Accountant/Home.master" CodeBehind="repoort.aspx.cs" Inherits="EccoHospital.reception.repoort" %>
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
                    <li class="bring_right"><a href="#">الاستقبال </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">تقارير  </h1>
               
                <div class="form">
                    <div class="form-horizontal">
                      
                            <div class="row box box-group ">
                                <h5>بحث خدمات</h5>
                                <div class="col-md-12 bg-info">
                                 
                                <div class="col-md-3 pull-right">
                                     اسم الخدمة :
                                    <asp:DropDownList  ID="sservv"  ToolTip="select" CssClass="form-control " runat="server">
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
                                        
                                        <asp:Button ID="search" OnClick="search_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث خدمات  " /><br />
                                        <br />
                                    </div>   
                                </div>
                                    
                                   
                               
                                 <div class="col-md-12 bg-warning">
                                      <h5>بحث اشعه</h5>
                                 <div class="col-md-3 pull-right">
                                     اسم الاشعه :
              <asp:DropDownList CssClass="form-control" ID="radddl"  runat="server"></asp:DropDownList>
                                    
                                </div>
                                <div class="col-md-3 pull-right">
                                     من  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="from"  runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-3 pull-right">
                                     الي  :
              <asp:TextBox CssClass="form-control" TextMode="Date" ID="to"  runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-2 pull-right">
                                        <br />
                                        
                                        <asp:Button ID="rad" OnClick="rad_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث اشعه  " /><br />
                                        <br />
                                    </div> 
                                    </div>
                             
                                
                                    <div class="col-md-12 bg-info">
                                           <h5>بحث تحاليل</h5>
                                  <div class="col-md-3 pull-right">
                                     اسم التحليل :
              <asp:DropDownList CssClass="form-control" ID="labddl"  runat="server"></asp:DropDownList>
                                    
                                </div>
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
                                        
                                        <asp:Button ID="labbtn" OnClick="labbtn_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث تحاليل  " /><br />
                                        <br />
                                    </div> 
                                    </div>
                                
                            </div>
                         </div>
                              
                                 <%  



                                     if (!string.IsNullOrEmpty(Request.QueryString["servname"])||(!String.IsNullOrEmpty(Request.QueryString["servfrom"])&&!String.IsNullOrEmpty(Request.QueryString["servto"])))
                                     {var x = (from ss in db.patient_history join i in db.clinic_reception on ss.details_id equals i.id  select new { ss, i}).ToList();
                                         if (!string.IsNullOrEmpty(Request.QueryString["servname"]) && (string.IsNullOrEmpty(Request.QueryString["servfrom"]) && string.IsNullOrEmpty(Request.QueryString["servto"])))
                                           { string c = Request.QueryString["servname"].ToString();
                                               x = (from ss in db.patient_history join i in db.clinic_reception on ss.details_id equals i.id where ss.service_name ==c  select new { ss, i}).ToList();
                                           }
                                           else if (!string.IsNullOrEmpty(Request.QueryString["servname"]) && (!string.IsNullOrEmpty(Request.QueryString["servfrom"]) && !string.IsNullOrEmpty(Request.QueryString["servto"])))
                                           { string c = Request.QueryString["servname"].ToString();
                                                DateTime fromrad = Convert.ToDateTime(Request.QueryString["servfrom"].ToString());
                                                DateTime torad = Convert.ToDateTime(Request.QueryString["servto"].ToString());
                                               x = (from ss in db.patient_history join i in db.clinic_reception on ss.details_id equals i.id where ss.service_name==c&&ss.date>=fromrad &&ss.date<torad select new { ss, i}).ToList();

                                           }
                                            else if (string.IsNullOrEmpty(Request.QueryString["servname"]) && (!string.IsNullOrEmpty(Request.QueryString["servfrom"]) && !string.IsNullOrEmpty(Request.QueryString["servto"])))
                                           { 
                                                DateTime fromrad = Convert.ToDateTime(Request.QueryString["servfrom"].ToString());
                                                DateTime torad = Convert.ToDateTime(Request.QueryString["servto"].ToString());
                                               x = (from ss in db.patient_history join i in db.clinic_reception on ss.details_id equals i.id where ss.date>=fromrad &&ss.date<torad select new { ss, i}).ToList();

                                           }

                                         if (x != null)
                                         {

                       %>
                                       <div class="col-lg-12 "style="overflow-x:scroll">
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable">
                                            
                                        <tr class="bg-danger">
                                            <th>#</th>
                                            <th>اسم الخدمة</th>
                                             <th> النوع </th>
                                              <th>اسم المريض</th>
                                            <th>السعر </th>
                                           
                                             <th> المستشفي</th>
                                             <th> الطبيب</th>
                                            <th> الصيانه</th>
                                             <th> الوحدة</th>
                                             <th> التاريخ</th>
                                       


                                        </tr>
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
                                            <td><%=item.ss.service_name %></td>
                                            <td><%=item.ss.serTypee %></td>
                                            <td><%=item.ss.p_name %></td>
                                             <td><%=item.ss.price %></td>
                                      
                                             <td><%=item.ss.hos_value %></td>
                                            <td><%=item.ss.doc_value %></td>
                                             <td><%=item.ss.main_val %></td>
                                            <td><%=item.ss.unit_val %></td>
                                            <td><%DateTime d = Convert.ToDateTime(item.ss.date);
                                                    Response.Write(d.Day + "/" + d.Month + "/" + d.Year); %></td>
                                            <%totdoc += double.Parse(item.ss.doc_value.ToString());
                                                tothos += double.Parse(item.ss.hos_value.ToString());
                                                totmaint+=double.Parse(item.ss.main_val.ToString());
                                                totunit+=double.Parse(item.ss.unit_val.ToString());
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
                                        <%

    }

                                                            %>
                                         </table>
                                              <br />
                                    <br />
                                    <br />
                                </div>
                                        <%

        }

    } %>
                    <% if (!String.IsNullOrEmpty(Request.QueryString["labtxt"])||(!String.IsNullOrEmpty(Request.QueryString["fromlab"])&&!String.IsNullOrEmpty(Request.QueryString["tolab"])))
                        {
                            var x = (from ss in db.lab_history  select ss).ToList();
                          
                           if (!string.IsNullOrEmpty(Request.QueryString["labtxt"]) && (string.IsNullOrEmpty(Request.QueryString["fromlab"]) && string.IsNullOrEmpty(Request.QueryString["tolab"])))
                           { string c = Request.QueryString["labtxt"].ToString();
                               x = (from ss in db.lab_history where ss.lab_name ==c select ss).ToList();
                           }
                           else if (!string.IsNullOrEmpty(Request.QueryString["labtxt"]) && (!string.IsNullOrEmpty(Request.QueryString["fromlab"]) && !string.IsNullOrEmpty(Request.QueryString["tolab"])))
                           { string c = Request.QueryString["labtxt"].ToString();
                                DateTime fromrad = Convert.ToDateTime(Request.QueryString["fromlab"].ToString());
                                DateTime torad = Convert.ToDateTime(Request.QueryString["tolab"].ToString());
                               x = (from ss in db.lab_history where ss.lab_name==c&&ss.date>=fromrad &&ss.date<torad select ss).ToList();

                           }
                            else if (string.IsNullOrEmpty(Request.QueryString["labtxt"]) && (!string.IsNullOrEmpty(Request.QueryString["fromlab"]) && !string.IsNullOrEmpty(Request.QueryString["tolab"])))
                           { 
                                DateTime fromrad = Convert.ToDateTime(Request.QueryString["fromlab"].ToString());
                                DateTime torad = Convert.ToDateTime(Request.QueryString["tolab"].ToString());
                               x = (from ss in db.lab_history where ss.date>=fromrad &&ss.date<torad select ss).ToList();

                           }


                            if (x != null)
                            {

                       %>
                                       <div class="col-lg-12 "style="overflow-x:scroll">
                                    <br />

                                    <table class="table table-hover table-bordered">
                                            
                                        <tr class="bg-danger">
                              <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>اسم المريض</td>
                            <td>التحليل</td>
                            <td>الطبيب المحول</td>
                            <td>السعر</td>
                           
                            <td>اسم المستخدم</td>
                                        </tr>
                                          <%
    if (x != null)
    {
        int i = 1;

        foreach (var item in x)
        {   DateTime d = DateTime.Parse(item.date.ToString());
                           %> 

                            <tr>
                            <td><%=i %></td>
                            <td><%Response.Write(d.Day + "/" + d.Month + "/" + d.Year); %></td>
                          
                            <td><%=item.p_name %></td>
                            <td><%=item.lab_name %></td>
                           <td><%=item.docNmae %></td>
                            <td><%=item.price %></td>
                            <td><%=item.user_name %></td>
                                          </tr>
                                        <%
        }

    }

                                                            %>
                                         </table>
                                              <br />
                                    <br />
                                    <br />
                                </div>
                                        <%

                            }

                       } %>
       <%  if (!string.IsNullOrEmpty(Request.QueryString["radtxt"])||(!string.IsNullOrEmpty(Request.QueryString["fromrad"])&&!string.IsNullOrEmpty(Request.QueryString["torad"])))
           { var x=(from ss in db.rad_history select ss).ToList();
               if (!string.IsNullOrEmpty(Request.QueryString["radtxt"]) && (string.IsNullOrEmpty(Request.QueryString["fromrad"]) && string.IsNullOrEmpty(Request.QueryString["torad"])))
               { string c = Request.QueryString["radtxt"].ToString();
                   x = (from ss in db.rad_history where ss.rad_name ==c select ss).ToList();
               }
               else if (!string.IsNullOrEmpty(Request.QueryString["radtxt"]) && (!string.IsNullOrEmpty(Request.QueryString["fromrad"]) && !string.IsNullOrEmpty(Request.QueryString["torad"])))
               { string c = Request.QueryString["radtxt"].ToString();
                    DateTime fromrad = Convert.ToDateTime(Request.QueryString["fromrad"].ToString());
                    DateTime torad = Convert.ToDateTime(Request.QueryString["torad"].ToString());
                   x = (from ss in db.rad_history where ss.rad_name==c&&ss.date>=fromrad &&ss.date<torad select ss).ToList();

               }
                else if (String.IsNullOrEmpty(Request.QueryString["radtxt"]) && (!String.IsNullOrEmpty(Request.QueryString["fromrad"]) && !String.IsNullOrEmpty(Request.QueryString["torad"])))
               { 
                    DateTime fromrad = Convert.ToDateTime(Request.QueryString["fromrad"].ToString());
                    DateTime torad = Convert.ToDateTime(Request.QueryString["torad"].ToString());
                   x = (from ss in db.rad_history where ss.date>=fromrad &&ss.date<torad select ss).ToList();

               }

               if (x != null)
               {

                       %>
          <div class="col-lg-12 "style="overflow-x:scroll">
                                    <br />

               <table class="table table-hover table-bordered" >
                                            
                                        <tr class="bg-warning">

                                              <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>اسم المريض</td>
                            <td>الاشعه</td>
                           <td>الطبيب المحول </td>
                            <td>السعر </td>
                            <td>اسم المستخدم</td>
                             <th></th>


                                        </tr>
                                          <%
                                              if (x != null)
                                              {
                                                  int i = 1;

                                                  foreach (var item in x)
                                                  {
                                                      DateTime d = Convert.ToDateTime(item.date.ToString());
                           %> 

                                        <tr>
                             <td><%=i %></td>
                            <td><%Response.Write(d.Day + "/" + d.Month + "/" + d.Year); %></td>
                          
                            <td><%=item.p_name %></td>
                            <td><%=item.rad_name %></td>
                            <td><%=item.docNmae %></td>
                            <td><%=item.price %></td>
                            <td><%=item.user_name %></td>
                                           </tr>
                                                    <% i++;
        }

    }

                                                            %>
                                         </table>
                                              <br />
                                    <br />
                                    <br />
                                </div>
                                        <%

        }

    } %>
  
                                                            
                                 
                           
                            </div>
                            
                        <%--</asp:Panel>--%>
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



