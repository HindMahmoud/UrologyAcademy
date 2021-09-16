<%@ Page Language="C#" AutoEventWireup="true" Inherits="login" Codebehind="login.aspx.cs" %>

<!DOCTYPE html>


<html lang="ar">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ecco-Hospital</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/icon.css" rel="stylesheet">
        <link id="css" href="css/light_style.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="body" class="hold-transition login-page" 
>
        <!--Start Login Form--> 
        <div  style="margin-right:-500px;margin-top:50px;">
            <div class="modal-dialog">
                <div class="modal-content">
                   
                        <form id="form1" runat="server">

                    <div id="test" class="modal-body notvis">
                      
                           <%-- <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="اسم المستخدم" aria-describedby="username">
                                <span class="input-group-addon glyphicon glyphicon-user" id="username" ></span>
                            </div>
                            <div class="input-group input-group-lg">
                                <input type="password" class="form-control" placeholder="كلمة المرور" aria-describedby="password">
                                <span class="input-group-addon glyphicon glyphicon-lock" id="password"></span>
                            </div>--%>
                              <div class="form-group has-feedback">
        <asp:TextBox cssClass="form-control" placeholder="User Name" ID="TextBox1" runat="server"></asp:TextBox>
        <%--<input type="email" class="form-control" placeholder="Email">--%>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <asp:TextBox cssClass="form-control" placeholder="Password" ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
       <%-- <input type="password" class="form-control" placeholder="Password">--%>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
    
                       
                        <%--<div class="checkbox">
                            <label>
                                <input type="checkbox"> حفظ بيانات الدخول 
                            </label>
                        </div>--%>

                    </div>
                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">الغاء</button>--%>
        
       <asp:Button ID="Button1" CssClass="btn btn-danger " runat="server" Text="Login" OnClick="Button1_Click" />
        
                    </div>
                     </form>
                </div>
            </div>
        </div>
        <!--End Login From-->
         <img class=" img-responsive  center-block " style="width:450px;height:400px"  src="dist/img/ecco.jpg" />
        
        <!--Please Remove this <a> tag-->
        <%--<a href="index.aspx" style="text-align: center; display: block; margin-top: 50px; color: rgb(255, 0, 0); font-weight: bolder; font-size: 30px;">المتابعه لمعاينة صفحات لوحة التحكم</a>--%>
        <!--Please Remove this <a> tag-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
        <script src="js/bootstrap.min.js"></script>


        <!--Start Login Area Show Animation-->
        <script type="text/javascript">
            $(document).ready(function () {
                $(".login_area").show(1000);
            });
        </script>
        <!--End Login Area Show Animation-->
        
        
    </body>
</html>

