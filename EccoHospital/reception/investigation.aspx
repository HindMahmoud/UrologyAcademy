<%@ Page Language="C#" AutoEventWireup="true" masterPageFile="~/reception/MasterPage.master" CodeBehind="investigation.aspx.cs" Inherits="EccoHospital.reception.investigation" %>
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
    <style>
        .t {
        text-align:left;
        color:darkgreen
        }
        .form-control1 {
         
    font-size: 14px;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
     
      
      }
        .textarea2 {
          height:100px;
              display: block;
    width: 100%;
   
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
     
      
      }


        input[type='checkbox'] {
            width: 30px;
            height: 30px;
            border-radius: 5px;
            border: 2px solid #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
       <%
         EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
         int y = 0;
         if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["surg_id"])))
         {
             y = int.Parse(Request.QueryString["surg_id"].ToString());
         }
             %>
 <div class="page_content" style="margin-right:29%;width:68%;margin-bottom:20px">
    <div class="row box box-success text-bold" style="direction:ltr;">
          <br />
             <br />
              <a href="SurgeryResrv.aspx?surg_id=<%=y %>"  class="pull-left alert-info fa-2x"> Back to Previous page  <i class="fa  fa-arrow-circle-o-left text-blue"></i></a>
             <br />
             <br />
       <h2 class="text-success" style="font-size:larger; font-family:'Comic Sans MS'"> Investigation</h2>
        <br /> <br />
      
        <div class="col-md-12" style="border-radius:12px;border-left:1px solid aqua;border-right:1px solid aqua;">
           <div class="col-md-12">
                  <label>Operation date: </label><label runat="server" id="dalbl" style="font-size:18px"></label>
              </div> 
            <div class="col-md-6">
                  <label> Treatment + instruction:</label><asp:TextBox runat="server" ID="tret" CssClass="textarea2" TextMode="MultiLine" />
              </div>
             <div class="col-md-12">
                  <label> Previous Operation:</label><asp:TextBox runat="server" ID="operations" CssClass="textarea2" TextMode="MultiLine" />
              </div>
            
        <div class="col-md-12">
           <label> Operation descreption:</label>
            <asp:TextBox TextMode="MultiLine" CssClass=" textarea2" ID="desctxt" runat="server"></asp:TextBox>
        </div>


                <div class="col-md-12">
              <h2 class="alert-info text-center">  استخدام أجهزة علاجية داخل العملية</h2>
                              <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text">
            اسم الجهاز   </label>

                                <div class="col-sm-10">
                             
                             <asp:ListBox ID="dd"   SelectionMode="Multiple" ToolTip="select" CssClass="form-control select2 js-example-placeholder-single " AutoPostBack="true" OnSelectedIndexChanged="dd_SelectedIndexChanged"  runat="server" >
                                
                             </asp:ListBox>
                             </div>
              </div>

                    <br />
                    <br />
                                 <div class="form-group">
                                <label for="input0" class="col-sm-2 control-label bring_right left_text"> السعر  </label>
                                <div class="col-sm-10">
                                    <input  type="text" class="form-control" id="txt_price" placeholder=" السعر  " runat="server" >
                                </div>
                            </div>



        <div class="col-md-12">
          <table class="table y1">
              <thead>
                  <tr><td></td><td></td></tr>
                  <tr>
                      <td><label class="t">Drains</label></td>
                      <td><asp:TextBox runat="server" ID="dratxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Tubes</label></td>
                      <td><asp:TextBox runat="server" ID="Tubestxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Stitches</label></td>
                      <td><asp:TextBox runat="server" ID="stitxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Dressing</label></td>
                      <td><asp:TextBox runat="server" ID="dresstxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Stints</label></td>
                      <td><asp:TextBox runat="server" ID="Stuitstxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Catheter</label></td>
                      <td><asp:TextBox runat="server" ID="cathertxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                   <tr>
                      <td><label class="t">Prosthetic limbs</label></td>
                      <td><asp:TextBox runat="server" ID="proctxt" CssClass="form-control"></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td><label class="t">other investigation</label></td>
                      <td><asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"></asp:TextBox></td>
                  </tr>
              </thead>
                                <tr><td></td><td></td></tr>

          </table>
             </div>
            
    
        <div class="col-md-12" style="text-align:center;margin-left:396px;margin-bottom:20px">
            
            <asp:Button ID="btn_add" OnClick="btn_add_Click"  CssClass="btn btn-success btn-lg pull-left" runat="server" Text="Save " />
        <br /> 
            <br />
        </div>
     
    </div>

      </div>
        </div>
 
    <script>

        $('#da').daterangepicker({
            "singleDatePicker": true,
            "showDropdowns": true,
            "timePicker": true,
            "timePickerIncrement": 5,
            "autoApply": true,

            "locale": {
                "format": "YYYY/MM/DD"

            }
        });
    </script>
</asp:Content>
