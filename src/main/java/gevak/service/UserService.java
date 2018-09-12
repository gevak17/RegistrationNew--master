package gevak.service;

import gevak.entity.User;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserService {

    void save(String username, String password, String email, String name, String surname, int age, int pidrozdil_id);

    void deleteOne(int id);

    User findOne(int id);

    List<User> findAll();

    User findByUserName(String username);

//    List<User> findAllUsers();

}
