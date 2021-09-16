<%@ Page Title="" Language="C#" MasterPageFile="~/lab/MasterPage.master" AutoEventWireup="true" CodeBehind="dr_lab.aspx.cs" Inherits="EccoHospital.lab.dr_lab" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> نتائج التحاليل</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">
                     <h1 class="heading_title">نتائج التحاليل</h1>
                   


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="dr_lab.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal ">
                            <%--<h4 style="border-bottom: 3px solid red; width:20% ;text-align:center;margin-top:0px">نتائج التحليل</h4>--%>
                            <%--<div class="form-group">
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
                                     <asp:DropDownList   ID="pats" ClientIDMode="Static" AppendDataBoundItems="True" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server"   AutoPostBack="True" OnSelectedIndexChanged="pats_SelectedIndexChanged"  >
                                      </asp:DropDownList>
                                </div>
                              
                            </div>
                              
                            <%--<div class="col-md-6">
                                <label for="input0" class="col-md-2 control-label bring_right left_text">رقم التزكرة </label>
                                <div class="col-md-4">
                                     <asp:DropDownList   ID="ticketId" ClientIDMode="Static" AppendDataBoundItems="True" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server"  DataTextField="name" DataValueField="id"  >
                                      </asp:DropDownList>
                                    <%--<input required type="text" class="form-control" id="txt_patient" placeholder="اسم المريض " readonly="readonly" runat="server" >
                                </div>
                            </div>--%>


               


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
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="dr_lab.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                   <%--  <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                --%>
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <%  
                           EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();


                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                            { 

                                  int xx = int.Parse(Request.QueryString["p_id"].ToString());

                    EccoHospital.Models.lab_history f = db.lab_history.FirstOrDefault(a => a.p_id == xx);
                 

                             %>

                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> التحليل</td>
                                 <td> السعر</td>
                                 <td> التاريخ</td>
                                 
                                <td>write Result</td>
                                <td>upload file</td>
                                <td>show files Pictue</td>
                                 <td> اسم المستخدم</td>

                            </tr>
                             <%  
                                 DateTime d = DateTime.Now.Date;

                                 var x = (from p in db.lab_history join s in db.patient_history on
                                          p.id equals s.details_id
                                          where p.p_id==xx

                                          select new {
                                              p, s.confirm_calc
                                          }).ToList();

                                 var hasFiles = (from g in db.image join i in db.lab_history on g.service_id equals i.id where i.p_id==xx select g).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p.p_name %></td>
                                <td><%=item.p.lab_name %></td>
                                <td><%=item.p.price %></td>
                                <td><%DateTime ft = Convert.ToDateTime(item.p.date);
                                        Response.Write(ft.Day + "/" + ft.Month + "/" + ft.Year); %></td>
                               


                                 <td>
                                <% if (item.p.status == false)

                                    { %>
                                  
                                    <a href="dr_lab.aspx?p_id=<%=xx %>&&edittxt=<%=item.p.id%>" class="" data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                    
                                <%} %> 
                                      </td >
                                <td>
                                     <a href="dr_lab.aspx?p_id=<%=xx %>&&edit=<%=item.p.id%>" class="" data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-floppy-open"></i></i></a>
                                   </td><td> 
                                    <% if (hasFiles != null)
                                        {%>
                                   <a href="lab_files.aspx?files=<%=item.p.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                      data-placement="top" title="ملفات المريض"></a>
                                  
                                   <%} %> 

                                </td>
                                 <td><%=item.p.user_name %></td>
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
        </div>

 
        <!--/End Main content container-->
</asp:Content>







