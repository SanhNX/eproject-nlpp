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

    public boolean add(FAQ faq) {
        try {
            this.em.persist(faq);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean update(FAQ faq) {
        try {
            FAQ f = this.em.find(FAQ.class, faq.getId());
            f.setId(faq.getId());
            f.setSubject(faq.getSubject());
            f.setQuestion(faq.getQuestion());
            f.setAnswer(faq.getAnswer());
            this.em.merge(f);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean delete(FAQ faq) {
        FAQ f = this.em.find(FAQ.class, faq.getId());
        if (f != null) {
            try {
                em.remove(f);

            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
            return true;
        }
        return false;
    }

    public List<FAQ> searchBySubject(String keyword) {
        String hql = "From FAQ as f  where f.subject LIKE '%" + keyword + "%'";
        Query query = this.em.createQuery(hql);
        List<FAQ> fList = query.getResultList(); // lay ra gan vao list FAQ
        return fList;
    }

    public FAQ getFAQByID(int id) {
        FAQ faq = this.em.find(FAQ.class, id);
        return faq;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
