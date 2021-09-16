<%@ Page Title="" Language="C#" MasterPageFile="~/HR/Home.Master" AutoEventWireup="true" CodeBehind="MonthNum.aspx.cs" Inherits="EccoHospital.MonthNum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

         $(function () {
             initdropdown();
         })
         function initdropdown() {
            $(".js-example-placeholder-single").select2({
                placeholder: "...اختار",
                allowClear: true
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href=""> مواعيد العمل</a></li>
                        <li class="bring_right"><a href="MonthNum.aspx">عدد ايام العمل بالشهر  </a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">عدد ايام العمل بالشهر</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم الحفظ بنجاح!</strong><br /> <a href="MonthNum.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton></div>


                    <div class="form">
                        <div class="form-horizontal">

                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">التاريخ </label>
                                <div class="col-sm-10">
                                    <asp:textbox id="datetxt" TextMode="Date"  cssClass="form-control" runat="server"></asp:textbox>
                                </div>
                            </div>
                          
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">عدد الايام  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox  Text="0"  CssClass="form-control" id="numtxt"  runat="server" ></asp:TextBox>
                                </div>
                            </div>
                          
                            
                            </div>
                         
                            <div class="form-group">
                                <div class="col-sm-12 ">
                                     <asp:Button ID="btn" CssClass="btn btn-success center-block" OnClick="btn_Click" runat="server" Text="اضافة" />
                
                                   
                                </div>
                            </div>
                        </div>

                     <div class="wrap ">

                        <div class="box bg-info ">
              

             
                <div class="row center-block" >
                    <span>بحث:</span>
                   <div class="col-md-3"   ><input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="تاريخ.."></div>
                  

                </div>
              
            </div>
                        <table id="mytable" class="table table-bordered ">
                            <tr style="background-color:honeydew" >
                                <td >#</td>
                               
                                <td>الشهـــــــــــــــر</td>
                               
                               
                                <td>عدد الايام </td>


                                <td></td>
                                <td></td>

                            </tr>
                             <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.month_days


                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=  Convert.ToDateTime (item.date.ToString()).ToShortDateString() %></td>
                               
                                <td><%=item.workDays %></td>
                                

                                 
                                <td>
                                    <a href="MonthNum.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil " data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                    
                                </td>
                                <td><a href="MonthNum.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a></td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>
                    </div>
                </div>
            </div>
        
</asp:Content>

