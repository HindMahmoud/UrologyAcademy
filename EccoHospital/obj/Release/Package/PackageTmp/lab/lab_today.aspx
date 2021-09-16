<%@ Page Title="" Language="C#" MasterPageFile="~/lab/MasterPage.Master" AutoEventWireup="true" CodeBehind="lab_today.aspx.cs" Inherits="EccoHospital.lab.lab_today" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <%
                            EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        
         %>
    
                       
        <div class="main_content_container">
            <div class="main_container  main_menu_open">
                 <h1 class="heading_title">  التحاليل</h1>
                <div class="page_content">
                    <div class="wrap">
                         <div class="col-md-4">
              
            <div class="box-tools">
                 كود المريض
                <asp:TextBox runat="server"  ID="codePat" cssclass="form-control" OnTextChanged="codePat_TextChanged" ></asp:TextBox>

                </div>
                  </div>
                        </div>
       <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                <%-- <td> التحليل</td>
                                 <td> السعر</td>--%>
                                 <td> التاريخ</td>
                                 <td> اسم المستخدم</td>
                            </tr>
                             <%  
                                 DateTime d = DateTime.Now.Date;
                                 DateTime d2 = d.AddDays(1);


                                 var x = (from  pp in db.patient  join p in db.lab_history on pp.id equals p.p_id
                                          
                                          where p.date>=d&&p.date<d2

                                          select  p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                               <%-- <td><%=item.lab_name %></td>
                                <td><%=item.price %></td>--%>
                                <td><%Response.Write(Convert.ToDateTime(item.date).Day + "/" + Convert.ToDateTime(item.date).Month + "/" + Convert.ToDateTime(item.date).Year); %></td>
                                <td><%=item.user_name %></td>

                                <td><a href="labprofile.aspx?p_id=<%=item.p_id%>" style="color:lightseagreen;font-size:20px"  data-toggle="tooltip"
                                       data-placement="top" title="profile"><i class="fa fa-arrow-circle-left"></i> </a>
                             </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>
                     
        </div>
                </div>
            </div>



</asp:Content>
