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
        <link rel="stylesheet" type="text/css" href="css/style-admin.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />
        <script language="javascript" type="text/javascript" src="js/niceforms.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>
        <script type="text/javascript" src="js/additional-methods.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#login-admin").validate({
                    rules:{
                        txtUsername:{
                            required: true
                        },
                        txtPassword:{
                            required:true
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

                <div class="right_header">Welcome ${sessionScope.admin.email} <a href="#">View Profile</a>  | <a href="AdminCO?action=logout" class="logout">Logout</a></div>
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
                                    <li><a href="">Manage Adward</a></li>
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

                        <h2>Products Categories Settings</h2>


                        <table id="rounded-corner" summary="2007 Major IT Companies' Profit">
                            <thead>
                                <tr>
                                    <th scope="col" class="rounded-company"></th>
                                    <th scope="col" class="rounded">Product</th>
                                    <th scope="col" class="rounded">Details</th>
                                    <th scope="col" class="rounded">Price</th>
                                    <th scope="col" class="rounded">Date</th>
                                    <th scope="col" class="rounded">Edit</th>
                                    <th scope="col" class="rounded-q4">Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6" class="rounded-foot-left"><em>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</em></td>
                                    <td class="rounded-foot-right">&nbsp;</td>

                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" name="" /></td>
                                    <td>Product name</td>
                                    <td>details</td>
                                    <td>150$</td>
                                    <td>12/05/2010</td>

                                    <td><a href="#"><img src="images/user_edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="#" class="ask"><img src="images/trash.png" alt="" title="" border="0" /></a></td>
                                </tr>

                            </tbody>
                        </table>

                        <a href="#" class="bt_green"><span class="bt_green_lft"></span><strong>Add new item</strong><span class="bt_green_r"></span></a>
                        <a href="#" class="bt_blue"><span class="bt_blue_lft"></span><strong>View all items from category</strong><span class="bt_blue_r"></span></a>
                        <a href="#" class="bt_red"><span class="bt_red_lft"></span><strong>Delete items</strong><span class="bt_red_r"></span></a>
                        <h2>Nice Form example</h2>

                        <div class="form">
                            <form action="" method="post" class="niceform">

                                <fieldset>
                                    <dl>
                                        <dt><label for="email">Email Address:</label></dt>
                                        <dd><input type="text" name="" id="" size="54" /></dd>
                                    </dl>
                                    <dl>
                                        <dt><label for="password">Password:</label></dt>
                                        <dd><input type="text" name="" id="" size="54" /></dd>
                                    </dl>


                                    <dl>
                                        <dt><label for="gender">Select categories:</label></dt>
                                        <dd>
                                            <select size="1" name="gender" id="">
                                                <option value="">Select option 1</option>
                                                <option value="">Select option 2</option>
                                                <option value="">Select option 3</option>
                                                <option value="">Select option 4</option>
                                                <option value="">Select option 5</option>
                                            </select>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt><label for="interests">Select tags:</label></dt>
                                        <dd>
                                            <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">Web design</label>
                                            <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">Business</label>
                                            <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">Simple</label>
                                            <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">Clean</label>
                                        </dd>
                                    </dl>

                                    <dl>
                                        <dt><label for="color">Select type</label></dt>
                                        <dd>
                                            <input type="radio" name="type" id="" value="" /><label class="check_label">Basic</label>
                                            <input type="radio" name="type" id="" value="" /><label class="check_label">Medium</label>
                                            <input type="radio" name="type" id="" value="" /><label class="check_label">Premium</label>
                                        </dd>
                                    </dl>



                                    <dl>
                                        <dt><label for="upload">Upload a File:</label></dt>
                                        <dd><input type="file" name="upload" id="upload" /></dd>
                                    </dl>

                                    <dl>
                                        <dt><label for="comments">Message:</label></dt>
                                        <dd><textarea name="comments" id="comments" rows="5" cols="50"></textarea></dd>
                                    </dl>

                                    <dl>
                                        <dt><label></label></dt>
                                        <dd>
                                            <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">I agree to the <a href="#">terms &amp; conditions</a></label>
                                        </dd>
                                    </dl>

                                    <dl class="submit">
                                        <input type="submit" name="submit" id="submit" value="Submit" />
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
