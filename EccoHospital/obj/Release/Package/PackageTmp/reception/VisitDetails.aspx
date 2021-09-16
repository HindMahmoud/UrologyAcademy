<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="VisitDetails.aspx.cs" Inherits="EccoHospital.External_Clinics.VisitDetails" %>


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
    margin-bottom:3px
        }
       .headers {text-align:left;color:darkblue
        }
        #complainch {
         
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
        #diag {
        border-color:chartreuse;color:darkred}
        .d1 {
        padding-left:40px;
        }

  
    </style>
 
  
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
     <div class="main_content_container" style="direction:ltr">
         <%--<div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="#" class="alert-link">حسناً</a> . </div>--%>
                  
                      
         <div class="main_container  main_menu_open" style="padding-right:3px;padding-left:3px">
                    <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                        if (!String.IsNullOrEmpty(Request.QueryString["patid"])&&!String.IsNullOrEmpty(Request.QueryString["Recid"]))

                        {
                            int code = int.Parse(Request.QueryString["patid"].ToString());
                            int detail=int.Parse(Request.QueryString["Recid"].ToString());

                            var pat = (from v in db.patient_history where v.p_id == code&&v.details_id==detail select new { v, v.details_id }).FirstOrDefault();
                            if (pat != null){%> 
        
             <br />
             <br />
              <a href="patprofile.aspx?patid=<%=pat.v.p_id %>" style="margin-left:20px;padding:1px" class="pull-left alert-info fa-2x"> Back to profile  <i class="fa  fa-arrow-circle-o-left text-blue"></i></a>
             <br />
             <br />
       <%} %>
                <div class="page_content">
                    <br />
                  <%--  <p>تفاصيل زيارة للمريض <%=pat.v.p_name %></p>--%>
                   <div class="row box box-primary" > 
     <br />
        <div class="col-md-12"  id="complain"> Complaint&Duaration:
            <br/>
              <asp:CheckBox ToolTip="select" Text="UUTS" ID="compch1" OnCheckedChanged="compch1_CheckedChanged" runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="LUTS" ID="compch2" OnCheckedChanged="compch2_CheckedChanged" runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="ED" ID="compch3"  runat="server" OnCheckedChanged="compch3_CheckedChanged"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select"  Text="Emergency" ID="compch4" OnCheckedChanged="compch4_CheckedChanged" runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="others" ID="compch5" OnCheckedChanged="compch5_CheckedChanged" runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="Congenital Anomalies" OnCheckedChanged="compch6_CheckedChanged" ID="compch6"  runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="Voiding symptom" ID="compch7" OnCheckedChanged="compch7_CheckedChanged" runat="server"  >
              </asp:CheckBox>
            <asp:CheckBox ToolTip="select" Text="Post micturation" ID="compch8" OnCheckedChanged="compch8_CheckedChanged"  runat="server"  >
              </asp:CheckBox>
           
<%--             <asp:ListItem Value="UUTS">UUTS</asp:ListItem>
             <asp:ListItem Value="LUTS">LUTS</asp:ListItem>
             <asp:ListItem Value="ED"> ED</asp:ListItem>
             <asp:ListItem Value="Emergency">Emergency</asp:ListItem>
             <asp:ListItem Value="others">others</asp:ListItem>
             <asp:ListItem Value="cong"> cong</asp:ListItem>--%>
                
         </div>
         <div class="col-md-12 d1" >
                     complaint text:
                     <asp:TextBox ID="diag" TextMode="MultiLine" style="border-color:crimson" CssClass="form-control" runat="server"></asp:TextBox>
              <br />
           </div>
                    
         
             
          </div>
               
                    <br/>

                   <%--<asp:Button OnClick="btn_Click" ID="btn" CssClass="btn btn-primary" runat="server" Text="Save" />--%>
    <%--<asp:Button OnClick="print_Click" ID="print" OnClientClick="target ='_blank';" CssClass="btn bg-aqua-gradient fa-print " runat="server" Text="print" />
    <asp:Button OnClick="fin_Click" ID="fin" CssClass="btn bg-lime-active pull-left" runat="server" Text="Finish" />--%>
 <div class="wrap">
        <div runat="server" visible="false" id="Div2"  role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                      <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" ID="cancel"  >لا</asp:LinkButton>
                    </div>

              <div class="col-md-12" id="UUTS" >
                  <h3 class="headers">UUTS </h3>
                  <div class="col-md-4">
                      <br />
                      <asp:CheckBox ID="uch1" CssClass="form-control1" Text="Mass" runat="server" />
                      <asp:CheckBox ID="uch2" CssClass="form-control1" Text="Pain" runat="server" />
                      <asp:CheckBox ID="uch3" CssClass="form-control1" Text="Haematuria" runat="server" />
                  </div>

                  <div class="col-md-12">
                      other:
                  <asp:TextBox ID="utxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>
     
      <div class="col-md-12" id="LUTS" >
                  <h3 class="headers" >LUTS </h3>
                  <div class="col-md-6">
                    <br /> 

                   <asp:CheckBox ID="lch1" CssClass="form-control1" Text="Frequancy" runat="server" />
                           
                      <asp:CheckBox ID="lch2" CssClass="form-control1" Text="No cturia" runat="server" />
                           
                      <asp:CheckBox ID="lch3" CssClass="form-control1" Text="Urgency" runat="server" />
                         <asp:CheckBox ID="lch4"  CssClass="form-control1"  AutoPostBack="false" Text="Incontinence" runat="server" OnCheckedChanged="lch4_CheckedChanged" />
                       
                       
                        <div ID="ul1">
                           <asp:RadioButtonList  ID="RadioButtonList1"  runat="server" Width="130px" >
                                <asp:ListItem Value="r1">stress</asp:ListItem>
                                <asp:ListItem Value="r2">Urgency</asp:ListItem>
                                <asp:ListItem Value="r3">True  </asp:ListItem>
                            </asp:RadioButtonList>            
                           
                          </div>
                      </div>
                 
          <div class="col-md-6" runat="server">
                      other:
                  <asp:TextBox ID="Luttxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
          </div>
     <div class="col-md-12" id="v" >
           <h3 class="headers">voiding  </h3>
                  <div class="col-md-7">
                    <br />
                     <asp:CheckBox ID="vch1" CssClass="form-control1" Text="Stream" runat="server" />
                             
                      <asp:CheckBox ID="vch2" CssClass="form-control1" Text="Hesitancy" runat="server" />
                     <asp:CheckBox ID="vch3" CssClass="form-control1" Text="Straining" runat="server" />
                       <asp:CheckBox ID="vch4" CssClass="form-control1" Text="Post micturation drippling" runat="server" />
                       <br /> 
                      
                        <ul class="ull2"><li>
                       
                         <asp:CheckBox ID="vsch1" CssClass="form-control1" Text="Slow" runat="server" />
                         </li>
                            <li>   
                      <asp:CheckBox ID="vsch3" CssClass="form-control1" Text="Splitting spraying" runat="server" />
                         </li>
                            <li>  
                      <asp:CheckBox ID="vsch4" CssClass="form-control1" Text="Intekmittent" runat="server" />
                       </li> 
                       </ul> 
                           
                  </div>
                  
                  <div class="col-md-5">
                      other:
                  <asp:TextBox ID="TextBox1" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
          </div>

      <div class="col-md-12" id="post" >
                  <h3 class="headers">Post micturation  </h3>
                  <div class="col-md-6">
                      <br />
                      <asp:CheckBox ID="pch1" CssClass="form-control1" Text="Feeling of incomplete empting" runat="server" />
                      <asp:CheckBox ID="pch2" CssClass="form-control1" Text="Post Micturation drippling" runat="server" />
                     
                  </div>

                  <div class="col-md-6">
                      other:
                  <asp:TextBox ID="posttxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>
      

     <div class="col-md-12" id="others" >
                  <h3 class="headers">others: </h3>
                  <div class="col-md-12">
                      
                      <asp:CheckBox ID="och1" CssClass="form-control1" Text="Pain (Dysuria)" runat="server" />
                      <asp:CheckBox ID="och2" CssClass="form-control1" Text="Feuer" runat="server" />
                      <asp:CheckBox ID="och3" CssClass="form-control1" Text="Urine color chage" runat="server" />
                       <asp:CheckBox ID="och4" CssClass="form-control1" Text="Discharge" runat="server" />
                       <asp:CheckBox ID="och5" CssClass="form-control1" Text="Fistula" runat="server" />
                       <asp:CheckBox ID="och6" CssClass="form-control1" Text="Sinus" runat="server" />
                        <asp:CheckBox ID="och7" CssClass="form-control1" Text="Anal pain" runat="server" />
                  </div>

                  <br />
                  <div class="col-md-12">
                      other:
                  <asp:TextBox ID="otxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>

     <div class="col-md-12" id="em" >
                  <h3 class="headers">Emergency: </h3>
                  <div class="col-md-12">
                      <asp:CheckBox ID="emch1" CssClass="form-control1" Text="Retention" runat="server" />
                      <asp:CheckBox ID="emch2" CssClass="form-control1" Text="Anuria" runat="server" />
                      <asp:CheckBox ID="emch3" CssClass="form-control1" Text="Infected Hydronephrosis" runat="server" />
                       <asp:CheckBox ID="emch4" CssClass="form-control1" Text="Uremia" runat="server" />
                       <asp:CheckBox ID="emch5" CssClass="form-control1" Text="Priapism" runat="server" />
                       <asp:CheckBox ID="emch6" CssClass="form-control1" Text="Torsion" runat="server" />
                        <asp:CheckBox ID="emch7" CssClass="form-control1" Text="Infection" runat="server" />
                       <asp:CheckBox ID="emch8" CssClass="form-control1" Text="Trauma" runat="server" />
                  </div>

                  <br />
                  <div class="col-md-12">
                      other:
                  <asp:TextBox ID="emtxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>
     
            <div class="col-md-12" id="ed" >
                  <h3 class="headers">Erectyl Dysfuuction: </h3>
                 
                  <div class="col-md-12">
                      EDISSCORE:
                  <asp:TextBox ID="Ertxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>          
     
          <div class="col-md-12" id="cong" >
                  <h3 class="headers">congenital Anomalies: </h3>
                  <div class="col-md-12">
                    
                      <asp:CheckBox ID="conch1" CssClass="form-control1" Text="UUT cons Anomalies " runat="server" />
                      <asp:CheckBox ID="conch2" CssClass="form-control1" Text="LUT cons Anomalies" runat="server" />
                      <asp:CheckBox ID="conch3" CssClass="form-control1" Text="Hypospadias" runat="server" />
                   
                       <asp:CheckBox ID="conch4" CssClass="form-control1" Text="Epispadias" runat="server" />
                       <asp:CheckBox ID="conch5" CssClass="form-control1" Text="Undesended Testis " runat="server" />
                       <%--<asp:CheckBox ID="conch6" CssClass="form-control1" Text="OherIs" runat="server" />
                 --%>
                  </div>

                  <div class="col-md-12">
                      other:
                  <asp:TextBox ID="contxt" TextMode="MultiLine" cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   </div>
                     
              </div>
           <div class="col-md-12" style="text-align:left">
                                        <br />
                                        <asp:Button ID="Button1" ValidationGroup="a"  OnClick="btnSave_Click"  CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                        <br />
                       </div>
     <hr style="height:1px;color:darkslateblue;width:100%"/>
     <div class="col-md-12">
                  <h3 class="headers">Examination </h3>
                
                  <br />
                  <div class="col-md-12" style="border-radius:13px;border:1px solid gray;padding:3px">
                     <div class="col-md-6">
                       General:
                  <asp:TextBox ID="eetxt1"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Kideny:
                  <asp:TextBox ID="eetxt2"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Ureter:
                  <asp:TextBox ID="eetxt3"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Bladder:
                  <asp:TextBox ID="eetxt4"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Penis:
                  <asp:TextBox ID="eetxt5"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                       EUM:
                  <asp:TextBox ID="eetxt6"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                      </div>
                      <div class="col-md-6">
                           Perineum:
                  <asp:TextBox ID="eetxt7"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Scrotum:
                  <asp:TextBox ID="eetxt8"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                        Urethra:
                  <asp:TextBox ID="eetxt9"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                           P/R:
                  <asp:TextBox ID="eetxt10"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                   Prostate:
                  <asp:TextBox ID="eetxt11"  cssClass="form-control" runat="server" Width="100%"></asp:TextBox>
                 </div>
                       </div>
                       <div class="col-md-6" style="text-align:left;padding-bottom:15px">
                                        <br />
                                        <asp:Button ID="Button2" ValidationGroup="a"  CssClass="btn btn-warning" runat="server" Text=" Save  " OnClick="Button2_Click" /><br />
                                        <br />
                           
                       </div>
         <div class="col-md-6 pull-right" style="text-align:right;margin-bottom:4%">
          <br />
            <i class="fa fa-2x fa fa-outdent text-primary"></i> <asp:Button ID="LinkButton" OnClick="LinkButton1_Click"   CssClass="pull-right btn btn-default" Text="finish" style="font-family:'Comic Sans MS';font-size:16px;color:black;"  runat="server"/>

              <%-- <a class="pull-right btn btn-default" ID="alink" runat="server" href="../reception/outReport.aspx?p_id=<%=pat.v.p_id %>"><i class="fa fa-2x fa fa-outdent text-primary"></i><label style="font-family:'Comic Sans MS';font-size:18px;color:black;"> Finish </label> </a>
          --%>
              <br />
              </div>
          <br /><br />
              </div>
              
            </div>
                        <%
                            } %>  
               </div>
                </div>
      
         </div>
  

     <script>
      
         $('#lmp').daterangepicker({
               "singleDatePicker": true,
               
               "locale": {
                   "format": "DD/MM/YYYY"

               }
           });
      
