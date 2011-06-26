/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.Presenter;
import SLSBeans.PresenterBLORemote;
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
public class AdminPresenterCO extends HttpServlet {

    PresenterBLORemote PresenterBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            PresenterBLO = (PresenterBLORemote) ctx.lookup("PresenterBLO/remote");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("presenter")) {
            List<Presenter> presenters = PresenterBLO.getAll();
            request.setAttribute("presenters", presenters);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("addpresenter")) {
            String name = request.getParameter("txtname");
            String address = request.getParameter("txtaddress");
            String email = request.getParameter("txtemail");
            String phone = request.getParameter("txtphone");

            Presenter pre = new Presenter(name, address, email, phone);
            boolean resutl = PresenterBLO.addPresenter(pre);
            if (resutl) {
                List<Presenter> presenters = PresenterBLO.getAll();
                request.setAttribute("presenters", presenters);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Admin/error.jsp");
            }
        } else if (action.equalsIgnoreCase("view")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Presenter pre = PresenterBLO.getByID(id);
            request.setAttribute("pre", pre);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter-View.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("Delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean resutl = PresenterBLO.deletePresenter(id);
            if (resutl) {
                List<Presenter> presenters = PresenterBLO.getAll();
                request.setAttribute("presenters", presenters);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Admin/error.jsp");
            }
        } else if (action.equalsIgnoreCase("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("txtname");
            String address = request.getParameter("txtaddress");
            String email = request.getParameter("txtemail");
            String phone = request.getParameter("txtphone");

            Presenter pre = new Presenter(id, name, address, email, phone);
            boolean resutl = PresenterBLO.updatePresenter(pre);
            if (resutl) {
                List<Presenter> presenters = PresenterBLO.getAll();
                request.setAttribute("presenters", presenters);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        } else if (action.equalsIgnoreCase("search")) {
            String keyword = request.getParameter("txtsearch");
            List<Presenter> presenters = PresenterBLO.searchPresenter(keyword);
            request.setAttribute("presenters", presenters);
            request.setAttribute("keyword", keyword);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-Presenter.jsp");
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
