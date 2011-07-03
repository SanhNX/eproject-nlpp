/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.Award;
import SLSBeans.AwardBLORemote;
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
public class AdminAwardCO extends HttpServlet {

    AwardBLORemote awardBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            awardBLO = (AwardBLORemote) ctx.lookup("AwardBLO/remote");
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
        if (action.equalsIgnoreCase("viewAward")) {
            List<Award> awards = awardBLO.getAllAward();
            request.setAttribute("awards", awards);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/manageAward.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("addAward")) {
            String description = request.getParameter("txtDescription");
            Award award = new Award(description);
            boolean result = awardBLO.addAward(award);
            if (result) {
                response.sendRedirect("AdminAwardCO?action=viewAward");
            }
        } else if (action.equalsIgnoreCase("deleteAward")) {
            int awardID = Integer.parseInt(request.getParameter("awardID"));
            boolean result = awardBLO.deleteAward(awardID);
            if (result) {
                response.sendRedirect("AdminAwardCO?action=viewAward");
            }
        } else if (action.equalsIgnoreCase("formEditAward")) {
            int awardID = Integer.parseInt(request.getParameter("awardID"));
            Award award = awardBLO.getByID(awardID);
            List<Award> awards = awardBLO.getAllAward();
            request.setAttribute("awards", awards);
            request.setAttribute("award", award);
            request.setAttribute("flag", "True");
            RequestDispatcher rd = request.getRequestDispatcher("Admin/manageAward.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("editAward")) {
            int awardID = Integer.parseInt(request.getParameter("awardID"));
            String desciption = request.getParameter("txtDescription1");
            System.out.println(desciption);
            Award award = new Award(awardID, desciption);
            boolean result = awardBLO.editAward(award);
            if (result) {
                List<Award> awards = awardBLO.getAllAward();
                request.setAttribute("awards", awards);
                request.setAttribute("flag", "");
                RequestDispatcher rd = request.getRequestDispatcher("Admin/manageAward.jsp");
                rd.forward(request, response);
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
