package gevak.service.impl;

import gevak.dao.GidrantDAO;
import gevak.entity.Gidrant;
import gevak.service.GidrantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
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
        String street_txt = gidrant.getStreet_txt();
        gidrantEdit.setLng(gidrant.getLng());
        gidrantEdit.setLat(gidrant.getLat());
        gidrantEdit.setStreet_txt(street_txt);
        gidrantEdit.setBud(gidrant.getBud());
        gidrantEdit.setZrazok(gidrant.getZrazok());
        gidrantEdit.setDiametr(gidrant.getDiametr());
        gidrantEdit.setTyp(gidrant.getTyp());
        gidrantEdit.setSpravnyi(gidrant.getSpravnyi());
        gidrantEdit.setVkazivnyk(gidrant.getVkazivnyk());
//        System.out.println("Gidrant edit - "+gidrantEdit);
        gidrantDAO.save(gidrantEdit);
    }

    @Override
    public List<Gidrant> findAll() {
        return gidrantDAO.findAll();
    }

    @Override
    public Gidrant findOne(int id) {
        return gidrantDAO.findOne(id);
    }
}
