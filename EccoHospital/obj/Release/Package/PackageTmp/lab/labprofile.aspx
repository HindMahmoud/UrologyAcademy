<%@ Page Title=""  Language="C#" AutoEventWireup="true" MasterPageFile="~/lab/MasterPage.Master" CodeBehind="labprofile.aspx.cs" Inherits="EccoHospital.lab.labprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .home_passs {      background-color: #f6f6f6;
    font-size: 16px;
    border-bottom: 1px solid #eee;
    /* margin-bottom: 20px; */
    padding: 5px;
    overflow: hidden;
        }
     .wrap .headin_title {    /* margin-top: 50px; */
    /*border-top: 2px solid #e64759;*/
    color: #222;
    border-bottom: 2px solid #e64759;
    width: 250px;
    padding-bottom: 8px;
    /*padding-top: 5px;*/
    /*margin-left: auto;
    margin-right: auto;*/
    font-size: 21px;
    text-align: center;
    margin:auto auto;
    margin-bottom:1px
        }
  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="main_content_container">
            <div class="main_container  main_menu_open" style="padding-right:3px;padding-left:3px">
                 <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">التحاليل </a></li>
                        <li class="bring_right"><a href="">ملف المريض </a></li>
                    </ul>
                </div>
                   <% 
                       int x = 0;
                       if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                       {
                           x = int.Parse(Request.QueryString["p_id"].ToString());

                       }
                       EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                       var pat = db.patient.FirstOrDefault(a => a.code == x.ToString());
                       if (pat != null)
                       {
                           %>
                <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="#" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->
       
                <div class="page_content">
                  <div style="margin-bottom:-35px">
                        
                      <div class="col-md-6">
                          <div>
                              <br />
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
                                        <asp:TextBox ID="txt_result"  CssClass="form-control" TextMode="MultiLine"  Columns="40" Rows="10" runat="server"></asp:TextBox>
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
                            
                     
                        <% }%>
                              </div>
                          </div>
                                      
                      <div class=" col-md-6" >
                        <div class="box box-primary">
                            <div class="box-body box-profile">

                          <h3 class="profile-username">بيانات المريض :
                             </h3>
                           <ul class="list-group list-group-unbordered" style="padding-right:0px">
                               <li class="list-group-item"><b>اسم المريض</b><a class="pull-left"> <%=pat.name %></a></li>
                            <li class="list-group-item">
                              <b>السن</b> <a class="pull-left"><%=pat.age %></a>
                            </li>
                              <li class="list-group-item">
                              <b>العنوان </b> <a class="pull-left"><%=pat.government %></a>
                            </li>
                               <li class="list-group-item">
                              <b>الهاتف </b> <a class="pull-left"><%=pat.phone %></a>
                            </li>
                            <li class="list-group-item">
                                 <a class="btn btn-primary blue-gradient center-block"  style="width:100%" href="external_lab_reception.aspx?p_id=<%=pat.id%>">اضافة خدمة/ تحليل للمريض</a>
                           </li>
                              </ul>
                                </div>
                            </div>
                          
                         </div>
                </div>

  <div class="wrap">
                   <%  
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

                                 var xp = (from p in db.lab_history
                                          where p.p_id==xx 

                                          select p).ToList();
                                  var hasFiles = (from g in db.image join i in db.lab_history on g.service_id equals i.id   where i.p_id==xx select g).ToList();

                                 if (xp != null)
                                 {
                                     int i = 1;
                                     foreach (var item in xp)
                                     {

                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                                <td><%=item.lab_name %></td>
                                <td><%=item.price %></td>
                                <td><%
                                        DateTime v = Convert.ToDateTime(item.date);
                                        Response.Write(v.Day+"/"+v.Month+"/"+v.Year); %></td>
                                <td>
                                 <% if (item.status == false)

                                    { %>
                                 
                                
                                    <a href="labprofile.aspx?p_id=<%=xx %>&&edittxt=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                   
                                    <%} %> 
                                     <% else
                                    {
                                        Response.Write(item.lab_result);
                                    } %>
                                </td>
                                  <td>
                                     <a href="labprofile.aspx?p_id=<%=xx %>&&edit=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-floppy-open"></i></a>
                                   </td>
                                <td> 
                                    <% if (hasFiles != null)
                                        {%>
                                   <a href="lab_files.aspx?files=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                      data-placement="top" title="ملفات المريض"></a>
                                  
                                   <%} %> 
                                </td>
                                <td><%=item.user_name %></td>
                                 <td>
                                     <a href="external_lab_reception.aspx?p_id=<%=item.p_id %>&&p_idedit=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-pencil"></i></a>
                                   </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>
                         <%
                            }
                             %>
                    </div>
            
           
        </div>
                <%} %>
       </div>
        </div>
    </asp:content>



