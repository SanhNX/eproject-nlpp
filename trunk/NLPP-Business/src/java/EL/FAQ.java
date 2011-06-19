/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EL;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author XuanSanh_IT
 */
@Entity
@Table(name = "tbl_FAQ")
@NamedQueries({
    @NamedQuery(name = "FAQ.findAll", query = "SELECT f FROM FAQ f")})
public class FAQ implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "FAQID")
    private Integer faqid;
    @Basic(optional = false)
    @Column(name = "Subject")
    private String subject;
    @Basic(optional = false)
    @Lob
    @Column(name = "FAQQuestion")
    private String fAQQuestion;
    @Basic(optional = false)
    @Lob
    @Column(name = "FAQAnswer")
    private String fAQAnswer;

    public FAQ() {
    }

    public FAQ(Integer faqid) {
        this.faqid = faqid;
    }

    public FAQ(Integer faqid, String subject, String fAQQuestion, String fAQAnswer) {
        this.faqid = faqid;
        this.subject = subject;
        this.fAQQuestion = fAQQuestion;
        this.fAQAnswer = fAQAnswer;
    }

    public Integer getFaqid() {
        return faqid;
    }

    public void setFaqid(Integer faqid) {
        this.faqid = faqid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFAQQuestion() {
        return fAQQuestion;
    }

    public void setFAQQuestion(String fAQQuestion) {
        this.fAQQuestion = fAQQuestion;
    }

    public String getFAQAnswer() {
        return fAQAnswer;
    }

    public void setFAQAnswer(String fAQAnswer) {
        this.fAQAnswer = fAQAnswer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (faqid != null ? faqid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FAQ)) {
            return false;
        }
        FAQ other = (FAQ) object;
        if ((this.faqid == null && other.faqid != null) || (this.faqid != null && !this.faqid.equals(other.faqid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.FAQ[faqid=" + faqid + "]";
    }

}
