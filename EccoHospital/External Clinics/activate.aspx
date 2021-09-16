<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activate.aspx.cs" MasterPageFile="~/External Clinics/MasterPage.master" Inherits="EccoHospital.External_Clinics.activate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    th,td{padding:5px;}
     table{border-spacing:5px;}
     tr:hover{background-color:#007FCB}
        .rdos{font-size:12px
        }
        .bg-navey {background:#001F3F;color:white
        }
       .bg-blue-gradient {background:#0073B7;color:white}
        .bg-navy {color:black
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--  <%if (Session["role"] != null)
        {
            microinjection2Entities db = new microinjection2Entities();
             int uid =  int .Parse(Session["user_id"].ToString());
             var up = db.permissions.FirstOrDefault(a => a.user_id == uid);
            // if (up.patient_profile == true)
             {


             %>--%>
    <br />
    <br />
    <%
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        int x=0;
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
        {
            x = int.Parse(Request.QueryString["id"].ToString());
        }
        var act = (from s in db.activation where s.patient_id == x select s).ToList();
         %>
        <div class="page_content" style="width: 71%;margin-right: 351px;">
     <a href="profile2.aspx?patid=<%=x %>" style="font-size:17px large" class="pull-right"><span class="glyphicon glyphicon-circle-arrow-right"></span>back to profile</a>
        <br />
        <br />
    <div >
       
        <div style="width: 100%;">
            <table  class="  text-center table-responsive bg-navey  " border="1">

                <tr class="bg-blue-gradient" style="font-size:17px;">
                    <th colspan="2">Procedure</th>
                    <th colspan="2">Protocol</th>
                    <th>other</th>
                    <th colspan="4">HMG name</th>
                    <th colspan="4">FSH name</th>
                    <th colspan="2">Agonist</th>
                    <th colspan="2">Antagonist</th>
                    <th colspan="4">Semen source</th>
                    <th>BMI</th>


                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="PROCED" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="ICSI" Value="ICSI"  /> 
                            <asp:ListItem Text ="MUI" Value="MUI" />
                        </asp:RadioButtonList></td>
                    <td colspan="2">
                        <asp:RadioButtonList ID="Protocol" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="Long" Value="Long" /> 
                            <asp:ListItem Text ="Short" Value="Short" />
                        </asp:RadioButtonList></td>
                    <td>
                        <asp:TextBox CssClass="bg-navy" width="100%" ID="other" runat="server"></asp:TextBox></td>   
                    <td colspan="4">
                        <asp:RadioButtonList style="float:right" ID="HMG" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="ML" Value="ML" /> 
                            <asp:ListItem Text ="MG" Value="MG" />
                            <asp:ListItem Text ="MP" Value="MP" />
                            <asp:ListItem Text ="EG" Value="EG" />


                        </asp:RadioButtonList></td>

                    <td colspan="4">
                        <asp:RadioButtonList style="float:right" ID="FSH_name" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="F" Value="F" /> 
                            <asp:ListItem Text ="GF" Value="GF" />
                            <asp:ListItem Text ="GP" Value="GP" />
                            <asp:ListItem Text ="P" Value="P" />


                        </asp:RadioButtonList></td>
                    <td colspan="2"><asp:RadioButtonList style="float:right" ID="Agonist" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="Dec" Value="Dec" /> 
                            <asp:ListItem Text ="Luc" Value="Luc" />
                            


                        </asp:RadioButtonList></td>
                     <td colspan="2"><asp:RadioButtonList style="float:right" ID="Antagonist" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="Org" Value="Org" /> 
                            <asp:ListItem Text ="Citr" Value="Citr" />
                         
                        </asp:RadioButtonList></td>
                    <td colspan="4">
                        <asp:RadioButtonList style="float:right" ID="Semen_source" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="Ejac" Value="Ejac" /> 
                            <asp:ListItem Text ="PESA" Value="PESA" />
                            <asp:ListItem Text ="TESE" Value="TESE" />
                            <asp:ListItem Text ="CRYO" Value="CRYO" />


                        </asp:RadioButtonList></td>
                      <td>
                        <asp:TextBox CssClass="bg-navy" width="100%" ID="Bmi" runat="server"></asp:TextBox></td>   
                  
                </tr>
            </table>

            <br />
             <table class="  text-center table-responsive  bg-navey  " border="1">
                 <tr class="bg-blue-gradient" style="font-size:17px;">
                     <th>FSH</th>
                     <th>LH</th>
                     <th>PRL</th>
                     <th>THS</th>
                     <th>AMH</th>
                     <th>APHL</th>
                     <th>ANA</th>
                     <th>ATA</th>
                     <th>Rubella</th>
                     <th>HCV.HBV.AIDS</th>

                 </tr>
                 <tr>
                     <td><asp:TextBox CssClass="bg-navy" width="100%" ID="FSH" runat="server"></asp:TextBox></td> 
                     <td><asp:TextBox CssClass="bg-navy" width="100%" ID="LH" runat="server"></asp:TextBox></td>
                     <td><asp:TextBox CssClass="bg-navy" width="100%" ID="PRL" runat="server"></asp:TextBox></td> 
                     <td><asp:TextBox CssClass="bg-navy" width="100%" ID="THS" runat="server"></asp:TextBox></td>
                     <td><asp:TextBox CssClass="bg-navy" width="100%" ID="AMH" runat="server"></asp:TextBox></td>   
                        
                       <td ><asp:RadioButtonList style="float:right;font-size:11px" ID="APHL" runat="server"  RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="+Ve" Value="+Ve" /> 
                            <asp:ListItem Text ="-Ve" Value="-Ve" />
                         
                        </asp:RadioButtonList></td>
                        
                       <td ><asp:RadioButtonList style="float:right;font-size:11px" ID="ANA" runat="server"  RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="+Ve" Value="+Ve" /> 
                            <asp:ListItem Text ="-Ve" Value="-Ve" />
                         
                        </asp:RadioButtonList></td>
                     <td><asp:RadioButtonList style="float:right;font-size:11px" ID="ATA" runat="server"  RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="+Ve" Value="+Ve" /> 
                            <asp:ListItem Text ="-Ve" Value="-Ve" />
                         
                        </asp:RadioButtonList></td>
                     <td ><asp:RadioButtonList style="float:right;font-size:11px" ID="Rubella" runat="server"  RepeatDirection="Horizontal" TextAlign="Right">
                            
                            <asp:ListItem Text ="+Ve" Value="+Ve" /> 
                            <asp:ListItem Text ="-Ve" Value="-Ve" />
                         
                        </asp:RadioButtonList></td>
              <td><asp:TextBox CssClass="bg-navy" width="100%" ID="HCV_HBV_AIDS" runat="server"></asp:TextBox></td> 

                 </tr>
            </table>
            <br />
             <table class="  text-center table-responsive  bg-navey  " border="1">
                 <tr class="bg-blue-gradient" style="font-size:17px;">
                     <th>ABO</th>
                     <th>RH</th>
                     <th>HB</th>
                   
                     <th>PC%</th>
                     <th>BT</th>
                     <th>CT</th>
                     <th>SGOT</th>
                     <th>SGPT</th>
                     <th>Urea</th>
                     <th>Createnin</th>

                 </tr>
                 <tr>
                      <td><asp:TextBox CssClass="bg-navy" width="100%" ID="ABO" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="RH" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="HB" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="PC" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="BT" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="CT" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="SGOT" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="SGPT" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="Urea" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy" width="100%" ID="Createnin" runat="server"></asp:TextBox></td> 
                 
                 </tr>
                 </table>
            <br />
            <asp:Button OnClick="Button1_Click" CssClass="center-block btn btn-primary" ID="Button1" runat="server" Text="Save" />
            <br />


           <span runat="server" id="lb1" style="font-size:16px;font-weight:bold" class="time-label"> Start At: </span>
            <asp:TextBox TextMode="Date" Format="dd/MM/yyyy" OnTextChanged="TextBox1_TextChanged" ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
            <asp:TextBox ID="date2" runat="server" Visible="False" Font-Size="Medium" Font-Bold="True"></asp:TextBox>
            <asp:Button OnClick="print_Click"  OnClientClick="target ='_blank';" ID="print" CssClass="btn btn-info fa-print "  runat="server" Text="print" />
            <table class="  text-center table-responsive  bg-navey " border="1">
               <tr class="bg-blue-gradient" style="font-size:17px;">
                    <th rowspan="2"> Date</th>
                    <th rowspan="2"> Day</th>

                    <th rowspan="2"> HMG/dose/day</th>
                    <th rowspan="2"> FSH/dose/day</th>
                    <th colspan="8" >Folliculometry</th>
                    <th rowspan="2">End.thickness</th>
                    <th rowspan="2">End.pattren</th>
                    <th rowspan="2">E2</th>
                   <th rowspan="2"></th>

               </tr>
                <tr class="bg-blue-gradient" style="font-size:18px; font-weight:bold">
                   <td colspan="4">RT</td>
                   <td colspan="4">LT</td>

                </tr>
                <tr>
                    <td>#</td>
                    <td>#</td>
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="HMG2" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="FSH2" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="RT1" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="RT2" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="RT3" runat="server"></asp:TextBox></td> 
                    <td><asp:TextBox CssClass="bg-navy " width="100%" ID="RT4" runat="server"></asp:TextBox></td> 
                   <td><asp:TextBox CssClass="bg-navy " width="100%" ID="LT1" runat="server"></asp:TextBox></td> 
                   <td><asp:TextBox CssClass="bg-navy " width="100%" ID="LT2" runat="server"></asp:TextBox></td> 
                  <td><asp:TextBox CssClass="bg-navy " width="100%" ID="LT3" runat="server"></asp:TextBox></td> 
                  <td><asp:TextBox CssClass="bg-navy " width="100%" ID="LT4" runat="server"></asp:TextBox></td> 
                  <td><asp:TextBox CssClass="bg-navy " width="100%" ID="EndThick" runat="server"></asp:TextBox></td> 
                   <td><asp:TextBox CssClass="bg-navy " width="100%" ID="EndPattern" runat="server"></asp:TextBox></td> 
                   <td><asp:TextBox CssClass="bg-navy " width="100%" ID="E2" runat="server"></asp:TextBox></td> 

                    <td>
                        <asp:Button CssClass="btn btn-openid" OnClick="Button2_Click" ID="Button2" runat="server" Text="save" />
                        </td>

                   



                </tr>
                <% 
                    int i = 0;
                    foreach (var item in act)
                    {

                     %>
                <tr>
                    <%DateTime f= Convert.ToDateTime( item.date);
                        string ff = f.ToString("dd");
                         %>
                    <td><%=ff %></td>
                    <td><%=item.day %></td>

                    <td >
                        <%=item.HMG %>
                       </td>
                    <td><%=item.FSH %></td>
                   
                    <td><%=item.RT1 %></td>
                    <td><%=item.RT2 %></td>
                    <td><%=item.RT3 %></td>
                    <td><%=item.RT4 %></td>

                    <td><%=item.LT1 %></td>
                    <td><%=item.LT2 %></td>
                    <td><%=item.LT3 %></td>
                    <td><%=item.LT4 %></td>

                    <td><%=item.End_thickness %></td>
                    <td><%=item.End_pattern %></td>
                    <td><%=item.E2 %></td>
                    <td><a href="activat.aspx?id=<%=x %>&&item=<%=item.id %>"> <i class="fa fa-2x fa-edit text-orange"></i></a></td>


                </tr>
                <%i++;
                    } %>

            </table>
            
            </div>
    </div>
</div>
<%--     <% }
           
       }

       else
       {
           Response.Redirect("login.aspx");
       }%>--%>
    </asp:Content>