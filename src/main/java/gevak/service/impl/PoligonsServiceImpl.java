package gevak.service.impl;

import gevak.dao.PoligonDAO;
import gevak.entity.Poligons;
import gevak.service.PoligonsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PoligonsServiceImpl implements PoligonsService {

    @Autowired
    PoligonDAO poligonDAO;


//    @Override
//    public Integer findIdByIdAdminrayon(Integer idAdminrayon) {
//        return poligonDAO.findIdByIdAdminrayon(idAdminrayon);
//    }

    @Override
    public Poligons findOne(Integer id) {
        return poligonDAO.findOne(id);
    }

    @Override
    public Boolean isPointInPoligon(Integer idAdminrayon, String point) {
        return poligonDAO.isPointInPoligon(idAdminrayon, point);
    }
}
