<%@ Page Title="" Language="C#" MasterPageFile="~/rad/MasterPage.master" AutoEventWireup="true" CodeBehind="dr_rad.aspx.cs" Inherits="EccoHospital.rad.dr_rad" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> نتائج الأشعه</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title"> نتائج الأشعه</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="dr_rad.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>

                          <%--  <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div class="col-sm-10">
                                   
                                    <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                            
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                
                                <div class="col-sm-4">
                                   </div> 
                                <div class="col-sm-6">
                                    
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>

                                </div>
                            </div>


               </ContentTemplate>
                                </asp:UpdatePanel>


                        </div>
                    </div>


                     <div>
                       


                        <%  
                            EccoHospital.Models.EccoHospitalEntities dbb = new EccoHospital.Models.EccoHospitalEntities();
                            if(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"]))&&(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"]))||!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"]))))
                                    { 
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"])))
                            {
                              %>
                         <div  style="margin-left:3px;margin-right:10px">
                                 <div class="form-group pull-right">
                                     <label for="input3" class="control-label bring_right ">نتيجة التحليل :</label>
                                        <asp:TextBox ID="txt_result"  CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                   </div>
                              </br></br>
                                  </div>
                             
                            
                            <%} 
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                            {


                             %>
                        <br /><br />
                        
                             <div style="margin-left:3px;margin-right:10px">
                                     <div class="form-group  pull-right">
                                           <div >
                                                <label for="input3" class="control-label bring_right ">رفع ملفات :</label>
                                                 <asp:FileUpload AllowMultiple="true" CssClass="form-control bg-gray" ID="FileUpload1" runat="server" />
                         
                                           </div>
                                     </div>
                                 </div>
                           
                          
                    <br />
                                <% }%>

                              <div class=" pull-right">
                                 
                        <asp:Button ID="btn_add" CssClass="btn btn-success" OnClick="btn_add_Click" runat="server" Text="أضافه" />
                                </div>
                            </div>
                     
                        <% }%>
                      </div> 


                   <%-- <div>
                        <h1 class="heading_title">  الأشعه</h1>


                         <%  
                            EccoHospital.Models.EccoHospitalEntities dbb = new EccoHospital.Models.EccoHospitalEntities();


                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"]))&&!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                            {


                             %>
     <br /><br />
                        <div class="row ">
                            <div class="col-md-7 pull-right">

                                النتيجه:
                           
                                <asp:TextBox ID="txt_result" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-1 pull-right">
                    <br />
                        <asp:Button ID="btn_add" CssClass="btn btn-success" OnClick="btn_add_Click" runat="server" Text="أضافه" />
                                </div>
                            </div>

                        <% }%>
                    --%>

                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="dr_lab.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <%--<asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />--%>
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">



                          <%  
                           EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();


                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                            { 

                                  int xx = int.Parse(Request.QueryString["p_id"].ToString());

                    EccoHospital.Models.rad_history f = db.rad_history.FirstOrDefault(a => a.p_id == xx);
                 

                             %>





                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>اسم المريض</td>
                                 <td> الأشعه</td>
                                 <td> السعر</td>
                                 <td> التاريخ</td>
                                 <td>write Result</td>
                                <td>upload file</td>
                                <td>show files Pictue</td>
                                 <td> اسم المستخدم</td>

                            </tr>
                             <%  
                           DateTime d = DateTime.Now.Date;

                                 var x = (from p in db.rad_history
                                          where p.p_id==xx 

                                          select p).ToList();
                                  var hasFiles = (from g in db.image join i in db.rad_history on g.service_id equals i.id where i.p_id==xx select g).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {

                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                                <td><%=item.rad_name %></td>
                                <td><%=item.price %></td>
                                <td><%
                                        DateTime v = Convert.ToDateTime(item.date);
                                        Response.Write(v.Day+"/"+v.Month+"/"+v.Year); %></td>
                                <td>
                                 <% if (item.status == false)

                                    { %>
                                 
                                
                                    <a href="dr_rad.aspx?p_id=<%=xx %>&&edittxt=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                   
                                    <%} %> 
                                </td>
                                  <td>
                                     <a href="dr_rad.aspx?p_id=<%=xx %>&&edit=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-floppy-open"></i></a>
                                   </td><td> 
                                    <% if (hasFiles != null)
                                        {%>
                                   <a href="rad_files.aspx?files=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                      data-placement="top" title="ملفات المريض"></a>
                                  
                                   <%} %> 
                                </td>
                                <td><%=item.user_name %></td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>
                         <%
                            }
                             %>
                    </div>

                   
                </div>
            </div>
        </div>
        <!--/End Main content container-->
</asp:Content>








