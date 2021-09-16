<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="CareResrv.aspx.cs" Inherits="EccoHospital.reception.CareResrv" %>



<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                         <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>
                      
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">حجز عنايه مركزه</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">حجز عنايه مركزه</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="CareResrv.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
    <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                          <div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">كود التذكره </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="txt_code" placeholder="كود التذكره " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                    <asp:Label runat="server" Visible="false" CssClass="text-danger"  ID="lblticket"></asp:Label>
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>
    

     


                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             رقم السرير   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddl_room" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ddl_room_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
              </div>

                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> سعر اليوم  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" placeholder=" السعر  " runat="server" >
                                </div>
                            </div>

      </ContentTemplate>

   </asp:UpdatePanel>
                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">  ملاحظات  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_notes" placeholder=" ملاحظات  " runat="server" >
                                </div>
                            </div>

                            <div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الوقت </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="fromdt"   TextMode="DateTimeLocal" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h1 class="heading_title">عرض كل  الحجوزات</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="lab_reception.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                    
                                    <div class="col-md-3 pull-right">
                                        من:<asp:TextBox ID="from1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-3 pull-right">
                                        الي:<asp:TextBox ID="to1" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     
                 <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="btnSearch" OnClick="btnSearch_Click"  CssClass="btn btn-primary" Text="بحث" runat="server"></asp:Button>
                                    </div>
                                    
                                </div>
                            </div>
                    <div class="wrap">
                        <div class="col-md-12">
              
            <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث باسم  ..">
                  <br />

                  <input type="text" name="table_search" id="search2" class="form-control pull-left" onkeyup="myFunction2()" placeholder="بحث بالغرفه  ..">
                  <br />

                </div>
                  </div>
                        </div>
                
                        <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> النوع</td>

                                 <td>السرير</td>
                               

                                 <td> سعر اليوم</td>
                                 <td> التاريخ</td>
                                <td> اسم المستخدم</td>
                                <td>حذف</td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                               
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);

                                 var x = (from p in db.patient_history
                                          join pp in db.room_history on p.details_id equals pp.id

                                          where p.type=="عنايه"
                                           && p.date>=d &&p.date<dplus
                                          select new { p,pp.type}).ToList();

                                 if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                     x = (from p in db.patient_history
                                          join pp in db.room_history on p.details_id equals pp.id

                                          where p.type=="عنايه" && p.date>=d1 &&p.date<=d2
                                          select new { p,pp.type}).ToList();
                                 }

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p.p_name %></td>
                                <td><%=item.type %></td>

                                <td><%=item.p.service_name %></td>
                                <td><%=item.p.price %></td>
                                <td><%Response.Write(Convert.ToDateTime(item.p.date).Day + "/" + Convert.ToDateTime(item.p.date).Month+"/" +Convert.ToDateTime(item.p.date).Year); %></td>
                                 <td><%=item.p.user_name %></td>
                                <td>
                                    
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="CareResrv.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>

                    </div>
                </div>
            </div>
        </div>

      <asp:Panel runat="server" ID="bb">
                         <div class="row">
    <div class="col-lg-12">

        
        <div id="myModal1" class="modal fade" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content ">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" style="float:left;font-size:30px">&times;</button>
                                                                <h4 class="modal-title">اضافه مريض</h4>
                                                            </div>
                                                            <div class="modal-body ">
                                                                <div class="row box box-group bg-info ">
                                <div class="col-md-12">
                                    <h3> البيانات الشخصية</h3>
                                   <div class="col-md-4 pull-right">
                                        اسم المريض:
                                    <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="namepat" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" EnableClientScript="False" ForeColor="Red" ID="req" ControlToValidate="namepat" ErrorMessage="ادخل الاسم  ">
                                        </asp:RequiredFieldValidator>--%>
                                         <asp:label runat="server" Visible="false" ID="Label1" style="color:red">ادخل الاسم </asp:label>
                                   
                                    </div>
                                     <div class="col-md-4 pull-right">
                                         الرقم القومي :
                                       <asp:TextBox ID="natPatient" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ForeColor="Red" ID="RegularExpressionValidator1"
                                        ControlToValidate="natPatient" runat="server"
                                        ErrorMessage="ادخل 14 رقم  لرقم البطاقه"
                                        ValidationExpression="^\d{14}$">
                                    </asp:RegularExpressionValidator>
                                  </div>
                               
                                 <div class="col-md-4 pull-right">
                                         السن:
                                       <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                  </div>
                                    </div>
                                                                    <br />
                                      <div class="col-md-12 bg-info">
                                       <div class="col-md-4 pull-right">
                                       
                                          رقم التليفون 1 :
                                         <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                                                     <div class="col-md-4 pull-right">
                                         رقم التليفون 2 :
                                         <asp:TextBox ID="mobiletxt" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                     
                                    <div class="col-md-4 pull-right" style="float:right">
                                          المحافظة :
                                         <asp:TextBox ID="govv" CssClass="form-control" runat="server"></asp:TextBox>
                                     </div>
                                    
                                     
                                    <br />
                                     <div class="col-md-4 pull-right">
                                        المركز :
                                       <asp:TextBox ID="m" CssClass="form-control" runat="server"></asp:TextBox>
                                  </div>
                                         </div>
                          

                                            <div class="modal-footer">
                                                
                                              <asp:Button type="button" runat="server" ID="btnSave" class="btn btn-danger" style="float:left;"  OnClick="btnSave_Click" Text="حفظ"/>
                                           </div>
                                   </div>
                           
                                                                    
                 </div>
                   </div>

            </div>
        
                     <br /><br />
                     <br /><br />

                    </div>
                        </div>
                      </asp:Panel>
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
      <script>

        function myFunction2() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search2");
            filter = input.value.toUpperCase();
            table = document.getElementById("mytable");
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
        <!--/End Main content container-->
</asp:Content>






