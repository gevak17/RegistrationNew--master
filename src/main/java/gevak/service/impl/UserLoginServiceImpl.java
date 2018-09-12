package gevak.service.impl;

import gevak.dao.UserLoginDAO;
import gevak.entity.UserLogin;
import gevak.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
@Transactional
public class UserLoginServiceImpl implements UserLoginService{

    @Autowired
    UserLoginDAO userLoginDAO;

    @Override
    public Set<UserLogin> findByUser(Integer operator_id) {
        return userLoginDAO.findByUser(operator_id);
    }

//    @Override
//    public Set<UserLogin> findByUserPidrozdil(Integer operator_id, Integer pidrozdil_id) {
//        return null;
//    }
}






