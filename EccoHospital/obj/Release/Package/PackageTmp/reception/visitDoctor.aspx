<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" Inherits="reception_visitDoctor" Codebehind="visitDoctor.aspx.cs" %>

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

                <h1 class="heading_title">زيارة دكتور  لمريض  </h1>


                <!--Start status alert-->
                <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success">
                    <strong>تم بنجاح!</strong>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <asp:linkbutton class="btn-xs btn-success  "  onclick="reload_Click" id="reload" runat="server">حسناُ</asp:linkbutton>

                    
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
                                <div class="col-xs-12 pull-right ">
                                    <div class="col-xs-3 pull-right">

                                        <label for="middle-name" class="control-label hidden-print">اسم الدكتور  :</label>
                                        <div>


                                           <asp:DropDownList  AutoPostBack="true" OnSelectedIndexChanged="doc_SelectedIndexChanged"  ID="doc" ClientIDMode="Static" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                           <asp:ListItem></asp:ListItem>

                         

                       </asp:DropDownList>
                                             <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="doc" ErrorMessage="ادخل اسم الدكتور ">
                                        </asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                 
                                                     <div class="col-xs-3 pull-right">

                                        <label for="middle-name" class="control-label hidden-print">السعر    :</label>
                                        <div>


                                            <asp:TextBox ID="price" CssClass="form-control" runat="server"></asp:TextBox>
                                            
                                            <%-- <asp:RequiredFieldValidator
                                            CssClass="text-red text-bold list-group-item-text" runat="server" ValidationGroup='b' ID="RequiredFieldValidator5" ControlToValidate="txt_barcode" ErrorMessage="ادخل الباركود ">
                                        </asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                           <%--         <div class="col-xs-3 pull-right">
                                        <br />

                                        <asp:Button CssClass="btn btn-success " ValidationGroup="b" ID="btn_add" runat="server" Text="اضافة  " />
                                        <br />
                                        <br />

                                    </div>--%>
                                    
                                </div>
                               
                                 <div class="col-xs-12 pull-right">
                                <br />
                                <br />

                                <asp:Button CssClass="btn btn-success " OnClick="Button1_Click" ValidationGroup="b" ID="Button1" runat="server" Text="حفظ   " />
                                <%--<asp:Button CssClass="btn btn-primary " ValidationGroup="b" ID="print" runat="server" Text="طباعة   " />--%>
                              
                                   <br />
                                <br />

                            </div>
                            </div>
                            <div class="col-xs-12">

                                <div class="col-lg-12 ">
                                    <br />

                                    <%--<table class="table table-hover table-bordered" id="mytable">
                                             <%  
    EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
    DateTime d = new DateTime(DateTime.Now.Year, 6, 1);
    DateTime dd = new DateTime(DateTime.Now.Year + 1, 6, 1);
    //  string m = Request.QueryString["m"];

    //DateTime f = Convert.ToDateTime(from1.Text);
    //DateTime f2 = f.AddMonths(1);
    if (txt_code.Text != "")
    {
                                                     int zz =int.Parse(txt_code.Text);
        var x = (from ss in db.patient_history where  ss.p_code == zz &&ss.type=="visit"   select ss).ToList();
       
        
        if (x != null)
        {

                       %>
                                        <tr class="bg-info">

                                            <th>#</th>

                                            <th>اسم الدكتور  </th>


                                            <th>سعر الزيارة </th>

                                            <th>كود المريض </th>
                                            <th>اسم المريض </th>
                                            <th>التاريخ  </th>


                                           
                                        </tr>
                                          <%
    
    int i = 1;

    foreach (var item in x)
    {
       
        DateTime d1 = Convert.ToDateTime(item.date);
                           %> 

                                        <tr>
                                            <td><%=i %></td>
                                            <td><%=item.doc_name %></td>
                                              <td><%=item.price %></td>
                                            <td><%=item.p_code %></td>
                                            <td><%=item.p_name %></td>

                                            <td><%=d1.ToShortDateString() %></td>



                                                       </tr>
                                                    <% i++;

            }
        }
    }%>
                                    </table>--%>
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

