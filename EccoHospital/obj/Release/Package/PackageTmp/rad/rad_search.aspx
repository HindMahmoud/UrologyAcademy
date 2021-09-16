<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/rad/MasterPage.Master" CodeBehind="rad_search.aspx.cs" Inherits="EccoHospital.rad.rad_search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الاشعه</a></li>
                    <li class="bring_right"><a href="">عرض كل الأشعه</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">عرض كل الأشعه</h1>

                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"><strong>تم الحفظ بنجاح!</strong><br />
                    <a href="leave_moneyall.aspx" class="alert-link">حسناً</a> . </div>
               <%-- <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف ؟</strong>
                    <asp:linkbutton class="btn-xs btn-danger  " visible="false" onclick="delbtn_Click" id="delbtn" runat="server">نعم</asp:linkbutton>
                    <asp:linkbutton class="btn-xs btn-warning  " visible="false" onclick="cancel_Click" runat="server" id="cancel">لا</asp:linkbutton>
                </div>--%>
                <!--/End status alert-->
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
                            { %>
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
                    <div class="col-md-12">
              
          
                        </div>
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>اسم المريض</td>
                            <td>الأشعه</td>
                            <td>نتيجه الأشعه</td>
                            <td>upload file</td>
                             <td>show file</td>
                             <td> اسم المستخدم</td>
                            

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            var x = (from p in db.rad_history where p.del == false   select p).ToList();
                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                

                                x = (from p in db.rad_history where p.del == false && p.date >= d1 && p.date <=d2  select p).ToList();
                            }
                          
                            if (x != null)
                            { 
                                int i = 1;
                                foreach (var item in x)
                                {var hasFiles = (from g in db.image join ii in db.rad_history on g.service_id equals ii.id  where ii.p_id==item.p_id select g).ToList();


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%
                                        DateTime f = Convert.ToDateTime(item.date);
                                        Response.Write(f.Day + "/" + f.Month + "/" + f.Year); %>

                            </td>

                            <td><%=item.p_name %></td>
                            <td><%=item.rad_name %></td>
                              <td>
                                 <% if (item.status == false)

                                     { %>
                                 
                                
                                    <a href="rad_search.aspx?p_id=<%=item.p_id %>&&edittxt=<%=item.id%>"  data-toggle="tooltip"
                                       data-placement="top" ><i class="glyphicon glyphicon-file"></i></a>
                                   
                                    <%}%>
                                   <% else
                                    {
                                        Response.Write(item.rad_result);
                                    } %>
                                 
                                   
                                </td>
                                 <td>
                                     <a href="rad_search.aspx?p_id=<%=item.p_id %>&&edit=<%=item.id%>"  data-toggle="tooltip"
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
                        
                        </tr>
                        <%  i++;
}
    }
                            %>
                    </table>
                    </div>
                    
                    </div>
                </div>
            </div>
        </div>

    <!--/End Main content container-->
     <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2];
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
      <script>

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5];
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
</asp:Content>
