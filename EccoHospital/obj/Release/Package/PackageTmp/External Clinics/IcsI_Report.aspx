<%@ Page Title="" Language="C#" MasterPageFile="~/External Clinics/MasterPage.master" AutoEventWireup="true" Inherits="IcsI_Report" Codebehind="IcsI_Report.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .col-md-6 ,.col-md-12{color:cornflowerblue;font-size:20px}
     .aa tr td {
    display:inline-block;
    margin-right:20px;
   padding:10px;
   color:black;
   font-size:17px;
    
       }  ​
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                        
         // int uid =  int .Parse(Session["user_id"].ToString());
         // var up = db.permissions.FirstOrDefault(a => a.user_id == uid);
         //if (up.patient_profile == true)
         //{

         int y = 0;
         if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
         {
             y = int.Parse(Request.QueryString["id"].ToString());
         }
             %>
    <div class="page_content" style="margin-right:29%;width:70%">
    <div  class="row box box-info text-bold" style="direction:ltr">
        <br />
       <span class="text-info" style="font-size:larger; font-family:'Comic Sans MS'"> ICSI Report</span><a href="profile2.aspx?patid=<%=y %>" style="margin-right:50px" class="pull-right btn btn-primary"><i class="fa fa-arrow-circle-left"></i> back to profile</a>
        <br /> <br />
        
        <div class="col-md-6">
           Drugs used:
            
            <asp:TextBox  CssClass="form-control" ID="drug" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
           protocol:
            <asp:TextBox  CssClass="form-control" ID="proto" runat="server"></asp:TextBox>
        </div>
         
         <div class="col-md-6">
            Comment on response:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="comm" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
          Totla period of ovarian:(day)
            <asp:TextBox  CssClass="form-control" ID="period_ovarian" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
           HCG Date:
            <asp:TextBox  TextMode="Date" CssClass="form-control" ID="hcg" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-12">
          Husband Semen Analysis:
             <table class="  text-center table-responsive  bg-gray " border="1">
                 <tr class="bg-info" style="font-size:17px;">
                     <th>Coc./MI</th>
                     <th>PR</th>
                     <th>NP</th>
                     <th>Immotile</th>

                   
                 </tr>
                 <tr>
                      <td><asp:TextBox CssClass="bg-gray" width="100%" ID="coc_h" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="PR_h" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="NP_h" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="Immotile_h" runat="server"></asp:TextBox></td> 
                    
                 </tr>
                 </table>
            <br />
            
        </div>

        <div class="col-md-12">
         Ovum Pick up Date:
            <asp:TextBox Width="50%"  TextMode="Date" CssClass="form-control" ID="ovmd" runat="server"></asp:TextBox>

             <table class="  text-center table-responsive  bg-gray " border="1">
                 <tr class="bg-info" style="font-size:17px;">
                     <th>Coc</th>
                     <th>M2</th>
                     <th>M1</th>
                     <th>GV</th>
                     <th>EZ</th>
                     <th>Injected</th>

                 </tr>
                 <tr>
                      <td><asp:TextBox CssClass="bg-gray" width="100%" ID="coc_O" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="m2_O" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="m1_O" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="gv_O" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="EZ_O" runat="server"></asp:TextBox></td> 

                    <td><asp:TextBox CssClass="bg-gray" width="100%" ID="Injected_O" runat="server"></asp:TextBox></td> 

                    
                 </tr>
                 </table>
            <br />
            
        </div>

        <div class="col-md-12">
         Embryo Transefer date&&time:
            <asp:TextBox Width="50%"  TextMode="DateTimeLocal" CssClass="form-control" ID="emDt" runat="server"></asp:TextBox>
</div>
        <div class="col-md-12">
         Embryo Stgging&&Grading:
            <asp:TextBox Width="50%"   CssClass="form-control" ID="emYs" runat="server"></asp:TextBox>
</div>
        <div class="col-md-6">
            <br />
            

            <asp:Button ID="btn_add" OnClick="btn_add_Click"  CssClass="btn btn-info pull-left" runat="server" Text="save" />
            <br />
            <br />  
              
             </div>
        
        
           


    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">ICSI Reports</h3>

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
                     

                      var x = (from ss in db.icsi_report where ss.pat_id==y select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>Date</th>
                  <th>Protocol</th>
                  <th> Drugs</th>


                  <th></th>
                 
                  <th></th>


                </tr>
                  <% foreach (var item in x)
    {
                           %> 
                      
                <tr>
                    

                 <td><% Response.Write(item.date); %></td>
                     <td><% Response.Write(item.protocol); %></td>
                     <td><% Response.Write(item.drugs); %></td>
 
                    
         <td><a href="IcsI_Report.aspx?id=<%=item.pat_id %>&&editid=<%=item.id %>">  <i class="fa fa-edit text-aqua"></i></a></td>
         <td><a href="IcsI_Report.aspx?id=<%=item.pat_id %>&&print=<%=item.id %>" target="_blank">  <i class="fa fa-print text-blue"></i></a></td>
     <td><a  href='IcsI_Report.aspx?id=<%=item.pat_id %>&&delid=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>




                    

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
     <%--<% }%>--%>
           <%--else
           {
               %>--%>
    <%---<div   style="font-weight:bold"  class="text-center text-danger">ليس لديك صلاحيه لدخول الصفحه</div><%--%>--%>
       <%--    }
       }

       else
       {
           Response.Redirect("login.aspx");
       }--%>
</asp:Content>

