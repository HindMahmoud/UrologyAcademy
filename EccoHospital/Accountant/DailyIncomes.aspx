<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Home.Master" AutoEventWireup="true" CodeBehind="DailyIncomes.aspx.cs" Inherits="EccoHospital.Accountant.DailyIncomes" %>

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
                        <li class="bring_right"><a href="">إدارة الحسابات</a></li>
                        <li class="bring_right"><a href="">تسليم ايراد يومي</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">إيراد يومي</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="DailyIncomes.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            
                              
                             <div class="form-group">
                     
                                   <label for="input0" class="col-sm-2 control-label bring_right left_text">البند </label>

                                <div class="col-sm-10">
                                        <asp:DropDownList  ID="ddlincome" OnSelectedIndexChanged="ddlincome_SelectedIndexChanged" AutoPostBack="true" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server"> 
                                            <asp:ListItem></asp:ListItem> 
                                            <asp:ListItem Value="save">خزنه</asp:ListItem>   
                                            <asp:ListItem Value="pharmacy">صيدليه</asp:ListItem>   
                                            <asp:ListItem Value="cafe">كافتيريا</asp:ListItem>   
                                            <asp:ListItem Value="dental">الاسنان</asp:ListItem>   


                                              
                                        </asp:DropDownList>
                                     </div>
                                        
                                       </div>

                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">المبلغ </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" placeholder="المبلغ " runat="server" >
                                </div>
                            </div>
                            <div class="form-group"  id ="div4" runat="server" visible="false">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
             أسم الطبيب   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="docList" CssClass="form-control js-example-placeholder-single select2" runat="server" ></asp:DropDownList>
                                    </div>
              </div>
                            <div class="form-group" id ="div5" runat="server" visible="false">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> نسبه الطبيب  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox  type="text"  AutoPostBack="true" OnTextChanged="doc_txt_TextChanged" CssClass="form-control" id="doc_txt" Text="0" placeholder=" الطبيب  " runat="server" ></asp:TextBox>
                                </div>
                            </div>

     <div class="form-group" id ="div6" runat="server" visible="false">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> نسبه المستشفي  </label>
                                <div class="col-sm-10">
                                    <asp:TextBox   type="text" AutoPostBack="true" OnTextChanged="hos_txt_TextChanged" CssClass="form-control" id="hos_txt" Text="0" placeholder=" المستشفي  " runat="server" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">التاريخ </label>
                                <div class="col-sm-10">
                                    <asp:TextBox   CssClass="form-control" id="txt_date"  TextMode="DateTimeLocal" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">ملاحظات </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_notes" placeholder="ملاحظات " runat="server" >
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
                        <div class="form-horizontal">
                    <div class="col-lg-12" dir="rtl">

                      <div class="col-lg-2 " style="align-self:right">
                       <br />
            <asp:Button CssClass="btn btn-primary " OnClick="show_Click" ID="show" runat="server" Text="عرض" />
              
               
                    </div>
                        
                    <div class="col-lg-5" style="align-self:left">

                 
                                 الي
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="to1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator1" controltovalidate="to1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>

                       </div>
                        <div class="col-lg-5" style="align-self:right" >

                   
                              من
                    <asp:textbox textmode="date" validationgroup='a' cssclass="form-control" id="from1" clientidmode="Static" runat="server"></asp:textbox>

                            <asp:requiredfieldvalidator
                                cssclass="text-red text-bold list-group-item-text" runat="server" validationgroup='a' id="RequiredFieldValidator4" controltovalidate="from1" errormessage="ادخل تاريخ  ">
                        </asp:requiredfieldvalidator>
                           </div>
                        
                </div>
                            </div>
                        <br />
                        <h1 class="heading_title">عرض كل الايرادات</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addService.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>البند</td>
                                 <td>المبلغ</td>
                                 <td>التاريخ</td>
                                 <td>ملاحظات</td>
                                 <td>المستخدم</td>

                                <td></td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.Acc_save
                                          where  (p.type=="خزنه"||p.type=="كافتيريا"||p.type=="صيدليه"||p.type=="الاسنان")


                                          select p).ToList();
                                 if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                      x = (from p in db.Acc_save
                                          where  (p.type=="خزنه"||p.type=="كافتيريا"||p.type=="صيدليه"||p.type=="الاسنان")
                                          && p.date>=d1&&p.date<d2

                                          select p).ToList();
                                 }

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {
                                         // DateTime dt = Convert.ToDateTime(item.date.ToString());

                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.type %></td>
                                <td><%=item.in_value %></td>
                                <td><%=item.date %></td>
                                <td><%=item.notes %></td>
                                <td><%=item.user_name %></td>



                                 <%
                                     if (Session["role"].ToString() == "Financial Manager" || Session["role"].ToString() == "Admin")
                                     {
                                     %>
                                 
                                <td>
                                   
                                  <a href="DailyIncomes.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
                                       data-placement="top" title="حذف"></a>
                                </td>
                                <%} %>
                            </tr>
                              <%  i++;}
    }%>
                           
                        </table>

                    </div>

                    </div>
                </div>
            </div>
        </div>
        <!--/End Main content container-->
</asp:Content>






