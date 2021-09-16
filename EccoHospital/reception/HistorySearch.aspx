<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="HistorySearch.aspx.cs" Inherits="EccoHospital.reception.HistorySearch" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

    <!--Start Main content container-->
    <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    
                    <li class="bring_right"><a href="">التاريخ المرضي</a></li>
                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">
                <h1 class="heading_title">التاريخ المرضي</h1>

                <!--Start status alert-->
             
                <!--/End status alert-->
              
                    <div class="col-md-12">
              
          <div class="col-sm-12 left_text">
                                    
                                    <div class="col-md-3 pull-right">
                                        <label class="pull-right">من:</label>
                                       <asp:TextBox ID="from1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-3 pull-right">
                                         <label class="pull-right">الي:</label>
                                        <asp:TextBox ID="to1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
               <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
    <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                             <div class="col-sm-2 pull-right">
                                   <label class="pull-right">الكود:</label>
                                    <asp:TextBox CssClass="form-control" ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                </div>
                           
                              
                             <div class="col-sm-3 pull-right">
                                 <label class="pull-right">الاسم:</label>
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            
   </ContentTemplate>
                   </asp:UpdatePanel>
                 <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="btnSearch" OnClick="btnSearch_Click"  CssClass="btn btn-primary" Text="بحث" runat="server"></asp:Button>
                                    </div>
                                    
                                </div>
                        </div>
                <%
    if ( !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["c"]))&& !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
    {

                     %>
                <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>اسم المريض</td>
                         
                            <td>الخدمه</td>
                            <td>السعر</td>
                            <td>التاريخ</td>
                             <td>اسم المستخدم</td>
                            

                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

                            DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

    DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
    int c = Convert.ToInt32(Request.QueryString["c"]);

                            var x = (from p in db.patient_history where  p.p_id == c && p.date>=d1&&p.date<=d2 select p).ToList();



                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            
                          
                            <td><%=item.p_name %></td>
                            <td><%=item.service_name %></td>
                            <td><%=item.price %></td>
                            <td><%Response.Write(d.Day + "/"+d.Month+"/" +d.Year); %></td>
                            <td><%=item.user_name %></td>
                        </tr>
                        <%  i++;
        }
    }
                            %>
                    </table>
                    </div>
                    <%} %>
                    </div>
                </div>
            </div>
       
    <!--/End Main content container-->
     <script>

        function myFunction1() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2];
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

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5];
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

