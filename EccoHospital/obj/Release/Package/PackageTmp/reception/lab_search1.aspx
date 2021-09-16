<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="lab_search1.aspx.cs" Inherits="EccoHospital.reception.lab_search1" %>
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
                        <li class="bring_right"><a href="">البيانات الطبية </a></li>
                        <li class="bring_right"><a href="">ملف المريض </a></li>
                    </ul>
                </div>
                  
                <div class="page_content">
                  <div>
                        <div class="col-md-12">

 <div class="form">
                    <div class="form-horizontal">
                    <div class="col-lg-12" dir="rtl">

                    
                        
                    <div class="col-lg-6" style="align-self:left">

                 
                                 الي
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator1" controltovalidate="to1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>

                       </div>
                        <div class="col-lg-6" style="align-self:right" >

                   
                              من
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator4" controltovalidate="from1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>
                           </div>
                </div>
                         
                   </div>
                
                <div class="clearfix">
                </div>
                <div class="form-group">
                    <div class="col-sm-12 ">
                       
            <asp:Button CssClass="btn btn-primary " OnClick="show_Click" ID="show" runat="server" Text="عرض" />
              
                    </div>
                        </div>
                      <div class="col-md-12">
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
                                        <asp:TextBox ID="txt_result"  CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
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
                   
                </div>

  <div class="wrap">
                   <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                                  <td> التاريخ</td>
                                <td>اسم المريض</td>
                                 <td> التحليل</td>
                               
                                 <td>write Result</td>
                                <td>upload file</td>
                                <td>show files Pictue</td>
                                 <td> اسم المستخدم</td>

                            </tr>
                             <%   EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from p in db.lab_history where p.del == false   select p).ToList();
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                

                                x = (from p in db.lab_history where p.del == false && p.date >= d1 && p.date <=d2  select p).ToList();
                            }
                          
                                 
                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     { var hasFiles = (from g in db.image join io in db.lab_history on g.service_id equals io.id   where io.p_id==item.p_id select g).ToList();


                           %> 
                            <tr>
                                <td><%=i %></td>
                               <td><%
                                        DateTime v = Convert.ToDateTime(item.date);
                                        Response.Write(v.Day+"/"+v.Month+"/"+v.Year); %></td>
                               
                                <td><%=item.p_name %></td>
                                <td><%=item.lab_name %></td>
                              
                                <td>
                                 <% if (item.status == false)

                                    { %>
                                 
                                
                                    <a href="lab_search1.aspx?p_id=<%=item.p_id %>&&edittxt=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                   
                                    <%} %> 
                                     <% else
                                    {
                                        Response.Write(item.lab_result);
                                    } %>
                                </td>
                                  <td>
                                     <a href="lab_search1.aspx?p_id=<%=item.p_id %>&&edit=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-floppy-open"></i></a>
                                   </td>
                                <td> 
                                    <% if (hasFiles != null)
                                        {%>
                                   <a href="../lab/lab_files.aspx?files=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                      data-placement="top" title="ملفات المريض"></a>
                                  
                                   <%} %> 
                                </td>
                                <td><%=item.user_name %></td>
                              
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>
                         
                    </div>

        </div>
              
       </div>
        </div>
    </asp:content>



