package gevak.service;

import gevak.entity.Gidrant;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public interface GidrantService {

    void save(Gidrant gidrant);

    void edit(Gidrant gidrant) throws UnsupportedEncodingException;

    List<Gidrant> findAllGidrantsByAsc();

    Gidrant findOne(int id);

    Set<String> getAllGidrantsStreets();

    List<Gidrant> findByStreetTxt(String streetTxt);



//    List<Gidrant> findByAdminrayon_id(Integer adminrayon_id);

//    ArrayList<Gidrant> findByAdminrayon_id();

}
