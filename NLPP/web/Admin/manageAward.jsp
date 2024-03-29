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
                new JsDatePick({
                    useMode:2,
                    target:"inputField1",
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
                $("#form").validate({
                    rules:{
                        txtDescription1:{
                            required:true,
                            minlength:10
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
                        <c:set value="${requestScope.flag}" var="flag"/>
                        <c:if test="${empty flag}">
                            <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Create Award <span>Form</span></h2>
                            </c:if>
                            <c:if test="${not empty flag}">
                            <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Update Award <span>Form</span></h2>
                            </c:if>
                        <div class="form">
                            <c:set value="${requestScope.flag}" var="flag"/>
                            <c:if test="${empty flag}">
                                <form id="form" action="AdminAwardCO?action=addAward" method="post" class="niceform">
                                    <fieldset>
                                        <dl>
                                            <dt><b>Description :</b></dt>
                                            <dd><textarea name="txtDescription" rows="8" cols="70"></textarea></dd>
                                        </dl>
                                        <dl class="submit">
                                            <input align="right" type="submit" value="Create Award" />
                                        </dl>
                                    </fieldset>
                                </form>
                            </c:if>
                            <c:if test="${not empty flag}">

                                <form id="form" action="AdminAwardCO?action=editAward&awardID=${requestScope.award.id}" method="post" class="niceform">
                                    <fieldset>
                                        <dl>
                                            <dt><b>Description :</b></dt>
                                            <dd><textarea name="txtDescription1" rows="8" cols="70">${requestScope.award.description}</textarea></dd>
                                        </dl>
                                        <dl class="submit">
                                            <input align="right" type="submit" value="Update Award" />


                                        </dl>
                                    </fieldset>
                                </form>

                            </c:if>
                        </div>
                        <br/>
                        <h2>Award <span>List</span></h2>
                        <table id="rounded-corner" >
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded">No.</th>
                                    <th scope="col" class="rounded">Description</th>
                                    <th scope="col" class="rounded-q4" colspan="2" align="center">Action</th>
                                    <!--                                    <th scope="col" class="rounded-q4">Delete</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="-1"/>
                                <c:forEach items="${requestScope.awards}" var="award">
                                    <c:set var="count" value="${count + 1}"/>
                                    <c:if test="${award.id != 1}">
                                        <tr>
                                            <td>${count}</td>
                                            <td>${award.description}</td>
                                            <td><a href="AdminAwardCO?action=formEditAward&awardID=${award.id}"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                                    <c:set value="${award.evtUserList}" var="evtUser"/>
                                                    <c:if test="${empty evtUser}">
                                                <td><a onclick="return confirm('Are You Still Want To Delete ?')"
                                                       href="AdminAwardCO?action=deleteAward&awardID=${award.id}" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                                    </c:if>
                                                    <c:if test="${not empty evtUser}">
                                                <td><a href="#" class="ask"><img src="" alt="" title="" border="0" /></a></td>
                                                    </c:if>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:set value="${requestScope.flag}" var="flag"/>
                        <c:if test="${not empty flag}">
                            <a href="AdminAwardCO?action=viewAward" class="bt_green"><span class="bt_green_lft"></span><strong>Redirect To Create Award Page</strong><span class="bt_green_r"></span></a>
                        </c:if>
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
