/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CL;

import EL.*;
import SLSBeans.*;
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
public class VisiterCO extends HttpServlet {

    UserBLORemote userBLO;
    MailingListBLORemote mailingListBLO;
    FAQBLORemote faqBLO;
    EventBLORemote eventBLO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            String jndiFileName = this.getServletContext().getRealPath("/") + "WEB-INF/jndi.properties";
            java.util.Properties props = new java.util.Properties();
            props.load(new java.io.FileInputStream(jndiFileName));
            InitialContext ctx = new InitialContext(props);
            userBLO = (UserBLORemote) ctx.lookup("UserBLO/remote");
            faqBLO = (FAQBLORemote) ctx.lookup("FAQBLO/remote");
            mailingListBLO = (MailingListBLORemote) ctx.lookup("MailingListBLO/remote");
            eventBLO = (EventBLORemote) ctx.lookup("EventBLO/remote");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("register")) {
            String messege="";
            User u = null;
            Date birthday = null;
            DateFormat dateFormat = null;
            try {
                String email = request.getParameter("txtEmail");
                String pass = request.getParameter("txtPass");
                dateFormat = new SimpleDateFormat("MM-dd-yyyy");
                birthday = (Date) dateFormat.parse(request.getParameter("txtBirthday").toString());
                String fullName = request.getParameter("txtFullname");
                String txtgender = request.getParameter("rbtType");
                boolean gender = true;
                if (txtgender.equalsIgnoreCase("Male")) {
                    gender = true;
                } else {
                    gender = false;
                }
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");
                Role role = userBLO.getRole(2);
                u = new User(email, pass, fullName, birthday, gender, address, phone,true);
                boolean result = userBLO.add(role, u);
                if (result) {
                    messege="";
                    response.sendRedirect("User-login-confirm.jsp");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                messege = "This email address is already registered !<br/>Please switch to the Login Page.";
                request.setAttribute("messege", messege);
                request.setAttribute("user", u);
                String birthday1 = dateFormat.format(u.getBirthday());
                request.setAttribute("birthday", birthday1);
                RequestDispatcher rd = request.getRequestDispatcher("User-register.jsp");
                rd.forward(request, response);
            }
        } else if (action.equalsIgnoreCase("addMail")) {
            String email = request.getParameter("txtMailing");
            MailingList mailingList = new MailingList(email);
            boolean result = mailingListBLO.add(mailingList);
            if (result) {
                response.sendRedirect("index.jsp");
            }
        } else if (action.equalsIgnoreCase("viewFAQ")) {
            List<FAQ> faqs = faqBLO.getAll();
            request.setAttribute("faqs", faqs);
            RequestDispatcher rd = request.getRequestDispatcher("faq.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("searchEvent")) {
            String title = request.getParameter("txtKeyword");
            List<Event> events = eventBLO.getByTitle(title);
            request.setAttribute("events", events);
            request.setAttribute("title", title);
            RequestDispatcher rd = request.getRequestDispatcher("User-searchResult.jsp");
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
