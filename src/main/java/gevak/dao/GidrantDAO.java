package gevak.dao;

import gevak.entity.Gidrant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface GidrantDAO extends JpaRepository<Gidrant, Integer> {
    @Override
    @Query("from Gidrant g where g.id=:id")
    Gidrant getOne(@Param("id") Integer id);
}
