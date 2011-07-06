/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.Award;
import EL.Event;
import EL.EvtUser;
import EL.Payment;
import EL.Presenter;
import EL.User;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface EventBLORemote {

    List<Event> getAllEvent();

    Event getByID(int evtID);

    List<Event> getByTitle(String title);

    boolean addUserForEvent(User u, Event evt, Payment pay,Award a);

    Payment getPaymentById(int id);

    boolean addEvent(Event evt);

    boolean addPreForEvent(int evtID, int preID);

    boolean updateEvent(Event evt);

    boolean removePreForEvent(int evtID, int preID);

    boolean delUserOfEvent(User u, Event evt);

    boolean delWinnerForEvent(String email, int evtID);

    boolean addWinnerForEvent(String email, int evtID, int awardID);

    boolean deleteEvent(int evtID);

}
