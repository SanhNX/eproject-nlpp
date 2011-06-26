/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Role;
import EL.User;
import java.util.ArrayList;
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
        String hql = "FROM User AS u where u.email = '" + email + "' AND u.password = '" + password + "' AND RoleID = 2 AND u.status = True  ";
        Query query = this.em.createQuery(hql);
        User user = (User) query.getSingleResult();
        return user;
    }

    public User checkAdmin(String email, String password) {
        String hql = "FROM User AS u where u.email = '" + email + "' AND u.password = '" + password + "' AND RoleID = 1 ";
        Query query = this.em.createQuery(hql);
        User user = (User) query.getSingleResult();
        return user;
    }

    public boolean updateProfile(String email, String fullName, Date birthday, boolean gender, String address, String phone) {
        User u = em.find(User.class, email);
        u.setFullName(fullName);
        u.setBirthday(birthday);
        u.setGender(gender);
        u.setAddress(address);
        u.setPhone(phone);
        em.merge(u);
        return true;
    }

    public boolean updatePass(String email, String password) {
        User u = em.find(User.class, email);
        u.setPassword(password);
        em.persist(u);
        return true;
    }

    public boolean add(Role role, User user) {
        try {
            //binding cho contact va customer thay nhau ( binding master va slave obj )
            List<User> users = new ArrayList<User>();//Tao ra 1 List co 1 Order vi tham so truyen zo setCustOrderList la 1 cai List
            users.add(user);
            role.setUserList(users);
            user.setRole(role);
            //neu add 2 thang xuong 1 luc thi dung persit
            //con truong hop nay da co thang customer trong DB nen ta se goi ham merge de update lai bang order
            this.em.persist(user);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public Role getRole(int roleID) {
        Role role = em.find(Role.class, roleID);
        return role;
    }

    public User getByEmail(String email) {
        User user = em.find(User.class, email);
        return user;
    }

    public boolean updateStatus(User user) {
        try {
            User u = getByEmail(user.getEmail());
            u.setEmail(user.getEmail());
            u.setPassword(user.getPassword());
            u.setFullName(user.getFullName());
            u.setBirthday(user.getBirthday());
            u.setGender(user.getGender());
            u.setAddress(user.getAddress());
            u.setPhone(user.getPhone());
            u.setRole(user.getRole());
            u.setStatus(user.getStatus());
            this.em.merge(u);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
