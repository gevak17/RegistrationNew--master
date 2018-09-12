package gevak.service;

import gevak.entity.UserLogin;

import java.util.Set;

public interface UserLoginService {

    Set<UserLogin> findByUser(Integer operator_id);
//    Set<UserLogin> findByUserPidrozdil(Integer operator_id, Integer pidrozdil_id);


}
