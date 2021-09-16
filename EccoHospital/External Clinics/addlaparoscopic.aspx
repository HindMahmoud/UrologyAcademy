<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/External Clinics/MasterPage.master" CodeBehind="addlaparoscopic.aspx.cs" Inherits="EccoHospital.External_Clinics.addlaparoscopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style>
     .col-md-6{color:palevioletred;font-size:20px}
     .aa tr td {
    display:inline-block;
    margin-right:20px;
   padding:10px;
   color:black;
   font-size:17px
    
       }  ​
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%//if (Session["role"] != null)
         // {
         //     microinjectionEntities db = new microinjectionEntities();
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
    <div class="page_content" style="margin-right:30%;width:70%">
    <div class="row box box-warning text-bold " style="direction:ltr;">
        <br />
       <span class="text-purple" style="font-size:larger; font-family:'Comic Sans MS'"> Laparoscopic Report</span><a href="profile2.aspx?patid=<%=y %>" style="margin-right:50px" class="pull-right btn-primary">back to profile</a>

        <br /> <br />
        <div class="col-md-6">
         panoramic view:
            <asp:RadioButtonList CssClass="aa" ID="panorama" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>Normal</asp:ListItem>
                <asp:ListItem>Abnormal</asp:ListItem>

            </asp:RadioButtonList>
        </div>
        <div class="col-md-6">
           Anesthesia:
            <asp:RadioButtonList CssClass="aa" ID="antesth" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>General endo tracheel</asp:ListItem>
                <asp:ListItem>Spinal</asp:ListItem>
            </asp:RadioButtonList>
        </div>
         
         <div class="col-md-6">
             Uterus:
             <asp:CheckBoxList CssClass="aa" ID="uterus" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>Normal,Mobile</asp:ListItem>
                <asp:ListItem>Abnormal</asp:ListItem>
                <asp:ListItem>Adhesion</asp:ListItem>


            </asp:CheckBoxList>
           </div>
        <div class="col-md-6">
           Bladder & Uterovesical Pouch:
             <asp:RadioButtonList CssClass="aa" ID="bladder" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>Normal , Mobile</asp:ListItem>
                <asp:ListItem>Abnormal</asp:ListItem>
                <asp:ListItem>Normal</asp:ListItem>


            </asp:RadioButtonList>
        </div>
        
        <div class="col-md-6">
            RT Tubes:
             <asp:RadioButtonList CssClass="aa" ID="rttubes" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Mobile,Patent,Healthy,+ve BM</asp:ListItem>
                <asp:ListItem>Closed,Dilatated,Unhealthy,-ve BM</asp:ListItem>
                <asp:ListItem>Hydrosalpinex</asp:ListItem>
                 </asp:RadioButtonList>

        </div>
        <div class="col-md-6">
            LT Tubes:
             <asp:RadioButtonList CssClass="aa" ID="lttubes" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Mobile,Patent,Healthy,+ve BM</asp:ListItem>
                <asp:ListItem>Closed,Dilatated,Unhealthy,-ve BM</asp:ListItem>
                <asp:ListItem>Hydrosalpinex</asp:ListItem>
                 </asp:RadioButtonList>

        </div>
        <div class="col-md-6">
            RT Tubes comment:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="rttubesCO" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            LT Tubes comment::
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="lttubesCO" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-6">
            RT Ovary:
             <asp:RadioButtonList CssClass="aa" ID="rtovary" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Normal</asp:ListItem>
                <asp:ListItem>Pco</asp:ListItem>
                <asp:ListItem>Small adhesion</asp:ListItem>
                 </asp:RadioButtonList>

        </div>
        <div class="col-md-6">
           LT Ovary:
             <asp:RadioButtonList CssClass="aa" ID="ltovary" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Normal</asp:ListItem>
                <asp:ListItem>Pco</asp:ListItem>
                <asp:ListItem>Small adhesion</asp:ListItem>
                 </asp:RadioButtonList>

        </div>
       
        <div class="col-md-6">
            RT Ovary comment:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="rtovaryCO" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            LT Ovary comment:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="ltovaryCO" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-6">
            RT Ovarain Fossa:
             <asp:RadioButtonList CssClass="aa" ID="rtovarain" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Normal</asp:ListItem>
                <asp:ListItem>Abnormal</asp:ListItem>
             
                 </asp:RadioButtonList>

        </div>
         <div class="col-md-6  ">
            LT Ovarain Fossa:
             <asp:RadioButtonList CssClass="aa" ID="ltovarain" runat="server" RepeatDirection="Vertical" >
                <asp:ListItem>Normal</asp:ListItem>
                <asp:ListItem>Abnormal</asp:ListItem>
             
                 </asp:RadioButtonList>

        </div>
         <div class="col-md-6">
            RT Ovarain Fossa comment:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="rtovarainCO" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
             LT Ovarain Fossa comment:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="ltovarainCO" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            Douglas Poch:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="doglas" runat="server"></asp:TextBox>
            
        </div>
         <div class="col-md-6">
            Uterosacral  Ligaments:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="uteroscaral" runat="server"></asp:TextBox>
            
        </div>
        <div class="col-md-6">
            Operative  interventions:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="operative" runat="server"></asp:TextBox>
            
        </div>
          <div class="col-md-6">
           Impression:
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="impress" runat="server"></asp:TextBox>
            
        </div>
        
           

         <div class="col-md-6">
            <br />
            <br />

            <asp:Button ID="btn_add"  OnClick="btn_add_Click" CssClass="btn btn-warning pull-left" runat="server" Text="save" />
               </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
          <div class="box box-warning">
            <div class="box-header">
              <h3 class="box-title">Laparoscopic</h3>

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
                    

                      var x = (from ss in db.laparoscopic where ss.pat_id==y select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>Date</th>
                  <th>Impression</th>
                  <th>Operative Notes</th>


                  <th></th>
                 
                  <th></th>


                </tr>
                  <% foreach (var item in x)
    {
                           %> 
                      
                <tr>
                    

                 <td><% Response.Write(item.date); %></td>
                     <td><% Response.Write(item.impression); %></td>
                     <td><% Response.Write(item.operative); %></td>
 
                    
         <td><a href="addlaparoscopic.aspx?id=<%=item.pat_id %>&&editid=<%=item.id %>">  <i class="fa fa-edit text-aqua"></i></a></td>
         <td><a href="addlaparoscopic.aspx?id=<%=item.pat_id %>&&print=<%=item.id %>">  <i class="fa fa-print text-blue"></i></a></td>
     <td><a  href='addlaparoscopic.aspx?id=<%=item.pat_id %>&&delid=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>




                    

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
   <%--  <% }
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