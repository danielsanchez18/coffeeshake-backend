package com.coffeeshake_backend.controllers;

import com.coffeeshake_backend.config.JwtUtils;
import com.coffeeshake_backend.exceptions.UserNotFoundException;
import com.coffeeshake_backend.model.JwtRequest;
import com.coffeeshake_backend.model.JwtResponse;
import com.coffeeshake_backend.model.User;
import com.coffeeshake_backend.services.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@CrossOrigin("*")
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private JwtUtils jwtUtils;

    @PostMapping("/generate-token")
    public ResponseEntity<?> generateToken(@RequestBody JwtRequest jwtRequest) throws Exception{
        try {
            authenticate(jwtRequest.getUsername(), jwtRequest.getPassword());
        } catch (UserNotFoundException e) {
            e.printStackTrace();
            throw new Exception("ERROR: User not found");
        }

        UserDetails userDetails = this.userDetailsService.loadUserByUsername(jwtRequest.getUsername());
        String token = this.jwtUtils.generateToken(userDetails);
        return ResponseEntity.ok(new JwtResponse(token));
    }

    private void authenticate(String username, String password) throws Exception {
        try {
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (DisabledException e) {
            throw new Exception("ERROR: User disabled" + e.getMessage());
        } catch (BadCredentialsException e) {
            throw new Exception("ERROR: Invalid credentials" + e.getMessage());
        }
    }

    @GetMapping("/current-user")
    public User getCurrentUser(Principal principal){
        return (User) this.userDetailsService.loadUserByUsername(principal.getName());
    }
}
