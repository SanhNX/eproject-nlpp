<%-- 
    Document   : index
    Created on : Jun 6, 2011, 11:02:14 PM
    Author     : XuanSanh_IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
        <link rel="stylesheet" type="text/css" href="css/style-admin.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />
        <script language="javascript" type="text/javascript" src="js/niceforms.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#login-admin").validate({
                    rules:{
                        txtUsername:{
                            required: true
                        },
                        txtPassword:{
                            required:true
                        }
                    }   //end rules
                });  //end validate
            }); //end function
        </script>

        <title>National Level Paper Presentation</title>
    </head>
    <body>
        <div id="main_container">

            <div class="header_login">
                <div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
            </div>
            <div class="login_form">
                <h3>Admin Panel Login</h3>
                <a href="#" class="forgot_pass">Forgot password</a>
                <form action="../AdminCO?action=login" method="post" id="login-admin">
                    <fieldset>
                        <br/>
                        <br/>
                        <dl>
                            <dt1><b>Username &nbsp;</b></dt1>
                            <dd1><input type="text" name="txtUsername" id="" size="40" /></dd1>
                        </dl>
                        <dl>
                            <dt1><b>Password &nbsp;</b></dt1>
                            <dd1><input type="password" name="txtPassword" id="" size="40" /></dd1>
                        </dl>
                        <dl>
                            <dt1><label></label></dt1>
                            <dd1>
                                <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label" style="color: #666;">Remember me</label>
                            </dd1>
                        </dl>
                        <dl class="submit">
                            <input type="submit" name="submit" id="submit" value="Submit"  />
                        </dl>
                    </fieldset>
                </form>
            </div>
            <div class="footer_login">
                <div class="left_footer">NLPP University ADMINISTRATOR PANEL | Powered by <a href="#">Group 2 - FAT 3</a></div>
            </div>
        </div>
    </body>
</html>
