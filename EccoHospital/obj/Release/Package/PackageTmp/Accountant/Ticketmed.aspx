<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="Ticketmed.aspx.cs" Inherits="EccoHospital.Accountant.Ticketmed" %>







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
    <% if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
                {
                       
                        int n = int.Parse(Request.QueryString["t_id"].ToString());
                       %>
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                       <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">  <%=n %>علاج تذكره  </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title"><%=n %>تذكره</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="InternalMED.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div>
                       
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="CareAdd.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                             </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                               
                                 <td>اسم المريض</td>
                                 <td> رقم التذكره</td>
                                 <td> الصنف</td>
                                 <td> الكميه</td>
                                 <td> التاريخ</td>
                                 <td>المستخدم</td>
                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
    DateTime d = DateTime.Now.Date;

    var x = (from p in db.treatment
             where p.check_out == false && p.ticket_id==n
             select p).ToList();

    if (x != null)
    {
        int i = 1;
        foreach (var item in x)
        {


                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%=item.p_name %></td>
                              
                                <td><%=item.ticket_id %></td>
                                <td><%=item.name %></td>
                                <td><%=item.quantity %></td>
                                <td><%=item.datenow %></td>
                                 <td><%=item.user_name %></td>
                                <td>
                                    <a href="Ticketmed.aspx?id=<%=item.id %>"><i class="fa fa-trash text-danger"></i></a>
                                </td>


                              
                            </tr>
                              <%  i++;
        }
    }%>
                           
                        </table>

                    </div>

                    </div>
                </div>
            </div>
        </div>

    <%} %>
        <!--/End Main content container-->
</asp:Content>








