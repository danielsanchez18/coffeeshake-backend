package com.coffeeshake_backend.services.impl;

import com.coffeeshake_backend.exceptions.UserFoundException;
import com.coffeeshake_backend.model.User;
import com.coffeeshake_backend.model.UserRole;
import com.coffeeshake_backend.repository.RoleRepository;
import com.coffeeshake_backend.repository.UserRepository;
import com.coffeeshake_backend.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public User registerUser(User user, Set<UserRole> userRoles) throws Exception {
        User userSaved = userRepository.findByUsername(user.getUsername());
        if (userSaved != null) {
            throw new UserFoundException("ERROR: user already exists");
        }
        else {
            for (UserRole userRole : userRoles) {
                roleRepository.save(userRole.getRole());
            }
            user.getUserRoles().addAll(userRoles);
            userSaved = userRepository.save(user);
        }
        return userSaved;
    }

    @Override
    public User getUserByUsername(String username) throws Exception {
        return userRepository.findByUsername(username);
    }

    @Override
    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }
}
