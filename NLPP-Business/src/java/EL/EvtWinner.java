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
@Table(name = "tbl_EvtWinner")
@NamedQueries({
    @NamedQuery(name = "EvtWinner.findAll", query = "SELECT e FROM EvtWinner e")})
public class EvtWinner implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EvtWinnerPK evtWinnerPK;
    @JoinColumn(name = "Email", referencedColumnName = "Email", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "EvtAwardID", referencedColumnName = "EvtAwardID")
    @ManyToOne
    private EvtAward evtAward;
    @JoinColumn(name = "EvtID", referencedColumnName = "EvtID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Event event;

    public EvtWinner() {
    }

    public EvtWinner(EvtWinnerPK evtWinnerPK) {
        this.evtWinnerPK = evtWinnerPK;
    }

    public EvtWinner(int evtID, String email) {
        this.evtWinnerPK = new EvtWinnerPK(evtID, email);
    }

    public EvtWinnerPK getEvtWinnerPK() {
        return evtWinnerPK;
    }

    public void setEvtWinnerPK(EvtWinnerPK evtWinnerPK) {
        this.evtWinnerPK = evtWinnerPK;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public EvtAward getEvtAward() {
        return evtAward;
    }

    public void setEvtAward(EvtAward evtAward) {
        this.evtAward = evtAward;
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
        hash += (evtWinnerPK != null ? evtWinnerPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvtWinner)) {
            return false;
        }
        EvtWinner other = (EvtWinner) object;
        if ((this.evtWinnerPK == null && other.evtWinnerPK != null) || (this.evtWinnerPK != null && !this.evtWinnerPK.equals(other.evtWinnerPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.EvtWinner[evtWinnerPK=" + evtWinnerPK + "]";
    }

}
