/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.FAQ;
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
public class FAQBLO implements FAQBLORemote {
    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<FAQ> getAll() {
        String hql = "FROM FAQ";
        Query query = this.em.createQuery(hql);
        List<FAQ> faqs = query.getResultList();
        return faqs;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
