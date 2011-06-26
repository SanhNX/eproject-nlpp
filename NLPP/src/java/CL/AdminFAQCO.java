/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.FAQ;
import SLSBeans.FAQBLORemote;
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
 * @author XuanSanh_IT
 */
public class AdminFAQCO extends HttpServlet {

    FAQBLORemote faqBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            faqBLO = (FAQBLORemote) ctx.lookup("FAQBLO/remote");
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
        if (action.equalsIgnoreCase("viewFAQ")) {
            List<FAQ> faqList = faqBLO.getAll();
            request.setAttribute("faqList", faqList);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-viewFAQ.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("formEdit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            FAQ faq = faqBLO.getFAQByID(id);
            request.setAttribute("faq", faq);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-updateFAQ.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String subject = request.getParameter("txtSubject");
            String question = request.getParameter("txtQuestion");
            String answer = request.getParameter("txtAnswer");
            FAQ faq = new FAQ(id, subject, question, answer);
            boolean result = faqBLO.update(faq);
            if(result){
                response.sendRedirect("AdminFAQCO?action=viewFAQ");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            FAQ faq  = faqBLO.getFAQByID(id);
            boolean result = faqBLO.delete(faq);
            if(result){
                response.sendRedirect("AdminFAQCO?action=viewFAQ");
            }
        } else if (action.equalsIgnoreCase("add")) {
            String subject = request.getParameter("txtSubject");
            String question = request.getParameter("txtQuestion");
            String answer = request.getParameter("txtAnswer");
            FAQ faq = new FAQ(subject, question, answer);
            boolean result = faqBLO.add(faq);
            if(result){
                response.sendRedirect("AdminFAQCO?action=viewFAQ");
            }
        } else if (action.equalsIgnoreCase("search")) {
            String keyword = request.getParameter("txtsearch");
            List<FAQ> faqList = faqBLO.searchBySubject(keyword);
            request.setAttribute("faqList", faqList);
            request.setAttribute("keyword", keyword);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-viewFAQ.jsp");
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
