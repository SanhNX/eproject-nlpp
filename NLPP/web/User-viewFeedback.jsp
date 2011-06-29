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
        <link rel="stylesheet" type="text/css" href="css/style-table.css" />
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
                $("#contacts-form").validate({
                    rules:{
                        txtQuestion:{
                            required: true,
                            minlength: 10
                        },
                        txtSubject:{
                            required:true,
                            minlength: 10
                        }
                    }   //end rules
                });  //end validate
            }); //end function
        </script>
        <title>National Level Paper Presentation</title>
    </head>
    <body id="page1">
        <%
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("user");
                    if (user == null) {
        %>
        <jsp:forward page="/User-login.jsp"/>
        <%}%>
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
                        </ul>
                    </nav>
                    <form action="VisiterCO?action=searchEvent" method="POST" id="search-form">
                        <fieldset>
                            <div class="rowElem">
                                <input type="text" name="txtKeyword"  value="Search Title Event" onFocus="if(this.value=='Search Title Event'){this.value=''}" onBlur="if(this.value==''){this.value='Search Title Event'}" >
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
                        <li><span><a href="#">About US</a></span></li>
                    </ul>
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
                    <h2>Fresh <span>News</span></h2>
                    <ul class="news">
                        <li><strong>June 30, 2010</strong>
                            <h4><a href="#">Sed ut perspiciatis unde</a></h4>
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. </li>
                        <li><strong>June 14, 2010</strong>
                            <h4><a href="#">Neque porro quisquam est</a></h4>
                            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni. </li>

                        <br/>
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
                    </ul>
                </aside>
                <!-- content -->
                <section id="content">
                    <div id="banner">
                        <h2><span>Traning Programmer<span>Since 1992</span></span></h2>
                    </div>
                    <div class="inside">
                        <h2><img src="images/icon_cube.png" width="64" height="95">Our <span>Feedback</span></h2>
                        <div class="address">
                            <address>
                                <strong>Zip Code:</strong>70000<br>
                                <strong>Country:</strong>Viet Nam<br>
                                <strong>Telephone:</strong>+84 938-086255<br>
                                <strong>Fax:</strong>+84 938-086255
                            </address>
                            <div class="extra-wrap">
                                <h4>NLPP University info:</h4>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.</p>
                            </div>
                        </div>
                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded" width="5%">No.</th>
                                    <th scope="col" class="rounded" width="15%">Feedback Date</th>
                                    <th scope="col" class="rounded" width="40%">Question</th>
                                    <th scope="col" class="rounded" width="40%">Answer</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="fb" items="${sessionScope.user.feedBackList}">
                                    <c:set var="count" value="${count + 1}"/>
                                    <c:if test="${count%2==1}">
                                        <tr style="background-color: #d2e7f0;">
                                            <td >${count}</td>
                                            <td ><h:formatDate pattern="MM-dd-yyyy" value="${fb.questionDate}"/></td>
                                            <td >${fb.question}</td>
                                            <td >${fb.answer}</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${count%2==0}">
                                        <tr>
                                            <td >${count}</td>
                                            <td ><h:formatDate pattern="MM-dd-yyyy" value="${fb.questionDate}"/></td>
                                            <td >${fb.question}</td>
                                            <td >${fb.answer}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
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
