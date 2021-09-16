<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/stock/HomeStock.Master" CodeBehind="linksdep.aspx.cs" Inherits="EccoHospital.stock.linksdep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home ">الاقسام</span></li>
                    <li class="bring_right"><a href=""> الاقسام </a></li>
                </ul>
            </div>
            <!--/End system bath-->
          

    <div class="row" style="padding:3%">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">قائمه الاقسام </h3>
              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                  <% 
                     EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
           
                      var x = (from ss in db.departments select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr style="background-color:lightgray">
                  
                    <th>#</th>
                  <th>القسم</th>
                 
                 
                  <th></th>


                </tr>
                  <%int i = 1; foreach (var item in x)
                      {
                           %> 
                      
                <tr>
                     <td><% Response.Write(i); %></td>

                 <td><% Response.Write(item.name); %></td>
               
                   <td><a  href='ReportInvoice.aspx?depId=<%=item.id %>'>  <i class="fa fa-arrow-left text-aqua"></i></a></td>
                   
                </tr>
                    <% i++; }
    }%>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

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

