/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.MailingList;
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
    public boolean deleteMail(String mail) {
        MailingList presenter = em.find(MailingList.class, mail);
        if(presenter !=null)
        {
             try
            {
                     em.remove(presenter);

            }
            catch(Exception ex){ex.printStackTrace(); return false;}
            return true;
        }
        return false;
    }

    public List<MailingList> search(String keyword) {
        String hql = "From MailingList as p  where p.email LIKE '%"+keyword+"%'";
        Query query = this.em.createQuery(hql);
        List<MailingList> s= query.getResultList(); // lay ra gan vao list book
        return s;
    }
    public List<MailingList> getAll() {
        String hql = "FROM MailingList";
        Query query = this.em.createQuery(hql);
        List<MailingList> u = query.getResultList();
        return u;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
