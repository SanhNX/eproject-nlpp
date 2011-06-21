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
        <link rel="stylesheet" type="text/css" href="css/style-table.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />
        <script language="javascript" type="text/javascript" src="js/niceforms.js"></script>
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
                    <!--                    <h1><a href="index.jsp">Student's site</a></h1>-->
                    <nav>
                        <ul>
                            <li class="current"><a href="index.jsp" class="m1">Home Page</a></li>
                            <li><a href="User-register.jsp" class="m3">Register</a></li>
                            <li><a href="User-login.jsp" class="m2">Feedback Us</a></li>
                            <li><a href="contact-us.jsp" class="m4">FAQ</a></li>
                            <li class="last"><a href="admin.jsp" class="m5">Administrator</a></li>
                        </ul>
                    </nav>
                    <form action="" id="search-form">
                        <fieldset>
                            <div class="rowElem">
                                <input type="text" value="Search Title Event" onFocus="if(this.value=='Search Title Event'){this.value=''}" onBlur="if(this.value==''){this.value='Search Title Event'}" >
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
                        <li><span><a href="#">Event Information</a></span></li>
                        <li><span><a href="#">Enroll Event</a></span></li>
                        <li><span><a href="#">Presenter Information</a></span></li>
                        <%
                                    HttpSession s = request.getSession();
                                    String ses = (String) s.getAttribute("user");
                                    if (ses == null) {
                        %>
                        <li><span><a href="User-login.jsp">Login</a></span></li>
                        <li><span><a href="User-register.jsp">Register</a></span></li>
                        <%}%>
                        <li><span><a href="#">About US</a></span></li>
                    </ul>
                    <%
                                s = request.getSession();
                                ses = (String) s.getAttribute("user");
                                if (ses != null) {
                    %>
                    <form action="" id="newsletter-form1">
                        <fieldset>
                            <div class="rowElem">
                                <h2>Login Site</h2>
                                <a style="color:#FFF">Username</a>
                                <input type="text" value="">
                                <a style="color:#FFF">Password</a>
                                <input type="password" value="">
                                <div class="clear"><a href="register.jsp" class="fleft">Register User</a><a href="#" class="fright">Submit</a></div>
                            </div>                            
                        </fieldset>
                    </form>
                    <%                                            } else {
                    %>
                    <form action="" method="POST" id="newsletter-form2">
                        <fieldset>
                            <div class="rowElem">
                                <h2>You Are Sign In</h2>
                                <a style="color: white; font-size: 20px; ">Welcome </a><a href="#" style="font-weight:lighter;font-style: italic;color: brown;font-size: 15px; ">sanh232003</a>
                                <br/><br/>
                                <div><a href="#" class="fleft">My Profile</a><a href="#" class="fright">Logout</a></div>
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
                        <form action="" method="POST" id="newsletter-form">
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
                        <h2><img src="images/icon_cube.png" width="64" height="95">${requestScope.event.title} <span>Events</span></h2>
                        <div class="img-box"><img src="images/logo_event.png" width="130" height="130" class="png"><span class="txt1">${requestScope.event.description}</span>
                            ${requestScope.event.description} ${requestScope.event.description} ${requestScope.event.description} ${requestScope.event.description} ${requestScope.event.description} ${requestScope.event.description}</div>
                        <table id="rounded-corner">
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded">Criteria</th>
                                    <th scope="col" class="rounded">Procedures</th>
                                    <th scope="col" class="rounded">Fee</th>
                                    <th scope="col" class="rounded">Start Date</th>
                                    <th scope="col" class="rounded">End Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${requestScope.event.criteria}</td>
                                    <td>${requestScope.event.procedures}</td>
                                    <td>${requestScope.event.fee}$</td>
                                    <td>${requestScope.event.startDate}</td>
                                    <td>${requestScope.event.endDate}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
            </div>
        </section>
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
