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
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="h" %>
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
                var current = new Date();
                var day = current.getDate();
                var month = current.getMonth();
                var year = current.getFullYear();
                new JsDatePick({
                    useMode:2,
                    target:"inputField",
                    isStripped:false,
                    selectedDate:{
                        year:year,
                        month:month+1,
                        day:day
                    },
                    yearsRange: new Array(year,year+1)
                });
                new JsDatePick({
                    useMode:2,
                    target:"inputField1",
                    isStripped:false,
                    selectedDate:{
                        year:year,
                        month:month+1,
                        day:day
                    },
                    yearsRange: new Array(year,year+1)
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
                $("#form").validate({
                    rules:{
                        txtTitle:{
                            required:true,
                            rangelength:[6,30]
                        },
                        txtFee:{
                            required:true,
                            digits:true,
                            min:500,
                            max:50000
                        },
                        txtCriteria:{
                            required:true,
                            minlength:10
                        },
                        txtProcedures:{
                            required:true,
                            minlength:10
                        },
                        txtStartDate:{
                            required:true
                        },
                        txtEndDate:{
                            required:true
                        },
                        txtDescription:{
                            required:true,
                            minlength:10
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
                                    <li><a href="${requestScope.compare > 0 ? 'AdminUserCO?action=manageUser':'../AdminUserCO?action=manageUser'}">Manage User</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'AdminMNEventCO?action=viewEvent':'../AdminMNEventCO?action=viewEvent'}">Manage Event</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'AdminPresenterCO?action=presenter':'../AdminPresenterCO?action=presenter'}">Manage Presenter</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'AdminAwardCO?action=viewAward':'../AdminAwardCO?action=viewAward'}">Manage Awards</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'mailingCO?action=mailling':'../mailingCO?action=mailling'}">Manage Mailing List</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'AdminFeedBackCO?action=feedback':'../AdminFeedBackCO?action=feedback'}">Manage Feedback</a></li>
                                    <li><a href="${requestScope.compare > 0 ?'AdminFAQCO?action=viewFAQ':'../AdminFAQCO?action=viewFAQ'}">Manage FAQ</a></li>
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
                        <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Create Event <span>Form</span></h2>
                        <div class="form">
                            <form id="form" action="${requestScope.compare > 0?'AdminMNEventCO?action=addEvent':'../AdminMNEventCO?action=addEvent'}"  method="post" class="niceform">
                                <fieldset>
                                    <dl>
                                        <dt><b>Event Title :</b></dt>
                                        <dd><input type="text" name="txtTitle" value="${requestScope.event.title}" size="54"/></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Fee :</b></dt>
                                        <dd><input type="text" name="txtFee"  value="${requestScope.event.fee}" size="54" /></dd>
                                    </dl>

                                    <dl>
                                        <dt><b>Criteria :</b></dt>
                                        <dd><input type="text" name="txtCriteria" value="${requestScope.event.criteria}" size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Procedures :</b></dt>
                                        <dd><input type="text" name="txtProcedures" value="${requestScope.event.procedures}" size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>Start Date :</b></dt>
                                        <dd><input type="text" name="txtStartDate" id="inputField" size="54" readonly="true"/></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>End Date :</b></dt>
                                        <dd><input type="text" name="txtEndDate" id="inputField1" size="54" readonly="true"/></dd>
                                    </dl>
                                        <c:if test="${requestScope.compare > 0 }">
                                        <dl>
                                            <dt></dt>
                                            <dd><h4><span style="color: red;">*  Please select the start date must be less than or equal to end date </span></h4></dd>
                                        </dl>
                                </c:if>
                                <dl>
                                    <dt><b>Description :</b></dt>
                                    <dd><textarea name="txtDescription" rows="8" cols="70">${requestScope.event.description}</textarea></dd>
                                </dl>
                                <dl class="submit">
                                    <input align="right" type="submit" value="Create Event" />
                                </dl>
                            </fieldset>
                        </form>
                    </div>
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
