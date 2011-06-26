/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.FeedBack;
import EL.User;
import SLSBeans.AdminFeedBackBLORemote;
import SLSBeans.UserBLORemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AdminFeedBackCO extends HttpServlet {

    AdminFeedBackBLORemote feedbackBLO;
    UserBLORemote userBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            feedbackBLO = (AdminFeedBackBLORemote) ctx.lookup("AdminFeedBackBLO/remote");
            userBLO = (UserBLORemote) ctx.lookup("UserBLO/remote");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("feedback")) {
            List<FeedBack> feeds = feedbackBLO.getAll();
            request.setAttribute("feeds", feeds);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-FeedBack.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("view")) {
            int id = Integer.parseInt(request.getParameter("code"));
            FeedBack pre = feedbackBLO.getByID(id);
            DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            String questionDate = dateFormat.format(pre.getQuestionDate());
            request.setAttribute("feed", pre);
            request.setAttribute("questionDate", questionDate);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-FeedBack-View.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("code"));
            boolean resutl = feedbackBLO.deleteFeedBack(id);
            if (resutl) {
                List<FeedBack> feeds = feedbackBLO.getAll();
                request.setAttribute("feeds", feeds);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-FeedBack.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Admin/error.jsp");
            }
        } else if (action.equalsIgnoreCase("update")) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                FeedBack f = feedbackBLO.getByID(id);
                User u = f.getUser();
                String subject = request.getParameter("txtsubject");
                String question = request.getParameter("txtquestion");
                String answer = request.getParameter("txtanswer");
                DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
                Date questiondate = (Date) dateFormat.parse(request.getParameter("txtquestionDate").toString());
                Date answerdate = new Date();
                String status = "Processed";
                FeedBack feed = new FeedBack(id, subject, question, answer, questiondate, answerdate, status, u);
                boolean resutl = feedbackBLO.updateFeedback(feed);
                if (resutl) {
                    request.setAttribute("feeds", feed);
                    RequestDispatcher rd = request.getRequestDispatcher("AdminFeedBackCO?action=feedback");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("Admin/error.jsp");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("search")) {
            String keyword = request.getParameter("txtsearch");
            List<FeedBack> feedbacks = feedbackBLO.searchBySubject(keyword);
            request.setAttribute("feeds", feedbacks);
            request.setAttribute("keyword", keyword);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-FeedBack.jsp");
            rd.forward(request, response);
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
