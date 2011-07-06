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
                    yearsRange: new Array(1971,2100)
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
                    yearsRange: new Array(1971,2100)
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
                <div class="right_header">Welcome  <b style="font-size: 17px;"> ${sessionScope.admin.email} </b><a href="AdminCO?action=myProfile">View Profile</a>  | <a href="AdminCO?action=logout" class="logout" onclick="return confirm('Are You Still Want To Logout ?')">Logout</a></div>
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
                        <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Update Information <span>Form</span></h2>
                        <div class="form">
                            <form id="form" action="AdminMNEventCO?action=updateInfo&id=${requestScope.event.id}" method="post" class="niceform">
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
                                        <dd><input type="text" name="txtStartDate" value="${requestScope.startDate}"
                                                   id="inputField" size="54" readonly="true" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><b>End Date :</b></dt>
                                        <dd><input type="text" name="txtEndDate" value="${requestScope.endDate}"
                                                   id="inputField1" size="54" readonly="true"/></dd>
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
                                        <input align="right" type="submit" value="Update Event" />
                                    </dl>
                                </fieldset>
                            </form>
                        </div><br/>
                        <h2>Presenter <span>List</span></h2>

                        <table id="rounded-corner" >
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded">No.</th>
                                    <th scope="col" class="rounded">Name</th>
                                    <th scope="col" class="rounded">Address</th>
                                    <th scope="col" class="rounded">Email</th>
                                    <th scope="col" class="rounded">Phone</th>
                                    <th scope="col" class="rounded-q4">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="${requestScope.event.presenterList}" var="list"/>
                                <c:if test="${not empty list}">
                                    <c:set var="count" value="0"/>
                                    <c:forEach items="${requestScope.event.presenterList}" var="pre">
                                        <c:set var="count" value="${count + 1}"/>
                                        <tr>
                                            <td>${count}</td>
                                            <td>${pre.name}</td>
                                            <td>${pre.address}</td>
                                            <td>${pre.email}</td>
                                            <td>${pre.phone}</td>
                                            <td><a href="AdminMNEventCO?action=delPre&preID=${pre.id}&evtID=${requestScope.event.id}"
                                                   onclick="return confirm('Are You Still Want To Delete ?')" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="6"><h4><span style="color: red;">There is no results</span></h4></td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <a href="AdminMNEventCO?action=listPresnter&id=${requestScope.event.id}" class="bt_green"><span class="bt_green_lft"></span><strong>Add Presenter For This Event</strong><span class="bt_green_r"></span></a>
                        <br/>
                        <h2>Member's <span> This Event</span></h2>

                        <table id="rounded-corner" >
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded">No.</th>
                                    <th scope="col" class="rounded">Email</th>
                                    <th scope="col" class="rounded">Full Name</th>
                                    <th scope="col" class="rounded">Phone</th>
                                    <th scope="col" class="rounded-q4" colspan="2">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="${requestScope.event.evtUserList}" var="evtList"/>
                                <c:if test="${not empty evtList}">
                                    <c:set var="count" value="0"/>
                                    <c:forEach items="${requestScope.event.evtUserList}" var="evtUser">
                                        <c:set var="count" value="${count + 1}"/>
                                        <tr>
                                            <td>${count}</td>
                                            <td>${evtUser.user.email}</td>
                                            <td>${evtUser.user.fullName}</td>
                                            <td>${evtUser.user.phone}</td>
                                            <td><a href="AdminMNEventCO?action=formAddWinner&id=${requestScope.event.id}&email=${evtUser.user.email}">
                                                    <img src="images/user_edit.png"
                                                         alt="Update Award For This User" title="" border="0" /></a></td>
                                            <td><a href="AdminMNEventCO?action=deleteUForE&email=${evtUser.user.email}&evtID=${requestScope.event.id}"
                                                   onclick="return confirm('Are You Still Want To Delete ?')" class="ask">
                                                    <img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty evtList}">
                                    <tr>
                                        <td colspan="6"><h4><span style="color: red;">There is no results</span></h4></td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <h2>Winner's <span> This Event</span></h2>

                        <table id="rounded-corner" >
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded">No.</th>
                                    <th scope="col" class="rounded">Email</th>
                                    <th scope="col" class="rounded">Full Name</th>
                                    <th scope="col" class="rounded">Award Description</th>
                                    <th scope="col" class="rounded-q4">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach items="${requestScope.event.evtUserList}" var="evtUser">
                                    <c:set var="count" value="${count + 1}"/>
                                    <c:set var="default" value="default"/>
                                    <c:if test="${evtUser.award.description ne default}">
                                        <tr>
                                            <td>${count}</td>
                                            <td >${evtUser.user.email}</td>
                                            <td >${evtUser.user.fullName}</td>
                                            <td >${evtUser.award.description}</td>
                                            <td><a href="AdminMNEventCO?action=delWinner&email=${evtUser.user.email}&evtID=${requestScope.event.id}"
                                                   onclick="return confirm('Are You Still Want To Delete ?')" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
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
