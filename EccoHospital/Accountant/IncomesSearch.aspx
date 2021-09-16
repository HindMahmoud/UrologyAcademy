<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="IncomesSearch.aspx.cs" Inherits="EccoHospital.Accountant.IncomesSearch" %>





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
                       
                        <li class="bring_right"><a href="">  بحث ايرادات </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">بحث ايرادات  </h1>

                      <div class="col-md-4 pull-right">
                          البند:
             <asp:DropDownList ID="ddltype"  CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
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
                    <%  if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) )
                        {
                            EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                            DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                            DateTime d = DateTime.Now.Date;
                            DateTime dplus = d.AddDays(1);


                            string n = "";

                            var   x = (from p in db.patient_history

                                       where  (p.type!=null)  && p.date>=d1 &&p.date<d2

                                       select p ).ToList();


                            if(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["n"])) )
                            {

                                n = Request.QueryString["n"].ToString();
                                x = (from p in db.patient_history

                                     where  (p.type!=null)&&p.type==n  && p.date>=d1 &&p.date<d2

                                     select p ).ToList();
                            }

                                %>
                    <div class="wrap">
                        <h3><%=n %></h3>

                           <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                 <td> النوع</td>

                                 
                                 <td> التاريخ</td>
                                 <td> المستخدم</td>


                                 <td> السعر</td>
                                 


                            </tr>
                             <% 
                                     
                                     
                                 

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
                                <td><%=item.type %></td>

                               
                                <td><%=item.date %></td>
                                <td><%=item.user_name %></td>


                                <td><%=item.price %></td>
                               
                              
                            </tr>
                              <%  i++;}
                                      %>
                               <tr style="background-color:#ffd800">

                                   <td colspan="6">
                                       الاجمالــــــــــــــــــــــي
                                   </td>
                                   <td><%=x.Sum(a=>a.price) %></td>
                               </tr>
                               <%
    }%>
                           
                        </table>
                       

                    </div>
                   
                     <%
                            }

                                    %> 
                  </div>
                </div>
       </div>
    </asp:Content>
