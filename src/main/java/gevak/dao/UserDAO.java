package gevak.dao;

import gevak.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserDAO extends JpaRepository<User, Integer> {

    @Query("from User u where u.username=:username")
    User findByUserName(@Param("username") String username);

//    @Query("SELECT * FROM User")g
//    List<User> findAllUsers();

}
