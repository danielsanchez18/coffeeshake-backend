package com.coffeeshake_backend.exceptions;

public class UserNotFoundException extends Exception{

    public UserNotFoundException(){
        super("ERROR: The user with that username does not exist. Try again");
    }

    public UserNotFoundException(String message){
        super(message);
    }
}
