/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.User;
import SLSBeans.AdminUserBLORemote;
import SLSBeans.UserBLORemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APTECH-FPT
 */
public class AdminUserCO extends HttpServlet {

    AdminUserBLORemote adminUserBLO;
    UserBLORemote userBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            adminUserBLO = (AdminUserBLORemote) ctx.lookup("AdminUserBLO/remote");
            userBLO = (UserBLORemote) ctx.lookup("UserBLO/remote");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("manageUser")) {
            List<User> users = adminUserBLO.getAll();
            request.setAttribute("users", users);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-ManageUser.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("editUser")) {
//            User user = userBLO.getByEmail(username);
            //request.setAttribute("user", user);
            // RequestDispatcher rd = request.getRequestDispatcher("Admin-Manage-User-Edit.jsp");
            //rd.forward(request, response);
        } else if (action.equalsIgnoreCase("search")) {
            String keywork = request.getParameter("txtsearch");
            List<User> users = adminUserBLO.searchUser(keywork);
            request.setAttribute("users", users);
            request.setAttribute("keywork", keywork);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-ManageUser.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("updateStatus")) {
            String email = request.getParameter("email");
            User user = userBLO.getByEmail(email);
            if(user.getStatus())
                user.setStatus(false);
            else
                user.setStatus(true);
            boolean result = userBLO.updateStatus(user);
            if(result){//AdminUserCO?action=manageUser
                response.sendRedirect("AdminUserCO?action=manageUser");
            }
        }else if (action.equalsIgnoreCase("deleteUser")) {
            String email = request.getParameter("email");
            User user = userBLO.getByEmail(email);
            boolean result = adminUserBLO.deleteUser(user);
            if(result){
                response.sendRedirect("AdminUserCO?action=manageUser");
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
