<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="patprofile.aspx.cs" Inherits="EccoHospital.reception.patprofile" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        .some-class {
        opacity:.9;cursor:no-drop
        }
            .some-class input[type=checkbox] {cursor:no-drop;
            
            }
        .gly {
        color:black}
      @media print {
       #mytable2 {
 overflow-x: auto;

}
        }
        .home_passs {     
             background-color: #f6f6f6;
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
        .list-group {float:right;text-align:center
        }
        .list-group-item {
        margin-left:2px}
    
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="main_content_container">
            <div class="main_container  main_menu_open" style="padding-right:3px;padding-left:3px">
                 <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       </ul>
                </div>
                   <% 
                       int x = 0;
                       if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["patid"])))
                       {
                           // x is id
                           x = int.Parse(Request.QueryString["patid"].ToString());


                           EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();


                           var pat = db.patient.FirstOrDefault(a => a.id == x);
                           if (pat != null)
                           {  %>
                <!--Start status alert-->
                   <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->
        <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><a href="#" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
                   </div>
                <div class="page_content">
                 
                    <div>
                        
                      <div class="col-md-12" >
                        
                           <div class="row" id="div11" runat="server">
                              <div class="col-md-12" dir="ltr">
                          <h4 style="text-align:left">Past History</h4>
                          <ul>
                          
                  <li class="list-group-item">
                     <asp:CheckBox  Text="Smooker" ClientIDMode="Static" class="marginClass" ID="PPCh1" runat="server" >
                </asp:CheckBox>
                     &nbsp;&nbsp;
                      <asp:CheckBox  Text="Stones" ClientIDMode="Static" CssClass="marginClass" ID="PPCh2" runat="server" >
                </asp:CheckBox>
                   &nbsp;&nbsp;
                      <asp:CheckBox  Text="Operations" ClientIDMode="Static" CssClass="marginClass" ID="PPCh3" runat="server" >
                </asp:CheckBox>
                     &nbsp;&nbsp;
                      <asp:CheckBox  Text="Trauma" ClientIDMode="Static" CssClass="marginClass" ID="PPCh4" runat="server" >
                </asp:CheckBox>
                      &nbsp;&nbsp;
                      <asp:CheckBox  Text="TB" ClientIDMode="Static" CssClass="marginClass" ID="PPCh5" runat="server" >
                </asp:CheckBox>
                      &nbsp;&nbsp;
                      <asp:CheckBox  Text="Diabetes" ClientIDMode="Static" CssClass="marginClass" ID="PPCh6" runat="server" >
                </asp:CheckBox>
                  &nbsp;&nbsp;
                      <asp:CheckBox  Text="Hypertension" ClientIDMode="Static" ID="PPCh7" runat="server" >
                </asp:CheckBox>
                     &nbsp;&nbsp;
                      <asp:CheckBox  Text="Cancer" ClientIDMode="Static" ID="PPCh8" runat="server" >
                </asp:CheckBox>
                     &nbsp;&nbsp;
                      <asp:CheckBox  Text="Ischluic_ttt" ClientIDMode="Static" ID="PPch9" runat="server" >
                </asp:CheckBox>
                      &nbsp;&nbsp;
                      <asp:CheckBox  Text="Asthma" ClientIDMode="Static" ID="PPch10" runat="server" >
                </asp:CheckBox>
                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <asp:CheckBox  Text="candiac_Stuiet" ClientIDMode="Static" ID="PPch11" runat="server" >
                </asp:CheckBox>
             
                       </li>
                             
       <li class="list-group-item" style="text-align:left"> others  <asp:TextBox ID="posttxt" CssClass="form-control" runat="server"></asp:TextBox></li> 
                              </ul>
                                  </div>
                              <div class="col-md-12" dir="ltr">
                         <h4 style="text-align:left">family History</h4>
                       <ul style="list-style-type:none ;text-align:left" >
                               <li class="list-group-item">


           <asp:CheckBox CssClass="aa" Text="Diabetes" ClientIDMode="Static" ID="FFch1" runat="server" >
                  
               </asp:CheckBox>
               &nbsp;&nbsp;&nbsp;
              <asp:CheckBox CssClass="aa" Text="Hypertension" ClientIDMode="Static" ID="FFch2" runat="server" >
             </asp:CheckBox>
                 &nbsp;&nbsp;&nbsp;
                 <asp:CheckBox CssClass="aa" Text="cancer" ClientIDMode="Static" ID="FFch3" runat="server" >
            </asp:CheckBox>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:CheckBox CssClass="aa" Text=" cancer prostate " ClientIDMode="Static" ID="FFch4" runat="server" >
          </asp:CheckBox>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:CheckBox CssClass="aa"   ClientIDMode="Static" Text="statues" ID="FFch5" runat="server" >
         </asp:CheckBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:CheckBox CssClass="aa"   ClientIDMode="Static" Text="Medical_Chronic_diseases" ID="FFch6" runat="server" >
         </asp:CheckBox>
                                 </li>
                             
     <li class="list-group-item" style="text-align:left">  others  <asp:TextBox ID="Familytxt" CssClass="form-control" runat="server"></asp:TextBox></li>

                              </ul>
                                  </div>

                               <asp:Button runat="server" ID="btnSave"  OnClick="btnSave_Click" Text="save" CssClass="btn btn-primary pull-left" /><br /><br />
                              </div>
                      
                      </div>
                        <hr />
                      
                              <div class="container-fluid "> 
                               <div class="col-md-12" style="float:left">
                                    <table class="text-center table-responsive bg-navey" border="1" dir="ltr" style="border-top:10px">
                                  <tr><th colspan="12">Vital signst Cluial data :</th></tr>
                                 <tr><td class="bg-warning"> pulse:</td>
                                      <td >
                                <asp:TextBox ID="plusee"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                              </td><td class="bg-warning">BP:</td>
                                   <td >        
                                <asp:TextBox ID="bp"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                     </td>
                                    <td class="bg-warning">wight/Kg:</td>
                                      <td>
                                       <asp:TextBox ID="kg"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td><td class="bg-warning">
                                           Temp:
                                      </td>
                                      <td >
                                <asp:TextBox ID="temptxt"  cssClass="form-control bg-primary" runat="server" Width="100%"></asp:TextBox>
                                 </td><td class="bg-warning">
                                           Respiration: 
                                     </td><td>
                                   <asp:TextBox ID="rep"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td> 
                                     <td class="bg-warning">
                                           Serum creatinine: 
                                     </td><td colspan="2">
                                   <asp:TextBox ID="bp2"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td>
                                          </tr>
                                  <tr>
                                     <td class="bg-success">Diabetes:</td> 
                                     
                                       <td> <asp:TextBox ID="diab"  cssClass="form-control" runat="server"></asp:TextBox>
                                    </td>
                                      <td class="bg-success">pregnancy Test:</td> 
                                      <td> <asp:TextBox ID="preg"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>
                                      <td class="bg-success">hepatitis:</td>
                                      <td> <asp:TextBox ID="hep"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>
                                        <td class="bg-success">Asthma:</td>
                                      <td> <asp:TextBox ID="asthmatxt"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td> <td class="bg-success">Cardiac:</td>
                                      <td> <asp:TextBox ID="diactxt"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>
                                      
                                 </tr>
                                        <tr  ><td colspan="12">
                                             <asp:Button runat="server" ID="Button1" style="width:10% ;height:40px;margin-bottom:2px;margin-top:2px;border:1px solid blue;color:darkblue;text-align:center;margin-left:50%" OnClick="Button1_Click" Text="save" CssClass="btn btn-default pull-left" />
                             
                                            </td></tr>
                                
                  </table>
                                </div>           
                      <div class=" col-md-6 col-sm-12 pull-right" style="height:auto" >
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                       <h3 class="profile-username alert-info fa-2x" style="text-align:center">بيانات المريض :
                             </h3>
                           <ul class=" list-group-unbordered" style="padding-right:0px">

                                <li class="list-group-item">
                              <b>كود المريض</b> <a class="pull-left"><%=pat.id %></a>
                            </li>

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



                              <div class=" col-md-6 col-sm-12 " style="height:auto" >
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                       <h3 class="profile-username alert-info fa-2x " style="text-align:center">بيانات الأشعة والتحاليل  :
                             </h3>
                           <ul class=" list-group-unbordered" style="padding-right:0px">

                        
                            
                                   <li class="list-group-item">
                              <b>ملف الاشعه </b> <a class="pull-left" href="../rad/radProfile.aspx?p_id=<%=pat.id %>"><i class="fa fa-2x fa-arrow-circle-o-left text-info"></i></a>
                            </li>
                                   <li class="list-group-item">
                              <b>ملف التحاليل </b> <a class="pull-left"href="../lab/labprofile.aspx?p_id=<%=pat.id %>"><i class="fa fa-2x fa-arrow-circle-o-left text-danger"></i></a>
                            </li>
                            <li class="list-group-item">
                              <b>أضافة عملية </b> <a class="pull-left"href="../reception/SurgeryResrv.aspx?p_id=<%=pat.id %>"><i class="fa fa-2x fa-heartbeat text-warning"></i></a>
                            </li>
                           <%-- <li class="list-group-item">
                              <b> تقرير خروج </b> <a class="pull-left"href="../reception/outReport.aspx?p_id=<%=pat.id %>"><i class="fa fa-2x fa fa-outdent text-primary"></i></a>
                            </li>--%>
                              </ul>
                                </div>
                            </div>
                         </div>
                                </div>         
                    
                </div>

  <div class="wrap">
   <input type="text" name="table_search" id="search3" class=" pull-right" onkeyup="myFunction3()" placeholder="بحث برقم الزيارة  .."  style="width:30%;height:20%">
     <table class="table table-bordered" id="mytable">
                  <% 
                      DateTime d = DateTime.Now.Date;
                      // p = db.patient.FirstOrDefault(a => a.id == x);
                      int id = pat.id;
                      //int specid = int.Parse(Session["Spectialid"].ToString());
                      var lab = (from patRec in db.clinic_reception where patRec.patient_id == id select patRec).ToList();
                //      var sur = (from patRec in db.patient_history where patRec.p_id == id  && patRec.service_name=="عمليات "  select patRec).ToList();
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
                  <th></th>
                  
                </tr>
                  <% foreach (var item in lab)
    {
        DateTime f = DateTime.Now;
        string dd = Convert.ToDateTime(item.date).ToString("yyyy/MM/dd");


                          %> 
                      
                <tr>
                 
                 <td><% Response.Write(item.id); %></td>
             
                  <td><% if (item.status == true)
                          {
                         %>انتهت<%
                                    }
                                    else
                                    { %>لم تنتهي <%} %>

                  </td>  
                 <td><% Response.Write(Convert.ToDateTime(item.date).Day + "/" + Convert.ToDateTime(item.date).Month + "/" + Convert.ToDateTime(item.date).Year); %></td>
                 <td><% Response.Write(item.user_name); %></td>
                  <td><% Response.Write(item.type); %></td>
                    <td><% Response.Write(item.price); %></td>
                  <td><a  href="visitDetails.aspx?Recid=<%=item.id %>&&patid=<%=item.patient_id %>">  <i class="fa  fa-arrow-circle-o-right text-blue"></i></a></td>
                   <%--<td><a  href='session_medicines.aspx?sess_id=<%=item.id %>'>  <i class="fa  fa-medkit text-blue"></i></a></td>--%>
                 
                    <td><a  href='patprofile.aspx?patid=<%=item.patient_id %>&&delRec=<%=item.id %>'><i class="fa  fa-trash-o text-red"></i></a></td>
                     
                  </tr>
                    <%  }
                        }%>
               
              </table>
            </div>
  
                    <hr />
                    <h2 class="text-center" >عمليات</h2>
                      <div class="wrap">
   <input type="text" name="table_search" id="search" class=" pull-right" onkeyup="myFunction()" placeholder="بحث  باسم الجراح  .."  >
     <div class="table table-responsive">
           <table class="table table-bordered" id="mytable2" style="overflow-x:auto">
                  <%  int patid = pat.id;
                      int i = 1;
                      var labb = (from patRec in db.Surgery_history where patRec.p_id == patid select patRec).ToList();
                      if (labb != null)
                      {
                       %>
                <tr>
                  <th>#</th>
                   <th>اسم الجراح</th>
                  <th>التاريخ </th>
                  
                 <th> اسم الممرض</th>
                 <th> اسم المساعد</th>
                 <th> operation description </th>
                 <th> surgery type</th>
                 <th> Anaesthesia</th>
                 <th> period</th>
                 <th> other</th>
                    <th colspan="7">
                        sites
                       
                    </th>
                    
                 <th > Treatment and instruction</th>
                 <th> previous operation</th>
                 
                 <th> Drains</th> 
                 <th> Tubes</th> 
                    <th> Stitches</th> 
                 <th> Dressing</th> 
                    <th> Stints</th> 
                 <th> Catheter</th> 
                    <th> Prosthetic limbs</th> 
                 <th> other investigation</th>     
                 <th></th>
                  
                </tr>
                  <% foreach (var item in labb)
    {
            %> 
                      
                <tr>
                 <td><%=i %></td>
                 <td><% Response.Write(item.surgeon_name); %></td>
             
                 <td><%=item.date %></td>
                  <td><% Response.Write(item.Nursery_name); %></td>
                 <td><% Response.Write(item.assistant_name); %></td>
                    <td><% Response.Write(item.operation_description); %></td>
                    <td><% Response.Write(item.TypeSurg); %></td>
                    <td><% Response.Write(item.Anaestusia); %></td>
                    <td><% Response.Write(item.period); %></td>
                    <td><% Response.Write(item.otherSurg); %></td>
                    
                    <td colspan="7">
                        <table class="table table-bordered table-responsive ti">
                           <tr class="bg-primary">
                               <th colspan="2">Kidney</th>
                                <th colspan="2">Ureter
                                   
                                </th>
                                <th colspan="2">Bladder
                                    
                                </th>
                                <th colspan="2">penile
                                   
                                </th>
                                <th colspan="2">Testis
                                    
                                </th>
                                <th colspan="2">Scrotum
                                    
                                </th>
                                <th colspan="2">Perimeal
                                    
                                </th>
                               <th>Others
                                    
                                </th>
                           </tr>
                            <tr class="bg-danger">
                               <%for(int yi =0;yi<7;yi++) { %>
                               <td class="gly">RT</td>
                               <td class="gly">LT</td>
                               <%} %>
                           </tr>
                             <tr>
                                <%var sitetd = (from b in db.sites where b.surg_id == item.id select b).FirstOrDefault();
                                    if (sitetd != null)
                                    {%>
                                <td>
                                <%
    if (sitetd.kindlyRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.kindlylt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                                                  <td>
                                <%
    if (sitetd.UreterRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.Ureterlt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                                                  <td>
                                <%
    if (sitetd.BlodderRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.Blodderlt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                  <td>
                                <%
    if (sitetd.PeuileRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.Peuilelt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                                                  <td>
                                <%
    if (sitetd.TestisRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.TestisRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                  <td>
                                <%
    if (sitetd.scroumRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.scroumLt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>


                                                  <td>
                                <%
    if (sitetd.peqRt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>
                                <td>
                                <%
    if (sitetd.preLt == true)
    {%>
                                <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                    <%} %>
                                </td>

                              <th rowspan="2"><%=sitetd.others %></th>
                                <%} %>

                            </tr>
                        </table>
                    </td>
                  
                    <td ><% Response.Write(item.trent); %></td>
                    <td><% Response.Write(item.previous_opeation); %></td>
                    <td><% Response.Write(item.Drauis); %></td>
                     <td><% Response.Write(item.Tubes); %></td>
                     <td><% Response.Write(item.stitches); %></td>
                     <td><% Response.Write(item.Dressuis); %></td>
                     <td><% Response.Write(item.stuits); %></td>
                     <td><% Response.Write(item.cathers); %></td>
                     <td><% Response.Write(item.Prosthetic); %></td>
                     <td><% Response.Write(item.other_instruction); %></td>
                  <td><a  href="patprofile.aspx?removes=<%=item.id %>&&patid=<%=item.p_id %>">  <i class="fa  fa-remove text-danger"></i></a></td>
                  
                  </tr>
                    <% i++; }
                        }%>
               
              </table>
            </div>
       <br />
                           </div>
                </div>
      <%} %>
                 </div>
      <%} %>  </div>
    
               <script>

        function myFunction3() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search3");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function myFunction() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable2");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    </asp:content>


