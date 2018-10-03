package gevak.service;

import gevak.entity.Gidrant;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public interface GidrantService {

    void save(Gidrant gidrant);

    void edit(Gidrant gidrant) throws UnsupportedEncodingException;

    List<Gidrant> findAll();

    Gidrant findOne(int id);

    List<String> getAllGidrantsStreets();

//    ArrayList<Gidrant> findByAdminrayon_id();

}
