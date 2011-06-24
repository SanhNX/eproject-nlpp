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
        <script type="text/javascript">
            function bt(){
                var r = confirm("Are You Sure ?");
                if(r == true){
                    var frm = document.getElementById("frmLogout");
        
                }
        
            }
        </script>
        <title>National Level Paper Presentation</title>
    </head>
    <body>
        <div id="main_container">

            <div class="header">
                <div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>

                <div class="right_header">Welcome ${sessionScope.admin.email} <a href="AdminCO?action=myProfile">View Profile</a>  | <a id="frmLogout" href="AdminCO?action=logout" class="logout" onclick="bt()">Logout</a></div>
                <div class="jclock"></div>
            </div>

            <div class="main_content">

                <div class="menu">
                    <ul>
                        <!--<li><a class="current" href="index.html">Admin Home</a></li>
                        <li><a href="list.html">Manage Categories</a></li>
                        <li><a href="login.html">Manage Users</a></li>
                        <li><a href="login.html">Manage Orders</a></li>
                        <li><a href="login.html">Settings</a></li>
                        <li><a href="">Custom details</a></li>
                        <li><a href="">Contact</a></li>-->
                    </ul>
                </div>

                <div class="center_content">
                    <div class="left_content">
                        <div class="sidebar_search">
                            <form>
                                <input type="text" name="" class="search_input" value="search keyword" onclick="this.value=''" />
                                <input type="image" class="search_submit" src="images/search.png" />
                            </form>
                        </div>
                        <div class="sidebarmenu">
                            <a class="menuitem submenuheader" href="#">Categories</a>
                            <div class="submenu">
                                <ul>
                                    <li><a href="">Manage User</a></li>
                                    <li><a href="">Manage Event</a></li>
                                    <li><a href="">Manage Presenter</a></li>
                                    <li><a href="">Manage Award</a></li>
                                    <li><a href="">Manage Payment</a></li>
                                    <li><a href="">Manage Mailing List</a></li>
                                    <li><a href="">Manage Feedback</a></li>
                                    <li><a href="">Manage FAQ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar_box">
                            <div class="sidebar_box_top"></div>
                            <div class="sidebar_box_content">
                                <h3>User help desk</h3>
                                <img src="images/info.png" alt="" title="" class="sidebar_icon_right" />
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                </p>
                            </div>
                            <div class="sidebar_box_bottom"></div>
                        </div>

                        <div class="sidebar_box">
                            <div class="sidebar_box_top"></div>
                            <div class="sidebar_box_content">
                                <h4>Important notice</h4>
                                <img src="images/notice.png" alt="" title="" class="sidebar_icon_right" />
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                </p>
                            </div>
                            <div class="sidebar_box_bottom"></div>
                        </div>
                        <div class="sidebar_box">
                            <div class="sidebar_box_top"></div>
                            <div class="sidebar_box_content">
                                <h5>Download photos</h5>
                                <img src="images/photo.png" alt="" title="" class="sidebar_icon_right" />
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                </p>
                            </div>
                            <div class="sidebar_box_bottom"></div>
                        </div>
                    </div>
                    <div class="right_content">
                        <div class="form">
                            <br/><br/><br/><br/>
                            <h2><img src="images/icon_home.png" width="64" height="95"/>Login <span>Form</span></h2>
                            <div align="left">
                                <h4><span>Your request completed successfully.</span></h4>
                                <h4><span>Please Login To Confirmation </span></h4>
                            </div>
                            <form action="AdminCO?action=login" method="post" id="login-admin">
                                <fieldset>
                                    <br/>
                                    <br/>
                                    <dl>
                                        <dt><b>Username &nbsp;</b></dt>
                                        <dd><input type="text" name="txtUsername" id="" size="50" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Password &nbsp;</b></dt>
                                        <dd><input type="password" name="txtPassword" id="" size="50" /></dd>
                                    </dl>

                                    <dl class="submit">
                                        <input align="light" type="submit" name="submit" id="submit" value="Login Admin" />
                                    </dl>
                                </fieldset>
                            </form>
                        </div>
                    </div><!-- end of right content-->
                </div>   <!--end of center content -->
                <div class="clear"></div>
            </div> <!--end of main content-->
            <div class="footer">
                <div class="left_footer">NLPP University ADMIN PANEL | Powered by <a href="#">Group 2 - FAT 3</a></div>
            </div>
        </div>
    </body>
</html>
