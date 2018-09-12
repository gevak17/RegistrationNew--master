package gevak.service;

import gevak.entity.Poligons;

public interface PoligonsService {

    Poligons isContain(Integer id);

    Poligons findOne(Integer id);

    Boolean nativeQuery(Integer pId, String point);

}
