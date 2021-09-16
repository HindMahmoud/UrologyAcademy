<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="ClinicCalcu.aspx.cs" Inherits="EccoHospital.Accountant.ClinicCalcu" %>



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
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                      <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">  حساب عيادات و مرور </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">حساب عيادات و مرور  </h1>

                      <div class="col-md-4 pull-right">
                          الطبيب:
             <asp:DropDownList ID="docList"  CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
                     <div class="col-md-4 pull-right">
                          من:
             <asp:TextBox ID="txt_from" TextMode="Date" CssClass="form-control " runat="server" ></asp:TextBox>
                                    </div>
                     <div class="col-md-4 pull-right">
                          الي:
             <asp:TextBox ID="txt_to" TextMode="Date" CssClass="form-control " runat="server" ></asp:TextBox>
                                    </div>
                    <div class="col-md-4 pull-right">
                         <br />
             <asp:Button ID="btn" CssClass="btn btn-primary " OnClick="btn_Click" Text="بحث" runat="server" ></asp:Button>
                                    </div>
                    <%  if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"]))&&!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) )
                        {
                            EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            int doc_id = int.Parse(Request.QueryString["id"].ToString());
                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                            DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);

                            EccoHospital.Models.doctor dd = db.doctor.FirstOrDefault(a => a.id == doc_id);

                                %>
                    <div class="wrap">
                        <h3><%=dd.name.ToString() %></h3>

                           <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                 <td> الطبيب</td>
                                 <td> التاريخ</td>

                                 <td> السعر</td>
                                 


                            </tr>
                             <%  DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);


                                 var   x = (from p in db.patient_history
                                         
                                          where p.doc_id==doc_id && (p.type=="مرور"||p.type=="عيادات")  && p.date>=d1 &&p.date<d2
                                          &&p.confirm_calc==false&&p.doc_acc==false
                                          select p ).ToList();


                                  
                                     
                                     
                                 

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                                <td><%=item.service_name %></td>
                                <td><%=item.doc_name %></td>
                                <td><%=item.date %></td>

                                <td><%=item.price %></td>
                               
                              
                            </tr>
                              <%  i++;}
                                      %>
                               <tr style="background-color:#ffd800">

                                   <td colspan="5">
                                       الاجمالــــــــــــــــــــــي
                                   </td>
                                   <td><%=x.Sum(a=>a.price) %></td>
                               </tr>
                               <%
    }%>
                           
                        </table>
                       

                    </div>
                    <div class="col-md-3 pull-right">
                        <asp:TextBox ID="txt_total" Text="0" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-md-3 pull-right">
                        <asp:Button ID="btn_save" OnClick="btn_save_Click" Text="اضافه لحساب طبيب" CssClass="btn btn-success" runat="server"></asp:Button>
                    </div>
                     <%
                            }

                                    %> 
                  </div>
                </div>
       </div>
    </asp:Content>
