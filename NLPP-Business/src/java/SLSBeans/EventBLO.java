/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.Event;
import EL.EvtUser;
import EL.EvtUserPK;
import EL.Payment;
import EL.User;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author XuanSanh_IT
 */
@Stateless
public class EventBLO implements EventBLORemote {
    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<Event> getAllEvent() {
        String hql = "FROM Event";
        Query query = this.em.createQuery(hql);
        List<Event> events = query.getResultList();
        return events;
    }

    public Event getByID(int evtID) {
        Event evt = em.find(Event.class, evtID);
        return evt;
    }

    public List<Event> getByTitle(String title) {
        String hql = "FROM Event AS e where e.title LIKE '%"+ title +"%'  ";
        Query query = this.em.createQuery(hql);
        List<Event> events = query.getResultList();
        return events;
    }

    public boolean addUserForEvent(User u, Event evt, Payment pay) {
        try {
            List<EvtUser> evtUserList = new ArrayList<EvtUser>();//Tao ra 1 List co 1 Order vi tham so truyen zo setCustOrderList la 1 cai List
            EvtUserPK evtUserPK = new EvtUserPK(evt.getId(), u.getEmail());
            EvtUser evtUser = new EvtUser(u, pay, evt);
            evtUser.setEvtUserPK(evtUserPK);
            evtUserList.add(evtUser);
            evt.setEvtUserList(evtUserList);
            pay.setEvtUserList(evtUserList);
            u.setEvtUserList(evtUserList);
            this.em.persist(evtUser);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public Payment getPaymentById(int id) {
        Payment payment =  em.find(Payment.class, id);
        return payment;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

}
