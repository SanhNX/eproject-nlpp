/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

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

    boolean updateProfile(String email,String fullName, Date birthday, boolean gender, String address, String phone);

    boolean updatePass(String email, String password);
    
}
