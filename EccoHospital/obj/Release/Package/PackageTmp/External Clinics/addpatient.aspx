<%@ Page Title="" Language="C#" MasterPageFile="~/External Clinics/MasterPage.master" AutoEventWireup="true" Inherits="addpatient" Codebehind="addpatient.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
       .aa tr {
    display:inline-block;
    margin-right:20px;
    
       }  ​
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%//if (Session["role"] != null)
         // {
         //     microinjectionEntities db = new microinjectionEntities();
         //      int uid =  int .Parse(Session["user_id"].ToString());
         //      var up = db.permissions.FirstOrDefault(a => a.user_id == uid);
         //      if (up.reception == true)
         //      {
         EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

             %>
     <div  class="page_content" style="margin-right:30%;width:70%">
        <div class="row" >
           <div class="col-md-12">
               <div class="col-md-3">

            <label>رقم الهاتف:</label>
         <asp:TextBox CssClass="form-control "  ID="phone" runat="server" ></asp:TextBox></div>
            
            
            <div class="col-md-4">
         <label > العنوان :</label><asp:TextBox CssClass="form-control "   ID="address" runat="server" ></asp:TextBox>
            </div>
              <div class="col-md-1">
         <label> السن :</label>
        <asp:TextBox TextMode="SingleLine" CssClass="form-control "   ID="age" runat="server" ></asp:TextBox>
              </div>
             <div class="col-md-4">
                 <label >  الاسم :</label><asp:TextBox CssClass="form-control "   ID="Name" runat="server" onkeyup="myFunction()" ></asp:TextBox>
             </div>
          </div>
            <br />
             <div class="col-md-12">
            
              <div class="col-md-2">

          <label>عدد الاطفال:</label> 
         <asp:TextBox CssClass="form-control "  ID="childrenNO" runat="server" ></asp:TextBox></div>
           
                  <div class="col-md-3">
           <label> مده الجواز :</label>
         <asp:TextBox CssClass="form-control "   ID="duration" runat="server" ></asp:TextBox></div>
          
                   <div class="col-md-3">
          <label> درجه القرابه:</label>
         <asp:TextBox CssClass="form-control "  ID="relation" runat="server" ></asp:TextBox></div>
           
                 <div class="col-md-4">

           <label> اسم الزوج:</label>
         <asp:TextBox CssClass="form-control "  ID="husName" runat="server" ></asp:TextBox></div>
          

</div>
            <div class="col-md-12">
                  <div class="col-md-2">

           <label>  عدد الذكور:</label>
         <asp:TextBox CssClass="form-control "  ID="boys" runat="server" ></asp:TextBox></div>
            <div class="col-md-2">

          <label> عدد الاناث:</label>
         <asp:TextBox CssClass="form-control "  ID="girls" runat="server" ></asp:TextBox></div>
          <div class="col-md-2">
                 <label> عدد الاجهاض:</label>
         <asp:TextBox CssClass="form-control "  ID="aportion" runat="server" ></asp:TextBox></div>
           
                  <div class="col-md-3">

         <label> عدد الولادات الطبيعيه:</label>
         <asp:TextBox CssClass="form-control "  ID="natural" runat="server" ></asp:TextBox></div>
            <div class="col-md-3">

         <label> عدد الولادات القيصريه:</label> 
         <asp:TextBox CssClass="form-control "  ID="surgery" runat="server" ></asp:TextBox></div>
           
 </div>
               
           <div class="col-md-12"> 
             <asp:CheckBoxList CssClass="aa" ClientIDMode="Static" ID="CheckBoxList1" runat="server" >
                 <asp:ListItem >ضغط دم</asp:ListItem>
                 <asp:ListItem>امراض قلب</asp:ListItem>
                 <asp:ListItem>اورام</asp:ListItem>
                 <asp:ListItem>امراض جلديه</asp:ListItem>
                 <asp:ListItem>السكر</asp:ListItem>
                 <asp:ListItem>الكبد</asp:ListItem>
                 <asp:ListItem>الصرع</asp:ListItem>
                 <asp:ListItem>الحساسيه</asp:ListItem>
                 <asp:ListItem>سيوله الدم</asp:ListItem>
                 <asp:ListItem>الكلي</asp:ListItem>
                 <asp:ListItem>الغده الدراقيه</asp:ListItem>
                

             </asp:CheckBoxList>
          
              <asp:CheckBoxList CssClass="aa" ClientIDMode="Static" ID="CheckBoxList2" runat="server" >
                  <asp:ListItem>حمل</asp:ListItem>
                  <asp:ListItem>رضاعه</asp:ListItem>
              </asp:CheckBoxList>
            <div class="col-md-12" style="width:100%">
                اخري:
             <asp:TextBox class="col-md-12" TextMode="MultiLine" CssClass="form-control" ID="other" runat="server"></asp:TextBox>
         </div>
            </div>
       
          <div class="col-md-6">

         <asp:TextBox CssClass="form-control "  ID="code"  Visible="false"  runat="server" ></asp:TextBox></div>
                 </div>
     <div class="col-md-12 text-center">
            <br />
            <asp:Button CssClass="btn btn-primary" OnClick="add_Click" ID="Button1" runat="server" Text="اضافه" />
        </div>
    <div class="wrap " >
       <%-- <div class="col-xs-12">--%>
          <div class="box row">
            <div class="box-header">
              <h3 class="box-title">المرضي</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" >
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction()" placeholder="بحث..">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>--%>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
          <%--  <div class="box-body table-responsive no-padding">--%>
              <table class="table table-bordered" id="mytable">
                  <% 
                      DateTime d = DateTime.Now.Date;
                      var x = (from p in db.patient 
                               where p.name!=null
                              
                               select p).ToList();
                      
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>#</th>
                   
                 
                  <th>اسم المريض</th>
                  <th>السن</th>
                  <th>العنوان</th>
                  <th>الهاتف</th>



                  
                  <th></th>
                  <th></th>
                  <th></th>  



                </tr>
                  <% foreach (var item in x)
                      {
                         

                           %> 
                      
                <tr>
                 <td><% Response.Write(item.id); %></td>
                     
                 <td><% Response.Write(item.name); %></td>
                 <td><% Response.Write(item.age); %></td>
                 <td><% Response.Write(item.address); %></td>
                 <td><% Response.Write(item.phone); %></td>



              
                   <td><a  href="profile2.aspx?patid=<%=item.id %>">  <i class="fa fa-arrow-circle-o-right text-orange"> عرض</i></a></td>

                   <td><a  href='addpatient.aspx?editid=<%=item.id %>'>  <i class="fa fa-edit text-aqua"></i></a></td>
                   <td><a  href='addpatient.aspx?id=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>
                   
                    

                </tr>
                    <%  }
    }%>
               
              </table>
           <%-- </div>--%>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       <%-- </div>--%>
      </div>
    </div>
            <script>
function myFunction() {
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
    
    
    <script>
      
           $('#ex_date,#Text1').daterangepicker({
               "singleDatePicker": true,
               "showDropdowns": true,
               "timePicker": true,
               "timePickerIncrement": 5,
               "autoApply": true,

               "locale": {
                   "format": "DD/MM/YYYY hh:mm A"

               }
           });
      
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

