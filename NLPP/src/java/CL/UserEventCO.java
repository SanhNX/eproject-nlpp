/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.Event;
import EL.EvtUser;
import EL.Payment;
import EL.Presenter;
import EL.User;
import SLSBeans.EventBLORemote;
import SLSBeans.PresenterBLORemote;
import java.io.IOException;
import java.util.List;
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
public class UserEventCO extends HttpServlet {

    EventBLORemote eventBLO;
    PresenterBLORemote preBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            eventBLO = (EventBLORemote) ctx.lookup("EventBLO/remote");
            preBLO = (PresenterBLORemote) ctx.lookup("PresenterBLO/remote");
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
        HttpSession session = null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("viewEvent")) {
            List<Event> events = eventBLO.getAllEvent();
            request.setAttribute("events", events);
            RequestDispatcher rd = request.getRequestDispatcher("User-Events.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("event")) {
            String id = request.getParameter("id");
            Event event = eventBLO.getByID(Integer.parseInt(id));
            request.setAttribute("event", event);
            RequestDispatcher rd = request.getRequestDispatcher("User-Event.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("listPresnter")) {
            List<Presenter> presenters = preBLO.getAll();
            request.setAttribute("presenters", presenters);
            RequestDispatcher rd = request.getRequestDispatcher("User-ListPresenter.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("formEnrollEvent")) {
            session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("User-login-Permission.jsp");
            } else {
                String id = request.getParameter("id");
                Event event = eventBLO.getByID(Integer.parseInt(id));
                request.setAttribute("event", event);
                RequestDispatcher rd = request.getRequestDispatcher("User-EnrollEvent.jsp");
                rd.forward(request, response);
            }
        } else if (action.equalsIgnoreCase("enrollEvent")) {
            session = request.getSession();
            User user = (User) session.getAttribute("user");
            String id = request.getParameter("id");
            Event event = eventBLO.getByID(Integer.parseInt(id));
            String PaymentName = request.getParameter("rbtType");
            Payment payment = null;
            if (PaymentName.equalsIgnoreCase("Direct")) {
                payment = eventBLO.getPaymentById(1);
            } else if (PaymentName.equalsIgnoreCase("Cheque")) {
                payment = eventBLO.getPaymentById(2);
            } else if (PaymentName.equalsIgnoreCase("Cash")) {
                payment = eventBLO.getPaymentById(3);
            }
            boolean result = eventBLO.addUserForEvent(user, event, payment);
            if(result){
                response.sendRedirect("UserEventCO?action=event&id="+id);
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
            throws ServletException,
            IOException {
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
            throws ServletException,
            IOException {
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
