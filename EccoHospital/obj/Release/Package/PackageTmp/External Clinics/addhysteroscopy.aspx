<%@ Page Language="C#" AutoEventWireup="true" MasterPagefile="~/External Clinics/MasterPage.master" CodeBehind="addhysteroscopy.aspx.cs" Inherits="EccoHospital.External_Clinics.addhysteroscopy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .col-md-6 ,.col-md-12{color:green;font-size:20px}
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
         int y = 0;
         if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
         {
             y = int.Parse(Request.QueryString["id"].ToString());
         }
             %>
 <div class="page_content" style="margin-right:29%;width:68%">
    <div class="row box box-success text-bold" style="direction:ltr">
        <br />
       <span class="text-olive" style="font-size:larger; font-family:'Comic Sans MS'"> Hysteroscopy Report</span><a href="profile2.aspx?patid=<%=y %>" style="margin-right:50px" class="pull-right btn-primary">back to profile</a>
        <br /> <br />
        <div class="col-md-12">
            Clinical diagnosis:
            <asp:TextBox width="50%" CssClass="form-control" ID="clicn_diag" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
           Uterine sounding:
            <asp:RadioButtonList CssClass="aa" ID="ut_S" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>pass easly</asp:ListItem>
                <asp:ListItem>pass with dilatation</asp:ListItem>
            </asp:RadioButtonList>
        </div>
         <div class="col-md-6">
          introduction of hysteroscopy:
            <asp:RadioButtonList CssClass="aa" ID="intro" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>pass easly</asp:ListItem>
                <asp:ListItem>pass with dilatation</asp:ListItem>

            </asp:RadioButtonList>
        </div>
         <div class="col-md-6">
            Uterine Cavity:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="uterine_cavity" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
           Endometrium:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="endo" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
          Tubal opening:
            <asp:RadioButtonList CssClass="aa" ID="tubal" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>seen</asp:ListItem>
                <asp:ListItem>not seen</asp:ListItem>

            </asp:RadioButtonList>
        </div>

        <div class="col-md-6">
          Distention media:
            <asp:RadioButtonList CssClass="aa" ID="distmedial" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>saline</asp:ListItem>
                <asp:ListItem>glycerine</asp:ListItem>

            </asp:RadioButtonList>
        </div>
        <div class="col-md-6">
            Diagnosis:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="diagnosisi" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            Plan of management:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="plan" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <br />
            <br />

            <asp:Button ID="btn_add" OnClick="btn_add_Click" CssClass="btn btn-success pull-left" runat="server" Text="save" />
               </div>
        <div class="col-md-6">
            Operative notes:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="operat" runat="server"></asp:TextBox>
             <br />
        </div>
        
           


    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box box-success">
            <div class="box-header">
              <h3 class="box-title">Hystroscopy</h3>

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
                     

                      var x = (from ss in db.hystroscopy where ss.pat_id==y select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>Date</th>
                  <th>Clinical diagnosis</th>
                  <th>Operative diagnosis</th>


                  <th></th>
                 
                  <th></th>


                </tr>
                  <% foreach (var item in x)
    {
                           %> 
                      
                <tr>
                    

                 <td><% Response.Write(item.date); %></td>
                     <td><% Response.Write(item.clinic_diag); %></td>
                     <td><% Response.Write(item.operative_notes); %></td>
 
                    
         <td><a href="addhysteroscopy.aspx?id=<%=item.pat_id %>&&editid=<%=item.id %>">  <i class="fa fa-edit text-aqua"></i></a></td>
         <td><a href="addhysteroscopy.aspx?id=<%=item.pat_id %>&&print=<%=item.id %>">  <i class="fa fa-print text-blue"></i></a></td>
     <td><a  href='addhysteroscopy.aspx?id=<%=item.pat_id %>&&delid=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>




                    

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
  
</asp:Content>


