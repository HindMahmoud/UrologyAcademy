<%@ Page Language="C#"  MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="AddBank.aspx.cs" Inherits="EccoHospital.Accountant.AddBank" %>


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
                        <li class="bring_right"><a href="">البنك اضافه بنك</a></li>
                        <li class="bring_right"><a href="">إضافة بنك جديد</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">إضافة بنك جديد</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم الحفظ بنجاح!</strong><br /> <a href="AddBank.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">اسم البنك </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="nametxt" placeholder="اسم البنك " runat="server" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">رقم  الحساب </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="acc_no" placeholder="رقم الحساب  " runat="server" >
                                </div>
                            </div>
                        
                            <div class="form-group">
                                <label for="input3" class="col-sm-2   control-label bring_right left_text">الرصيد الافتتاحي</label>
                                <div class="col-sm-10">
                                    <input  type="text" value="0"  class ="form-control" id="balancetxt" placeholder="الرصيد الافتتاحي" runat="server">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-sm-12 ">
                                     <asp:Button ID="btn" CssClass="btn btn-success center-block" OnClick="btn_Click" runat="server" Text="اضافة" />
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="wrap">

                        <div class="box bg-info ">
              

             
                <div class="row center-block" >
                    <span>بحث:</span>
                   <div class="col-md-3"   ><input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="الاسم.."></div>
                  

                </div>
              
            </div>
                        <table id="mytable" class="table table-bordered ">
                            <tr style="background-color:honeydew" >
                                <th >#</th>
                               
                                <th>الاســـــــــــــــــــم</th>
                                <th>رقم الحساب</th>

                            

                                <th></th>
                               

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.bank select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
              <td><a href="BankBalance.aspx?id=<%=item.id %>"><%=item.name %></a></td>
                                <td><%=item.account_num %></td>
                               
                           
                               

                                 
                                <td>
                                    <a href="AddBank.aspx?edit=<%=item.id%>" class="fa  fa-edit " data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                    
                                </td>
                                <%--<td><a href="AllReps.aspx?id=<%=item.id%>" class="fa fa-trash text-danger" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a></td>--%>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>
                </div>
            </div>
        
</asp:Content>

