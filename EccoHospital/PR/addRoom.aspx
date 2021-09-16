<%@ Page Title="" Language="C#" MasterPageFile="~/PR/MasterPage.master" AutoEventWireup="true" CodeBehind="addRoom.aspx.cs" Inherits="EccoHospital.PR.addRoom" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="main_content_container">
            <div class="main_container  main_menu_open">
                <!--Start system bath-->
                <div class="home_pass hidden-xs">
                    <ul>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                        <li class="bring_right"><a href="">إدارة الغرف </a></li>
                        <li class="bring_right"><a href="">إضافة غرفه جديده</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">إضافة غرفه جديده</h1>


                    <!--Start status alert-->
                    <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addRoom.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger"> <strong>خطأ!</strong> لم يتم الحفظ. </div>
                    <!--/End status alert-->


                    <div class="form">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">أسم الغرفه </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_name" placeholder="أسم الغرفه " runat="server" >
                                </div>
                            </div>
                              
                            <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">الطابق  </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_floor" placeholder="الطابق  " runat="server" >
                                </div>
                            </div>
                           
                             

                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> نوع الغرفه </label>
                                <div class="col-sm-10">
                                    <asp:DropDownList ID="drp_type" CssClass="form-control" runat="server">
                                        
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>أقامه</asp:ListItem>
                                        <asp:ListItem>حضانه</asp:ListItem>
                                        <asp:ListItem>عنايه</asp:ListItem>
                                        <asp:ListItem>عمليات</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>

                                <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">  سعر اليوم </label>
                                <div class="col-sm-10">
                                    <input required type="text" class="form-control" id="txt_price" placeholder="سعر اليوم   " runat="server" >
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
                        <h1 class="heading_title">عرض كل الغرف</h1>
                    
                    <!--Start status alert-->
                    <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="addRoom.aspx" class="alert-link">حسناً</a> . </div>
                    <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>
                    <!--/End status alert-->
                      <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="print" CssClass="btn btn-success" OnClick="print_Click" runat="server" Text="طباعة" />
                
                                    <%--<button type="reset" class="btn btn-default">مسح الحقول</button>--%>
                                </div>
                            </div>
                    <div class="wrap">
                        <table class="table table-bordered">
                            <tr>
                                <td>#</td>
                               
                                <td>أسم الغرفه</td>
                                 <td>الطابق </td>
                                 <td> نوع الغرفه </td>
                                 <td>  سعر اليوم</td>
                                <td>  اسم المستخدم</td>
                                 <td>  </td>


                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 var x = (from p in db.room 


                                          select p).ToList();

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {


                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.name %></td>
                                <td><%=item.floor %></td>
                                <td><%=item.type %></td>
                                <td><%=item.price %></td>
                                <td><%=item.user_name %></td>
                                <% if(item.flag==true){%>
                                <td><a href="addRoom.aspx?r_id=<%=item.id%>"> تفريغ</a></td>
                               <% }else{%><td></td><%} %>
                                

                                 
                                <td>
                                    <a href="addRoom.aspx?edit=<%=item.id%>" class="glyphicon glyphicon-pencil" data-toggle="tooltip"
                                       data-placement="top" title="تعديل"></a>
                                   <%-- <a href="all_labs.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                          data-placement="top" title="طباعة"></a>
                               --%>     <a href="addRoom.aspx?id=<%=item.id%>" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
        <!--/End Main content container-->
</asp:Content>






