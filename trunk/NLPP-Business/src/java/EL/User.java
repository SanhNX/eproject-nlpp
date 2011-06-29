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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "tbl_User")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Email")
    private String email;
    @Basic(optional = false)
    @Column(name = "Password")
    private String password;
    @Basic(optional = false)
    @Column(name = "FullName")
    private String fullName;
    @Basic(optional = false)
    @Column(name = "Birthday")
    @Temporal(TemporalType.TIMESTAMP)
    private Date birthday;
    @Basic(optional = false)
    @Column(name = "Gender")
    private boolean gender;
    @Basic(optional = false)
    @Column(name = "Address")
    private String address;
    @Basic(optional = false)
    @Column(name = "Phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "Status")
    private boolean status;
    @OneToMany(mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<FeedBack> feedBackList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EvtWinner> evtWinnerList;
    @OneToMany(cascade={CascadeType.MERGE,CascadeType.REFRESH,CascadeType.REMOVE}, mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<EvtUser> evtUserList;
    @JoinColumn(name = "RoleID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Role role;

    public User() {
    }

    public User(String email) {
        this.email = email;
    }

    public User(String email, String password, String fullName, Date birthday, boolean gender, String address, String phone, boolean status) {
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.birthday = birthday;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<FeedBack> getFeedBackList() {
        return feedBackList;
    }

    public void setFeedBackList(List<FeedBack> feedBackList) {
        this.feedBackList = feedBackList;
    }

    public List<EvtWinner> getEvtWinnerList() {
        return evtWinnerList;
    }

    public void setEvtWinnerList(List<EvtWinner> evtWinnerList) {
        this.evtWinnerList = evtWinnerList;
    }

    public List<EvtUser> getEvtUserList() {
        return evtUserList;
    }

    public void setEvtUserList(List<EvtUser> evtUserList) {
        this.evtUserList = evtUserList;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EL.User[email=" + email + "]";
    }

}
