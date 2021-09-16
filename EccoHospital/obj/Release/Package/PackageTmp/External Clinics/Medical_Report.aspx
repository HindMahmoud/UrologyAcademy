<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="Medical_Report" Codebehind="Medical_Report.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page_content" style="margin-right:29%;width:70%"> 
    <a class="btn btn primary bg-blue-gradient" href='javascript:history.go(-1)'>Go Back <i class="fa fa fa-arrow-circle-left"></i></a>
       <br />
        <br />
    <div class="row ">
        <div class="col-md-3">
           عنوان التقرير:
            <asp:TextBox ID="title" CssClass="form-control" runat="server"></asp:TextBox></div>
        
         <div class="col-md-9"><br />
              <asp:TextBox ID="txt" Height="150px" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox></div>



             
      <div class="col-md-12">
        <br />
        <asp:Button ID="add" OnClick="add_Click" CssClass="btn btn-primary" runat="server" Text="add" />
    </div>
        </div>
    <div class="row">
        <div class="col-xs-12">
          <div class="box box-success">
            <div class="box-header">
              <h3 class="box-title">Medical Reports</h3>

              <div class="box-tools">
                  
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" id="search" class="form-control pull-right" onkeyup="myFunction1()" placeholder="search..">

                  <%--<div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>--%>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="mytable">
                  <% EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
                        
                      int y = 0;
                      if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                      {
                          y = int.Parse(Request.QueryString["id"].ToString());
                      }
                      DateTime d = DateTime.Now.Date;


                      var x = (from ss in db.medical_report where ss.pat_id==y select ss).ToList();
                      if (x != null)
                      {
                       %>
                <tr>
                  
                  <th>Date</th>
                  <th>title</th>
                  
                  <th></th>
                 
                  <th></th>


                </tr>
                  <% foreach (var item in x)
    {
                           %> 
                      
                <tr>
                    

                 <td><% Response.Write(item.date); %></td>
                     <td><% Response.Write(item.title); %></td>
                     
 
                    
         <td><a href="Medical_Report.aspx?id=<%=item.pat_id %>&&editid=<%=item.id %>">  <i class="fa fa-edit text-aqua"></i></a></td>
         <td><a href="Medical_Report.aspx?id=<%=item.pat_id %>&&print=<%=item.id %>" target="_blank">  <i class="fa fa-print text-blue"></i></a></td>
     <td><a  href='Medical_Report.aspx?id=<%=item.pat_id %>&&delid=<%=item.id %>'>  <i class="fa fa-trash-o text-red"></i></a></td>




                    

                </tr>
                    <%  }
    }%>
               
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
      </div>

</asp:Content>

