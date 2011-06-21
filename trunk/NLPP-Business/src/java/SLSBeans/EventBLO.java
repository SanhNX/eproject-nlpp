/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.Event;
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

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

}
