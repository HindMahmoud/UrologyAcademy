<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="outReport.aspx.cs" Inherits="EccoHospital.reception.outReport" %>
<!DOCTYPE html>
<html lang="ar">
<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hospital</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/icon.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/ar.css" rel="stylesheet" class="lang_css arabic">
     <link rel="stylesheet" href="../dist/fonts/fonts-fa.css">
    <link rel="stylesheet" href="../dist/css/1.css">
    <link rel="stylesheet" href="../dist/css/2.css">
    <script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>

    <link href="../plugins/select2/select2.min.css" rel="stylesheet" />

      <style>
          tr {
              text-align: center;
          }

          td {
              text-align: center;
          }

          th {
              text-align: center;
          }
          .table > tbody > tr > td {
          padding:0}
          .table > tfoot > tr > th {
          vertical-align:inherit}
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
    margin-bottom:3px
        }
       .headers {text-align:left;color:darkblue
        }
       
        .form-control1 {
           /* display: block; */
    /* width: 100%; */
    height: 24px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
          ul label.r {
          margin-left:2px;font-size:12px;
          text-align:right;

          }
          ul {
          text-align:right
          }
        .bg-Navy .form-control{background-color:azure;color:black
        }
        .ull2 {
        list-style-type:none;padding-left: 3px;padding-top:5px;}
            .ull2 li {
            margin:7px}
        #ul1 {
        float:right}
        #complain {font-size:18px
        }
            #complain  {
           font-size:14px;padding-left:40px;width:95% }
       
        .d1 {
        padding-left:40px;
        }

        #report1 {
       
        }
     .textarea1{
          height:130px;
              display: block;
    width: 100%;
   
    padding: 6px 12px;
    font-size: 12px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
      }
          .cont {
          
          padding-right:125px;padding-left:125px
          }
          .noborder td{
              border:none;
          }
          .tdd {
         width: 30%}
          table#RadioButtonList1 {
          float:left
          }
          .mainul {
          text-align:left;direction:ltr}
          .mainul ul{text-align:left;direction:ltr}
      </style>
    
