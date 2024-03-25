/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import java.io.InputStream;

/**
 *
 * @author user
 */
public class Report {
    private int rid;
    private String patient_name;
    private String pdf_file;
    public Report(){
    }
 
    public Report(int rid, String patient_name, String pdf_file) {
        this.rid = rid;
        this.patient_name = patient_name;
        this.pdf_file = pdf_file;
    }
 
    public int getRid() {
        return rid;
    }
 
    public void setRid(int rid) {
        this.rid = rid;
    }
 
    public String getPatient_name() {
        return patient_name;
    }
 
    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }
 
    public String getPdf_file() {
        return pdf_file;
    }
 
    public void setPdf_file(String pdf_file) {
        this.pdf_file = pdf_file;
    }
 
    
}