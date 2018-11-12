package gevak.service.impl;

import gevak.dao.GidrantDAO;
import gevak.entity.Gidrant;
import gevak.service.GidrantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class GidrantServiceImpl implements GidrantService {

    @Autowired
    GidrantDAO gidrantDAO;

    @Override
    public void save(Gidrant gidrant) {
        gidrantDAO.save(gidrant);
    }

    @Override
    public void edit(Gidrant gidrant) throws UnsupportedEncodingException {
        Gidrant gidrantEdit = gidrantDAO.findOne(gidrant.getId());
        String street_txt = gidrant.getStreetTxt();
        gidrantEdit.setLng(gidrant.getLng());
        gidrantEdit.setLat(gidrant.getLat());
        gidrantEdit.setStreetTxt(street_txt);
        gidrantEdit.setBud(gidrant.getBud());
        gidrantEdit.setZrazok(gidrant.getZrazok());
        if (gidrant.getDiametr().length()<=3) {
            gidrantEdit.setDiametr(gidrant.getDiametr());
        }
        gidrantEdit.setTyp(gidrant.getTyp());
        gidrantEdit.setSpravnyi(gidrant.getSpravnyi());
        gidrantEdit.setVkazivnyk(gidrant.getVkazivnyk());
        gidrantDAO.save(gidrantEdit);
    }

    @Override
    public List<Gidrant> findAllGidrantsByAsc() {
        return gidrantDAO.findAll(sortByStreetAsc());
    }
    private Sort sortByStreetAsc(){
        return new Sort(Sort.Direction.ASC, "streetTxt");
    }

    @Override
    public Gidrant findOne(int id) {
        return gidrantDAO.findOne(id);
    }

    @Override
    public List<String> getAllGidrantsStreets() {
        List<Gidrant> all = gidrantDAO.findAll();
        List<String> streetsAllGidrants = new ArrayList<>();
        for (Gidrant gidrant : all) {
            streetsAllGidrants.add(gidrant.getStreetTxt());
//            System.out.println(gidrant.getStreet_txt());
        }

//        System.out.println("before gidrantDAO.getAllByStreetTxt()");
//        List<String> allByStreetTxt = gidrantDAO.getAllByStreetTxt();
//        System.out.println("after gidrantDAO.getAllByStreetTxt()");

//        return allByStreetTxt;
        return streetsAllGidrants;
    }

    /*@Override
    public List<Gidrant> findByAdminrayon_id(Integer adminrayon_id) {
        return gidrantDAO.findByAdminrayon_id(adminrayon_id);
    }*/


}
