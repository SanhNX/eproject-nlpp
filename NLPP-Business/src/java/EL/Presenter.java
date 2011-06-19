/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_Presenter")
@NamedQueries({
    @NamedQuery(name = "Presenter.findAll", query = "SELECT p FROM Presenter p")})
public class Presenter implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PresenterID")
    private Integer presenterID;
    @Basic(optional = false)
    @Column(name = "PresenterName")
    private String presenterName;
    @Basic(optional = false)
    @Column(name = "PresenterAddress")
    private String presenterAddress;
    @Basic(optional = false)
    @Column(name = "PresenterEmail")
    private String presenterEmail;
    @Basic(optional = false)
    @Column(name = "PresenterPhone")
    private String presenterPhone;
    @ManyToMany(mappedBy = "presenterList")
    private List<Event> eventList;

    public Presenter() {
    }

    public Presenter(Integer presenterID) {
        this.presenterID = presenterID;
    }

    public Presenter(Integer presenterID, String presenterName, String presenterAddress, String presenterEmail, String presenterPhone) {
        this.presenterID = presenterID;
        this.presenterName = presenterName;
        this.presenterAddress = presenterAddress;
        this.presenterEmail = presenterEmail;
        this.presenterPhone = presenterPhone;
    }

    public Integer getPresenterID() {
        return presenterID;
    }

    public void setPresenterID(Integer presenterID) {
        this.presenterID = presenterID;
    }

    public String getPresenterName() {
        return presenterName;
    }

    public void setPresenterName(String presenterName) {
        this.presenterName = presenterName;
    }

    public String getPresenterAddress() {
        return presenterAddress;
    }

    public void setPresenterAddress(String presenterAddress) {
        this.presenterAddress = presenterAddress;
    }

    public String getPresenterEmail() {
        return presenterEmail;
    }

    public void setPresenterEmail(String presenterEmail) {
        this.presenterEmail = presenterEmail;
    }

    public String getPresenterPhone() {
        return presenterPhone;
    }

    public void setPresenterPhone(String presenterPhone) {
        this.presenterPhone = presenterPhone;
    }

    public List<Event> getEventList() {
        return eventList;
    }

    public void setEventList(List<Event> eventList) {
        this.eventList = eventList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (presenterID != null ? presenterID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Presenter)) {
            return false;
        }
        Presenter other = (Presenter) object;
        if ((this.presenterID == null && other.presenterID != null) || (this.presenterID != null && !this.presenterID.equals(other.presenterID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.Presenter[presenterID=" + presenterID + "]";
    }

}
