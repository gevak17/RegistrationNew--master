package gevak.entity;

import javax.persistence.*;

@Entity
//@Table(name="oper.gidrant_login")
@Table(name="user_login")
public class UserLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "pidrozdil_id_2")
    private Integer pidrozdil_id;
    private Integer pog_id;
    private Integer adminrayon_id;

    //    @OneToMany(mappedBy = "userLogin", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    private User operator_id;
//@ManyToOne
//@JoinColumn(name="operator_id", nullable=false)
    @Column(name = "operator_id")
    private Integer user;


    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }


    public UserLogin() {
    }

    public UserLogin(int pidrozdil_id, Integer pog_id, Integer adminrayon_id, Integer operator_id) {
        this.pidrozdil_id = pidrozdil_id;
        this.pog_id = pog_id;
        this.adminrayon_id = adminrayon_id;
//        this.operator_id = operator_id;
        this.user = operator_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getPidrozdil_id() {
        return pidrozdil_id;
    }

    public void setPidrozdil_id(Integer pidrozdil_id) {
        this.pidrozdil_id = pidrozdil_id;
    }

    public Integer getPog_id() {
        return pog_id;
    }

    public void setPog_id(Integer pog_id) {
        this.pog_id = pog_id;
    }

    public Integer getAdminrayon_id() {
        return adminrayon_id;
    }

    public void setAdminrayon_id(Integer adminrayon_id) {
        this.adminrayon_id = adminrayon_id;
    }

//    public User getOperator_id() {
//        return operator_id;
//    }
//
//    public void setOperator_id(User operator_id) {
//        this.operator_id = operator_id;
//    }

    @Override
    public String toString() {
        return "UserLogin{" +
                "id=" + id +
                ", pidrozdil_id=" + pidrozdil_id +
                ", pog_id=" + pog_id +
                ", adminrayon_id=" + adminrayon_id +
                '}';
    }
}
