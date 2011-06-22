/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.FeedBack;
import EL.User;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface FeedBackBLORemote {

    List<FeedBack> getAll();

    boolean add(FeedBack feedback,User user);
    
}
