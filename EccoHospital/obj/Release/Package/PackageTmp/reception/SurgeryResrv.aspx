<%@ Page Title="" Language="C#" MasterPageFile="~/reception/MasterPage.master" AutoEventWireup="true" CodeBehind="SurgeryResrv.aspx.cs" Inherits="EccoHospital.reception.SurgeryResrv" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
  <style>
      input[type='checkbox'] {
   
    width:30px;
    height:30px;
   
    border-radius:5px;
    border:2px solid #555;
}
       .y1 input[type='checkbox'] {
   
    width:15px;
    height:15px;
   
    border-radius:5px;
    border:2px solid #555;
}
       input[type='radio'] {
   
    width:20px;
    height:15px;
   margin-left:6px
    
}
      .table {margin-top:5px
      }
      .textarea1{
          height:170px;
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

      
  </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <%
         EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
         int y = 0;
         if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
         {
             y = int.Parse(Request.QueryString["p_id"].ToString());
         }
             %>
 <div class="page_content" style="margin-right:29%;width:68%">
    <div class="row box box-success text-bold" style="direction:ltr">
          <br />
             <br />
              <a href="patprofile.aspx?patid=<%=y %>"  class="pull-left alert-info fa-2x"> Back to profile  <i class="fa  fa-arrow-circle-o-left text-blue"></i></a>
             <br />
             <br />
       <span class="text-info" style="font-size:larger; font-family:'Comic Sans MS'"> Operation Details</span>
        <br /> <br />
      
        <div class="col-md-12">
              <label>Diagnosis:</label>
            <asp:TextBox runat="server"  TextMode="MultiLine" CssClass=" textarea1" ID="diagnosis"></asp:TextBox>
        </div>
         <%--<div class="col-md-6">
           <img src="../img/operation.jpg" width="100%" height="200px" style="text-align:right"/>

         </div>--%>
        <div class="col-md-6">
           <label>Date:</label> 
            <asp:TextBox  TextMode="DateTimeLocal" CssClass="form-control" ID="datee" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
               <label>Period:</label>  
            <asp:TextBox TextMode="Number" CssClass="form-control" ID="periodtxt" runat="server"></asp:TextBox>
       
        </div>
         <div class="col-md-6">
           <label>Anaesthesia:</label>  
            <asp:RadioButtonList CssClass="aa" ID="intro" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem Value="1">General</asp:ListItem>
                <asp:ListItem Value="2">Spinal</asp:ListItem>
                 <asp:ListItem Value="3">Local</asp:ListItem>

            </asp:RadioButtonList>
        </div>
          <div class="col-md-6">
           <label>Type of surgery:</label> 
            <asp:RadioButtonList CssClass="aa" ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem Value="1">Endoscopy</asp:ListItem>
                <asp:ListItem Value="2">Open</asp:ListItem>
                 <asp:ListItem Value="3">Labaroscopy</asp:ListItem>

            </asp:RadioButtonList>
        </div>
         <div class="col-md-10">
            <label>other:</label>
            <asp:TextBox  TextMode="MultiLine" CssClass="form-control" ID="sugnotes" runat="server"></asp:TextBox>
        </div>
       
        <div class="col-md-12">
           <table class="table">
               <thead>
                   <tr style="background-color:cadetblue;color:white">
                       <td><label>sites</label></td>
                       <td><label>RT</label></td>
                       <td><label>LT</label></td>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td><label>Kidney</label></td>
                       <td><asp:CheckBox runat="server" ID="Krch" /></td>
                       <td><asp:CheckBox runat="server" ID="Klch" /></td>
                       </tr>
                   <tr>
                       <td><label>Ureter</label> </td>
                       <td><asp:CheckBox runat="server" ID="Urch" /></td>
                       <td><asp:CheckBox runat="server" ID="Ulch" /></td>
                       </tr>
                   <tr>
                       <td><label>Bladder</label></td>
                       <td><asp:CheckBox runat="server" ID="Brch" /></td>
                       <td><asp:CheckBox runat="server" ID="Blch" /></td>
                       </tr>
                   <tr>
                       <td><label>penile</label></td>
                       <td><asp:CheckBox runat="server" ID="Prch" /></td>
                       <td><asp:CheckBox runat="server" ID="Plch" /></td>
                       </tr>
                   <tr>
                       <td><label>Testis</label></td>
                       <td><asp:CheckBox runat="server" ID="Trch" /></td>
                       <td><asp:CheckBox runat="server" ID="tlch" /></td></tr>
                   <tr>
                       <td><label>Scrotum</label></td>
                       <td><asp:CheckBox runat="server" ID="Srch" /></td>
                       <td><asp:CheckBox runat="server" ID="Slch" /></td>
                       </tr>
                   <tr>
                       <td><label>Perimeal</label></td>
                       <td><asp:CheckBox runat="server" ID="Perch" /></td>
                       <td><asp:CheckBox runat="server" ID="Pelch" /></td>
                       </tr>
                   <tr>
                       <td><label>Others:</label></td>
                       <td colspan="3" style="background-color:beige">
                           <asp:TextBox TextMode="MultiLine" CssClass="form-control" ID="othersSites" runat="server"></asp:TextBox>                       </td>
                   </tr>
               </tbody>
           </table>
            
        <div class="col-md-4">
          <label>Name of Surgeon:</label>:
             <asp:DropDownList ID="surgeonddl"  ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
             </asp:DropDownList><br />New Surgeon
          <asp:TextBox ID="name"  cssClass="form-control" runat="server"></asp:TextBox>
        </div>
       <div class="col-md-4">
          <label>Name of Assistant:</label>:
           <asp:DropDownList ID="assddl"  ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
             </asp:DropDownList><br />New Assistant:
          <asp:TextBox ID="nameAss"  cssClass="form-control" runat="server"></asp:TextBox>
        </div>
            <div class="col-md-4">
          <label>Name of Nursery:</label>:
                <asp:DropDownList ID="nurseryddl"  ToolTip="select" CssClass="form-control js-example-placeholder-single select2" runat="server">
             </asp:DropDownList><br />New Nurse:
          <asp:TextBox ID="nameNurs" cssClass="form-control" runat="server"></asp:TextBox>
        </div>
        
        <div class="col-md-12" style="text-align:center;margin-bottom:50px">
            <br />
            <br />

            <asp:Button ID="btn_add" onClick="btn_add_Click" CssClass="btn btn-primary pull-left" Width="100%" runat="server" Text="Save and Contunie " />
             <br />
            <br />  
             </div>
     
    </div>

      </div>
        </div>
 

</asp:Content>






