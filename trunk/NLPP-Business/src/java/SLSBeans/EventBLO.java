/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Award;
import EL.Event;
import EL.EvtUser;
import EL.EvtUserPK;
import EL.Payment;
import EL.Presenter;
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
        String hql = "FROM Event AS e where e.title LIKE '%" + title + "%'  ";
        Query query = this.em.createQuery(hql);
        List<Event> events = query.getResultList();
        return events;
    }

    public boolean addUserForEvent(User u, Event evt, Payment pay, Award a) {
        try {
            List<EvtUser> evtUserList = new ArrayList<EvtUser>();//Tao ra 1 List co 1 Order vi tham so truyen zo setCustOrderList la 1 cai List
            EvtUserPK evtUserPK = new EvtUserPK(evt.getId(), u.getEmail());
            EvtUser evtUser = new EvtUser(u, pay, evt, a);
            evtUser.setEvtUserPK(evtUserPK);
            evtUserList.add(evtUser);
            evt.setEvtUserList(evtUserList);
            pay.setEvtUserList(evtUserList);
            u.setEvtUserList(evtUserList);
            a.setEvtUserList(evtUserList);
            this.em.persist(evtUser);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public Payment getPaymentById(int id) {
        Payment payment = em.find(Payment.class, id);
        return payment;
    }

    public boolean addEvent(Event evt) {
        try {
            this.em.persist(evt);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean addPreForEvent(int evtID, int preID) {
        Event event = em.find(Event.class, evtID);
        Presenter presenter = em.find(Presenter.class, preID);
        event.getPresenterList().add(presenter);
        presenter.getEventList().add(event);
        return true;
    }

    public boolean updateEvent(Event evt) {
        try {
            Event event = this.em.find(Event.class, evt.getId());
            event.setId(evt.getId());
            event.setTitle(evt.getTitle());
            event.setFee(evt.getFee());
            event.setCriteria(evt.getCriteria());
            event.setProcedures(evt.getProcedures());
            event.setStartDate(evt.getStartDate());
            event.setEndDate(evt.getEndDate());
            event.setDescription(evt.getDescription());
            this.em.merge(event);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean removePreForEvent(int evtID, int preID) {
        Event event = em.find(Event.class, evtID);
        Presenter presenter = em.find(Presenter.class, preID);
        event.getPresenterList().remove(presenter);
        presenter.getEventList().remove(event);
        return true;
    }

    public boolean delUserOfEvent(User u, Event evt) {
        try {
            EvtUserPK evtUserPK = new EvtUserPK(evt.getId(), u.getEmail());
            EvtUser evtUser = this.em.find(EvtUser.class, evtUserPK);
            if (evtUser != null) {
                this.em.remove(evtUser);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean delWinnerForEvent(String email, int evtID) {
        EvtUserPK euPK = new EvtUserPK(evtID, email);
        EvtUser evtUser = this.em.find(EvtUser.class, euPK);
        if (evtUser != null) {
            try {
                Award award = new Award(1);
                evtUser.setAward(award);
                this.em.merge(evtUser);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return true;
    }

    public boolean deleteEvent(int evtID) {
        Event event = getByID(evtID);
        if (event != null) {
            try {
                this.em.remove(event);
            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
            return true;
        }
        return false;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
