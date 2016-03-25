package com.rkdev.domain;

public enum Role {

    ADMINISTRATOR ("ADMINISTRATOR"), USER ("USER");

    private String abbreviation;

    private Role (String abbreviation){
        this.abbreviation = abbreviation;
    }
    public String getAbbreviation(){
        return abbreviation;
    }

    @Override
    public String toString() {
        return abbreviation;
    }
}
