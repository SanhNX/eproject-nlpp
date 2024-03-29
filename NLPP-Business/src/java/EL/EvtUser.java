/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
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
    @JoinColumn(name = "Email", referencedColumnName = "Email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "PaymentID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Payment payment;
    @JoinColumn(name = "EvtID", referencedColumnName = "ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Event event;
    @JoinColumn(name = "AwardID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Award award;

    public EvtUser() {
    }

    public EvtUser(EvtUserPK evtUserPK) {
        this.evtUserPK = evtUserPK;
    }

    public EvtUser(User user, Payment payment, Event event, Award award) {
        this.user = user;
        this.payment = payment;
        this.event = event;
        this.award = award;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Award getAward() {
        return award;
    }

    public void setAward(Award award) {
        this.award = award;
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
