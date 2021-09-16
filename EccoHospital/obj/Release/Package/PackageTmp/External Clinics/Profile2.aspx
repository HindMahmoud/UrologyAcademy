<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile2.aspx.cs" MasterPageFile="~/External Clinics/MasterPage.master" Inherits="EccoHospital.External_Clinics.Profile2" %>

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
        .bg-purple {
        background:#605CA8;color:white}
        .bg-yellow-gradient {
        background-color:yellow}
        .bg-b {background:#FF9292
        }
        .bg-fuchsia {background:fuchsia;color:white
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
                        
                      <div class="col-md-8">
                            <div class="wrap">
      
<h4 class="headin_title">Patient history </h4>
              <table class="table table-bordered">
                  <% 
                      DateTime d = DateTime.Now.Date;
                      // p = db.patient.FirstOrDefault(a => a.id == x);
                      int id = x;
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
                 <td><% Response.Write(item.date); %></td>
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

                          </div>
                                      
                      <div class=" col-md-4" >
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
                                <li class="list-group-item">
                  <%--<a class="btn btn-primary center-block" data-toggle="modal" data-target="#myModal1">اضافه خدمه</a>--%>

                      <a class="btn btn-primary blue-gradient center-block"  style="width:100%" href="addpatient.aspx?editid=<%=x %>">show data</a>
                </li>

                  <li class="list-group-item">
                  <a class="btn btn-success center-block" style="width:100%" href="addhysteroscopy.aspx?id=<%=x %>">hysteroscopy</a>
                </li>

                   <li class="list-group-item">
                  <a class="btn bg-purple center-block" style="width:100%" href="addlaparoscopic.aspx?id=<%=x %>">laparoscopic</a>
                </li>
                  <li class="list-group-item">
                  <a class="btn bg-b center-block" style="width:100%" href="activate.aspx?id=<%=x %>">active </a>
                </li>
                   <li class="list-group-item">
                  <a class="btn bg-yellow-gradient center-block" style="width:100%"  href="Medical_Report.aspx?id=<%=x %>">Mediacl Report</a>
                </li>
                    

                  <li class="list-group-item">
                  <a class="btn bg-info center-block" style="width:100%"  href="IcsI_Report.aspx?id=<%=x %>">ICSI Report</a>
                </li>
                   <li class="list-group-item">
                  <a class="btn bg-fuchsia center-block" style="width:100%"  href="FrozenEmpryo.aspx?id=<%=x %>">Frozen Empryo Report</a>
                </li>
                              </ul>
                                </div>
                            </div>
                         </div>
                </div>


        
        </div>
       </div>
        </div>
    </asp:content>

