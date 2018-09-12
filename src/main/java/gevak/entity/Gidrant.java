package gevak.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "gidrant")
public class Gidrant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String street_txt;
    private String bud;
    private String zrazok;
    private String diametr;
    private String typ;
    private int spravnyi;
    private int vkazivnyk;
    private int adminrayon_id;
    private int pidrozdil_id;
    private String prymitka;
    private int argis_id;
    private Date perevirka;
    private int nespravnist;
    private int nedolik;
    private String street_id;
    private String nas_punkt;
    @Column(name = "x")
    private double lng;
    @Column(name = "y")
    private double lat;
    private String tmp;
    private String photo;
    private String address;
    private String spravnist;
    private String type;
    private String vkazivnik;

    public Gidrant() {
    }
//
//  логін:
//  пароль:



//    @OneToMany(targetEntity = Adminrayon.class, cascade = CascadeType.ALL/*, fetch = FetchType.LAZY*/)
//    @JoinColumn(name = "adminrayon_id", referencedColumnName = "id")
//    private List<Adminrayon> adminrayons;







    public Gidrant(int id, double lng, double lat, String street_txt, String bud, String zrazok, String diametr, String typ, int spravnyi, int vkazivnyk) {
        this.id = id;
        this.lng = lng;
        this.lat = lat;
        this.street_txt = street_txt;
        this.bud = bud;
        this.zrazok = zrazok;
        this.diametr = diametr;
        this.typ = typ;
        this.spravnyi = spravnyi;
        this.vkazivnyk = vkazivnyk;
    }

    public Gidrant(double lng, double lat, String street_txt, String bud, String zrazok, String diametr, String typ, int spravnyi, int vkazivnyk) {
        this.lng = lng;
        this.lat = lat;
        this.street_txt = street_txt;
        this.bud = bud;
        this.zrazok = zrazok;
        this.diametr = diametr;
        this.typ = typ;
        this.spravnyi = spravnyi;
        this.vkazivnyk = vkazivnyk;
//        this.adminrayon_id = 0;
//        this.pidrozdil_id = 0;
//        this.prymitka = "";
//        this.argis_id = 0;
        this.perevirka = new Date();
//        this.nespravnist = 0;
//        this.nedolik = 0;
//        this.street_id = "";
//        this.nas_punkt = "";

//        this.tmp = "";
//        this.photo = "";
//        this.address = "";
//        this.spravnist = "";
//        this.type = "";
//        this.vkazivnik = "";
    }
//
//    public List<Adminrayon> getAdminrayons() {
//        return adminrayons;
//    }
//
//    public void setAdminrayons(List<Adminrayon> adminrayons) {
//        this.adminrayons = adminrayons;
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStreet_txt() {
        return street_txt;
    }

    public void setStreet_txt(String street_txt) {
        this.street_txt = street_txt;
    }

    public String getBud() {
        return bud;
    }

    public void setBud(String bud) {
        this.bud = bud;
    }

    public String getZrazok() {
        return zrazok;
    }

    public void setZrazok(String zrazok) {
        this.zrazok = zrazok;
    }

    public String getDiametr() {
        return diametr;
    }

    public void setDiametr(String diametr) {
        this.diametr = diametr;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public int getSpravnyi() {
        return spravnyi;
    }

    public void setSpravnyi(int spravnyi) {
        this.spravnyi = spravnyi;
    }

    public int getVkazivnyk() {
        return vkazivnyk;
    }

    public void setVkazivnyk(int vkazivnyk) {
        this.vkazivnyk = vkazivnyk;
    }

    public int getAdminrayon_id() {
        return adminrayon_id;
    }

    public void setAdminrayon_id(int adminrayon_id) {
        this.adminrayon_id = adminrayon_id;
    }

    public int getPidrozdil_id() {
        return pidrozdil_id;
    }

    public void setPidrozdil_id(int pidrozdil_id) {
        this.pidrozdil_id = pidrozdil_id;
    }

    public String getPrymitka() {
        return prymitka;
    }

    public void setPrymitka(String prymitka) {
        this.prymitka = prymitka;
    }

    public int getArgis_id() {
        return argis_id;
    }

    public void setArgis_id(int argis_id) {
        this.argis_id = argis_id;
    }

    public Date getPerevirka() {
        return perevirka;
    }

    public void setPerevirka(Date perevirka) {
        this.perevirka = perevirka;
    }

    public int getNespravnist() {
        return nespravnist;
    }

    public void setNespravnist(int nespravnist) {
        this.nespravnist = nespravnist;
    }

    public int getNedolik() {
        return nedolik;
    }

    public void setNedolik(int nedolik) {
        this.nedolik = nedolik;
    }

    public String getStreet_id() {
        return street_id;
    }

    public void setStreet_id(String street_id) {
        this.street_id = street_id;
    }

    public String getNas_punkt() {
        return nas_punkt;
    }

    public void setNas_punkt(String nas_punkt) {
        this.nas_punkt = nas_punkt;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public String getTmp() {
        return tmp;
    }

    public void setTmp(String tmp) {
        this.tmp = tmp;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSpravnist() {
        return spravnist;
    }

    public void setSpravnist(String spravnist) {
        this.spravnist = spravnist;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getVkazivnik() {
        return vkazivnik;
    }

    public void setVkazivnik(String vkazivnik) {
        this.vkazivnik = vkazivnik;
    }


    @Override
    public String toString() {
        return "Gidrant{" +
                "id=" + id +
                ", street_txt='" + street_txt + '\'' +
                ", bud='" + bud + '\'' +
                ", zrazok='" + zrazok + '\'' +
                ", diametr='" + diametr + '\'' +
                ", typ='" + typ + '\'' +
                ", spravnyi=" + spravnyi +
                ", vkazivnyk=" + vkazivnyk +
                ", lng=" + lng +
                ", lat=" + lat +
                '}';
    }
}
