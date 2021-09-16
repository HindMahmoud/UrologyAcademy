<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/rad/MasterPage.master" CodeBehind="rad_files.aspx.cs" Inherits="EccoHospital.rad.rad_files" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> نتائج الاشعة</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">
                    <%if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["files"])))
                        {
                            EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            int id = int.Parse(Request.QueryString["files"].ToString());
                            var fil = (from u in db.rad_history where u.id == id select u).FirstOrDefault();
                            DateTime ResultDate = Convert.ToDateTime(fil.date);
                         %>
                     <h1 class="heading_title">ملفات الاشعه بتاريخ <%Response.Write(ResultDate.Day+"/"+ResultDate.Month+"/"+ResultDate.Year); %> </h1>

                   
                  
                    <div class="wrap">
                        <% 
                            var hasFiles = (from g in db.image join radi in db.rad_history on g.service_id equals radi.id where radi.id==id&&g.typeLab=="اشعه" select new { g, radi}).ToList();

                            if (hasFiles != null)
                            {
                                foreach (var item in hasFiles)
                                {
                            %>
                        <div class="col-md-4">
                          <div class="thumbnail">
                              
                            <%if (item.g.type == "img")
                                { %>
                               <%--<a href='/upload/<%=item.g.img %>' target ="_blank" >--%>
                              <img src='/upload/<%=item.g.img%>' alt="Nature" class="image" style="width:100%">
                                   <%--</a>--%>

                               <div class="overlay">
                              <a class="text-warning" href='/upload/<%=item.g.img%>' target = "_blank"><i class="fa fa-2x fa-search-plus"></i></a>
                               <a  href='rad_files.aspx?iiid=<%=item.g.id%>&&files=<%=item.g.service_id %>'><i class="fa fa-2x fa-trash text-danger"></i></a>
                            </div>
                              <%} %>
                                   
                              <%else { %>
                              
                              <hr />
                              
                              <i  class="center-block btn fa fa-4x fa-file"></i>
                              <div class="caption">
                                <p>file Name: <%=item.g.img %></p>
                              </div>
                              
                              <%} %>
                              
                            
                          </div>
                        </div>
                        <%}
    }%>
                    </div>
                </div>
       <%} %>
                    </div>
                </div>
    <link href="../dist/css/mystyle1.css" rel="stylesheet" />
</asp:Content>
