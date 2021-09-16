<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/External Clinics/MasterPage.master" CodeBehind="FrozenEmpryo.aspx.cs" Inherits="EccoHospital.External_Clinics.FrozenEmpryo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
      
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%//if (Session["role"] != null)
         // {
         //   
         //      int uid =  int .Parse(Session["user_id"].ToString());
         //      var up = db.permissions.FirstOrDefault(a => a.user_id == uid);
         //      if (up.patient_profile == true)
         //      {
          EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

         int y = 0;
         if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
         {
             y = int.Parse(Request.QueryString["id"].ToString());
         }
             %>
    <div class="page_content" style="margin-right:29%;width:70%">
    <div  class="row box box-info text-bold" style="direction:ltr">
        <br />
       <span class="text-info" style="font-size:larger; font-family:'Comic Sans MS'"> Frozen Empryo Report</span><a href="profile2.aspx?patid=<%=y %>" style="margin-right:50px" class="pull-right btn btn-primary"><i class="fa fa-arrow-circle-left"></i> back to profile</a>
        <br /> <br />
        
        <div class="col-md-3 form-group" style="float:left" >
           Date:
            
            <asp:TextBox  AutoPostBack="true" TextMode="Date" OnTextChanged="date_TextChanged" CssClass="form-control" ID="date" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-12">
          
             <table class="  text-center table-responsive  bg-gray " border="1">
                 <tr class="bg-info" >
                     <th>CD</th>
                     <th>Date(m  <asp:Label runat="server" ID="m"></asp:Label>)<br />(Yr  <asp:Label runat="server" ID="y"></asp:Label>)</th>
                     <th>Lucrine 7units</th>
                     <th>pregnova</th>
                     <th>cialis</th>
                     <th>Ultrasound</th>


                   
                 </tr>
                 <tr>
                      <td>1</td>
                     <td><asp:TextBox ID="dd1" TextMode="date" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>4mg</td>
                    <td>10mg</td>
                    <td style="text-align:left" rowspan="5"><div>

                        Date:<asp:TextBox ID="date11"  TextMode="date" runat="server" CssClass="form-control"></asp:TextBox><br />
                      Estradiol: <asp:TextBox ID="est1" CssClass="form-control" Width="80%"  runat="server"></asp:TextBox><br />
                        Endometrium: <asp:TextBox Width="20%" CssClass="form-control" ID="end1"  runat="server"></asp:TextBox>mm  Initial:<asp:TextBox Width="20%" ID="ini1" CssClass="form-control"  runat="server"></asp:TextBox>mm
                        

                                    </div></td>

                 </tr>

                 <tr>
                      <td>2</td>
                     <td><asp:TextBox ID="dd2" TextMode="date" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>4mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>3</td>
                     <td><asp:TextBox ID="dd3" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>4mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>4</td>
                     <td><asp:TextBox ID="dd4" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>4mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>5</td>
                     <td><asp:TextBox ID="dd5" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>6mg</td>
                    <td>10mg</td>
                   

                 </tr>




                 <tr>
                      <td>6</td>
                     <td><asp:TextBox ID="dd6" TextMode="date" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>6mg</td>
                    <td>10mg</td>
                    <td style="text-align:left" rowspan="5"><div>

                        Date:<asp:TextBox ID="date22" CssClass="form-control" TextMode="date" runat="server"></asp:TextBox><br />
                      Estradiol: <asp:TextBox ID="est2" Width="80%" CssClass="form-control" runat="server"></asp:TextBox><br />
                        Endometrium: <asp:TextBox Width="20%" ID="end2" CssClass="form-control" runat="server"></asp:TextBox>mm Initial:<asp:TextBox Width="20%" ID="ini2"  runat="server"></asp:TextBox>mm
                        

                                    </div></td>

                 </tr>
                 
                 
                 <tr>
                      <td>7</td>
                     <td><asp:TextBox ID="dd7" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>6mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>8</td>
                     <td><asp:TextBox ID="dd8" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>6mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>9</td>
                     <td><asp:TextBox ID="dd9" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>10</td>
                     <td><asp:TextBox ID="dd10" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                   

                 </tr>


                  <tr>
                      <td>11</td>
                     <td><asp:TextBox ID="dd11" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                    <td style="text-align:left" rowspan="4"><div>

                        Date:<asp:TextBox ID="date33"  TextMode="date" CssClass="form-control" runat="server"></asp:TextBox><br />
                      Estradiol: <asp:TextBox ID="est3" Width="80%" CssClass="form-control" runat="server"></asp:TextBox><br />
                        Endometrium: <asp:TextBox Width="20%" ID="end3"   runat="server"></asp:TextBox>mm Initial:<asp:TextBox Width="20%" ID="ini3"  runat="server"></asp:TextBox>mm
                        

                                    </div></td>

                 </tr>
                <tr>
                      <td>12</td>
                     <td><asp:TextBox ID="dd12" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>13</td>
                     <td><asp:TextBox ID="dd13" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                   

                 </tr>
                 <tr>
                      <td>14</td>
                     <td><asp:TextBox ID="dd14" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>7u</td>
                    <td>8mg</td>
                    <td>10mg</td>
                   

                 </tr>

                 <tr class="bg-black-gradient">
                      <td>15</td>
                     <td><asp:TextBox CssClass="text-black form-control" ID="dd15"  TextMode="date" runat="server"></asp:TextBox></td>
                    <td>stop</td>
                    <td>8mg</td>
                    <td>10mg</td>
                    <td style="text-align:left">Progesteron400</td>

                 </tr>
                 
                 <tr >
                      <td>16</td>
                     <td><asp:TextBox  ID="dd16" TextMode="date"  CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td>stop</td>
                    <td>8mg</td>
                    <td>10mg</td>
                    <td style="text-align:left">Progesteron400 Teracyclin 250mm/Medrol 16mm</td>

                 </tr>
                 <tr >
                      <td>17</td>
                     <td><asp:TextBox  ID="dd17" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400 Teracyclin 250mm/Medrol 16mm</td>

                 </tr>
                  <tr >
                      <td>18</td>
                     <td><asp:TextBox  ID="dd18" TextMode="date"  CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400 Teracyclin 250mm/Medrol 16mm</td>

                 </tr>
                   <tr >
                      <td>19</td>
                     <td><asp:TextBox  ID="dd19" TextMode="date"  CssClass="form-control" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400 Teracyclin 250mm/Medrol 16mm</td>

                 </tr>
                  <tr >
                      <td>20</td>
                     <td><asp:TextBox  ID="dd20" TextMode="date" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400 Teracyclin 250mm/Medrol 16mm</td>

                 </tr>
                 <tr class="bg-black-gradient">
                      <td>21</td>
                     <td><asp:TextBox CssClass="text-black" ID="dd21" TextMode="date" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400               Embryo transfer</td>

                 </tr>
                  <tr >
                      <td>22</td>
                     <td><asp:TextBox  ID="dd22" TextMode="date" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td>12mg</td>
                    <td></td>
                    <td style="text-align:left">Progesteron400 </td>

                 </tr>
                 </table>
            <br />
            
        </div>
         
        <div class="col-md-6" style="float:left">
           Pregnancy outcome:
            
            <asp:TextBox   CssClass="form-control" ID="preg" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6" style="float:left">
           Date:
            
            <asp:TextBox TextMode="Date" CssClass="form-control" ID="pregdate" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-12" style="float:left">
          Comments:
            
            <asp:TextBox TextMode="MultiLine"   CssClass="form-control" ID="comments" runat="server"></asp:TextBox>
        </div>

        <div class="col-md-6">
            <br />
            

            <asp:Button ID="btn_add" OnClick="btn_add_Click"   CssClass="btn btn-info pull-left" runat="server" Text="save" />
            <br />
            <br />  
              
             </div>
        
        
           


    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">FrozenEmpryo Reports</h3>

              <div class="box-tools">
                  
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="search..">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>--%>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="mytable">
                  <% 
                      
                      DateTime d = DateTime.Now.Date;
                     

                      var x = (from ss in db.frozen_embryo where ss.pat_id==y select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>Date</th>
                  

                  <th></th>
                 
                  <th></th>


                </tr>
                  <% foreach (var item in x)
    {
                           %> 
                      
                <tr>
                    

                 <td><% Response.Write(item.date); %></td>
                     
                    
         <td><a href="FrozenEmpryo.aspx?id=<%=item.pat_id %>&&editid=<%=item.id %>">  <i class="fa fa-edit text-aqua"></i></a></td>
         <td><a href="FrozenEmpryo.aspx?id=<%=item.pat_id %>&&print=<%=item.id %>" target="_blank">  <i class="fa fa-print text-blue"></i></a></td>
     <td><a  href='FrozenEmpryo.aspx?id=<%=item.pat_id %>&&delid=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>




                    

                </tr>
                    <%  }
    }%>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
        </div>
    <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
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
     <%--<% }
           else
           {
               %><div   style="font-weight:bold"  class="text-center text-danger">ليس لديك صلاحيه لدخول الصفحه</div><%
           }
       }

       else
       {
           Response.Redirect("login.aspx");
       }%>--%>
</asp:Content>
