/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_Event")
@NamedQueries({
    @NamedQuery(name = "Event.findAll", query = "SELECT e FROM Event e")})
public class Event implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "Title")
    private String title;
    @Basic(optional = false)
    @Column(name = "Fee")
    private int fee;
    @Basic(optional = false)
    @Column(name = "Criteria")
    private String criteria;
    @Basic(optional = false)
    @Column(name = "Procedures")
    private String procedures;
    @Basic(optional = false)
    @Column(name = "StartDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    @Basic(optional = false)
    @Column(name = "EndDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @JoinTable(name = "tbl_EvtPresenter", joinColumns = {
        @JoinColumn(name = "EvtID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "PreID", referencedColumnName = "ID")})
    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Presenter> presenterList;
    @OneToMany(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE}, mappedBy = "event")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EvtUser> evtUserList;

    public Event() {
    }

    public Event(Integer id) {
        this.id = id;
    }

    public Event(String title, int fee, String criteria, String procedures, Date startDate, Date endDate, String description) {
        this.title = title;
        this.fee = fee;
        this.criteria = criteria;
        this.procedures = procedures;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
    }

    public Event(Integer id, String title, int fee, String criteria, String procedures, Date startDate, Date endDate, String description) {
        this.id = id;
        this.title = title;
        this.fee = fee;
        this.criteria = criteria;
        this.procedures = procedures;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public String getProcedures() {
        return procedures;
    }

    public void setProcedures(String procedures) {
        this.procedures = procedures;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Presenter> getPresenterList() {
        return presenterList;
    }

    public void setPresenterList(List<Presenter> presenterList) {
        this.presenterList = presenterList;
    }

    public List<EvtUser> getEvtUserList() {
        return evtUserList;
    }

    public void setEvtUserList(List<EvtUser> evtUserList) {
        this.evtUserList = evtUserList;
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
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.Event[id=" + id + "]";
    }

}
