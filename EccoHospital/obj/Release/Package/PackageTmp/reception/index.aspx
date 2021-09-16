<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" Inherits="reception_index" Codebehind="index.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="main_content_container">
         <a href="index.aspx">index.aspx</a>
        <div class="main_container  main_menu_open">
            <!--Start system bath-->
            <div class="home_pass hidden-xs">
                <ul>
                    <li class="bring_right"><span class="glyphicon glyphicon-home "></span></li>
                    <li class="bring_right"><a href="">الصفحة الرئيسية </a></li>

                </ul>
            </div>
            <!--/End system bath-->
            <div class="page_content">


                <!--Start status alert-->
               <div runat="server" visible="false" id="Div1" role="alert" class="alert alert-success"> <strong>تم بنجاح!</strong><br /> <a href="index.aspx" class="alert-link">حسناً</a> . </div>
                <div runat="server" visible="false" id="Div2" role="alert" class="alert alert-danger"> <strong>هل انت متأكد من الحذف ؟</strong>  <asp:LinkButton Class="btn-xs btn-danger  "    Visible="false" OnClick="delbtn_Click" ID="delbtn" runat="server">نعم</asp:LinkButton>
                <asp:LinkButton Class="btn-xs btn-warning  " Visible="false" OnClick="cancel_Click" runat="server" ID="cancel">لا</asp:LinkButton>

                </div>
                       
                <!--/End status alert-->


                <div class="page_content">
                    <div class="page_content">
                         <div>
                        <h1 class="heading_title">عرض الحجوزات</h1>
               
                    <div class="wrap">
                         <div class="col-md-4">
              
            <div class="box-tools">
                 كود المريض
                <asp:TextBox runat="server"  ID="codePat" cssclass="form-control" OnTextChanged="codePat_TextChanged" ></asp:TextBox>
                <br />
                <br />
                </div>
                  </div>
                        </div>
                        <table class="table table-bordered" id="mytable">
                            <tr>
                                <td>#</td>
                               
                                
                                 <td>اسم المريض</td>
                                 <td> الخدمه</td>
                                 <td> السعر</td>
                                <td>الطبيب المعالج</td>
                          <%--       <td> العياده</td>
                                 <td> الطبيب</td>--%>
                               <td> التاريخ</td>
                                <td>بروفايل المريض</td>
                                <td>حذف</td>

                            </tr>
                             <%  EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                                 DateTime d = DateTime.Now.Date;
                                 DateTime dplus = d.AddDays(1);


                                 var x = (from p in db.patient_history
                                          join pp in db.clinic_reception
                                          on p.details_id equals pp.id
                                          where p.type=="عيادات"&& pp.datenow>=d &&pp.datenow<=dplus

                                          select new { p,pp.type,pp.datenow } ).ToList();


                                 if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                                 {
                                     DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                                     DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                                     x = (from p in db.patient_history
                                          join pp in db.clinic_reception
                                          on p.details_id equals pp.id
                                          where p.type=="عيادات" && pp.datenow>=d1 &&pp.datenow<=d2

                                          select new { p,pp.type,pp.datenow } ).ToList();
                                 }

                                 if (x != null)
                                 {
                                     int i = 1;
                                     foreach (var item in x)
                                     {
                                        // var servtype = (from n in db.service where n.id == item.p.service_id select n.serType).FirstOrDefault();

                           %> 
                            <tr>
                                <td><%=i %></td>
                              
                                <td><%=item.p.p_name %></td>
                                <td><%=item.type %></td>
                                <td><%=item.p.price %></td>
                                <td><%=item.p.doc_name %></td>
                               <%-- <td><%=item.clinic_name %></td>
                                <td><%=item.doctor_name %></td>--%>
                                <td><%Response.Write(Convert.ToDateTime(item.datenow).Day + "/" + Convert.ToDateTime(item.datenow).Month + "/" + Convert.ToDateTime(item.datenow).Year); %></td>
                                <td>
                                    
                                   <a href="patprofile.aspx?patid=<%=item.p.p_id%>"data-toggle="tooltip"
                                       data-placement="top" >عرض الملف</a>
                                </td>
                                 <td>
                                    
                                   <a href="index.aspx?id=<%=item.p.id%>" style="color:darkred" class="glyphicon glyphicon-remove" data-toggle="tooltip"
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
        </div>

</asp:Content>

