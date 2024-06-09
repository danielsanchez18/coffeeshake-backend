package com.coffeeshake_backend.controllers;

import com.coffeeshake_backend.model.Role;
import com.coffeeshake_backend.model.User;
import com.coffeeshake_backend.model.UserRole;
import com.coffeeshake_backend.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@RestController
@RequestMapping("/user")
@CrossOrigin("*")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @PostMapping("/register")
    public User registerUser(@RequestBody User user) throws Exception {
        user.setProfile("default.png");

        user.setPassword(this.bCryptPasswordEncoder.encode(user.getPassword()));

        Set<UserRole> userRoles = new HashSet<>();

        Role role = new Role();
        role.setIdRole(5L);
        role.setNameRole("cliente");

        UserRole userRole = new UserRole();
        userRole.setUser(user);
        userRole.setRole(role);

        userRoles.add(userRole);
        return userService.registerUser(user, userRoles);
    }

    @GetMapping("/getUsername/{username}")
    public User getUserByUsername(@PathVariable String username) throws Exception {
        return userService.getUserByUsername(username);
    }

    @DeleteMapping("/delete/{idUser}")
    public void deleteUser(@PathVariable Long idUser) throws Exception {
        userService.deleteUserById(idUser);
    }

}
