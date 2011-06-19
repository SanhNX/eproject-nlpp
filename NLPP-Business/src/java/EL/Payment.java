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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_Payment")
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")})
public class Payment implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PaymentID")
    private Integer paymentID;
    @Basic(optional = false)
    @Column(name = "PaymentThrough")
    private String paymentThrough;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @OneToMany(mappedBy = "payment")
    private List<EvtPayment> evtPaymentList;

    public Payment() {
    }

    public Payment(Integer paymentID) {
        this.paymentID = paymentID;
    }

    public Payment(Integer paymentID, String paymentThrough, String description) {
        this.paymentID = paymentID;
        this.paymentThrough = paymentThrough;
        this.description = description;
    }

    public Integer getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(Integer paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentThrough() {
        return paymentThrough;
    }

    public void setPaymentThrough(String paymentThrough) {
        this.paymentThrough = paymentThrough;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<EvtPayment> getEvtPaymentList() {
        return evtPaymentList;
    }

    public void setEvtPaymentList(List<EvtPayment> evtPaymentList) {
        this.evtPaymentList = evtPaymentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentID != null ? paymentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentID == null && other.paymentID != null) || (this.paymentID != null && !this.paymentID.equals(other.paymentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.Payment[paymentID=" + paymentID + "]";
    }

}
