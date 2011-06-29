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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_Award")
@NamedQueries({
    @NamedQuery(name = "Award.findAll", query = "SELECT a FROM Award a")})
public class Award implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @OneToMany(mappedBy = "award")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EvtWinner> evtWinnerList;
    @JoinColumn(name = "EvtID", referencedColumnName = "ID")
    @ManyToOne
    private Event event;

    public Award() {
    }

    public Award(String description) {
        this.description = description;
    }

    public Award(Integer id) {
        this.id = id;
    }

    public Award(Integer id, String description) {
        this.id = id;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<EvtWinner> getEvtWinnerList() {
        return evtWinnerList;
    }

    public void setEvtWinnerList(List<EvtWinner> evtWinnerList) {
        this.evtWinnerList = evtWinnerList;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Award)) {
            return false;
        }
        Award other = (Award) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.Award[id=" + id + "]";
    }

}
