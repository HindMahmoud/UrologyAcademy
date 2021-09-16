<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" Inherits="reception_p_history" Codebehind="p_history.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main_content_container">
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الاستقبال</a></li>

                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">

                <h1 class="heading_title">    التاريخ المرضى  </h1>


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success">
                    <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton CssClass="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                    
                </div>
                <div runat="server" visible="false" id="danger_m" role="alert" class="alert alert-danger">
                    <strong>هل انت متأكد من الحذف</strong>
                    <%--  <asp:linkbutton class="btn-xs btn-danger  " visible="false" onclick="delbtn_Click" id="delbtn" runat="server">نعم</asp:linkbutton>
                    <asp:linkbutton class="btn-xs btn-warning  " visible="false" onclick="cancel_Click" runat="server" id="cancel">لا</asp:linkbutton>
                    --%>
                </div>
                <!--/End status alert-->


                <div class="form">
                    <div class="form-horizontal">
                        <div class="rtl bg-danger text-red">
                            <asp:ValidationSummary ValidationGroup="a" runat="server"
                                HeaderText="برجاء مراجعه المدخلات:" />
                            <asp:ValidationSummary ValidationGroup="b" runat="server"
                                HeaderText="برجاء مراجعه المدخلات:" />

                        </div>

                        <div class="col-xs-12">

  
                            <div class="col-xs-12 pull-right table-bordered">

                                 <div class="col-xs-12 pull-right ">
                                    <div class="col-xs-3 pull-right">

                                        <label for="middle-name" class="control-label hidden-print">كود المريض  :</label>
                                        <div>


                                            <asp:TextBox ID="txt_code" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator1"
                                                ControlToValidate="txt_code" runat="server"
                                                ErrorMessage="خطأ في ادخال الكود"
                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                            </asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidatorp" ControlToValidate="txt_code" ErrorMessage="ادخل الكود ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 pull-right">


                                        <label for="middle-name" class="control-label hidden-print">اسم المريض :</label>

                                         <asp:TextBox ID="pName" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                        <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator9" ControlToValidate="pName" ErrorMessage="ادخل اسم المريض  ">
                                        </asp:RequiredFieldValidator>
                                                  </div>
                                  
                  
                                </div>
                               <div class="col-xs-6 pull-left">

                                        <label for="middle-name" class="control-label hidden-print"> الى    :</label>
                                        <div>


                                            <asp:TextBox ID="fromd" TextMode="Date" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                          
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator6" ControlToValidate="fromd" ErrorMessage="ادخل تاريخ من ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                 <div class="col-xs-6 pull-left">

                                        <label for="middle-name" class="control-label hidden-print"> الى    :</label>
                                        <div>


                                            <asp:TextBox ID="to" TextMode="Date" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                          
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="to" ErrorMessage="ادخل تاريخ الى ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                            
                                 <div class="col-xs-12 pull-right">
                                <br />
                                <br />

                                <asp:Button CssClass="btn btn-success "  ValidationGroup="b" ID="Button1" runat="server" Text="حفظ   " />
                                <%--<asp:Button CssClass="btn btn-primary " ValidationGroup="b" ID="print" runat="server" Text="طباعة   " />--%>
                              
                                   <br />
                                <br />

                            </div>
                            </div>
                            <div class="col-xs-12 table-bordered">

                                <div class="col-lg-6 pull-right ">
                                    <h4>الخدمات</h4>
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable">
                                             <%  
   EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
   
    if (txt_code.Text != "")
    {
                                                     int zz =int.Parse(txt_code.Text);
        var x = (from ss in db.patient_history where ss.id == zz   select ss).ToList();
       
        
        if (x != null)
        {

                       %>
                                        <tr class="bg-info">

                                            <th>#</th>

                                            <th>اسم المريض  </th>


                                           
                                            <th>الخدمة  </th>
                                            <th>نوع الخدمة</th>
                                            <th>السعر  </th>
                                            <th>التاريخ  </th>
                                             <th>اسم المسنخدم  </th>

                                           
                                        </tr>
                                          <%
    
    int i = 1;

    foreach (var item in x)
    {
       
        DateTime d1 = Convert.ToDateTime(item.date);
                           %> 

                                        <tr>
                                            <td><%=i %></td>
                                            <td><%=item.p_name %></td>
                                              

                                            <td><%=item.service_name %></td>
                                            <td><%=item.type %></td>
                                            <td><%=item.price %></td>

                                            <td><%=d1.ToString("dd/MM/YYYY") %></td>
                                            <td><%=item.user_name %></td>



                                                       </tr>
                                                    <% i++;

            }
        }
    }%>
                                    </table>
                                    <br />
                                    <br />
                                         <div class="col-xs-3 pull-left">

                                        <label for="middle-name" class="control-label hidden-print">الاجمالى   :</label>
                                        <div>


                                            <asp:TextBox ID="total1" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator2"
                                                ControlToValidate="total1" runat="server"
                                                ErrorMessage="خطأ في ادخال الاجمالى"
                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                            </asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator1" ControlToValidate="total1" ErrorMessage="ادخل الاجمالى ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                   <div class="col-lg-6 ">
                                       <h4>الادوية</h4>
                                    <br />

                                    <table class="table table-hover table-bordered" id="mytable2">
                                             <%  

   
    if (txt_code.Text != "")
    {
                                                    int zz =int.Parse(txt_code.Text);
        var x = (from ss in db.patient_history where ss.id == zz   select ss).ToList();
       
        
        if (x != null)
        {

                       %>
                                        <tr class="bg-info">

                                            <th>#</th>

                                            <th>اسم المريض  </th>


                                            <th>اسم العلاج  </th>

                                            <th>السعر  </th>
                                          
                                           
                                        </tr>
                                          <%
    
    int i = 1;

    foreach (var item in x)
    {
       
        DateTime d1 = Convert.ToDateTime(item.date);
                           %> 

                                        <tr>
                                            <td><%=i %></td>
                                            <td><%=item.p_name %></td>
                                            
                                            <td><%=item.service_name %></td>
                                            <td><%=item.price %></td>

                                           


                                                       </tr>
                                                    <% i++;

            }
        }
    }%>
                                    </table>
                                    <br />
                                    <br />
                                       <div class="col-xs-3 pull-left">

                                        <label for="middle-name" class="control-label hidden-print">الاجمالى   :</label>
                                        <div>


                                            <asp:TextBox ID="total2" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator3"
                                                ControlToValidate="total2" runat="server"
                                                ErrorMessage="خطأ في ادخال الاجمالى"
                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                            </asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator2" ControlToValidate="total2" ErrorMessage="ادخل الاجمالى ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                            </div>
                            <div class="col-xs-12 table-bordered" style="background-color:pink">

                             <div class="col-xs-12 pull-left">

                                        <label for="middle-name" class="control-label hidden-print">الاجمالى   :</label>
                                        <div>


                                            <asp:TextBox ID="TextBox1" Width="50%" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator4"
                                                ControlToValidate="total1" runat="server"
                                                ErrorMessage="خطأ في ادخال الاجمالى"
                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                            </asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator3" ControlToValidate="total1" ErrorMessage="ادخل الاجمالى ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                 <div class="col-xs-12 pull-left">

                                        <label for="middle-name" class="control-label hidden-print">مبلغ التأمين   :</label>
                                        <div>


                                            <asp:TextBox ID="taameen" Width="50%" AutoPostBack="true" OnTextChanged="txt_code_TextChanged" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="b" CssClass="text-red" ID="RegularExpressionValidator5"
                                                ControlToValidate="taameen" runat="server"
                                                ErrorMessage="خطأ في ادخال التأمين"
                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$">
                                            </asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator4" ControlToValidate="taameen" ErrorMessage="ادخل التأمين ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

