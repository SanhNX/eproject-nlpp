/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.User;
import SLSBeans.UserBLORemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author XuanSanh_IT 
 */
public class UserCO extends HttpServlet {

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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("login")) {
            try {
                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                User user = userBLO.checkUser(email, password);
                if (user != null) {
                    session = request.getSession(true);
                    session.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("User-login.jsp");
            }
        } else if (action.equalsIgnoreCase("logout")) {
            session = request.getSession();
            session.removeAttribute("user");
            response.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("myProfile")) {
            DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            session = request.getSession();
            User user = (User) session.getAttribute("user");
            String birthday = dateFormat.format(user.getBirthday());
            request.setAttribute("user", user);
            request.setAttribute("birthday", birthday);
            RequestDispatcher rd = request.getRequestDispatcher("User-editProfile.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("updateProfile")) {
            String fullName = request.getParameter("txtFullname");
            DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date birthday = null;
            try {
                birthday = (Date) dateFormat.parse(request.getParameter("txtBirthday").toString());

                boolean gender = false;
                String txtGender = request.getParameter("rbtType");
                if (txtGender.equalsIgnoreCase("Male")) {
                    gender = true;
                } else {
                    gender = false;
                }
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");
                session = request.getSession();
                User user = (User) session.getAttribute("user");
                String email = user.getEmail();
                System.out.println(email + "|" + fullName + "|" + birthday + "|" + gender + "|" + address + "|" + phone);
                boolean result = userBLO.updateProfile(email, fullName, birthday, gender, address, phone);

                if (result) {
                    RequestDispatcher rd = request.getRequestDispatcher("User-editProfile.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
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
