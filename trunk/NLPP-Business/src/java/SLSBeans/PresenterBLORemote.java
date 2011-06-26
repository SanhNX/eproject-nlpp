/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SLSBeans;

import EL.Presenter;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface PresenterBLORemote {

    List<Presenter> getAll();

    Presenter getByID(int id);

    boolean addPresenter(Presenter pre);

    boolean deletePresenter(int id);

    boolean updatePresenter(Presenter pre);

    List<Presenter> searchPresenter(String keyword);
}
