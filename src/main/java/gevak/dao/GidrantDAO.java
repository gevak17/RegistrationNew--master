package gevak.dao;

import gevak.entity.Gidrant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public interface GidrantDAO extends JpaRepository<Gidrant, Integer> {
    @Override
    @Query("from Gidrant g where g.id=:id")
    Gidrant getOne(@Param("id") Integer id);

    @Query("from Gidrant g where g.adminrayon_id=:adminrayon_id")
    List<Gidrant> findByAdminrayon_id(@Param("adminrayon_id") Integer adminrayon_id);

    @Query("Select g.streetTxt from Gidrant g")
    Set<String> getAllByStreetTxt();


    @Query("from Gidrant g where g.streetTxt like %:streetTxt%")
//    @Query("from Gidrant g where g.streetTxt like streetTxt")
    List<Gidrant> findByStreetTxt(@Param("streetTxt") String streetTxt);




//    @Query(value = "SELECT g.id, g.street_txt, g.bud, g.zrazok, g.spravnyi from gidrant g WHERE g.adminrayon_id = 42", nativeQuery = true)
//    ArrayList<Gidrant> findByAdminrayon_id();

//    @Query("from Gidrant")
//    List<Gidrant> findAll();
}
