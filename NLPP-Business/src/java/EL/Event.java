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
    @Column(name = "EvtID")
    private Integer evtID;
    @Basic(optional = false)
    @Column(name = "EvtTitle")
    private String evtTitle;
    @Basic(optional = false)
    @Column(name = "EvtFee")
    private int evtFee;
    @Basic(optional = false)
    @Column(name = "EvtCriteria")
    private String evtCriteria;
    @Basic(optional = false)
    @Column(name = "EvtProcedures")
    private String evtProcedures;
    @Basic(optional = false)
    @Column(name = "DateStart")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateStart;
    @Basic(optional = false)
    @Column(name = "DateEnd")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateEnd;
    @JoinTable(name = "tbl_EvtPresenter", joinColumns = {
        @JoinColumn(name = "EvtID", referencedColumnName = "EvtID")}, inverseJoinColumns = {
        @JoinColumn(name = "PresenterID", referencedColumnName = "PresenterID")})
    @ManyToMany
    private List<Presenter> presenterList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "event")
    private List<EvtUser> evtUserList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "event")
    private List<EvtPayment> evtPaymentList;
    @OneToMany(mappedBy = "event")
    private List<EvtAward> evtAwardList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "event")
    private List<EvtWinner> evtWinnerList;

    public Event() {
    }

    public Event(Integer evtID) {
        this.evtID = evtID;
    }

    public Event(String evtTitle, int evtFee, String evtCriteria, String evtProcedures, Date dateStart, Date dateEnd) {
        this.evtTitle = evtTitle;
        this.evtFee = evtFee;
        this.evtCriteria = evtCriteria;
        this.evtProcedures = evtProcedures;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public Event(Integer evtID, String evtTitle, int evtFee, String evtCriteria, String evtProcedures, Date dateStart, Date dateEnd) {
        this.evtID = evtID;
        this.evtTitle = evtTitle;
        this.evtFee = evtFee;
        this.evtCriteria = evtCriteria;
        this.evtProcedures = evtProcedures;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public Integer getEvtID() {
        return evtID;
    }

    public void setEvtID(Integer evtID) {
        this.evtID = evtID;
    }

    public String getEvtTitle() {
        return evtTitle;
    }

    public void setEvtTitle(String evtTitle) {
        this.evtTitle = evtTitle;
    }

    public int getEvtFee() {
        return evtFee;
    }

    public void setEvtFee(int evtFee) {
        this.evtFee = evtFee;
    }

    public String getEvtCriteria() {
        return evtCriteria;
    }

    public void setEvtCriteria(String evtCriteria) {
        this.evtCriteria = evtCriteria;
    }

    public String getEvtProcedures() {
        return evtProcedures;
    }

    public void setEvtProcedures(String evtProcedures) {
        this.evtProcedures = evtProcedures;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
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

    public List<EvtPayment> getEvtPaymentList() {
        return evtPaymentList;
    }

    public void setEvtPaymentList(List<EvtPayment> evtPaymentList) {
        this.evtPaymentList = evtPaymentList;
    }

    public List<EvtAward> getEvtAwardList() {
        return evtAwardList;
    }

    public void setEvtAwardList(List<EvtAward> evtAwardList) {
        this.evtAwardList = evtAwardList;
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
        hash += (evtID != null ? evtID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Event)) {
            return false;
        }
        Event other = (Event) object;
        if ((this.evtID == null && other.evtID != null) || (this.evtID != null && !this.evtID.equals(other.evtID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.Event[evtID=" + evtID + "]";
    }

}
