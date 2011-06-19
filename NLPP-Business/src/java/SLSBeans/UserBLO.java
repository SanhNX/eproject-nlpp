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
 * @author XuanSanh_IT
 */
@Stateless
public class UserBLO implements UserBLORemote {
    @PersistenceContext(unitName= "Eproject_EJBPU")
    private EntityManager em;

    public List<User> checkLogin(String email, String password) {
        String hql = "FROM User AS u where u.email = '"+ email +"' AND u.password = '"+ password +"'  ";
        Query query = this.em.createQuery(hql);
        List<User> user = query.getResultList();
        return user;
    }
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
 
}
