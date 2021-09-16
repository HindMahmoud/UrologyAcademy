<%@ Page Title="" Language="C#" MasterPageFile="~/Saavee/Home.Master" AutoEventWireup="true" CodeBehind="patientPay.aspx.cs" Inherits="EccoHospital.Saavee.patientPay" %>


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
                      <%--<li class="bring_right">  <a  class="btn " data-toggle="modal" data-target="#myModal1"> <span class="notifications">اضافه مريض<i class="fa fa-hand-o-up"></i></span></a></li>--%>
                        <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                       
                        <li class="bring_right"><a href=""> سداد</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">تحصيل حسابات مرضي   </h1>


                                     <div runat="server" visible="false" id="success_m" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="patientPay.aspx" class="alert-link">حسناً</a> . </div>
   <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                       <asp:LinkButton Class="btn-xs btn-warning  " visible="false" OnClick="cancel_Click" runat="server" id="cancel"  >لا</asp:LinkButton>
 </div>


                   <div class="content">
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
                                    <asp:DropDownList AutoPostBack="true"  style="width:50%" ID="patientlist" OnSelectedIndexChanged="patientlist_SelectedIndexChanged" ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
                                            
                                        </asp:DropDownList>
                                    </div>
                            </div>


                                 
                           
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> اجمالي التذكره  </label>
                                <div class="col-sm-10">
                                    <input  value="0" readonly="readonly" type="text" style="width:50%" class="form-control" id="txt_total" placeholder=" خدمات  " runat="server" >
                                </div>
                            </div>
    <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">  اجمالي ما تم تحصيله  </label>
                                <div class="col-sm-10">
                                    <input value="0"  readonly="readonly" type="text" style="width:50%" class="form-control" id="txt_payed" placeholder=" سداد  " runat="server" >
                                </div>
                            </div>

     <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">  سداد  </label>
                                <div class="col-sm-10">
                                    <input  type="text" style="width:50%" class="form-control" id="txt_pay" value="0" runat="server" >
                                </div>
                            </div>
    <div class="form-group">
                                <div class="col-sm-6  text-center ">
                                     <asp:Button ID="Button1"  OnClick="Button1_Click" OnClientClick="target ='_blank';" Visible="false" CssClass="btn btn-warning" runat="server" Text="تفاصيل" />
                                    
                                </div>
                            </div>
                            </ContentTemplate>

   </asp:UpdatePanel>

                            <div class="form-group">
                                <div class="col-sm-6  text-center ">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click"  OnClientClick="target ='_blank';" runat="server" Text="سداد" />
                                    
                                </div>
                            </div>
                            
                        </div>
                       </div>
                      <div class="wrap">
                    <table class="table table-bordered" id="mytable">
                        <tr>
                            <td>#</td>

                            <td>الـتــاريــــــــــــخ</td>
                         
                            <td>البيان</td>
                            <td>النوع</td>

                            <td>المبلغ</td>
                            
                            <td>طباعه</td>


                        </tr>
                        <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                            DateTime today = DateTime.Now.Date;
                            DateTime todayplus = today.AddDays(1);
                            var x = (from p in db.savee where  p. date>=today && p.date<todayplus&&  p.p_id != null && p.out_value==0   select p).ToList();

                            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"]))  )
                            {
                                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                //int po = Convert.ToInt32(Request.QueryString["pro"]);

                                x = (from p in db.savee where  p.p_id != null && p.date >= d1 && p.date <=d2 && p.out_value==0 select p).ToList();
                            }

                            if (x != null)
                            {
                                int i = 1;
                                foreach (var item in x)
                                {

                                    DateTime d = DateTime.Parse(item.date.ToString());


                        %>
                        <tr style="text-align: center">
                            <td><%=i %></td>
                            <td><%=d.ToLocalTime() %></td>
                          
                            <td><%=item.title %></td>
                            <td><%=item.type %></td>

                            <td><%=item.in_value %></td>
                          

                        <td> <a href="patientPay.aspx?print=<%=item.id%>" class="glyphicon glyphicon-print" data-toggle="tooltip"
                                       data-placement="top" title="طباعه"></a></td>
                        </tr>
                        <%  i++;
}
    }
                            %>
                    </table>
                    </div>
                    
                  
                </div>
            </div>
        </div>

  
</asp:Content>






