<%-- 
    Document   : Admin-Presenter
    Created on : Jun 23, 2011, 9:54:00 PM
    Author     : APTECH-FPT
--%>

<%@page import="EL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
                $("#form").validate({
                    rules:{
                        txtname:{
                            required: true,
                            rangelength:[6,30]
                        },
                        txtaddress:{
                            required:true,
                            minlength:10
                        },
                        txtemail:{
                            required:true,
                            email:true
                        },
                        txtphone:{
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
        <%
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("admin");
                    if (user == null) {
        %>
        <jsp:forward page="Admin-login.jsp"/>
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
                        <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Presenter <span>List</span></h2>
                        <div>
                            <a href="Admin/Admin-addPresenter.jsp" class="bt_green"><span class="bt_green_lft"></span><strong>Add New Presenter</strong><span class="bt_green_r"></span></a>
                            <br/>
                            <div class="sidebar_search">
                                <form action="AdminPresenterCO?action=search" method="post">
                                    <input type="text" name="txtsearch" class="search_input"
                                           value="Search Presenter By Name"
                                           onfocus="if(this.value=='Search Presenter By Name'){this.value=''}"
                                           onblur="if(this.value==''){this.value='Search Presenter By Name'}" />
                                    <input type="image" class="search_submit" src="images/search.png" />
                                </form>
                            </div>
                        </div>
                        <c:set value="${requestScope.presenters}" var="presenters"/>
                        <c:if test="${empty presenters}">
                            <h4><span class="txt1" style="color: red;" >Presenter Not Found in Search Result With Keyword :</span>
                                <span class="txt1">${requestScope.keyword}</span></h4>
                            <br/>
                            <h4><span class="txt1" style="color: red;" >Please try Again ! </span></h4>
                        </c:if>
                        <c:if test="${not empty presenters}">
                            <table id="rounded-corner">
                                <thead>
                                    <tr>
                                        <th scope="col" class="rounded">No.</th>
                                        <th scope="col" class="rounded">Name</th>
                                        <th scope="col" class="rounded">Mail</th>
                                        <th scope="col" class="rounded">Phone</th>
                                        <th scope="col" class="rounded">View</th>
                                        <th scope="col" class="rounded-q4">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="count" value="0"/>
                                    <c:forEach var="pre" items="${requestScope.presenters}">
                                        <c:set var="count" value="${count + 1}"/>
                                        <tr>
                                            <td>${count}</td>
                                            <td>${pre.name}</td>
                                            <td>${pre.email}</td>
                                            <td>${pre.phone}</td>
                                            <td><a href="AdminPresenterCO?action=view&id=${pre.id}"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>

                                            <c:set value="${pre.eventList}" var="evtList"/>
                                            <c:if test="${empty evtList}">
                                                    <td><a onclick="return confirm('Are You Still Want To Delete ?')"
                                                           href="AdminPresenterCO?action=Delete&id=${pre.id}"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                                    </c:if>
                                                    <c:if test="${not empty evtList}">
                                                <td><a href="">
                                                        <img alt="" title="" border="0" /></a></td>
                                                    </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

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
