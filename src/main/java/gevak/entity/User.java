package gevak.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user_v")
public class User implements UserDetails{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String username;
    private String password;
    private String email;
    private String name;
    private String surname;
    private int age;
    private int pidrozdil_id;

//    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<UserLogin> userLogin;
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<UserLogin> userLogins;

    public Set<UserLogin> getUserLogins() {return userLogins;}
//---------------------------------------------------------










//--------------------------------------------------------------


    public void setUserLogins(Set<UserLogin> userLogins) {
        this.userLogins = userLogins;
    }

    //    public List<UserLogin> getUserLogin() {
//        return userLogin;
//    }
//
//    public void setUserLogin(List<UserLogin> userLogin) {
//        this.userLogin = userLogin;
//    }

    //    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
//    private Gidrant gidrant;




    @Enumerated(EnumType.STRING)
    Authority authority = Authority.ROLE_USER;

    public User() {
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(authority.name()));
        return authorities;
    }

    public User(String name, String surname, int age) {
        this.name = name;
        this.surname = surname;
        this.age = age;
    }

    public User(String username, String password, String email, String name, String surname, int age, int pidrozdil_id) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.pidrozdil_id = pidrozdil_id;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", age=" + age +
                ", pidrozdil_id=" + pidrozdil_id +
                ", authority=" + authority +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Authority getAuthority() {
        return authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

    public int getPidrozdil_id() {
        return pidrozdil_id;
    }

    public void setPidrozdil_id(int pidrozdil_id) {
        this.pidrozdil_id = pidrozdil_id;
    }

//    public Gidrant getGidrant() {
//        return gidrant;
//    }
//
//    public void setGidrant(Gidrant gidrant) {
//        this.gidrant = gidrant;
//    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}
