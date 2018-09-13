package gevak.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "boundary_polygon")
public class Poligons {

    @Id
    @Column(name = "gid")
    private int id;

    @Column(name = "osm_id")
    private int osmId;

    @Column(name = "name")
    private String namePoligon;

    @Column(name = "admin_lvl")
    private int adminLvl;

    @Column(name = "id_adminrayon")
    private int idAdminrayon;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamePoligon() {
        return namePoligon;
    }

    public void setNamePoligon(String namePoligon) {
        this.namePoligon = namePoligon;
    }

    public int getAdminLvl() {
        return adminLvl;
    }

    public void setAdminLvl(int adminLvl) {
        this.adminLvl = adminLvl;
    }

    @Override
    public String toString() {
        return "Poligons{" +
                "id=" + id +
                ", osmId=" + osmId +
                ", namePoligon='" + namePoligon + '\'' +
                ", adminLvl=" + adminLvl +
                ", idAdminrayon=" + idAdminrayon +
                '}';
    }
}




