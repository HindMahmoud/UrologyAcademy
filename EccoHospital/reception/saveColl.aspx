<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="saveColl.aspx.cs" Inherits="EccoHospital.reception.saveColl" %>






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
                       
                        <li class="bring_right"><a href="">حجز خدمات</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <% 
                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
                    {
                         EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                        
                        int xx = int.Parse(Request.QueryString["t_id"].ToString());
                        EccoHospital.Models.ticket_out pp = db.ticket_out.FirstOrDefault(a => a.code == xx);
                        int? p_id = null;
                        string p_name = null;
                        if (pp != null)
                        {
                            p_id = int.Parse(pp.patient_id.ToString());
                            p_name = pp.patient_name.ToString();
                        }
                    %>
                <div class="page_content">

                    <h1 class="heading_title">حجز خارجي</h1>

                    <h4><%=p_name %></h4>
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="saveColl.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                         
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                           
  
   


                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم التحليل   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_lab" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>

                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم الأشعه   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_rad" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>

                           

                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم الخدمه   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_servic" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>
                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             خدمات بنك الدم    </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddlblood" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>

                           
                              
           
                           
                            
      
                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    
                                </div>
                            </div>
             
                        </div>
                   
                    <div>
                        <h1 class="heading_title">عرض كل الخدامات</h1>
                       <br />

                     <div class="row">
                          <%
                              var listt = (from s in db.patient_history where s.p_id == p_id && s.ticketId==xx &&  s.ticket_type=="out" &&s.check_out == false  select s).ToList();
                              if(listt!=null)
                              {

                                  %>
                          <table class="table table-bordered" >
                               <tr>
                                  <th>#</th>
                                  <th>الخدمه</th>
                                  <th>السعر</th>

                              </tr>
                         <%
                             int i = 1;
                             foreach (var item in listt)
                             {
                                 %>
                              <tr>
                                  <td><%=i %></td>
                                  <td><%=item.service_name %></td>
                                  <td><%=item.price %></td>

                              </tr>
                              <%

                                      i++; }
                                         %>
                               


                                </table>
                                   
                                   <%} %>
                                </div>
                                   <div class="btn btn-lg" style="background-color:antiquewhite">الاجمالي: <asp:Label runat="server" ID="totallbl"></asp:Label></div>

                    <!--/End status alert-->
                    <div class="row">
                        <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>


                        <div class="col-md-4 pull-right">
                            نسبه خصم:
                            <asp:TextBox ID="txt_dis" CssClass="form-control" AutoPostBack="true" OnTextChanged="txt_dis_TextChanged" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-4 pull-right">
                            الاجمالي بعد الخصم
                            <asp:TextBox ID="txt_total2" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
    </ContentTemplate>
                            </asp:UpdatePanel>
                        
                    </div>

                    </div>
                </div>
                <%} %>


            </div>
        </div>

    
</asp:Content>






