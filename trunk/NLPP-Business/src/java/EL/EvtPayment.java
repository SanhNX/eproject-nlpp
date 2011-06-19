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
@Table(name = "tbl_EvtPayment")
@NamedQueries({
    @NamedQuery(name = "EvtPayment.findAll", query = "SELECT e FROM EvtPayment e")})
public class EvtPayment implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EvtPaymentPK evtPaymentPK;
    @JoinColumn(name = "Email", referencedColumnName = "Email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "PaymentID", referencedColumnName = "PaymentID")
    @ManyToOne
    private Payment payment;
    @JoinColumn(name = "EvtID", referencedColumnName = "EvtID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Event event;

    public EvtPayment() {
    }

    public EvtPayment(EvtPaymentPK evtPaymentPK) {
        this.evtPaymentPK = evtPaymentPK;
    }

    public EvtPayment(int evtID, String email) {
        this.evtPaymentPK = new EvtPaymentPK(evtID, email);
    }

    public EvtPaymentPK getEvtPaymentPK() {
        return evtPaymentPK;
    }

    public void setEvtPaymentPK(EvtPaymentPK evtPaymentPK) {
        this.evtPaymentPK = evtPaymentPK;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evtPaymentPK != null ? evtPaymentPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvtPayment)) {
            return false;
        }
        EvtPayment other = (EvtPayment) object;
        if ((this.evtPaymentPK == null && other.evtPaymentPK != null) || (this.evtPaymentPK != null && !this.evtPaymentPK.equals(other.evtPaymentPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.EvtPayment[evtPaymentPK=" + evtPaymentPK + "]";
    }

}
