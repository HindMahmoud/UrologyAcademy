<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="DoctorVisit.aspx.cs" Inherits="EccoHospital.reception.DoctorVisit" %>







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
    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                      <li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href="">  مرور الاطباء</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">  مرور الاطباء</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="DoctorVisit.aspx" class="alert-link">حسناً</a> . </div>
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
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الكود </label>
                                <div class="col-sm-10">
                                    <%--<input required type="text" class="form-control" id="txt_code" placeholder="الكود " runat="server" >--%>
                                    <asp:TextBox ID="txt_code" placeholder="الكود " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
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
             أسم الطبيب   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="docList" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>

                           
      <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> سعر المرور  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox  type="text"   CssClass="form-control" id="txt_price" Text="0" placeholder=" السعر  " runat="server" > </asp:TextBox>
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
                        <h1 class="heading_title">عرض المرور</h1>
                    


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="DoctorVisit.aspx" class="alert-link">حسناً</a> . </div>
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
                                   <%-- <div class="col-md-1 pull-right">
                                       <br /><asp:Button ID="Button1" OnClick="Button1_Click"  CssClass="btn btn-primary" Text="طباعه" runat="server"></asp:Button>
                                    </div>--%>
                                    
                                </div>
                            </div>
                    <div class="wrap">
                         <div class="col-md-12">
              
            <div class="box-tools">
                  <br />
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-left" onkeyup="myFunction1()" placeholder="بحث بالمريض  ..">
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
                                 
                                 <td> الطبيب</td>
                                

                                 <td> التاريخ</td>
                                <td> اسم المستخدم</td>
                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);


                                 var x = (from p in db.patient_history
                                         
                                          where p.type=="مرور"
                                        
                                          select  p ).OrderByDescending(a=>a.id).ToList().Take(40);


                                   if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                      x = (from p in db.patient_history
                                         
                                          where p.type=="مرور"  && p.date>=d1 &&p.date<=d2

                                          select p ).OrderByDescending(a=>a.id).ToList().Take(40);
                                 }

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p_name %></td>
                                <td><%=item.service_name %></td>
                                <td><%=item.price %></td>
                               
                                <td><%=item.doc_name %></td>

                                

                                <td><%Response.Write(Convert.ToDateTime(item.date).Day + "/" + Convert.ToDateTime(item.date).Month + "/" + Convert.ToDateTime(item.date).Year); %></td>
                               <td><%=item.user_name %></td>


                                
                                <td>
                                    
                                   <a href="DoctorVisit.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
                                                        <div class="modal-content bg-blue-gradient">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">اضافه مريض</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row box box-group bg-info ">
                                <div class="col-md-12 ">
                                    <h3> البيانات الشخصية</h3>
                                   
                                   
                                  
                                   
                                     <div class="col-md-3 pull-right">
                                        اسم المريض:
                        <asp:TextBox placeholder="الاسم " ToolTip="الاسم " CssClass="form-control" ID="name1" runat="server"></asp:TextBox>
                                        
                                    </div>
                               
                                <div class="col-md-3 pull-right">
                                   
                                    نوع المريض:
                       <asp:DropDownList   ID="type" ClientIDMode="Static" AppendDataBoundItems="true" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server" >
                           
                           
                           <asp:ListItem>داخلى</asp:ListItem>

                           

                       </asp:DropDownList>
                                   
                                    
                                </div>
                          <div class="col-md-3 pull-right">
                                    
                                    النوع :
                       <asp:DropDownList   ID="gender" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>ذكر</asp:ListItem>

                           <asp:ListItem>أنثى</asp:ListItem>

                       </asp:DropDownList>
                                   
                                    
                                </div>

                                
                                      <div class="col-md-3 pull-right">
                                         السن :
            <asp:TextBox ID="age" CssClass="form-control" runat="server"></asp:TextBox>
                                    
                                    
                                </div>

<div class="clearfix"></div>
                                <div class="col-md-3 pull-right">
                                    الجنسيه:
            <asp:TextBox CssClass="form-control" ID="nationalty" Text="مصرى" runat="server"></asp:TextBox>
                                    
                                </div>
                               <div class="col-md-3 pull-right">
                                    رقم التليفون  :
           <asp:TextBox CssClass="form-control" ID="mob" runat="server"></asp:TextBox>
                                    
                                </div>
                                     <div class="col-md-3 pull-right">
                                    
                                    المحافظة :
                       <asp:DropDownList   ID="gov" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>القاهرة</asp:ListItem>

                           <asp:ListItem>الاسكندرية</asp:ListItem>
                           <asp:ListItem>المنيا</asp:ListItem>

                           <asp:ListItem>اسيوط</asp:ListItem>
                           <asp:ListItem>سوهاج</asp:ListItem>
                           <asp:ListItem>الاقصر</asp:ListItem>
                           <asp:ListItem>قنا</asp:ListItem>
                           <asp:ListItem>اسوان</asp:ListItem>

                       </asp:DropDownList>
                                   
                                    
                                </div>
 <div class="col-md-3 pull-right">
                                    
                                    المدينة :
                   
              <asp:TextBox CssClass="form-control" ID="city" runat="server"></asp:TextBox>
                                   
                                    
                                </div>

                                     <div class="col-md-3 pull-right">
                                    العنوان  :
              <asp:TextBox CssClass="form-control" ID="address" runat="server"></asp:TextBox>
                                    
                                </div>
                                <div class="col-md-3 pull-right">
                                     رقم البطاقة :
              <asp:TextBox CssClass="form-control" ID="ssi_st" runat="server"></asp:TextBox>
                                    
                                   
                                </div>
                                       <div class="col-md-3 pull-right">
                                    
                                    الحالة الاجتماعية :
                       <asp:DropDownList   ID="social" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>
                           
                           <asp:ListItem>أعزب</asp:ListItem>

                           <asp:ListItem>متزوج</asp:ListItem>

                       </asp:DropDownList>
                                   
                                  
                                </div>
                                      <div class="col-md-3 pull-right">
                                    الوظيفه  :
           <asp:TextBox CssClass="form-control" ID="job" runat="server"></asp:TextBox>
                                   
                                </div>
                                
                                    </div>
                               
                                    <div class="col-md-3">
                                        <br />
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click"  CssClass="btn btn-primary" runat="server" Text=" حفظ  " /><br />
                                        <br />
                                    </div>
                                   
                        
                            </div>
                                                                </div>

                                                            <div class="modal-footer">

                                                               
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">اغلاق</button>
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






