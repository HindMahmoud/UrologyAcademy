<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="CareCalcu.aspx.cs" Inherits="EccoHospital.Accountant.CareCalcu" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--<% EccoHospitalEntities db = new EccoHospitalEntities(); %>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

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
                                <h1 class="heading_title">حساب عنايه  </h1>

               
                <div class="form">
                    <div class="form-horizontal">
                     
                  <br />
                      
 <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    
                    <!--Start status alert-->
                    <div class="form-group">
                                <div class="col-sm-12 left_text">
                                    
                                    <div class="col-md-3 pull-right">
                                        من:<asp:TextBox ID="from1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-3 pull-right">
                                        الي:<asp:TextBox ID="to1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                 <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="btnSearch" OnClick="btnSearch_Click"  CssClass="btn btn-primary" Text="بحث" runat="server"></asp:Button>
                                    </div>
                                   <%-- <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="Button1" OnClick="Button1_Click"  CssClass="btn btn-primary" Text="طباعه" runat="server"></asp:Button>
                                    </div>--%>
                                    
                                </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr style="background-color:#dcd7d7">
                               <td>#</td>
                               
                                
                                 <td>اســـــــــــــم المريض</td>
                                 <td> النوع</td>

                                 <td>السرير</td>
                               

                                 <td> الاجمالي </td>
                                 <td> التاريخ</td>
                                <td></td>
                                <td></td>
                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;

                                 var x = (from p in db.patient_history
                                          join pp in db.room_history on p.details_id equals pp.id

                                          where p.type=="عنايه"

                                          select new { p,pp.type,pp.from_date}).OrderByDescending(a=>a.p.id).ToList();

                                 if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                     x = (from p in db.patient_history
                                          join pp in db.room_history on p.details_id equals pp.id

                                          where p.type=="عنايه" && p.date>=d1 &&p.date<=d2
                                          select new { p,pp.type,pp.from_date}).OrderByDescending(a=>a.p.id).ToList();
                                 }


                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {

                                        
                           %> 
                            <tr>
                                <td style="background-color:#dcd7d7"><%=i %></td>
                               <td><%=item.p.p_name %></td>
                                <td><%=item.type %></td>

                                <td><%=item.p.service_name %></td>
                                <td><%=item.p.price %></td>
                                <td><%=item.from_date %></td>

                                    <td>
                          <a href="CareCalcu.aspx?print=<%=item.p.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                       data-placement="top" title="print"></a>
                                </td>
                                 <td>
                                    
                                     <a href="CareCalcu.aspx?edit=<%=item.p.id%>" class="glyphicon glyphicon-edit" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                </td>
                                 
                                <td>
                                    
                                     <a href="CareCalcu.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                               
                               



                                 
                                
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>


                            </div>




                               
                    </div>
                </div>
            </div>
        </div>
    </div>
    


    

   
</asp:Content>
