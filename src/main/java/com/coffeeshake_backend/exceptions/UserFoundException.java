package com.coffeeshake_backend.exceptions;

public class UserFoundException extends Exception{

    public UserFoundException(){
        super("ERROR: The user with that username already exists. Try again");
    }

    public UserFoundException(String message){
        super(message);
    }
}
