/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.MailingList;
import SLSBeans.MailingListBLORemote;
import java.io.IOException;
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
public class mailingCO extends HttpServlet {

    MailingListBLORemote mailBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            mailBLO = (MailingListBLORemote) ctx.lookup("MailingListBLO/remote");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("mailling")) {
            List<MailingList> mails = mailBLO.getAll();
            request.setAttribute("mails", mails);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Mailling.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            String email = request.getParameter("txtemail");
            MailingList m = new MailingList(email);
            boolean resutl = mailBLO.add(m);
            if (resutl) {
                List<MailingList> mails = mailBLO.getAll();
                request.setAttribute("mails", mails);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Mailling.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            String mail = request.getParameter("code");
            boolean resutl = mailBLO.deleteMail(mail);
            if (resutl) {
                List<MailingList> mails = mailBLO.getAll();
                request.setAttribute("mails", mails);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Mailling.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } else if (action.equalsIgnoreCase("search")) {
            String keyword = request.getParameter("txtsearch");
            List<MailingList> mails = mailBLO.search(keyword);
            request.setAttribute("mails", mails);
            request.setAttribute("keyword", keyword);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Mailling.jsp");
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
