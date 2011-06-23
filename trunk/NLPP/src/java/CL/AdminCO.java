/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CL;

import EL.User;
import SLSBeans.UserBLORemote;
import java.awt.Desktop.Action;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Thanh Nha
 */
public class AdminCO extends HttpServlet {
   
    UserBLORemote userBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            userBLO = (UserBLORemote) ctx.lookup("UserBLO/remote");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("login")) {
            try {
                String name = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                User admin = userBLO.checkAdmin(name, password);

                if (admin != null) {
                    session = request.getSession(true);
                    session.setAttribute("admin", admin);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin-home.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("Admin-login.jsp");
            }
        } else if (action.equalsIgnoreCase("logout")) {
            session = request.getSession();
            session.removeAttribute("admin");
            response.sendRedirect("Admin-login.jsp");
        }else if (action.equalsIgnoreCase("myProfile")) {
            session = request.getSession();
            User admin = (User) session.getAttribute("admin");
            DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            String birthday = dateFormat.format(admin.getBirthday());
            request.setAttribute("gender", admin.getGender());
            request.setAttribute("admin", admin);
            request.setAttribute("birthday", birthday);
            RequestDispatcher rd = request.getRequestDispatcher("Admin-MyProfile.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("updateProfile")) {
            String fullName = request.getParameter("txtFullname");
            DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date birthday = null;
            try {
                birthday = (Date) dateFormat.parse(request.getParameter("txtBirthday").toString());

                boolean gender = false;
                String txtGender = request.getParameter("type");
                if (txtGender.equalsIgnoreCase("Male")) {
                    gender = true;
                } else {
                    gender = false;
                }
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");
                session = request.getSession();
                User admin = (User) session.getAttribute("admin");
                String email = admin.getEmail();
                System.out.println(email + "|" + fullName + "|" + birthday + "|" + gender + "|" + address + "|" + phone);
                boolean result = userBLO.updateProfile(email, fullName, birthday, gender, address, phone);

                if (result) {
                    admin = userBLO.checkAdmin(admin.getEmail(), admin.getPassword());
                    String birthday1 = dateFormat.format(admin.getBirthday());
                    request.setAttribute("gender", admin.getGender());
                    request.setAttribute("admin", admin);
                    request.setAttribute("birthday", birthday1);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin-MyProfile.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        } else if (action.equalsIgnoreCase("updatePass")) {
            try {
                String Pass = request.getParameter("txtPass");
                String rePass = request.getParameter("txtRePass");
                String oldPass = request.getParameter("txtOldPass");
                session = request.getSession();
                User admin = (User) session.getAttribute("admin");
                User u = userBLO.checkAdmin(admin.getEmail(), oldPass);
                if (u != null) {
                    boolean result = userBLO.updatePass(admin.getEmail(), Pass);
                    if (result) {
                        System.out.println("------------------UPDATE PASS SUCCESSFUL----------------");// For Debug
                        session = request.getSession();
                        session.removeAttribute("admin");
                        response.sendRedirect("Admin-Login-comfirm.jsp");
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("Admin-ChangePassError.jsp");
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
