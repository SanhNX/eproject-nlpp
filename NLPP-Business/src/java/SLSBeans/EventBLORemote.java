/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.Event;
import EL.Payment;
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

    boolean addUserForEvent(User u, Event evt, Payment pay);

    Payment getPaymentById(int id);
    
}