</script> 
   <script src="1.js"></script>
    <script src="2.js"></script>
 <script type="text/javascript">
       $(document).ready(function () {
          
           var chkControl = document.getElementById('<%= lch4.ClientID %>');
           var chkControl2 = document.getElementById('<%= vch1.ClientID %>');
            var chuuts = document.getElementById('<%= compch1.ClientID %>');
           var chluts = document.getElementById('<%= compch2.ClientID %>');
            var chv = document.getElementById('<%= compch7.ClientID %>');
           var chem = document.getElementById('<%= compch4.ClientID %>');
            var ched = document.getElementById('<%= compch3.ClientID %>');
           var chpost = document.getElementById('<%= compch8.ClientID %>');
            var chothers = document.getElementById('<%= compch5.ClientID %>');
           var chcong = document.getElementById('<%= compch6.ClientID %>');
           
           $("#ul1").css("display", "none");
           $(".ull2").css("display", "none");
           $("#UUTS").css("display", "none");
           $("#LUTS").css("display", "none");
           $("#post").css("display", "none");
           $("#em").css("display", "none");
           $("#ed").css("display", "none");
           $("#cong").css("display", "none");
           $("#others").css("display", "none");
           $("#v").css("display", "none");

           if ($(chuuts).prop('checked')) {
               $('#UUTS').css('display', 'block');

           } else {
               $('#UUTS').css('display', 'none');

           }
           $(chuuts).click(function () {
            if ($(chuuts).is(":checked")) {
                $("#UUTS").show("slow");
               // $("#UUTS").css("display", "inline");
               }
            else {
                $("#UUTS").css("display", "none");
                   $("#UUTS").hide("slow");
               }
           });
           //--------------luts
           if ($(chluts).prop('checked')) {
               $('#LUTS').css('display', 'block');
               if ($('#lch4').prop('checked'))
               {
                   $('#ul1').css('display', 'block');
               }

           } else {
               $('#LUTS').css('display', 'none');

           }
           $(chluts).click(function () {

               if ($(chluts).is(":checked")) {
                   $("#LUTS").show("slow");
               }
               else {
                   $("#LUTS").hide("slow");
               }
           });
       //-------------post
           if ($(chpost).prop('checked')){
               $('#post').css('display', 'block');
               
           } else {
               $('#post').css('display', 'none');

           }
           $(chpost).click(function () {

               if ($(chpost).is(":checked")) {
                   $("#post").show("slow");
               }
               else {
                   $("#post").hide("slow");
               }
           });

           //-----------vido
           if ($(chv).prop('checked')) {
               $('#v').css('display', 'block');

           } else {
               $('#v').css('display', 'none');

           }

           $(chv).click(function () {

               if ($(chv).is(":checked")) {
                   $("#v").show("slow");
               }
               else {
                   $("#v").hide("slow");
               }
           });
           //------------em
           if ($(chem).prop('checked')) {
               $('#em').css('display', 'block');

           } else {
               $('#em').css('display', 'none');

           }
           $(chem).click(function () {

               if ($(chem).is(":checked")) {
                   $("#em").show("slow");
               }
               else {
                   $("#em").hide("slow");
               }
           });
           //-----------ed
           if ($(ched).prop('checked')) {
               $('#ed').css('display', 'block');

           } else {
               $('#ed').css('display', 'none');

           }
           $(ched).click(function () {

               if ($(ched).is(":checked")) {
                   $("#ed").show("slow");
               }
               else {
                   $("#ed").hide("slow");
               }
           });
           //-----------cong
           if ($(chcong).prop('checked')) {
               $('#cong').css('display', 'block');

           } else {
               $('#cong').css('display', 'none');

           }
           $(chcong).click(function () {

               if ($(chcong).is(":checked")) {
                   $("#cong").show("slow");
               }
               else {
                   $("#cong").hide("slow");
               }
           });
           //------------other
           if ($(chothers).prop('checked')) {
               $('#others').css('display', 'block');

           } else {
               $('#others').css('display', 'none');

           }
           $(chothers).click(function () {

               if ($(chothers).is(":checked")) {
                   $("#others").show("slow");
               }
               else {
                   $("#others").hide("slow");
               }
           });



          
           if ($(chkControl).prop('checked')) {
               $('#ul1').css('display', 'block');

           } else {
               $('#ul1').css('display', 'none');

           }
           if ($(chkControl2).prop('checked')) {
               $('.ull2').css('display', 'block');

           } else {
               $('.ull2').css('display', 'none');

           }
           $(chkControl).click(function () {
               
               if ($(chkControl).is(":checked")) {
                   $("#ul1").show("slow");
                   $("#RadioButtonList1 : checked").val() = null;
               }
               else {
                   $("#ul1").hide("slow");
                   
               }
           });
           $(chkControl2).click(function () {

               if ($(chkControl2).is(":checked")) {
                   $(".ull2").show("slow");
               }
               else {
                   $(".ull2").hide("slow");
               }
           });
       });
 </script>
</asp:Content>





