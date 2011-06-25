<%-- 
    Document   : index
    Created on : Jun 6, 2011, 11:02:14 PM
    Author     : XuanSanh_IT
--%>

<%@page import="EL.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="h" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
        <link rel="stylesheet" type="text/css" media="all" href="jsDatePick/jsDatePick_ltr.min.css" />
        <script type="text/javascript" src="jsDatePick/jsDatePick.min.1.3.js"></script>
        <script type="text/javascript">
            window.onload = function(){
                g_globalObject = new JsDatePick({
                    useMode:1,
                    isStripped:true,
                    target:"div3_example"
                });
            };
        </script>
        <link rel="stylesheet" type="text/css" href="css/style-table.css" />
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-replace.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>
        <script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
        <script type="text/javascript" src="js/html5.js"></script>
        <script type="text/javascript" src="js/ie_png.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#newsletter-form").validate({
                    rules:{
                        txtMailing:{
                            required: true,
                            email:true
                        }
                    }   //end rules
                });  //end validate
            }); //end function
        </script>
        <title>National Level Paper Presentation</title>
    </head>
    <body id="page1">
        <div class="wrap">
            <!-- header -->
            <header>
                <div class="container">
                    <img src="images/logo_96.png" width="270" height="270"/>
                    <nav>
                        <ul>
                            <li class="current"><a href="index.jsp" class="m1">Home Page</a></li>
                            <li><a href="User-register.jsp" class="m3">Register</a></li>
                            <li><a href="User-feedback.jsp" class="m2">Feedback Us</a></li>
                            <li><a href="VisiterCO?action=viewFAQ" class="m4">FAQ</a></li>
                            <li class="last"><a href="admin.jsp" class="m5">Administrator</a></li>
                        </ul>
                    </nav>
                    <form action="VisiterCO?action=searchEvent" method="POST" id="search-form">
                        <fieldset>
                            <div class="rowElem">
                                <input type="text" name="txtKeyword" value="Search Title Event" onFocus="if(this.value=='Search Title Event'){this.value=''}" onBlur="if(this.value==''){this.value='Search Title Event'}" >
                                <a href="#" onClick="document.getElementById('search-form').submit()">Search</a></div>
                        </fieldset>
                    </form>
                </div>
            </header>
            <div class="container">
                <!-- aside -->
                <aside>
                    <h3>Categories</h3>
                    <ul class="categories">
                        <li><span><a href="index.jsp">Home Page</a></span></li>
                        <li><span><a href="UserEventCO?action=viewEvent">Event Information</a></span></li>
                        <li><span><a href="#">Enroll Event</a></span></li>
                        <li><span><a href="UserEventCO?action=listPresnter">Presenter Information</a></span></li>
                        <%
                                    HttpSession s = request.getSession();
                                    User user = (User) s.getAttribute("user");
                                    if (user == null) {
                        %>
                        <li><span><a href="User-login.jsp">Login</a></span></li>
                        <li><span><a href="User-register.jsp">Register</a></span></li>
                        <%}%>
                        <li><span><a href="#">About US</a></span></li>
                    </ul>
                    <%
                                if (user == null) {
                    %>
                    <form action="UserCO?action=login" method="POST" id="newsletter-form1">
                        <fieldset>
                            <div class="rowElem">
                                <h2>Login Site</h2>
                                <a style="color:#FFF">Email</a>
                                <input type="text" name="txtEmail" size="25">
                                <a style="color:#FFF">Password</a>
                                <input type="password" name="txtPassword" size="25">
                                <br/><br/>
                                <div><a href="register.jsp" class="fleft">Register User</a><input style="float: right; " type="submit" value="Submit" /></div>
                            </div>
                        </fieldset>
                    </form>
                    <%} else {%>
                    <form action="" method="POST" id="newsletter-form2">
                        <fieldset>
                            <div class="rowElem">
                                <h2>You Are Sign In</h2>
                                <a style="color: white; font-size: 20px; ">Welcome </a><br/><br/><a href="#" style="font-weight:lighter;font-style: italic;color: brown;font-size: 15px; ">${sessionScope.user.email}</a>
                                <br/><br/>
                                <div><a href="UserCO?action=myProfile" class="fleft">My Profile</a><a onClick="return confirm('Are You Still Want To Logout ?')" href="UserCO?action=logout" class="fright">Logout</a></div>
                            </div>
                        </fieldset>
                    </form>
                    <%                                }
                    %>
                    <h2>Featured <span>Events</span></h2>
                    <ul class="news">
                        <li><strong>June 30, 2010</strong>
                            <h4><a href="#">Sed ut perspiciatis unde</a></h4>
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. </li>
                        <li><strong>June 14, 2010</strong>
                            <h4><a href="#">Neque porro quisquam est</a></h4>
                            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni. </li>

                        <br/>
                        <form action="VisiterCO?action=addMail" method="POST" id="newsletter-form">
                            <fieldset>
                                <div class="rowElem">
                                    <h2>Newsletter</h2>
                                    <input type="text" name="txtMailing" style="width: 100%;"><br/>
                                    <br/>
                                    <div><a href="#" class="fleft">UnSubscribe</a><input style="float: right; " type="submit" value="Submit" /></div>

                                </div>
                            </fieldset>
                        </form>
                        <div align="center"><span class="txt1">o0o Calendar o0o</span></div>
                        <div id="div3_example" style="margin:10px 0 30px 0; border:dashed 1px blue; width:219px; height:230px;" align="center"></div>
                    </ul>
                </aside>
                <!-- content -->
                <section id="content">
                    <div id="banner">
                        <h2><span>Traning Programmer<span>Since 1992</span></span></h2>
                    </div>
                    <div class="inside">
                        <h2><img src="images/icon_cube.png" width="64" height="95">${requestScope.event.title} <span>Events</span></h2>
                        <div class="img-box"><img src="images/logo_event.png" width="130" height="130" class="png"><span class="txt1">${requestScope.event.description}</span>
                        </div>
                        <table id="rounded-corner">
                            <tr>
                                <td width="20%" align="right"><span class="txt1">Procedures : </span></td>
                                <td width="80%">${requestScope.event.procedures}</td>
                            </tr>
                            <tr>
                                <td width="20%" align="right"><span class="txt1">Criteria : </span></td>
                                <td width="80%">${requestScope.event.criteria}</td>
                            </tr>
                            <tr>
                                <td width="20%" align="right"><span class="txt1">Fee : </span></td>
                                <td width="80%">${requestScope.event.fee} $</td>
                            </tr>
                            <tr>
                                <td width="20%" align="right"><span class="txt1">Start Date : </span></td>
                                <td width="80%"><h:formatDate pattern="MM-dd-yyyy" value="${requestScope.event.startDate}"/></td>
                            </tr>
                            <tr>
                                <td width="20%" align="right"><span class="txt1">End Date : </span></td>
                                <td width="80%"><h:formatDate pattern="MM-dd-yyyy" value="${requestScope.event.endDate}"/></td>
                            </tr>
                        </table>
                        <table id="rounded-corner">
                            <caption><span class="txt1"> Presenters List Of ${requestScope.event.title} </span></caption>
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded" width="5%">No.</th>
                                    <th scope="col" class="rounded" width="20%">Name</th>
                                    <th scope="col" class="rounded" width="40%">Address</th>
                                    <th scope="col" class="rounded" width="20%">Email</th>
                                    <th scope="col" class="rounded" width="15%">Phone</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="pre" items="${requestScope.event.presenterList}">
                                    <c:set var="count" value="${count + 1}"/>

                                    <tr>
                                        <td >${count}</td>
                                        <td >${pre.name}</td>
                                        <td >${pre.address}</td>
                                        <td >${pre.email}</td>
                                        <td >${pre.phone}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <table id="rounded-corner">
                            <caption><span class="txt1">Awards Of ${requestScope.event.title} </span></caption>
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded" width="20%">No.</th>
                                    <th scope="col" class="rounded" width="80%">Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="award" items="${requestScope.event.awardList}">
                                    <c:set var="count" value="${count + 1}"/>
                                    <tr>
                                        <td >${count}</td>
                                        <td >${award.description}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <c:if test="${requestScope.compare < 0}">
                            <span class="txt1"><a href="UserEventCO?action=formEnrollEvent&id=${requestScope.event.id}" class="fright">Enroll Current Event</a></span>
                        </c:if>
                        <c:if test="${requestScope.compare >= 0}">
                            <span class="txt1"><a class="fright">This event had enroll expired</a></span>
                        </c:if>
                        <table id="rounded-corner">
                            <caption><span class="txt1">Members Of ${requestScope.event.title}</span></caption>
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded" width="20%">No.</th>
                                    <th scope="col" class="rounded" width="40%">Email Address</th>
                                    <th scope="col" class="rounded" width="20%">Full Name</th>
                                    <th scope="col" class="rounded" width="20%">Phone Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="evtUser" items="${requestScope.event.evtUserList}">
                                    <c:set var="count" value="${count + 1}"/>
                                    <tr>
                                        <td >${count}</td>
                                        <td >${evtUser.user.email}</td>
                                        <td >${evtUser.user.fullName}</td>
                                        <td >${evtUser.user.phone}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <table id="rounded-corner">
                            <caption><span class="txt1">Winner Of ${requestScope.event.title}</span></caption>
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded" width="20%">No.</th>
                                    <th scope="col" class="rounded" width="30%">Email Address</th>
                                    <th scope="col" class="rounded" width="20%">Full Name</th>
                                    <th scope="col" class="rounded" width="30%">Award Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="evtUser" items="${requestScope.event.evtWinnerList}">
                                    <c:set var="count" value="${count + 1}"/>
                                    <tr>
                                        <td >${count}</td>
                                        <td >${evtUser.user.email}</td>
                                        <td >${evtUser.user.fullName}</td>
                                        <td >${evtUser.award.description}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <c:if test="${requestScope.compare < 0}">
                            <span class="txt1"><a href="UserEventCO?action=formEnrollEvent&id=${requestScope.event.id}" class="fright">Enroll Current Event</a></span>
                        </c:if>
                        <c:if test="${requestScope.compare >= 0}">
                            <span class="txt1"><a class="fright">This event had enroll expired</a></span>
                        </c:if>
                    </div>
                </section>
            </div>
        </div>
        <!-- footer -->
    <footer>
        <div class="container">
            <div class="inside">
                <div class="wrapper">
                    <div class="fleft">24/7 User Support <span>(+84).938.086.255</span></div>
                    <div class="aligncenter"><a href="#" class="new_window">NLPP University</a> designed by Group 2 - FAT3<br>
                        <a href="#" class="new_window">CSS</a> provided by Team Leader</div>
                </div>
            </div>
        </div>
    </footer>
    <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
