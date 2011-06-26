/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.FeedBack;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author APTECH-FPT
 */
@Remote
public interface AdminFeedBackBLORemote {
    List<FeedBack> getAll();

    FeedBack getByID(int id);

    boolean deleteFeedBack(int id);

    boolean updateFeedback(FeedBack pre);

    List<FeedBack> searchBySubject(String keyword);
}
