/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.FeedBack;
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
public class FeedBackBLO implements FeedBackBLORemote {

    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<FeedBack> getAll() {
        String hql = "FROM FeedBack";
        Query query = this.em.createQuery(hql);
        List<FeedBack> feedbacks = query.getResultList();
        return feedbacks;
    }

    public boolean add(FeedBack feedback, User user) {
        try {
            //binding cho contact va customer thay nhau ( binding master va slave obj )
            List<FeedBack> feedbacks = new ArrayList<FeedBack>();//Tao ra 1 List co 1 Order vi tham so truyen zo setCustOrderList la 1 cai List
            feedbacks.add(feedback);
            user.setFeedBackList(feedbacks);
            feedback.setUser(user);
            //neu add 2 thang xuong 1 luc thi dung persit
            //con truong hop nay da co thang customer trong DB nen ta se goi ham merge de update lai bang order
            this.em.persist(feedback);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
