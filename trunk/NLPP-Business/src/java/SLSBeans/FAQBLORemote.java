/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SLSBeans;

import EL.FAQ;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author XuanSanh_IT
 */
@Remote
public interface FAQBLORemote {

    List<FAQ> getAll();
    
}
