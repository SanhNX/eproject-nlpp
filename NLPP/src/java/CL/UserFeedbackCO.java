/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.FeedBack;
import EL.User;
import SLSBeans.FeedBackBLORemote;
import java.io.IOException;
import java.util.Date;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author XuanSanh_IT
 */
public class UserFeedbackCO extends HttpServlet {

    FeedBackBLORemote feedbackBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            feedbackBLO = (FeedBackBLORemote) ctx.lookup("FeedBackBLO/remote");
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
        String action = request.getParameter("action");
        HttpSession session = null;
        if (action.equalsIgnoreCase("addFeedback")) {
            try {
                session = request.getSession();
                User user = (User) session.getAttribute("user");
                String subject = request.getParameter("txtSubject");
                String question = request.getParameter("txtQuestion");
                Date date = new Date();
                FeedBack feedback = new FeedBack(subject, question, date,"Not Process");
                boolean result = feedbackBLO.add(feedback, user);
                if (result) {
                    response.sendRedirect("User-viewFeedback.jsp");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("error.jsp");
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
