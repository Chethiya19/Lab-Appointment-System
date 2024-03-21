/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;


/**
 *
 * @author user
 */
public class Appointment {
    private int Aid;
    private String p_name;
    private String date;
    private String time;
    private String test_Type;
    
    public Appointment() {
        
    }

    public Appointment(int Aid, String p_name, String date, String time, String test_Type) {
        this.Aid = Aid;
        this.p_name = p_name;
        this.date = date;
        this.time = time;
        this.test_Type = test_Type;
    }

    public int getAid() {
        return Aid;
    }

    public void setAid(int Aid) {
        this.Aid = Aid;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTest_Type() {
        return test_Type;
    }

    public void setTest_Type(String test_Type) {
        this.test_Type = test_Type;
    }
}
