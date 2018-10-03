package gevak.dao;

import gevak.entity.Poligons;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface PoligonDAO extends JpaRepository<Poligons, Integer> {

//    @Query(value = "select gid from boundary_polygon p where p.id_adminrayon = :idAdminrayon", nativeQuery = true)
//    Integer findIdByIdAdminrayon(@Param("idAdminrayon") Integer idAdminrayon);


    @Query(value = "SELECT ST_Contains((SELECT p.geom from boundary_polygon p WHERE p.id_adminrayon =:idAdminrayon), " +
            "ST_SetSRID (ST_GeomFromText(:point),4326))",
            nativeQuery = true)
    Boolean isPointInPoligon(@Param("idAdminrayon") Integer idAdminrayon, @Param("point") String point);





}


//    @Query(value = "SELECT ST_Contains((SELECT geom from boundary_polygon WHERE gid = 372), ST_GeomFromText('POINT(23.8574358 49.8413162)'))", nativeQuery = true)
//    Boolean nativeQuery(); //work
//
//    SELECT st_astext(geom) from "boundary-polygon" WHERE gid = 372
//    //повертає широту і довготу Об'єкта
//
//    SELECT geom from "boundary-polygon" WHERE gid = 372
//    //повертає геом Об'єкта
//
//
//    SELECT ST_Contains((SELECT geom from "boundary-polygon" WHERE gid = 372), ST_GeomFromText('POINT(24.01963280925772 49.84280592568782 4326)')) ;
//    SELECT ST_Contains((SELECT geom from "boundary-polygon" WHERE gid = 372), ST_GeomFromText('POINT(23.9778807075355 49.8379785552395 4326)')) ;
//    SELECT ST_Contains((SELECT geom from "boundary-polygon" WHERE gid = 372), ST_GeomFromText('POINT(23.8574358 49.8413162)')) ;
//    //повертає true якщо Об'єкт2 попадає в площину Об'єкта1
//------------------------------------------------------------------------------------------------------------------------
//    @Query("from User u where u.username=:username")
//    User findByUserName(@Param("username") String username);

//    @Query("from Gidrant g where g.id=:id")
//    Gidrant getOne(@Param("id") Integer id);
