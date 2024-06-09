package com.coffeeshake_backend.services;

import com.coffeeshake_backend.model.User;
import com.coffeeshake_backend.model.UserRole;

import java.util.Set;

public interface UserService {

    public User registerUser(User user, Set<UserRole> userRoles) throws Exception;
    public User getUserByUsername(String username) throws Exception;
    public void deleteUserById(Long id);

}
