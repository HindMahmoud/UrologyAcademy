<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Saavee/Home.Master" CodeBehind="t7sel.aspx.cs" Inherits="EccoHospital.Saavee.t7sel" %>

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
              <%--        <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>--%>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="#">تحصيل</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">تحصيل</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="ClinicResrv.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form" style="padding:0 20px">
                        <div class="form-horizontal">
                            <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
<ContentTemplate>
     <script>
        Sys.Application.add_load(initdropdown);
       

        </script>
                            <%--<div class="form-group"> 
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div class="col-sm-10">
                                     <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>
                           <div class="form-group col-md-12">
                                <label for="input0" class=" col-sm-4 control-label bring_right left_text">كود المريض </label>
                                <div >
                                    
                                    <asp:TextBox ID="txt_code" placeholder="كود المريض  " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                                      <asp:Label runat="server" ID="lbl" ForeColor="Red" Visible="false" ></asp:Label>
                                    </div>
                            </div>
                              
                           <%-- <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم المريض </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList AutoPostBack="true" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>--%>
    
<%--

                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم العياده   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ClinicList" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ClinicList_TextChanged"></asp:DropDownList>
                                    </div>
              </div>
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم الطبيب   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="docList" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>--%>

<%--                             <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             نوع الخدمه    </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ReceptionType" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ReceptionType_TextChanged">
                 <asp:ListItem></asp:ListItem>
                 <asp:ListItem>كشف</asp:ListItem>
                 <asp:ListItem>اعاده</asp:ListItem>
                 <asp:ListItem>استدعاء</asp:ListItem>

             </asp:DropDownList>
                                    
                                    </div>
              </div>--%>
 <%--   <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> التاريخ  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox  type="Date" AutoPostBack="true"  CssClass="form-control" id="datee"   runat="server" ></asp:TextBox>
                                </div>
        </div>--%>
                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> السعر  </label>
                                <div class="col-sm-10">
                                    <input  type="text"  AutoPostBack="true" OnTextChanged="txt_price_TextChanged" class="form-control" id="txt_price" placeholder=" السعر  " runat="server" >
                                </div>
                            </div>
      <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> نسبه الطبيب  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox  type="text" AutoPostBack="true" OnTextChanged="doc_txt_TextChanged" CssClass="form-control" id="doc_txt" Text="0" placeholder=" الطبيب  " runat="server" ></asp:TextBox>
                                </div>
                            </div>

     <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> نسبه المستشفي  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox   type="text" AutoPostBack="true" OnTextChanged="hos_txt_TextChanged" CssClass="form-control" id="hos_txt" Text="0" placeholder=" المستشفي  " runat="server" ></asp:TextBox>
                                </div>
                            </div>

     </ContentTemplate>

   </asp:UpdatePanel>
                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" runat="server" Text="اضافة" />
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h1 class="heading_title">عرض الحجوزات</h1>
                    


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="t7sel.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                     <div class="form-group">
                                <div class="col-sm-12 left_text">
                                    
                                    <div class="col-md-3 pull-right">
                                        من:<asp:TextBox ID="from1"  TextMode="date"  CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                     <div class="col-md-3 pull-right">
                                        الي:<asp:TextBox ID="to1" TextMode="Date"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                 <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="btnSearch" OnClick="btnSearch_Click"  CssClass="btn btn-primary" Text="بحث" runat="server"></asp:Button>
                                    </div>
                                    <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="Button1" OnClick="Button1_Click"  CssClass="btn btn-primary" Text="طباعه" runat="server"></asp:Button>
                                    </div>
                                    
                                </div>
                            </div>
                    <div class="wrap">
                         <div class="col-md-12">
              
            <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالمريض  ..">
                  <br />

                  <input type="text" name="table_search" id="search2" class="form-control pull-left" onkeyup="myFunction2()" placeholder="بحث بالعياده  ..">
                  <br />
                  <input type="text" name="table_search" id="search3" class="form-control pull-left" onkeyup="myFunction3()" placeholder="بحث بالطبيب  ..">

                </div>
                  </div>
                        </div>
                        <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                 <td> السعر</td>
                                 <td> العياده</td>
                                 <td> الطبيب</td>


                                 <td> التاريخ</td>
                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);


                                 var x = (from p in db.patient_history
                                          join pp in db.clinic_reception
                                          on p.details_id equals pp.id
                                          where p.type=="عيادات"
                                          && p.date>=d &&p.date<dplus&&p.confirm_calc==true
                                          select new { p,pp.type,pp.doctor_name,pp.clinic_name } ).ToList();


                                   if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                      x = (from p in db.patient_history
                                          join pp in db.clinic_reception
                                          on p.details_id equals pp.id
                                          where p.type=="عيادات" && p.date>=d1 &&p.date<=d2&&p.confirm_calc==true

                                          select new { p,pp.type,pp.doctor_name,pp.clinic_name } ).ToList();
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
                                <td><%=item.p.price %></td>
                                <td><%=item.clinic_name %></td>
                                <td><%=item.doctor_name %></td>
                                <td><%Response.Write(Convert.ToDateTime(item.p.date).Day + "/" + Convert.ToDateTime(item.p.date).Month + "/" + Convert.ToDateTime(item.p.date).Year); %></td>
                                <td>
                                    
                                   <a href="t7sel.aspx?id=<%=item.p.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
     
                      </asp:Panel>
        <!--/End Main content container-->

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
                td = tr[i].getElementsByTagName("td")[4];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }


        function myFunction3() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("search3");
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






