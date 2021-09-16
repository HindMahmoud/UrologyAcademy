<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/External Clinics/MasterPage.master" CodeBehind="profile.aspx.cs" Inherits="EccoHospital.External_Clinics.profile" %>


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
                        <li class="bring_right"><a href="">العيادات الخارجيه </a></li>
                        <li class="bring_right"><a href="">عيادة <%=Session["ClinicName"] %></a></li>
                    </ul>
                </div>
                   <% 
                        int x = 0;
                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["patid"])))
                        {
                            x = int.Parse(Request.QueryString["patid"].ToString());

                        }
                        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                
                        var pat = db.patient.FirstOrDefault(a => a.id == x);
                           %>
                <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="#" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->
       
                <div class="page_content">
                  <div style="margin-bottom:-35px">
                        
                      <div class="col-md-6">
                          </div>
                                       <%--  <div class="form">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                التاريخ :
                                                <input required type="date" class="form-control" id="date"  runat="server" >
                                            </div>
                                        </div>
                                       
                                        <div class="form-group">
                                             <div class="col-sm-12">
                                                التشخيص :
                                                <input required type="text" style="height:60px;padding:0 1px;font-size:11px" multiline="true"  class="form-control" id="daig" placeholder="التشخيص " runat="server" >
                                             <br />
                                                 الشكوي :
                                                 <input required type="text" style="height:60px;padding:0 1px;font-size:11px" multiline="true"  class="form-control" id="comp" placeholder="الشكوي  " runat="server" >
                                         
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <div class="col-sm-12 left_text">
                                                 <asp:Button ID="btn" CssClass="btn btn-warning"  runat="server" Text="اضافة" OnClick="btn_Click" />
                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                      </div>--%>
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
                              <b>العنوان </b> <a class="pull-left"><%=pat.address %></a>
                            </li>
                               <li class="list-group-item">
                              <b>الهاتف </b> <a class="pull-left"><%=pat.phone %></a>
                            </li>
                              </ul>
                                </div>
                            </div>
                         </div>
                </div>

  <div class="wrap">
      
<h4 class="headin_title">Patient history </h4>
              <table class="table table-bordered">
                  <% 
                      DateTime d = DateTime.Now.Date;
                      // p = db.patient.FirstOrDefault(a => a.id == x);
                      int id = pat.id;
                      //int specid = int.Parse(Session["Spectialid"].ToString());
                      var lab = (from patRec in db.clinic_reception  where patRec.patient_id==id select  patRec ).ToList();
                      if (lab != null)
                      {
                       %>
                <tr>
                  <th>#</th>
                  
                  
                  <th>الحالة</th>
                  <th>التاريخ </th>
                  <th> اسم المستخدم</th>
                  <th> نوع الخدمة</th>
                    <th> سعر الخدمه</th>
                  <th>تفاصيل الزياره</th>
                  <th>الروشته</th>

                  <th></th>
                  
                </tr>
                  <% foreach (var item in lab)
    {
        DateTime f = DateTime.Now;
        string dd = Convert.ToDateTime(item.date).ToString("yyyy/MM/dd");


                          %> 
                      
                <tr>
                 
                 <td><% Response.Write(item.id); %></td>
              <%--   <td><% Response.Write(item.Complaint); %></td>
                 <td><% Response.Write(item.Diagnosis); %></td>--%>
                  <td><% if (item.status == true)
    {
                         %>انتهت<%
    }
    else
    { %>لم تنتهي <%} %>

                  </td>  
                 <td><% Response.Write(Convert.ToDateTime(item.date).Day+"/"+Convert.ToDateTime(item.date).Month+"/"+Convert.ToDateTime(item.date).Year); %></td>
                 <td><% Response.Write(item.user_name); %></td>
                  <td><% Response.Write(item.type); %></td>
                    <td><% Response.Write(item.price); %></td>
                  <td><a  href="visitDetails.aspx?Recid=<%=item.id %>&&patid=<%=item.patient_id %>">  <i class="fa  fa-arrow-circle-o-right text-blue"></i></a></td>
                  <td><a  href='session_medicines.aspx?sess_id=<%=item.id %>'>  <i class="fa  fa-medkit text-blue"></i></a></td>
                 
                    <td><a  href='profile.aspx?delRecp=<%=item.id %>'><i class="fa  fa-trash-o text-red"></i></a></td>
                     
                  </tr>
                    <%  }
                        }%>
               
              </table>
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
       </div>
        </div>
    </asp:content>

