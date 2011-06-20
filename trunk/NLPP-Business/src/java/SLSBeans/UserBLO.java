/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.User;
import java.util.Date;
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

    @PersistenceContext(unitName = "Eproject_EJBPU")
    private EntityManager em;

    public User checkUser(String email, String password) {
        String hql = "FROM User AS u where u.email = '" + email + "' AND u.password = '" + password + "'  ";
        Query query = this.em.createQuery(hql);
        User user = (User) query.getSingleResult();
        return user;
    }

    public boolean updateProfile(String email,String fullName, Date birthday, boolean gender, String address, String phone) {
        String hql = "Update User AS u SET u.fullName = '"+ fullName +"',u.birthday = '"+birthday+"',"
                + "u.gender = '"+gender+"',u.address = '"+address+"',u.phone = '"+phone+"' where u.email = '"+email+"'  ";
        Query query = this.em.createQuery(hql);
        int row = query.executeUpdate();
        if(row>0){
            return true;
        }
        return false;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
