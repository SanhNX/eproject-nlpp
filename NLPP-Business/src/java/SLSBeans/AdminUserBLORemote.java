/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.User;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author APTECH-FPT
 */
@Remote
public interface AdminUserBLORemote {

    List<User> getAll();

    List<User> searchUser(String keyword);

    boolean deleteUser(User user);
    
}
