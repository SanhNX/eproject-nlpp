/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_EvtUser")
@NamedQueries({
    @NamedQuery(name = "EvtUser.findAll", query = "SELECT e FROM EvtUser e")})
public class EvtUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EvtUserPK evtUserPK;
    @Basic(optional = false)
    @Column(name = "StatusPayment")
    private boolean statusPayment;
    @JoinColumn(name = "Email", referencedColumnName = "Email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "EvtID", referencedColumnName = "EvtID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Event event;

    public EvtUser() {
    }

    public EvtUser(EvtUserPK evtUserPK) {
        this.evtUserPK = evtUserPK;
    }

    public EvtUser(EvtUserPK evtUserPK, boolean statusPayment) {
        this.evtUserPK = evtUserPK;
        this.statusPayment = statusPayment;
    }

    public EvtUser(int evtID, String email) {
        this.evtUserPK = new EvtUserPK(evtID, email);
    }

    public EvtUserPK getEvtUserPK() {
        return evtUserPK;
    }

    public void setEvtUserPK(EvtUserPK evtUserPK) {
        this.evtUserPK = evtUserPK;
    }

    public boolean getStatusPayment() {
        return statusPayment;
    }

    public void setStatusPayment(boolean statusPayment) {
        this.statusPayment = statusPayment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evtUserPK != null ? evtUserPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvtUser)) {
            return false;
        }
        EvtUser other = (EvtUser) object;
        if ((this.evtUserPK == null && other.evtUserPK != null) || (this.evtUserPK != null && !this.evtUserPK.equals(other.evtUserPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.EvtUser[evtUserPK=" + evtUserPK + "]";
    }

}
