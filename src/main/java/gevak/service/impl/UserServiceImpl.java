package gevak.service.impl;

import gevak.dao.UserDAO;
import gevak.dao.UserLoginDAO;
import gevak.entity.User;
import gevak.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    UserDAO userDAO;

    @Autowired
    UserLoginDAO userLoginDAO;

//    @Autowired
//    PasswordEncoder passwordEncoder;

    @Override
    public void save(String username, String password, String email, String name, String surname, int age, int pidrozdil_id) {
//        String encodePassword = passwordEncoder.encode(password);
        User user = new User(username, password, email, surname, name, age, pidrozdil_id);
        userDAO.save(user);
    }


    @Override
    public void deleteOne(int id) {
        userDAO.delete(id);
    }

//    @Override
//    public List<User> findAllUsers() {
//        return userDAO.findAllUsers();
//    }

    @Override
    public User findOne(int id) {
        return userDAO.findOne(id);
    }

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public User findByUserName(String username) {
        return userDAO.findByUserName(username);
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return findByUserName(s);
    }
}
