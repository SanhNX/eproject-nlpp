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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_EvtAward")
@NamedQueries({
    @NamedQuery(name = "EvtAward.findAll", query = "SELECT e FROM EvtAward e")})
public class EvtAward implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "EvtAwardID")
    private Integer evtAwardID;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @JoinColumn(name = "EvtID", referencedColumnName = "EvtID")
    @ManyToOne
    private Event event;
    @OneToMany(mappedBy = "evtAward")
    private List<EvtWinner> evtWinnerList;

    public EvtAward() {
    }

    public EvtAward(Integer evtAwardID) {
        this.evtAwardID = evtAwardID;
    }

    public EvtAward(Integer evtAwardID, String description) {
        this.evtAwardID = evtAwardID;
        this.description = description;
    }

    public Integer getEvtAwardID() {
        return evtAwardID;
    }

    public void setEvtAwardID(Integer evtAwardID) {
        this.evtAwardID = evtAwardID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public List<EvtWinner> getEvtWinnerList() {
        return evtWinnerList;
    }

    public void setEvtWinnerList(List<EvtWinner> evtWinnerList) {
        this.evtWinnerList = evtWinnerList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (evtAwardID != null ? evtAwardID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EvtAward)) {
            return false;
        }
        EvtAward other = (EvtAward) object;
        if ((this.evtAwardID == null && other.evtAwardID != null) || (this.evtAwardID != null && !this.evtAwardID.equals(other.evtAwardID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.EvtAward[evtAwardID=" + evtAwardID + "]";
    }

}
