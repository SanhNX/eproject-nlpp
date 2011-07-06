<%-- 
    Document   : index
    Created on : Jun 6, 2011, 11:02:14 PM
    Author     : XuanSanh_IT
--%>

<%@page import="EL.User"%>
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
        <%
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("admin");
                    if (user == null) {
        %>
        <jsp:forward page="login.jsp"/>
        <%}%>
        <div id="main_container">

            <div class="header">
                <div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
                <div class="right_header">Welcome  <b style="font-size: 17px;"> ${sessionScope.admin.email} </b>
                    <a href="AdminCO?action=myProfile">View Profile</a>  
                    |
                    <a href="AdminCO?action=logout" class="logout" onclick="return confirm('Are You Still Want To Logout ?')">Logout</a>
                </div>
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
                        <div class="sidebarmenu">
                            <a class="menuitem submenuheader" href="#">Categories</a>
                            <div class="submenu">
                                <ul>
                                    <li><a href="AdminUserCO?action=manageUser">Manage User</a></li>
                                    <li><a href="AdminMNEventCO?action=viewEvent">Manage Event</a></li>
                                    <li><a href="AdminPresenterCO?action=presenter">Manage Presenter</a></li>
                                    <li><a href="AdminAwardCO?action=viewAward">Manage Awards</a></li>
                                    <li><a href="mailingCO?action=mailling">Manage Mailing List</a></li>
                                    <li><a href="AdminFeedBackCO?action=feedback">Manage Feedback</a></li>
                                    <li><a href="AdminFAQCO?action=viewFAQ">Manage FAQ</a></li>
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


                    </div><!-- end of right content-->


                </div>   <!--end of center content -->
                <div class="clear"></div>
            </div> <!--end of main content-->
            <div class="footer">
                <div class="left_footer">NLPP University ADMINISTRATOR PANEL | Powered by <a href="#">Group 2 - FAT 3</a></div>
            </div>
        </div>
    </body>

</html>
