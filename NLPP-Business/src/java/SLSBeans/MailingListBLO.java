/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.MailingList;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author XuanSanh_IT
 */
@Stateless
public class MailingListBLO implements MailingListBLORemote {
    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public boolean add(MailingList mail) {
        try {
            if(getByMail(mail.getEmail()) == null){
                this.em.persist(mail);
            }else{
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public MailingList getByMail(String emailAddress) {
        MailingList email = em.find(MailingList.class, emailAddress);
        return email;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
