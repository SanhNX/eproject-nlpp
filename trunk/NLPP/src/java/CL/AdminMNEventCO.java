/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.Award;
import EL.Event;
import EL.Payment;
import EL.Presenter;
import EL.User;
import SLSBeans.EventBLORemote;
import SLSBeans.PresenterBLORemote;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author XuanSanh_IT
 */
public class AdminMNEventCO extends HttpServlet {

    EventBLORemote eventBLO;
    PresenterBLORemote preBLO;
    UserBLORemote userBLO;

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
        HttpSession session = null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("viewEvent")) {
            List<Event> events = eventBLO.getAllEvent();
            request.setAttribute("events", events);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-ManageEvent.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("addEvent")) {
            DateFormat dateFormat = null;
            try {
                String title = request.getParameter("txtTitle");
                int fee = Integer.parseInt(request.getParameter("txtFee"));
                String criteria = request.getParameter("txtCriteria");
                String procedures = request.getParameter("txtProcedures");
                dateFormat = new SimpleDateFormat("MM-dd-yyyy");
                Date startDate = (Date) dateFormat.parse(request.getParameter("txtStartDate").toString());
                Date endDate = (Date) dateFormat.parse(request.getParameter("txtEndDate").toString());
                String description = request.getParameter("txtDescription");
                Event event = new Event(title, fee, criteria, procedures, startDate, endDate, description);
                boolean result = eventBLO.addEvent(event);
                if (result) {
                    request.setAttribute("event", event);
                    RequestDispatcher rd = request.getRequestDispatcher("AdminMNEventCO?action=viewEvent");
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("searchEvent")) {
            String title = request.getParameter("txtKeyword");
            List<Event> events = eventBLO.getByTitle(title);
            request.setAttribute("events", events);
            request.setAttribute("title", title);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-ManageEvent.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("formUpdateEvent")) {
            try {
                String id = request.getParameter("id");
                Event event = eventBLO.getByID(Integer.parseInt(id));
                DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
                String startDate = dateFormat.format(event.getStartDate());
                String endDate = dateFormat.format(event.getEndDate());
                request.setAttribute("event", event);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-updateEvent.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("updateInfo")) {
            DateFormat dateFormat = null;
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String title = request.getParameter("txtTitle");
                int fee = Integer.parseInt(request.getParameter("txtFee"));
                String criteria = request.getParameter("txtCriteria");
                String procedures = request.getParameter("txtProcedures");
                dateFormat = new SimpleDateFormat("MM-dd-yyyy");
                Date startDate = (Date) dateFormat.parse(request.getParameter("txtStartDate").toString());
                Date endDate = (Date) dateFormat.parse(request.getParameter("txtEndDate").toString());
                String description = request.getParameter("txtDescription");
                Event event = new Event(id, title, fee, criteria, procedures, startDate, endDate, description);
                boolean result = eventBLO.updateEvent(event);
                if (result) {
                    request.setAttribute("event", event);
                    RequestDispatcher rd = request.getRequestDispatcher("AdminMNEventCO?action=formUpdateEvent&id=" + event.getId());
                    rd.forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("listPresnter")) {
            List<Presenter> presenters = preBLO.getAll();
            String id = request.getParameter("id");
            request.setAttribute("id", id);
            request.setAttribute("presenters", presenters);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-listPresenter.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("addPresenter")) {
            try {
                int evtID = Integer.parseInt(request.getParameter("evtID"));
                int preID = Integer.parseInt(request.getParameter("preID"));
                boolean result = eventBLO.addPreForEvent(evtID, preID);
                if (result) {
                    response.sendRedirect("AdminMNEventCO?action=formUpdateEvent&id=" + evtID);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("delPre")) {
            try {
                int evtID = Integer.parseInt(request.getParameter("evtID"));
                int preID = Integer.parseInt(request.getParameter("preID"));
                boolean result = eventBLO.removePreForEvent(evtID, preID);
                if (result) {
                    response.sendRedirect("AdminMNEventCO?action=formUpdateEvent&id=" + evtID);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("formAddAward")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Event event = eventBLO.getByID(id);
            request.setAttribute("event", event);
            RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-createAward.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("addAward")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Event event = eventBLO.getByID(id);
            String description = request.getParameter("txtDescription");
            Award award = new Award(description);
            boolean result = eventBLO.addAwardForEvent(award, event);
            if (result) {
                Event eventNew = eventBLO.getByID(id);
                request.setAttribute("event", eventNew);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/Admin-createAward.jsp");
                rd.forward(request, response);
            }
        } else if (action.equalsIgnoreCase("deleteAward")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int awardID = Integer.parseInt(request.getParameter("awardID"));
            boolean result = eventBLO.deleteAwardOfEvent(awardID);
            if (result) {
                Event eventNew = eventBLO.getByID(id);
                request.setAttribute("event", eventNew);
                RequestDispatcher rd = request.getRequestDispatcher("AdminMNEventCO?action=formUpdateEvent&id=" + id);
                rd.forward(request, response);
            }
        } else if (action.equalsIgnoreCase("deleteUForE")) {
            String email = request.getParameter("email");
            int evtID = Integer.parseInt(request.getParameter("evtID"));
            User user = userBLO.getByEmail(email);
            Event event = eventBLO.getByID(evtID);
            boolean result = eventBLO.delUserOfEvent(user, event);
            if(result){
                Event eventNew = eventBLO.getByID(evtID);
                request.setAttribute("event", eventNew);
                RequestDispatcher rd = request.getRequestDispatcher("AdminMNEventCO?action=formUpdateEvent&id=" + evtID);
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