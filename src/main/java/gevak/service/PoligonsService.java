package gevak.service;

import gevak.entity.Poligons;

public interface PoligonsService {

//    Integer findIdByIdAdminrayon(Integer idAdminrayon);

    Poligons findOne(Integer id);

    Boolean isPointInPoligon(Integer idAdminrayon, String point);


}
