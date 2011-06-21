/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CL;

import EL.User;
import SLSBeans.UserBLORemote;
import java.io.IOException;
import java.io.PrintWriter;
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
