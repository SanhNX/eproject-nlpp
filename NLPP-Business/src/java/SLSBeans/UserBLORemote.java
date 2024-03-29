/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.Role;
import EL.User;
import java.util.Date;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface UserBLORemote {

    User checkUser(String email, String password);

    User checkAdmin(String email, String password);

    boolean updateProfile(String email,String fullName, Date birthday, boolean gender, String address, String phone);

    boolean updatePass(String email, String password);

    boolean add(Role role, User user);

    Role getRole(int roleID);

    User getByEmail(String email);

    boolean updateStatus(User user);

}
