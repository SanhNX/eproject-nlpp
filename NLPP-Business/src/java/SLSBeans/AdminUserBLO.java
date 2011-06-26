/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.User;
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
public class AdminUserBLO implements AdminUserBLORemote {
    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public List<User> getAll() {
        String hql = "FROM User AS u where RoleID = 2  ";
        Query query = this.em.createQuery(hql);
        List<User> u = query.getResultList();
        return u;
    }

    public List<User> searchUser(String keyword) {
        String hql = "From User as p  where p.email LIKE '%"+keyword+"%' and RoleID =2";
        Query query = this.em.createQuery(hql);
        List<User> s= query.getResultList(); // lay ra gan vao list book
        return s;
    }

    public boolean deleteUser(User user) {
        User u = this.em.find(User.class, user.getEmail());
        if (u != null) {
            try {
                em.remove(u);

            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
            return true;
        }
        return false;
    }



    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
