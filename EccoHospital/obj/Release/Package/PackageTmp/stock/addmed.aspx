<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addmed.aspx.cs" MasterPageFile="~/stock/HomeStock.Master" Inherits="EccoHospital.stock.addmed" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs ">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home ">المستلزمات</span></li>
                    <li class="bring_right"><a href=""> المستلزمات </a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">اضافة صنف   </h1>
                <!--Start status alert-->
    <div class="form-horizontal">
        <div class="col-md-4 pull-right">
            الاسم:
            <asp:TextBox  CssClass="form-control" ID="name" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-4 pull-right">
            كود:
            <asp:TextBox  CssClass="form-control" ID="code" runat="server"></asp:TextBox>
        </div>
         
        <div class="col-md-4 pull-right">
            حد الطلب:
            <asp:TextBox  CssClass="form-control" ID="aler" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-4 pull-right">
            سعر الوحده:
            <asp:TextBox  CssClass="form-control" ID="price" runat="server"></asp:TextBox>
        </div>

        <div class="col-md-4 pull-right">
            تنبيه بتاريخ الصلاحيه (اشهر) :
            <asp:TextBox  CssClass="form-control" ID="alert_date" runat="server"></asp:TextBox>
        </div>
         <div class="col-md-12 text-center">
            <br />
            <asp:Button CssClass="btn btn-primary" OnClick="Button1_Click" ID="Button1" runat="server" Text="اضافه" />
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">قائمه المستلزمات </h3>
               
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
              <table class="table table-hover " style="font-weight:bold" id="mytable">
                  <% 
                     EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                      DateTime d = DateTime.Now.Date;
                      var x = (from ss in db.medicin select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr style="background-color:lightgray">
                  
                    <th>#</th>
                  <th>الاسم</th>
                  <th>الكود</th>
                  <th>كميه المخزن الرئيسي</th>

                  <th>حد الطلب</th>
                  <th>تنبيه الصلاحيه</th>


                  <th>السعر</th>

                
                  <th></th>
                 
                  <th></th>


                </tr>
                  <%int i = 1; foreach (var item in x)
                      {
                           %> 
                      
                <tr>
                     <td><% Response.Write(i); %></td>

                 <td><% Response.Write(item.name); %></td>
                     <td><% Response.Write(item.code); %></td>
                     <td><% Response.Write(item.quantity); %></td>

                     <td><% Response.Write(item.alert_qty); %></td>
                     <td><% Response.Write(item.alert_ex_date); %></td>


                 <td><% Response.Write(item.price); %></td>

                
                 
                   <td><a  href='addmed.aspx?editid=<%=item.id %>'>  <i class="fa fa-edit text-aqua"></i></a></td>
                    
                   <td><a  href='addmed.aspx?id=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>


                    

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
