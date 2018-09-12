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

    @Override
    public Poligons isContain(Integer id) {
        return poligonDAO.isConaine(id);
    }

    @Override
    public Poligons findOne(Integer id) {
        return poligonDAO.findOne(id);
    }

    @Override
    public Boolean nativeQuery(Integer pId, String point) {
        return poligonDAO.nativeQuery(pId, point);
    }
}
