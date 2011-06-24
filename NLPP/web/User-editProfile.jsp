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
                $("#contacts-form1").validate({
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
                $("#contacts-form").validate({
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
                        },
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
    <body id="page1">
        <%
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("user");
                    if (user == null) {
        %>
        <jsp:forward page="/User-login-confirm.jsp"/>
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

                    </ul>
                </aside>
                <!-- content -->
                <section id="content">
                    <div id="banner">
                        <h2><span>Traning Programmer<span>Since 1992</span></span></h2>
                    </div>
                    <div class="inside1">
                        <h2><img src="images/icon_cube.png" width="64" height="95">Update Profile <span>Form</span></h2>
                        <form id="contacts-form" action="UserCO?action=updateProfile" method="POST">
                            <table cellpadding="110" cellspacing="15">
                                <tr class="field">
                                    <td>Birthday &nbsp;</td>
                                    <td><input type="text" value="${requestScope.birthday}" name="txtBirthday" id="inputField" size="30" readonly="true"/></td>
                                </tr>
                                <tr class="field">
                                    <td>Full Name &nbsp;</td>
                                    <td><input type="text" name="txtFullname" value="${requestScope.user.fullName}" size="30"/></td>
                                </tr>
                                <c:if test="${requestScope.gender==true}">
                                    <tr class="field">
                                        <td>Gender &nbsp;</td>
                                        <td>
                                            <input type="radio" name="rbtType" value="Male" checked="true"> Male
                                            <input type="radio" name="rbtType" value="FeMale"> FeMale
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${requestScope.gender==false}">
                                    <tr class="field">
                                        <td>Gender &nbsp;</td>
                                        <td>
                                            <input type="radio" name="rbtType" value="Male" > Male
                                            <input type="radio" name="rbtType" value="FeMale" checked="true"> FeMale
                                        </td>
                                    </tr>
                                </c:if>
                                <tr class="field">
                                    <td>Address &nbsp;</td>
                                    <td><input type="text" name="txtAddress" value="${requestScope.user.address}" size="30"/></td>
                                </tr>
                                <tr class="field">
                                    <td>Phone Number &nbsp;</td>
                                    <td><input type="text" name="txtPhone" value="${requestScope.user.phone}" size="30"/></td>
                                </tr>
                                <tr class="field">
                                    <td></td>
                                    <td><input align="right" type="submit" value="Update Now"></td>
                                </tr>
                            </table>
                        </form>
                        <h2><img src="images/icon_cube.png" width="64" height="95">Change Password <span>Form</span></h2>
                        <form id="contacts-form1" action="UserCO?action=updatePass" method="POST">
                            <table>
                                <tr class="field">
                                    <td>New Password &nbsp;</td>
                                    <td><input type="password" name="txtPass" size="30"  id="txtPass"/></td>
                                </tr>
                                <tr class="field">
                                    <td>Re-Password &nbsp;</td>
                                    <td><input type="password" name="txtRePass" value="" size="30"/></td>
                                </tr>
                                <tr class="field">
                                    <td>Old Password &nbsp;</td>
                                    <td><input type="password" name="txtOldPass" value="" size="30"/></td>
                                </tr>
                                <tr class="field">
                                    <td></td>
                                    <td><input align="left" type="reset" value="Reset Form"> &nbsp;|&nbsp; <input align="right" type="submit" value="Change Pass"></td>
                                </tr>
                            </table>
                        </form>
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
