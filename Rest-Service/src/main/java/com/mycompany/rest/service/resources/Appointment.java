/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author user
 */
public class Appointment {
    private int Aid;
    private String p_name;
    private LocalDate date;
    private LocalTime time;
    private String testType;
    
    public Appointment() {
    }

    public Appointment( String p_name, LocalDate date, LocalTime time, String testType) {
        this.p_name = p_name;
        this.date = date;
        this.time = time;
        this.testType = testType;
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

    

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }
    
    
}
