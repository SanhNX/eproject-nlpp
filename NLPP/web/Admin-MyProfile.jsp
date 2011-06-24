<%-- 
    Document   : index
    Created on : Jun 6, 2011, 11:02:14 PM
    Author     : XuanSanh_IT
--%>

<%@page import="EL.User"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" type="text/css" media="all" href="jsDatePick/jsDatePick_ltr.min.css" />
        <script type="text/javascript" src="jsDatePick/jsDatePick.min.1.3.js"></script>
        <script type="text/javascript">
            window.onload = function(){
                new JsDatePick({
                    useMode:2,
                    target:"inputField",
                    isStripped:false,
                    selectedDate:{
                        year:2009,
                        month:4,
                        day:16
                    },
                    yearsRange: new Array(1971,2100),
                    limitToToday:true
                });
            };
        </script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
        <script type="text/javascript" src="js/html5.js"></script>
        <script type="text/javascript" src="js/date.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#form1").validate({
                    rules:{
                        txtPass:{
                            required:true,
                            rangelength:[6,25]
                        },
                        txtRePass:{
                            equalTo:"#txtPass"
                        },
                        txtOldPass:{
                            required:true
                        }
                    }   //end rules
                });  //end validate

                $("#form").validate({
                    rules:{
                        txtBirthday:{
                            required:true
                        },
                        txtFullname:{
                            required:true
                        },
                        txtAddress:{
                            required:true
                        },
                        txtPhone:{
                            required:true,
                            phoneVN:true
                            
                        }
                    }   //end rules
                });  //end validate
            }); //end function
        </script>
        <title>National Level Paper Presentation</title>
    </head>
    <body>
        <div id="main_container">

            <div class="header">
                <div class="logo"><a href="#"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>

                <div class="right_header">Welcome ${sessionScope.admin.email} <a href="#">View Profile</a>  | <a href="AdminCO?action=logout"
                                                                                                                 class="logout" onclick="return confirm('Are You Still Want To Logout ?')">Logout</a></div>
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
                        <h2><img src="images/icon_cube.png" width="64" height="95">Update Profile <span>Form</span></h2>
                        <div class="form">
                            <form id="form" action="AdminCO?action=updateProfile" method="post" class="niceform">

                                <fieldset>
                                    <dl>
                                        <dt><b>Birth Day:</b></dt>
                                        <dd><input type="text" name="txtBirthday" value="${requestScope.birthday}" id="inputField" size="54" readonly="true"/></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Full Name:</b></dt>
                                        <dd><input type="text" name="txtFullname" value="${requestScope.admin.fullName}" id="" size="54" /></dd>
                                    </dl>
                                    <c:if test="${requestScope.gender==true}">
                                        <dl>
                                            <dt><b>Gender</b></dt>
                                            <dd>
                                                <input type="radio" name="type" id="" value="Male" checked="true"  /><label class="check_label">Male</label>
                                                <input type="radio" name="type" id="" value="FeMale" /><label class="check_label">FeMale</label>

                                            </dd>
                                        </dl>
                                    </c:if>
                                    <c:if test="${requestScope.gender==false}">
                                        <dl>
                                            <dt><b>Gender</b></dt>
                                            <dd>
                                                <input type="radio" name="type" id="" value="Male" /><label class="check_label" style="color: #666;">Male</label>
                                                <input type="radio" name="type" id="" value="FeMale" checked="true" /><label class="check_label" style="color: #666;">FeMale</label>

                                            </dd>
                                        </dl>
                                    </c:if>
                                    <dl>
                                        <dt><b>Address:</b></dt>
                                        <dd><input type="text" name="txtAddress" value="${requestScope.admin.address}" id="" size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Phone:</b></dt>
                                        <dd><input type="text" name="txtPhone" value="${requestScope.admin.phone}" id="" size="54" /></dd>
                                    </dl>
                                    <dl class="submit">
                                        <input align="right" type="submit" value="Update Now" />
                                    </dl>
                                </fieldset>
                            </form>
                            <br/> <br/>
                            <h2><img src="images/icon_cube.png" width="64" height="95">Change Password <span>Form</span></h2>

                            <form id="form1" action="AdminCO?action=updatePass" method="Post" class="niceform" >
                                <fieldset>
                                    <dl>
                                        <dt><b>New PassWord:</b></dt>
                                        <dd><input type="password" name="txtPass" id="txtPass" size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Re-PassWord:</b></dt>
                                        <dd><input type="password" name="txtRePass"  size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Old-PassWord:</b></dt>
                                        <dd><input type="password" name="txtOldPass"  size="54" /></dd>
                                    </dl>
                                    <dl class="submit">
                                        <input align="left" type="reset" value="Reset Form" />&nbsp;&nbsp;|&nbsp;&nbsp;<input align="right" type="submit" value="Change Pass" />
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
