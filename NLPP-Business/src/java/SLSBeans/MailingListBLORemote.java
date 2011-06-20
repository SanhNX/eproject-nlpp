/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.MailingList;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface MailingListBLORemote {

    boolean add(MailingList mail);

    MailingList getByMail(String email);
    
}
