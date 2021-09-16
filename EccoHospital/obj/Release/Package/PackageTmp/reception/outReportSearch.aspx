<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/reception/MasterPage.master" CodeBehind="outReportSearch.aspx.cs" Inherits="EccoHospital.reception.outReportSearch" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        label {
            margin-right:15px;
            margin-left:30px;
        }
        span #CheckBox17 label {
                margin-right: 8px;
        }
       

        .home_passs {     
             background-color: #f6f6f6;
    font-size: 16px;
    border-bottom: 1px solid #eee;
    /* margin-bottom: 20px; */
    padding: 5px;
    overflow: hidden;
        }
     .wrap .headin_title {    /* margin-top: 50px; */
    /*border-top: 2px solid #e64759;*/
    color: #222;
    border-bottom: 2px solid #e64759;
    width: 250px;
    padding-bottom: 8px;
    /*padding-top: 5px;*/
    /*margin-left: auto;
    margin-right: auto;*/
    font-size: 21px;
    text-align: center;
    margin:auto auto;
    margin-bottom:1px
        }
        .list-group {float:right;text-align:center
        }
        .list-group-item {
        margin-left:2px}
        .sp {
        font-family:"Comic Sans MS";
        font-size:20px;
        }
            .sp a {
            font-size:18px;text-align:left}
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="main_content_container">
      <div class="main_container  main_menu_open" style="padding-right:3px;padding-left:3px">
                 <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       </ul>
                </div>
                
       <h1 class="heading_title">كل تقاير الخروج</h1>

                  <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    
        <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><a href="#" class="alert-link">حسناً</a> . </div>
                    <%--<div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
                   </div>--%>
                <div class="page_content">
                    
                  <div class="wrap">
   <input type="text" name="table_search" id="search" class=" pull-right" onkeyup="myFunction()" placeholder="بحث  باسم المريض  .."  >
    <br />  <table class="table table-bordered" id="mytable2" style="overflow-x:scroll;">
                  <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                      var labb = (from patRec in db.out_report join d in db.clinic_reception on patRec.Rec_id equals d.id select new { patRec, d }).ToList();
                      if (labb != null)
                      {
                       %>
                <tr>
                  <th>#</th>
                   <th>رقم التقرير</th>
                  <th>التاريخ </th>
                  <th> اسم المريض</th>
                 <th> رقم الزيارة</th>
                 <th> Medical History</th >
                    <th>  Physical Finding</th>
                    <th>  Operations</th>
                     <th>  Tubes and Instruction</th>
                    
                 
                  
                </tr>
                  <% int i = 1; foreach (var item in labb)
                      {
                          DateTime f = DateTime.Now;
                         // string dd = Convert.ToDateTime(item.date).ToString("yyyy/MM/dd");
             %> 
                      
                <tr>
                     <td><%=i %></td>
                     <td><% Response.Write(item.patRec.id); %></td>
             
                     <td><%=item.patRec.date_report %></td>
                     <td><% Response.Write(item.patRec.p_name); %></td>
                      <td><% Response.Write(item.d.id); %></td>
                     <td><% Response.Write(item.patRec.Medical_histoy); %></td>
                      <td><% Response.Write(item.patRec.physical_finding); %></td>
                     <td><%=item.patRec.operation %> </td>
                    <td><%=item.patRec.notes %> </td>
                     
                      
                  </tr>
                    <% i++; }
                        }%>
               
              </table>
            </div>
                    <div>
                     

  
        </div>
      
                 </div>
    </div>
    </div>
               <script>

        function myFunction() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable2");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3];
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
    </asp:content>