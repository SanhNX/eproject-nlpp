/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.FeedBack;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author APTECH-FPT
 */
@Stateless
public class AdminFeedBackBLO implements AdminFeedBackBLORemote {

    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<FeedBack> getAll() {
        String hql = "FROM FeedBack";
        Query query = this.em.createQuery(hql);
        List<FeedBack> feedbacks = query.getResultList();
        return feedbacks;
    }

    public FeedBack getByID(int id) {
        FeedBack feedback = em.find(FeedBack.class, id);
        return feedback;
    }

    public boolean deleteFeedBack(int id) {
        FeedBack b = getByID(id);
        if (b != null) {
            try {
                em.remove(b);

            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
            return true;
        }
        return false;
    }

    public boolean updateFeedback(FeedBack feed) {
        try {
            FeedBack feedback = em.find(FeedBack.class, feed.getId());
            feedback.setId(feed.getId());
            feedback.setUser(feed.getUser());
            feedback.setSubject(feed.getSubject());
            feedback.setQuestion(feed.getQuestion());
            feedback.setAnswer(feed.getAnswer());
            feedback.setQuestionDate(feed.getQuestionDate());
            feedback.setAnswerDate(feed.getAnswerDate());
            feedback.setStatus(feed.getStatus());
            this.em.merge(feedback);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public List<FeedBack> searchBySubject(String keyword) {
        String hql = "From FeedBack as p  where p.subject LIKE '%" + keyword + "%'";
        Query query = this.em.createQuery(hql);
        List<FeedBack> s = query.getResultList(); // lay ra gan vao list book
        return s;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
