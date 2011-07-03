/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Award;
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
public class AwardBLO implements AwardBLORemote {

    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public List<Award> getAllAward() {
        String hql = "FROM Award";
        Query query = this.em.createQuery(hql);
        List<Award> awards = query.getResultList();
        return awards;
    }

    public Award getByID(int awardID) {
        Award award = em.find(Award.class, awardID);
        return award;
    }

    public boolean addAward(Award award) {
        try {
            this.em.persist(award);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteAward(int id) {
        Award a = this.em.find(Award.class, id);
        if (a != null) {
            try {
                em.remove(a);
            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
            return true;
        }
        return false;
    }

    public boolean editAward(Award award) {
        try {
            this.em.merge(award);

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
