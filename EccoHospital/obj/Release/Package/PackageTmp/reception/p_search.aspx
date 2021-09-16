<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" Inherits="reception_p_search" Codebehind="p_search.aspx.cs" %>

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
                    <li class="bring_right"><a href="">الاستقبال </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">بحث عن مريض  </h1>
                <!--Start status alert-->
                <div runat="server" visible="false" id="message" role="alert" class="alert alert-success">
                     <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                      <asp:LinkButton Class="btn-xs btn-danger  " Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                    <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>
                    


                </div>
                <!--/End status alert-->
                <div class="form">
                    <div class="form-horizontal">
                       
                    

                       <%-- <asp:Panel ID="message2" CssClass="col-md-6 " runat="server" Visible="false">

                            <div class="modal-content  ">
                                <div class="modal-header bg-red ">

                                    <h4 class="modal-title ">Fail</h4>
                                </div>
                                <div class="modal-body bg-red-gradient">
                                    <p>تمت الاضافه بالرقم القومي مسبقا</p>
                                    <br />
                                    <asp:Button CssClass=" btn bg-maroon-active" OnClick="Button1_Click" ID="Button1" runat="server" Text="OK" />


                                </div>
                            </div>


                        </asp:Panel>
                        <asp:Panel ID="formContent" runat="server">--%>

                            <br />
                            <div class="row box box-group ">
                                <div class="col-md-12 bg-info">
                                   
                                   
                                  
                                   
                                    <%-- <div class="col-md-3 pull-right">
                                        اسم المريض:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="name1" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ID="req" ControlToValidate="name1" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>
                                    </div>--%>
                               
                              
                                <div class="col-md-5 pull-right">
                                     رقم البطاقة :
              <asp:TextBox CssClass="form-control" ID="ssi_st"  runat="server"></asp:TextBox>
                                    
                                </div>
                                
                                   
                                     <div class="col-md-5 pull-right">
                                     رقم التليفون :
              <asp:TextBox CssClass="form-control" ID="TextBox1"  runat="server"></asp:TextBox>
                                    
                                </div>
                                
                                   
                                     <div class="col-md-5 pull-right">
                                    اسم المريض :
              <asp:TextBox CssClass="form-control" ID="p_name"  runat="server"></asp:TextBox>
                                    
                                </div>
                                
                                   
                                     <div class="col-md-5 pull-right">
                                     المركز :
              <asp:TextBox CssClass="form-control" ID="p_city"  runat="server"></asp:TextBox>
                                    
                                </div>
                                
                                 
                                        <div class="col-md-5 pull-right">
                                     المحافظة :
              <asp:TextBox CssClass="form-control" ID="p_gov"  runat="server"></asp:TextBox>
                                    
                                </div>
                                
                                 <div class="col-md-3 pull-right">
                                        <br />
                                        
                                        <asp:Button ID="search" OnClick="search_Click"  CssClass="btn btn-primary" runat="server" Text=" بحث  " /><br />
                                        <br />
                                    </div>   
                                   
                            </div>
                              
                                 <%  


                                     //var zz =Request.QueryString["s"].ToString();
                                     var x = (from ss in db.patient select ss).ToList();

                                     if (!string.IsNullOrEmpty(Request.QueryString["ssi"]) || !string.IsNullOrEmpty(Request.QueryString["name"]) || !string.IsNullOrEmpty(Request.QueryString["city"]) || !string.IsNullOrEmpty(Request.QueryString["govv"]) || !string.IsNullOrEmpty(Request.QueryString["mobb"]))
                                     {
                                         string x1 = (Request.QueryString["ssi"].ToString());
                                         string x2 = (Request.QueryString["name"].ToString());
                                         string x3 = (Request.QueryString["city"].ToString());
                                         string x4 = (Request.QueryString["govv"].ToString());
                                         //string x5 = (Request.QueryString["mobb"].ToString());
                                         // x = (from v in db.patient  where v.name=x2&&v.ssi==x1 &&v.city==x3&&v.government==x2 select v).FirstOrDefault();
                                        // x = db.patient.Where(c =>c.name == x2).Where(p=>p.ssi==x1).Where(d=>d.government==x4).ToList().Select(c => { c.name == x2&&c.government==x4; return c; });;

                                         if (x1 != "")
                                         {
                                             x = db.patient.Where(c=>c.ssi==x1).ToList();
                                         }
                                          if (x2 != "")
                                         {
                                             x = db.patient.Where(c=>c.name==x2).ToList();
                                         }
                                           if (x3 != "")
                                         {
                                             x = db.patient.Where(c=>c.city==x3).ToList();
                                         }
                                            if (x4 != "")
                                         {
                                             x = db.patient.Where(c=>c.government==x4).ToList();
                                         }
                                        
                                         //|| c.government == x4 ).ToList();
                                     }
                                     if (x != null)
                                     {

                                         // x = (from ss in db.patient where ss.id !=0 && ss.ssi == zz  select ss).ToList();


                       %>
                                       <div class="col-lg-12 "style="overflow-x:scroll">
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable">
                                            
                                        <tr class="bg-info">

                                            <th>الكود</th>

                                            <th>الاسم </th>


                                            <th>رقم البطاقة </th>
                                            <th>رقم الهاتف </th>
                                            <th>السن </th>
                                           <%-- <th>النوع </th>
                                            <th>الحالة الاجتماعية </th>
                                            <th>الجنسية </th>

                                            <th>الوظيفة </th>--%>
                                            <th>المدينة </th>
                                            <th>المحافظة </th>
                                            
                                           <th></th>

                                           <%-- <th>تاريخ التسجيل </th>

                                            <th>اسم المستخدم </th>
                                           <th>حجز جديد</th>
                                           <th>تعديل البيانات</th>
                                           <th>طباعة</th>
                                           --%>
                                         <th></th>
                                        </tr>
                                          <%
    if (x != null)
    {
        int i = 1;

        foreach (var item in x)
        {

            // DateTime d1 = Convert.ToDateTime(item.dateNow);
                           %> 

                                        <tr>
                                            <td><%=item.id %></td>
                                            <td><%=item.name %></td>
                                            <td><%=item.ssi %></td>
                                            <td><%=item.phone %></td>
                                            <td><%=item.age %></td>
                                            <%--<td><%=item.gender %></td>
                                            <td><%=item.social_state %></td>
                                            <td><%=item.nationalty %></td>
                                            <td><%=item.job %></td>--%>
                                            <td><%=item.city %></td>
                                            <td><%=item.government %></td>
                                           <td><a  href='patprofile.aspx?patid=<%=item.id %>'> عرض الملف</a>
                                     </td>
                                           <%-- <td><%=d1.ToShortDateString() %></td>
                                            <td><%=item.u %></td>
                                                <td><a  href='p_Profile.aspx?c=<%=item.code %>' target="_blank">  <i class="glyphicon glyphicon-user  text-blue"></i></a></td>
                       <td><a href="addPatient.aspx?edit=<%=item.code %>">  <i class="glyphicon glyphicon-pencil text-blue"></i></a></td>--%>
<%if (Session["role"].ToString() == "Admin")
    { %>
                   <td><a  href='p_search.aspx?editid=<%=item.id %>'>  <i class="glyphicon glyphicon-pencil text-blue"></i></a>
                    
                   <a  href='p_search.aspx?remove=<%=item.id %>'>  <i class="glyphicon glyphicon-remove text-danger"></i></a>
                    
                   <a  href='p_search.aspx?print=<%=item.id %>' target="_blank">  <i class="glyphicon glyphicon-print text-warning"></i></a></td>

<%} %>

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

    %>
  
                                                            
                                 
                           
                            </div>
                            
                        <%--</asp:Panel>--%>
                    </div>
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

