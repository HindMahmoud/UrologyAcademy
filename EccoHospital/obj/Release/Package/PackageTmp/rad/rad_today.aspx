<%@ Page Title="" Language="C#" MasterPageFile="~/rad/MasterPage.Master" AutoEventWireup="true" CodeBehind="rad_today.aspx.cs" Inherits="EccoHospital.rad.rad_today" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <%
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        
         %>
      <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
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
                                 <%--<td> الأشعه</td>
                                 <td> السعر</td>--%>
                                 <td> التاريخ</td>
                                   <td> اسم المستخدم</td>
                                 <td>ملف المريض</td>
                            </tr>
                             <%  
                                 DateTime d = DateTime.Now.Date;
                                 DateTime d2 = d.AddDays(1);


                                 var x = (from p in db.rad_history join patien in db.patient on p.p_id equals patien.id
                                          where p.date>=d&&p.date<d2 

                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
 <%--                               <td><%=item.rad_name %></td>
                                <td><%=item.price %></td>--%>
                                <td><%
                                        DateTime f = Convert.ToDateTime(item.date);
                                        Response.Write(f.Day + "/" + f.Month + "/" + f.Year); %></td>

                                <td><%=item.user_name %></td>
                          
                               
                                <td><a href="radprofile.aspx?p_id=<%=item.p_id%>" style="color:lightseagreen;font-size:20px"  data-toggle="tooltip"
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

