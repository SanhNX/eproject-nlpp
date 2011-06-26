/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Presenter;
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
public class PresenterBLO implements PresenterBLORemote {

    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<Presenter> getAll() {
        String hql = "FROM Presenter";
        Query query = this.em.createQuery(hql);
        List<Presenter> presenters = query.getResultList();
        return presenters;
    }

    public Presenter getByID(int id) {
        Presenter presenter = em.find(Presenter.class, id);
        return presenter;
    }

    public boolean addPresenter(Presenter pre) {
        try {
            em.persist(pre);

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deletePresenter(int id) {
        Presenter b = getByID(id);
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

    public boolean updatePresenter(Presenter pre) {
        try {
            em.merge(pre);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Presenter> searchPresenter(String keyword) {
        String hql = "From Presenter as p  where p.name LIKE '%" + keyword + "%'";
        Query query = this.em.createQuery(hql);
        List<Presenter> s = query.getResultList(); // lay ra gan vao list book
        return s;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
