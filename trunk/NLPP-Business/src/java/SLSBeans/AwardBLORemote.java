/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Award;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface AwardBLORemote {

    List<Award> getAllAward();

    Award getByID(int awardID);

    boolean addAward(Award award);

    boolean deleteAward(int id);

    boolean editAward(Award award);
}
