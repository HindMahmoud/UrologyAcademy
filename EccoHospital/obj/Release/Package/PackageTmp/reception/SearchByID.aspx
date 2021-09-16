<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchByID.aspx.cs" MasterPageFile="~/reception/MasterPage.master" Inherits="EccoHospital.External_Clinics.SearchByID" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">العيادات الخارجيه </a></li>
                        <li class="bring_right"><a href="">بحث في المرضي  </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">بحث </h1>

                     <div class="form-group col-md-12"> 
                               <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div >
                                    <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true"  runat="server"></asp:TextBox>
                               <asp:Label runat="server" ID="Label" CssClass="text-danger" ></asp:Label>
                                     </div>
                            </div>
                     <div class="form-group col-md-12"> 
                               <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div >
                                    <asp:TextBox ID="TextBox1" placeholder="اسم المريض " AutoPostBack="true"  runat="server"></asp:TextBox>
                               <asp:Label runat="server" ID="Label1" CssClass="text-danger" ></asp:Label>
                                     </div>
                            </div>
                     <div class="form-group col-md-6"> 
                               <div >
                                   <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="بحث" OnClick="Button1_Click" />    
                              </div>
                            </div>
                    <!--Start status alert-->
                   <%-- <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->--%>


                    <div>
                       
                    
                    <!--Start status alert-->
                   <%-- <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="adduser.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>--%>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <%--<asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                --%>
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                                 <td >  اسم المريض </td>
                                <td> السن </td>
                                 <td> رقم التليفون 1 </td>
                                <td> رقم التليفون 2 </td>
                                  <td>المحافظة  </td>
                                  <td> المركز </td>
                                <%if (Session["role"].ToString() == "Admin")
                                    { %> 
                                <td > </td>
<%} %>
                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.patient
                                          select p).ToList();
                                 if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                                 { int cod = int.Parse(Request.QueryString["id"]);
                                      x=(from p in db.patient where p.id==cod
                                          select p).ToList();
                                 }
                                
                                 if (x != null)
                                 {
                                     int f = 0;

                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%=item.name %></td>
                             
                                <td><%=item.type %></td>
                               
                            <%-- <td>--%>
                                 <%-- <a  href='session_medicines.aspx?sess_id=<%=item.id %>'>  <i class="fa  fa-medkit text-blue"></i></a>
                                 --%> 
                                <%if (Session["role"].ToString() == "Admin")
                                    { %>
                                <td> <a  href='SearchByID.aspx?rid=<%=item.id %>'>  <i class="fa  fa-print text-blue"></i></a>
                                </td>
                                     <%} %>  
                             
                 
                               
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>

                    </div>
                </div>
            </div>
        </div>
        <!--/End Main content container-->
    <script>
     
        </script>
</asp:Content>

