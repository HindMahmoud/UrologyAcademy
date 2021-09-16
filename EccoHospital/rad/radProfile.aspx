<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/rad/MasterPage.Master" CodeBehind="radProfile.aspx.cs" Inherits="EccoHospital.rad.radProfile" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="main_content_container">
            <div class="main_container  main_menu_open" style="padding-right:3px;padding-left:3px">
                 <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">الاشعة </a></li>
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
                            
                       <%  
                            EccoHospital.Models.EccoHospitalEntities dbb = new EccoHospital.Models.EccoHospitalEntities();
                            if(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"]))&&(!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"]))||!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"]))))
                           { 
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"])))
                            {
                              %>
                         <div  style="margin-left:3px;margin-right:10px">
                             <br />
                             <br />
                                 <div class="form-group pull-right">
                                     <label for="input3" class="control-label bring_right ">نتيجة الأشعة :</label>
                                        <asp:TextBox ID="txt_result"  CssClass="form-control" TextMode="MultiLine" Columns="40" Rows="10" runat="server"></asp:TextBox>
                                   </div>
                              <br/><br/>
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
                                 <a class="btn btn-succuss blue-gradient center-block"  style="width:100%" href="external_rad.aspx?p_id=<%=pat.id%>">اضافة خدمة/ اشعة للمريض</a>
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

                                 var xp = (from p in db.rad_history
                                          where p.p_id==xx 

                                          select p).ToList();
                                  var hasFiles = (from g in db.image join i in db.rad_history on g.service_id equals i.id  where i.p_id==xx select g).ToList();

                                 if (xp != null)
                                 {
                                     int i = 1;
                                     foreach (var item in xp)
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
                                 
                                
                                    <a href="radProfile.aspx?p_id=<%=xx %>&&edittxt=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                   
                                    <%} %> 
                                     <% else
                                    {
                                        Response.Write(item.rad_result);
                                    } %>
                                </td>
                                  <td>
                                     <a href="radProfile.aspx?p_id=<%=xx %>&&edit=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-floppy-open"></i></a>
                                   </td>
                                <td> 
                                    <% if (hasFiles != null)
                                        {%>
                                   <a href="rad_files.aspx?files=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                      data-placement="top" title="ملفات المريض"></a>
                                  
                                   <%} %> 
                                </td>
                                <td><%=item.user_name %></td>
                                 <td>
                                     <a href="external_rad.aspx?p_id=<%=item.p_id %>&&p_idedit=<%=item.id%>"  data-toggle="tooltip"
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
            <!-- /.box-body -->
         

            <%--<div class="col-md-9 col-xs-12">
          <div class="box box-warning">
            <div class="box-header">
              <h3 class="box-title">completed</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search1" class="form-control pull-right" onkeyup="myFunction1()" placeholder="Search">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="mytable1">
                  <% 
                      //int spec = int.Parse(Session["Spectialid"].ToString());
                      var lab2 = (from ss in db.patient_services join sp in db.patiant_services_Wspecial on ss.id equals sp.Patiant_servid where ss.patient_id == id && sp.Special_id == spec && ss.flage == true select new { ss, sp.diag }).ToList();
                      if (lab2 != null)
                      {
                       %>
                <tr>
                  <th>#</th>
                  <th>الخدمه</th>
                  <th>الشكوي</th>
                  <th>التشخيص</th>
                  <th>الملاحظات</th>
                  <th>التاريخ </th>
                  <th>سعرها</th>
                  <th>تم دفع</th>
               <th>تفاصيل الزياره</th>
                  <th>الروشته</th>

                
                </tr>
                  <% foreach (var item in lab2)
                      {
                          string dd = Convert.ToDateTime(item.ss.date).ToString("yyyy/MM/dd");
                          var sum_serv = (from k in db.sessions where k.Patserv_id == item.ss.id select k.paid).Sum();
                           %> 
                      
                <tr>
                 
                 <td><% Response.Write(item.ss.id); %></td>
                 <td><% Response.Write(item.ss.service_name); %></td>
                 <td><% Response.Write(item.ss.status); %></td>
                 <td><% Response.Write(item.diag); %></td>
                 <td><% Response.Write(item.ss.notes); %></td>
                 <td><% Response.Write(dd); %></td>
                 <td><% Response.Write(item.ss.total); %></td>
                 <td><% Response.Write(sum_serv); %></td>
                 <td><a  href="visitDetails.aspx?id=<%=item.ss.id %>">  <i class="fa fa-2x fa-arrow-circle-o-right text-blue"></i></a></td>
                 <td><a  href='session_medicins.aspx?sess_id=<%=item.ss.id %>'>  <i class="fa fa-2x fa-medkit text-blue"></i></a></td>

                </tr>
                    <%  }
                        }%>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <div class="col-md-9">
                            <div class="nav-tabs-custom" style="height:600px; overflow-x:auto;">
                                <br />
                                <div style="margin-left: 40%">
                                    <label>photos</label>
                                    <asp:FileUpload AllowMultiple="true" ID="FileUpload1" runat="server" /><br />
                                   <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="add" OnClick="Button2_Click"  />

                                
                                    
                                </div>
                                <%
                                    int cc = int.Parse(Request.QueryString["code"]);
                                   // microinjectionEntities db = new microinjectionEntities();
                                    var ptx = (from r in db.image
                                               where r.patient_id==cc
                                               select r);
                                    foreach (var item in ptx)
                                    {
                                        %>

                                <div class='col-md-4'>
                                <div class='thumbnail'>
                               <a href='photos/<%=item.img %>' target = "_blank" >
                                   
                                   <img src='photos/<%=item.img %>'  style='width:400;height:100px'></a>                      
                               </div>
                                    <% int imageidd = item.id;
                                        
        string idd = Request.QueryString["code"];

        
                                        %>
                                   
                              <a href='profile.aspx?code=<%=x%>&&img=<%=item.id %>'>   <img src='img/delete.png'  class="center-block"/> </a>
                                    <% 
                                             %>
	                           </div>
                                <%
                                    }
                                %>
                                
                                </div>
                        



     
        </div>--%>
        </div>
                <%} %>
       </div>
        </div>
    </asp:content>


