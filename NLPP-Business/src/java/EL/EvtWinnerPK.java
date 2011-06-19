/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author XuanSanh_IT
 */
@Embeddable
public class EvtWinnerPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "EvtID")
    private int evtID;
    @Basic(optional = false)
    @Column(name = "Email")
    private String email;

    public EvtWinnerPK() {
    }

    public EvtWinnerPK(int evtID, String email) {
        this.evtID = evtID;
        this.email = email;
    }

    public int getEvtID() {
        return evtID;
    }

    public void setEvtID(int evtID) {
        this.evtID = evtID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) evtID;
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvtWinnerPK)) {
            return false;
        }
        EvtWinnerPK other = (EvtWinnerPK) object;
        if (this.evtID != other.evtID) {
            return false;
        }
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.EvtWinnerPK[evtID=" + evtID + ", email=" + email + "]";
    }

}
