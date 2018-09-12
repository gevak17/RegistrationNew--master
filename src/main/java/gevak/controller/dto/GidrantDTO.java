package gevak.controller.dto;

public class GidrantDTO {

    private int id;

    private String gidrantStreet_txt;
    private String gidrantBud;
    private String gidrantZrazok;
    private String gidrantDiametr;
    private String gidrantTyp;
    private int gidrantSpravnyi;
    private int gidrantVkazivnyk;
    private double gidrantLng;
    private double gidrantLat;

    public GidrantDTO() {
    }

    public GidrantDTO(int id, String gidrantStreet_txt, String gidrantBud, String gidrantZrazok, String gidrantDiametr, String gidrantTyp, int gidrantSpravnyi, int gidrantVkazivnyk, double gidrantLng, double gidrantLat) {
        this.id = id;
        this.gidrantStreet_txt = gidrantStreet_txt;
        this.gidrantBud = gidrantBud;
        this.gidrantZrazok = gidrantZrazok;
        this.gidrantDiametr = gidrantDiametr;
        this.gidrantTyp = gidrantTyp;
        this.gidrantSpravnyi = gidrantSpravnyi;
        this.gidrantVkazivnyk = gidrantVkazivnyk;
        this.gidrantLng = gidrantLng;
        this.gidrantLat = gidrantLat;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGidrantStreet_txt() {
        return gidrantStreet_txt;
    }

    public void setGidrantStreet_txt(String gidrantStreet_txt) {
        this.gidrantStreet_txt = gidrantStreet_txt;
    }

    public String getGidrantBud() {
        return gidrantBud;
    }

    public void setGidrantBud(String gidrantBud) {
        this.gidrantBud = gidrantBud;
    }

    public String getGidrantZrazok() {
        return gidrantZrazok;
    }

    public void setGidrantZrazok(String gidrantZrazok) {
        this.gidrantZrazok = gidrantZrazok;
    }

    public String getGidrantDiametr() {
        return gidrantDiametr;
    }

    public void setGidrantDiametr(String gidrantDiametr) {
        this.gidrantDiametr = gidrantDiametr;
    }

    public String getGidrantTyp() {
        return gidrantTyp;
    }

    public void setGidrantTyp(String gidrantTyp) {
        this.gidrantTyp = gidrantTyp;
    }

    public int getGidrantSpravnyi() {
        return gidrantSpravnyi;
    }

    public void setGidrantSpravnyi(int gidrantSpravnyi) {
        this.gidrantSpravnyi = gidrantSpravnyi;
    }

    public int getGidrantVkazivnyk() {
        return gidrantVkazivnyk;
    }

    public void setGidrantVkazivnyk(int gidrantVkazivnyk) {
        this.gidrantVkazivnyk = gidrantVkazivnyk;
    }

    public double getGidrantLng() {
        return gidrantLng;
    }

    public void setGidrantLng(double gidrantLng) {
        this.gidrantLng = gidrantLng;
    }

    public double getGidrantLat() {
        return gidrantLat;
    }

    public void setGidrantLat(double gidrantLat) {
        this.gidrantLat = gidrantLat;
    }
}
