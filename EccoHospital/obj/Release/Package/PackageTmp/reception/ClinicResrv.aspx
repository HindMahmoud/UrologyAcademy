<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.Master" AutoEventWireup="true" CodeBehind="ClinicResrv.aspx.cs" Inherits="EccoHospital.saavee.ClinicResrv" %>


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
                       
                        <li class="bring_right"><a href="#">حجز جديد</a></li>
                    </ul>
                </div>
                <!--/End system bath-->
                <div class="page_content">

                    <h1 class="heading_title">حجز جديد</h1>


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
         
      <!--Start status alert-->
                       </div>
                      <div class="form-group col-md-12">
                                <label for="input0" class=" col-sm-4 control-label bring_right left_text">كود المريض </label>
                                <div >
                                    
                                    <asp:TextBox ID="txt_code" placeholder="كود المريض  " AutoPostBack="true" OnTextChanged="txt_code_TextChanged" runat="server"></asp:TextBox>
                               
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
             نوع الخدمه    </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ReceptionType" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true" OnTextChanged="ReceptionType_TextChanged" OnSelectedIndexChanged="ReceptionType_SelectedIndexChanged">
             </asp:DropDownList>
                                    
                                    </div>
              </div>
    <div class="form-group">
         <label for="input0" class="col-sm-2 control-label bring_right left_text"> السعر  </label>
                                     <div class="col-sm-10">
                                    <input  type="text"  AutoPostBack="true" OnTextChanged="txt_price_TextChanged" class="form-control" id="txt_price" placeholder=" السعر  " runat="server" >
                                </div>
        </div>
     <div class="form-group">
                               
                        
                              <label for="input0" class="col-sm-2 control-label bring_right left_text"> التاريخ  </label>
                               <div class="col-sm-10">
                                <asp:TextBox  type="Date" AutoPostBack="true"  CssClass="form-control" id="datee"   runat="server" ></asp:TextBox>
                          
                               </div>
                        
                            
     </div>
     <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
            اسم الطبيب   </label>

                                <div class="col-sm-10">

             <asp:DropDownList ID="ddldoctors" OnSelectedIndexChanged="ddldoctors_SelectedIndexChanged" CssClass="form-control js-example-placeholder-single select2" runat="server" AutoPostBack="true">
             </asp:DropDownList>
                                    
                                    </div>
              </div>
    <div class="form-group">
                                
        </div>
      

     <div class="form-group">
                                <div class="col-sm-6">
                                    <label for="input0" class="col-sm-2 control-label bring_right left_text">  المستشفي  </label>
                                
                                    <asp:TextBox   type="text" AutoPostBack="true" OnTextChanged="hos_txt_TextChanged" CssClass="form-control" id="hos_txt" Text="0" placeholder=" المستشفي  " runat="server" ></asp:TextBox>
                                </div>
         <div class="col-sm-6">
                              <label for="input0" class="col-sm-2 control-label bring_right left_text"> الصيانة   </label>
                                    <asp:TextBox   type="text"   CssClass="form-control" id="mainttxt" Text="0" placeholder=" الصيانة  " runat="server" OnTextChanged="mainttxt_TextChanged" ></asp:TextBox>
                                </div>
         </div>
      
             <div class="form-group">
                 <div class="col-sm-6">
                                     <label for="input0" class="col-sm-2 control-label bring_right left_text"> الوحدة  </label>
                               <asp:TextBox   type="text"  CssClass="form-control" id="unittxt" Text="0" placeholder=" الوحدة  " runat="server" ></asp:TextBox>
                                </div>
                            <div class="col-sm-6">
                                 <label for="input0" class="col-sm-2 control-label bring_right left_text">  الطبيب   </label>
                               <asp:TextBox  type="text" AutoPostBack="true" OnTextChanged="doc_txt_TextChanged" CssClass="form-control" id="doc_txt" Text="0" placeholder=" الطبيب  " runat="server" ></asp:TextBox>
                                </div>
                                
                  </div>
    
     </div>

     </ContentTemplate>

   </asp:UpdatePanel>
                            <div class="form-group">
                                <div class="col-sm-12 left_text">
                                     <asp:Button ID="btn" CssClass="btn btn-success" OnClick="btn_Click" OnClientClick="target='_blank;'" runat="server" Text="اضافة" />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
    
    
   
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






