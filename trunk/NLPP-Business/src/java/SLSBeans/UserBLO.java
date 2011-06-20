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
        User u = em.find(User.class, email);
        u.setFullName(fullName);
        u.setBirthday(birthday);
        u.setGender(gender);
        u.setAddress(address);
        u.setPhone(phone);
        em.persist(u);
        return true;
    }

    public boolean updatePass(String email, String password) {
        User u = em.find(User.class, email);
        u.setPassword(password);
        em.persist(u);
        return true;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
