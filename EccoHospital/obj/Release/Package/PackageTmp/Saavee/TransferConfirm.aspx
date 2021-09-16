<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="TransferConfirm.aspx.cs" Inherits="EccoHospital.Saavee.TransferConfirm" %>





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
                       <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> صرف علاج داخلي  </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    


                    <div>
                        <h1 class="heading_title">عرض كل التحويلات</h1>
                    
                  
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                             </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                                 <td> التاريخ</td>
                                 <td>المستخدم</td>
                                 <td>النوع</td>
                                 <td>القيمه</td>


                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                
                                 var x = (from p in db.transfer
                                          where p.flag==0
                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                                <td><%Response.Write(Convert.ToDateTime(item.date).Day + "/"+Convert.ToDateTime(item.date).Month+"/" + Convert.ToDateTime(item.date).Year); %></td>
                              
                                <td><%=item.user_name %></td>
                                <td><%=item.type %></td>
                                <td><%=item.amount %></td>
                                
                                <td>
                                    <a href="TransferConfirm.aspx?id=<%=item.id %>" title="تحويل"><i class="fa fa-check text-danger" ></i></a>
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

    
        <!--/End Main content container-->
</asp:Content>









