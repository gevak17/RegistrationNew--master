package gevak.service;

import gevak.entity.Gidrant;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public interface GidrantService {

    void save(Gidrant gidrant);

    void edit(Gidrant gidrant) throws UnsupportedEncodingException;

    List<Gidrant> findAllGidrantsByAsc();

    Gidrant findOne(int id);

    List<String> getAllGidrantsStreets();

//    List<Gidrant> findByAdminrayon_id(Integer adminrayon_id);

//    ArrayList<Gidrant> findByAdminrayon_id();

}
