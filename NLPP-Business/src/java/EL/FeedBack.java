/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_FeedBack")
@NamedQueries({
    @NamedQuery(name = "FeedBack.findAll", query = "SELECT f FROM FeedBack f")})
public class FeedBack implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "FeedBackID")
    private Integer feedBackID;
    @Basic(optional = false)
    @Column(name = "Subject")
    private String subject;
    @Basic(optional = false)
    @Lob
    @Column(name = "FBQuestion")
    private String fBQuestion;
    @Lob
    @Column(name = "FBAnswer")
    private String fBAnswer;
    @Basic(optional = false)
    @Column(name = "DateQuestion")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateQuestion;
    @Column(name = "DateAnswer")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateAnswer;
    @Column(name = "Status")
    private String status;
    @JoinColumn(name = "Email", referencedColumnName = "Email")
    @ManyToOne
    private User user;

    public FeedBack() {
    }

    public FeedBack(Integer feedBackID) {
        this.feedBackID = feedBackID;
    }

    public FeedBack(Integer feedBackID, String subject, String fBQuestion, Date dateQuestion) {
        this.feedBackID = feedBackID;
        this.subject = subject;
        this.fBQuestion = fBQuestion;
        this.dateQuestion = dateQuestion;
    }

    public Integer getFeedBackID() {
        return feedBackID;
    }

    public void setFeedBackID(Integer feedBackID) {
        this.feedBackID = feedBackID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFBQuestion() {
        return fBQuestion;
    }

    public void setFBQuestion(String fBQuestion) {
        this.fBQuestion = fBQuestion;
    }

    public String getFBAnswer() {
        return fBAnswer;
    }

    public void setFBAnswer(String fBAnswer) {
        this.fBAnswer = fBAnswer;
    }

    public Date getDateQuestion() {
        return dateQuestion;
    }

    public void setDateQuestion(Date dateQuestion) {
        this.dateQuestion = dateQuestion;
    }

    public Date getDateAnswer() {
        return dateAnswer;
    }

    public void setDateAnswer(Date dateAnswer) {
        this.dateAnswer = dateAnswer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedBackID != null ? feedBackID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeedBack)) {
            return false;
        }
        FeedBack other = (FeedBack) object;
        if ((this.feedBackID == null && other.feedBackID != null) || (this.feedBackID != null && !this.feedBackID.equals(other.feedBackID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.FeedBack[feedBackID=" + feedBackID + "]";
    }

}