</head>   

 <body>
     <form id="foru" runat="server">
    <div class="container-fluid cont" dir="rtl">
        <%-- <h6 class="heading_title1">تقرير خروج</h6>--%>
                    
    
         <div>
                    <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                        if (!String.IsNullOrEmpty(Request.QueryString["p_id"]) )
                        {
                            int code = int.Parse(Request.QueryString["p_id"].ToString());
                            int c=int.Parse(Request.QueryString["clinicRec"].ToString());
                            var pat = (from v in db.patient join f in db.clinic_reception on v.id equals f.patient_id where v.id == code && f.id==c select new { v ,f}).FirstOrDefault();
                            if (pat != null)
                            {%> 
              
                 <table class="table">
                      <tr>
                        <td>
                             <img src="../img/academy.png" width="20%" height="70px" class="pull-right" style="text-align:left"/>
                        </td>
                            <td>
                            <br />
                         <asp:Button  runat="server" id="print" Text="Print" class="btn btn-lg btn-primary pull-left" OnClick="print_Click"/>
                      </td>

                        </tr>

                 </table>
              
        <table class="table table-borderless" style="border:none">
             
             <tr class="noborder">
                  
                   <td>
                     <ul style="list-style-type:none">
                                    <li> <label class="r">رقم التقرير  </label><label><%if (db.out_report.Any()) { var vp = (from n in db.out_report select n.id).Max(); Response.Write(vp); } else { Response.Write("1"); } %></label></li>
                                <li> <label class="r">تاريخ التقرير  </label><label><%=DateTime.Now %></label></li>
                               <li> <label class="r">   الرقم الطبي</label><label><%=pat.v.id %></label></li>
                               <li> <label class="r"> اسم المريض</label><label><%=pat.v.name %></label></li>
                                <li><label class="r">سن المريض </label><label><%=pat.v.age %></label></li>
                                <li><label class="r"> نوع المريض</label><label><%=pat.v.gender %></label></li>
                                </ul>

                   </td>
                   
                       <td colspan="5"> <asp:Label runat="server" ID="complaintxt"></asp:Label> <label style="color:crimson">:Complaint</label>
                           <br />
                           <ul class="mainul">
                                   <%var r = (from m in db.clinic_reception where m.id == c select m).FirstOrDefault();
                                       if (r.UUTS == true) { %>
                                       <li>:UUTS<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                     <ul>  <%var uutvar = (from n in db.UTS where n.Rec_id == r.id select n).FirstOrDefault();
                                           if (uutvar != null)
                                           {
                                               if (uutvar.Mass == true) { %>
                                                <li>Mass:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                           <%}
                                               if (uutvar.pain == true) {%>
                           <li>Pain:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                          
                           <% }
                                               if (uutvar.Heuiaturia == true) {%>
                            <li>Haematuria:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                          
                           <% }
                                              %>
                           <li class="txt">Other: <aspn><%=uutvar.txt %></aspn></li>
                           <%
                                           }
                                            %>
                            </ul>
                                         </li>
                                   <%}

 //--------------------------------------------voidus region-----------------
                                       if (r.voidus == true) { %>
                                        <li>voiding :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                              <ul>
                                  <%var voidvar = (from vv in db.Voidues where vv.Rec_id == r.id select vv).FirstOrDefault();
                                      if (voidvar != null) {
                                          if (voidvar.stream == true) { %>
                                  <li>Stream :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                   <%var streamoptions = (from b in db.Stream_options where b.StreamId == voidvar.id select b).FirstOrDefault();
                                       if (streamoptions != null) {
                                           %><ul><%
                                           if (streamoptions.slow == true) { %>
                                                <li>Slow :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                  <%}
                                               if (streamoptions.Splithlis == true) {%><li>Splitting spraying :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><% }
                                               if (streamoptions.liten_mitteut == true) { %><li>Intekmittent :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%}
                                           }%></ul><% }%></li><%
                                       if (voidvar.Hesitoucy == true) { %>
                                  <li>Hesitancy :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                  <%}
                                          if (voidvar.Strauius == true) {%>
                                   <li>Straining : <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                 
                                  <% }
                                          if (voidvar.Tesmul_drippluis == true) {%>
                                  <li>Post micturation drippling : <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                  <% }
                                      } %>
                              </ul>
                               <%}
//---------------------------------------------End voidus----------------------------
//----------------------------------------------LUTS region------------------
                                   if (r.LUTS == true) {
                                       var lutsvar = (from bb in db.LUTS where bb.rec_id == r.id select bb).FirstOrDefault();
                                       if (lutsvar != null)
                                       {%><li>LUTS:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                           <ul><%
                                           if (lutsvar.Frequercy == true) {%>
                                               <li>Frequancy:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                               <% }
                                           if (lutsvar.No_Cuturia == true) { %>
                                               <li>No cturia:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                               <%}
                                           if (lutsvar.Urgucy == true) {%>
                                               <li>Urgency:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                               <% }
                                           if (lutsvar.Lu_contineuce == true) { %>
                                               <li>Incontinence:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                   <ul>
                                                   <%if (lutsvar.Stress == true) {%>
                                                   <li>Stress:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                                   <% }
                                                       if (lutsvar.Lugluge == true) {%>
                                                       <li>Urgency :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                                       <% }
                                                       if (lutsvar.True == true) { %>
                                                       <li>True:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                                       <%} %>
                                                   </ul>
                                               </li>
                                              
                                               <%}%>
                                                    
                                         <li>
                                           Other:<span><%=lutsvar.txt %></span>  
                                           
                                               </li>
                                             <%  }
                                       %>
                                           </ul></li>
                                          <% }
                                              //--------------------------------------------End luts----------------------------
                                              if (r.others == true) {
                                                  var othervar = (from bb in db.others where bb.Rec_id == r.id select bb).FirstOrDefault();
                                                  if (othervar != null)
                                                  { %><li>Others:<ul>
                                                     <%if (othervar.pain == true)
                                                             { %><li>Pain<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.Feuer == true)
                                                             { %><li>Feuer<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.Uruil_change == true)
                                                             { %><li>Urine color chage<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.Dischosage == true)
                                                             { %><li>Discharge<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.Fistula == true)
                                                             { %><li>Fistula<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.shinus == true)
                                                             { %><li>Sinus<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                     <%if (othervar.aual_pain == true)
                                                             { %><li>Anal pain<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                      <li>
                                                          others:<span><%=othervar.othertxt %></span>
                                                      </li>
                                                   </ul>
                                                      </li>
                                            <%}
                                                }
                                                if (r.cong == true) {
                                                    var congvar = (from vv in db.cong_Anthio where vv.Rec_id == r.id select vv).FirstOrDefault();
                                                    if (congvar != null)
                                                    {  %>
                                            <li>congenital Anomalies:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                            <ul>
                                               <%if (congvar.UUT == true)
                                                       { %><li>UUT cons Anomalies
                                                  </li> <%} %>
                                               
                                                <%if (congvar.LUT == true)
                                                        { %><li>LUT cons Anomalies<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                   </li> <%} %>
                                                
                                                <%if (congvar.Hypospodias == true)
                                                        {%><li>Hypospadias<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                  </li>  <%} %>
                                                
                                                <%if (congvar.Epispadias == true)
                                                        { %><li>Epispadias<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                   </li> <%} %>
                                                
                                                <%if (congvar.undescTesties == true)
                                                        { %><li>Undesended Testis<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                  </li>  <%} %>
                                                
                                               <li>
                                                    Others:<span><%=congvar.others %></span>
                                                </li>
                                            </ul>
                                            </li><%}

                                                }
                                                //-------------------------------------------------------------ED region------------  
                                                if (r.ED == true) {%>
                              <li>Erectyl Dysfuuction :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                               <%
                                           var ty=(from nn in db.ED where nn.Rec_id==r.id select nn).FirstOrDefault();
                                          if(ty!=null)
                                           {
                                          %>
                                  <ul>
                                      <li class="txt">EDISSCORE:<span><%=ty.EDISS %></span></li>
                                  </ul>
                                  <%
                                           }
                                %></li><%}
                                           //------------------------------------------------------------End ED------------------------
                                           //-----------------------------------------Emerg region----------------------------------------
                                           if (r.Emergency == true) {
                                               var emergvar = (from nv in db.Emagercy where nv.Rec_id == r.id select nv).FirstOrDefault();
                                               if (emergvar != null)
                                               { %>
                                          
                                             <li >Emergency:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                             <ul>
                                                <%if (emergvar.Ret == true)
    { %><li>Retention
                                                  <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                                 <%} %>
                                                
                                                <%if (emergvar.anuria == true)
    { %><li>Anuria
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
        </li><%} %>
                                                
                                                <%if (emergvar.uiy_Hydronc == true)
    { %><li>Infected Hydronephrosis
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li>
                                                 <%} %>
                                                
                                                <%if (emergvar.Ueeuia == true)
    { %><li>Uremia
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i></li><%} %>
                                                
                                                <%if (emergvar.pria_pism == true)
    { %><li>Priapism
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i> </li><%} %>
                                               
                                                <%if (emergvar.Torsion == true)
    { %><li>Torsion
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                               </li> <%} %>
                                                
                                                <%if (emergvar.inFlection == true)
    { %><li>Infection
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                   </li>  <%} %>
                                               
                                                <%if (emergvar.Trauua == true)
    { %><li>Trauma
                                                    <i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                  </li>  <%} %>
                                                
                                                 <li class="txt">
                                                     Other:<span><%=emergvar.other %></span>
                                                 </li>
                                            </ul>
                                          </li>
                                            <%}
    }
    //---------------------------------------------End Emergy-------------------------------------
    if (r.post_mi == true)
    {
        var postvar = (from vy in db.post_micturation where vy.Rec_id == r.id select vy).FirstOrDefault();  %>
                                           <%if (postvar != null)
    { %> <li>Post micturation :<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                            <ul>
                                                <%if (postvar.Feeling_uicomplete_En == true)
    { %><li>Feeling of incomplete empting:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                               </li>
                                                <%} %>
                                                <%if (postvar.post_micturation_drippliz == true)
    { %><li>Post Micturation drippling:<i class="fa fa-check" style="color:darkblue" aria-hidden="true"></i>
                                                           </li>
                                                    <%} %> 
                                                <li>
                                                    Other:<span><% %></span>
                                                </li>
                                            </ul>
                                            </li><%
        }
    }

                                        %>
                               </li>
                              
                </td>
                 
               </tr> 
     
       

       <tr class="noborder"> 
    
                   
                    <td>تاريخ الوصول : <asp:Label runat="server" ID="datelabl" ></asp:Label></td>      
           <td style="float:left">الحالة عند الوصول :
                    <asp:RadioButtonList  ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server"  >
                                <asp:ListItem Value="r1">كشف</asp:ListItem>
                                <asp:ListItem Value="r2">طوارئ</asp:ListItem>
                                <asp:ListItem Value="r3">حوادث  </asp:ListItem>
                            </asp:RadioButtonList> 
                    <br />           
                         <asp:Label runat="server" ID="typee" Visible="false"></asp:Label>
                               
                </td>           
            </tr>
          
             <tr  >
               <th rowspan="4">
                    <img src="../img/operation.jpg" width="50%" height="200" style="float:right"  />
               </th>
               <%-- <div class="col-md-6" dir="ltr">--%>
              </tr>
            <tr>
             <td class="tdd">
                  medical History:
                  <asp:TextBox ID="medtxt" TextMode="MultiLine"  cssClass="textarea1" runat="server" MaxLength="7" Rows="7"></asp:TextBox>
                 
              </td>
                 <td class="tdd">
                  physical Finding:
                  <asp:TextBox ID="physicaltxt" TextMode="MultiLine" cssClass="textarea1" runat="server" ></asp:TextBox>
                 
              </td>
              </tr>
           <tr>
                  <td class="tdd">
                  Operation:<br />
                  <asp:TextBox runat="server" ID="operation" TextMode="MultiLine" CssClass="textarea1"></asp:TextBox>
               </td>
              <td class="tdd">
                  Tubes and Instractions:<asp:TextBox ID="notetxt" runat="server" TextMode="MultiLine" CssClass="textarea1"></asp:TextBox>
              </td>
          </tr>
            <tr></tr>
         <tr ><td style="text-align:right;font-size:20px">previous operation: </td>
             <td>
                 <% var previous = (from patRec in db.Surgery_history where patRec.p_id == pat.v.id select patRec).ToList();
                     if (previous != null)
                     {foreach (var t in previous)
                         {
                             Response.Write(t.previous_opeation);

                         }

                     } %>
             </td>
         </tr>
          
          </table> 
            
             <div class="container-fluid">
                 <div class="row">
                     <div class="col-md-12">
                               <table class="text-center table-responsive bg-navey" border="1" dir="ltr" style="width:100%" >
                                  <tr><th colspan="12">Vital signst Cluial data :</th></tr>
                                 <tr><td class="bg-warning"> pulse:</td><td><label><%=pat.v.plus %></label></td>
                                     <%-- <td >
                                <asp:TextBox ID="plusee"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                              </td>--%><td class="bg-warning">BP:</td><td><label><%=pat.v.BR1 %></label></td>
                                  <%-- <td >        
                                <asp:TextBox ID="bp"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                     </td>--%>
                                    <td class="bg-warning">wight/Kg:</td><td><label><%=pat.v.weight %></label></td>
                                     <%-- <td>
                                       <asp:TextBox ID="kg"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td>--%>
                                     <td class="bg-warning">
                                           Temp:</td><td><label><%=pat.v.Temp %></label>
                                      </td>
                                    <%--  <td >
                                <asp:TextBox ID="temptxt"  cssClass="form-control bg-primary" runat="server" Width="100%"></asp:TextBox>
                                 </td>--%>
                                     <td class="bg-warning">
                                           Respiration: </td><td><label><%=pat.v.Respiral %></label>
                                     </td>
                                    <%-- <td>
                                   <asp:TextBox ID="rep"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td>--%> 
                                     <td class="bg-warning">
                                            Serum creatinine: </td><td><label><%=pat.v.BR2 %></label> 
                                     </td>
                                    <%-- <td colspan="2">
                                   <asp:TextBox ID="bp2"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                                  </td>--%>
                                          </tr>
                                  <tr>
                                     <td class="bg-success">Diabetes:</td><td><label><%=pat.v.Diabetes %></label></td> 
                                     
                                       <%--<td> <asp:TextBox ID="diab"  cssClass="form-control" runat="server"></asp:TextBox>
                                    </td>--%>
                                      <td class="bg-success">pregnancy Test:</td><td><label><%=pat.v.pregnancy %></label></td> 
                                      <%--<td> <asp:TextBox ID="preg"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>--%>
                                      <td class="bg-success">hepatitis:</td><td><label><%=pat.v.hepatitis %></label></td>
                                     <%-- <td> <asp:TextBox ID="hep"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>--%>
                                        <td class="bg-success">Asthma:</td><td><label><%=pat.v.Asthma %></label></td>
                                     <%-- <td> <asp:TextBox ID="asthmatxt"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>--%>
                                       <td class="bg-success">Cardiac:</td><td><label><%=pat.v.diac %></label></td>
                                     <%-- <td> <asp:TextBox ID="diactxt"  cssClass="form-control" runat="server" ></asp:TextBox>
                                  </td>--%>
                                      
                                 </tr>
                                       
                                
                  </table>
                     </div>
                 </div>
                 <br />
                 <br />
                 <div class="col-md-12">
  <div class="table table-responsive">
           <table class="table table-bordered " id="mytable2" style="overflow-x:auto">
                  <%  int patid = pat.v.id;
                      int i = 1;
                      var labb = (from patRec in db.Surgery_history where patRec.p_id == patid select patRec).ToList();
                      if (labb != null)
                      {
                       %>
              
               
                  <% foreach (var item in labb) { %>
                 <tr class="bg-danger">

                  <th>#</th>
                  
                  <th>التاريخ </th>
                  <th> period</th>
                    <th> surgery type</th>
                     <th> Anaesthesia</th>
                </tr>
  
           
                     
                <tr >
                 <td><%=i %></td>
                <td><%=item.date %></td>
                      <td><% Response.Write(item.period); %></td>
                     <td><% Response.Write(item.TypeSurg); %></td>
                    <td><% Response.Write(item.Anaestusia); %></td>
                  
                    </tr>
               <tr >


                 <th> operation description </th>
                 
                
                 
                 <th> other</th>
                    <th colspan="8">
                        sites
                       
                    </th>
                    
                  
                 
                  
                </tr>
               <tr>
                     <td><% Response.Write(item.operation_description); %></td>
                   
                    
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
                  
                  
                 
                  </tr>

               <tr class="alert-info" >
                    <th > Treatment and instruction</th>
                <%-- <th> previous operation</th>--%>
                 
                 <th> Drains</th> 
                 <th> Tubes</th> 
                    <th> Stitches</th> 
                 <th> Dressing</th> 
                    <th> Stints</th> 
                 <th> Catheter</th> 
                    <th> Prosthetic limbs</th> 
                 <th> other investigation</th>   
               </tr>

               <tr style="border-bottom:5px dashed  #000000 " >
                     <td ><% Response.Write(item.trent); %></td>
           
                    <td><% Response.Write(item.Drauis); %></td>
                     <td><% Response.Write(item.Tubes); %></td>
                     <td><% Response.Write(item.stitches); %></td>
                     <td><% Response.Write(item.Dressuis); %></td>
                     <td><% Response.Write(item.stuits); %></td>
                     <td><% Response.Write(item.cathers); %></td>
                     <td><% Response.Write(item.Prosthetic); %></td>
                     <td><% Response.Write(item.other_instruction); %></td>
               </tr>
                    <% i++; }
                        }%>
               
              </table>
            </div>                  </div>
             </div>
            </div>
                        <%
                                }
                            }%>  
               
          
<asp:Label CssClass="pull-right" runat="server">توقيع  الطبيب</asp:Label><br /> 
<asp:Label CssClass="pull-right" runat="server">..............................</asp:Label> 
                      
        </div>
</form>
     <script src="../js/bootstrap.min.js"></script>
    <script src="../js/js.js"></script>
    <script src="../plugins/select2/select2.full.min.js"></script>
        <script src="../plugins/select2/select2.min.js"></script>
        <script src="../plugins/select2/select2.full.min.js"></script>
        <script src="../plugins/select2/select2.min.js"></script>
      <script>
          function printing() {
              window.print();


          }
       
          $(function () {
              //Initialize Select2 Elements
              $(".select2").select2();

              //Datemask dd/mm/yyyy
              $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
              //Datemask2 mm/dd/yyyy
              $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
              //Money Euro
              $("[data-mask]").inputmask();

              //Date range picker
              $('#reservation').daterangepicker();
              //Date range picker with time picker
              $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
              //Date range as a button
              $('#daterange-btn').daterangepicker(
                  {
                      ranges: {
                          'Today': [moment(), moment()],
                          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                          'This Month': [moment().startOf('month'), moment().endOf('month')],
                          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                      },
                      startDate: moment().subtract(29, 'days'),
                      endDate: moment()
                  },
                  function (start, end) {
                      $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                  }
              );

              //Date picker
              $('#datepicker').datepicker({
                  autoclose: true
              });

              //iCheck for checkbox and radio inputs
              $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                  checkboxClass: 'icheckbox_minimal-blue',
                  radioClass: 'iradio_minimal-blue'
              });
              //Red color scheme for iCheck
              $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                  checkboxClass: 'icheckbox_minimal-red',
                  radioClass: 'iradio_minimal-red'
              });
              //Flat red color scheme for iCheck
              $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                  checkboxClass: 'icheckbox_flat-green',
                  radioClass: 'iradio_flat-green'
              });

              //Colorpicker
              $(".my-colorpicker1").colorpicker();
              //color picker with addon
              $(".my-colorpicker2").colorpicker();

              //Timepicker
              $(".timepicker").timepicker({
                  showInputs: false
              });
          });
</script>
 </body>
  </html>

   <%--<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    --%> 
      
 

