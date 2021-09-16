<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="session_medicines.aspx.cs" Inherits="EccoHospital.External_Clinics.session_medicines" %>

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
                        <li class="bring_right"><a href="">الاستقبال </a></li>
                        </ul>
                </div>
                   <% 
                       int id = 0;
                       int pt = 0;
                       EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                       if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
                       {
                           id = int.Parse(Request.QueryString["sess_id"].ToString());

                       }
                       var pat = (from f in db.clinic_reception where f.id == id select f.patient_id).FirstOrDefault();
                       if (pat != null)
                       {
                           //var pat = db.patient.FirstOrDefault(a => a.id == x);
                           %>
                <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="#" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->
       
                <div class="page_content">
                    <a class="btn btn primary bg-blue-gradient" href='patprofile.aspx?patid=<%=pat %>' style="float:left">Go Back <i class="fa fa fa-arrow-circle-left"></i></a>
                    <%} %>
                     <br />
                     <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><a href="#" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
                   </div>
                  <div style="margin-bottom:2px" >
                        <h1 class="heading_title">الروشتة</h1>
                     <div>
                       <div class="form">
                           <div class="form-horizontal">
                               <div class="col-md-6"> 
                                          <div class="">
                                            
                                                ملاحظات :
                                                 <input  type="text" style="height:60px;padding:0 1px;font-size:11px" multiline="true"  class="form-control" id="note" placeholder="ملاحظات  " runat="server" >
                                         
                                            </div>
                                        </div> 
                               <%-- <div class="col-md-4"> 
                                           <div class="">
                                            
                                                 من-الي : 
                                                 <input  type="text"  class="form-control" id="extra" placeholder="من-الي  " runat="server" >
                                           </div>
                                        </div>--%>
                               <div class="col-md-6">
                                        <div class="">
                                                العلاج :
                                             <asp:DropDownList AppendDataBoundItems="True" CssClass="form-control js-example-placeholder-single select2" ID="name" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="code">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eccoConnectionString %>" SelectCommand="SELECT * FROM [treat]"></asp:SqlDataSource>
         
                                                  </div>
                                           </div> 
                                   
                                         
                                      
                                       <br />
                               <br />
                               <br />
                                       <div class="col-md-12"> 
                                       <div class="text-center">
                                                 <asp:Button ID="btn" CssClass="btn btn-warning"  runat="server" Text="اضافة" OnClick="btn_Click"  />
                
                                            </div>
                                        </div>
                                    
                               
                          </div>
                    
                    </div>
                  </div>

                     

  <div class="wrap">
       <%--<asp:Button ID="show" OnClick="show_Click" OnClientClick="target ='_blank';" runat="server" Text="طباعه"  CssClass=" btn btn-success"/>--%>
            <%--<asp:Button ID="Report2" OnClick="report_click" OnClientClick="target ='_blank';" runat="server" Text="print"  CssClass=" btn btn-default"/>--%>
        
              <table class="table table-bordered">
                  <% 
                      DateTime d = DateTime.Now.Date;
                      int i = 0;
                      var lab = (from s in db.session_med join c in db.clinic_reception on s.Clinic_RecID equals c.id where c.id==id select  new { s, c.type } ).ToList();
                      if (lab != null)
                      {
                       %>
                <tr>
                  <th>#</th>
                  
                  <th>العلاج </th>
                  <th>ملاحظات </th>
                
                 
                  <th></th>
                  
                </tr>
                  <% foreach (var item in lab)
                      {
                          
                          %> 
                      
                <tr>
                 
                 <td><%=i %></td>
                
                 <td><% Response.Write(item.s.name); %></td>
                 <td><% Response.Write(item.s.note); %></td>
                 <%--<td><% Response.Write(item.s.extra); %></td>--%>
                 
                 <td><a  href='session_medicines.aspx?sess_id=<%=id %>&&id=<%=item.s.id %>'>  <i class="fa fa-remove text-danger"></i></a></td>
                     
                  </tr>
                    <% }
                        }%>
               
              </table>
            </div>
           
        </div>
       </div>
        </div>
     </div>
    </asp:content>
