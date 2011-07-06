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
                        <h2><img alt="NLPP's Site"  src="images/icon_cube.png" width="64" height="95"/>Frequently Asked Questions <span>List</span></h2>
                        <div>
                            <a href="Admin/Admin-createFAQ.jsp" class="bt_green"><span class="bt_green_lft"></span><strong>Create New FAQ</strong><span class="bt_green_r"></span></a>
                            <br/>
                            <div class="sidebar_search">
                                <form action="AdminFAQCO?action=search" method="post">
                                    <input type="text" name="txtsearch" class="search_input"
                                           value="Search FAQ By Subject"
                                           onfocus="if(this.value=='Search FAQ By Subject'){this.value=''}"
                                           onblur="if(this.value==''){this.value='Search FAQ By Subject'}" />
                                    <input type="image" class="search_submit" src="images/search.png" />
                                </form>
                            </div>
                        </div>
                        <c:set value="${requestScope.faqList}" var="faq"/>
                        <c:if test="${empty faq}">
                            <h4><span class="txt1" style="color: red;" >FAQ Not Found in Search Result With Keyword :</span>
                                <span class="txt1">${requestScope.keyword}</span></h4>
                            <br/>
                            <h4><span class="txt1" style="color: red;" >Please try Again ! </span></h4>
                        </c:if>
                        <c:if test="${not empty faq}">
                            <table id="rounded-corner">
                                <thead>
                                    <tr>
                                        <th scope="col" class="rounded">Subject</th>
                                        <th scope="col" class="rounded">Question</th>
                                        <th scope="col" class="rounded">Answer</th>
                                        <th scope="col" class="rounded">Edit</th>
                                        <th scope="col" class="rounded-q4">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="faq" items="${requestScope.faqList}">
                                        <tr>
                                            <td>${faq.subject}</td>
                                            <td>${faq.question}</td>
                                            <td>${faq.answer}</td>
                                            <td><a href="AdminFAQCO?action=formEdit&id=${faq.id}"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>

                                            <td><a onclick="return confirm('Are You Still Want To Delete ?')"
                                                   href="AdminFAQCO?action=delete&id=${faq.id}"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
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
