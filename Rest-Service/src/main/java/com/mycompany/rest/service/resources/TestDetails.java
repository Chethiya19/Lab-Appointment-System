/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

/**
 *
 * @author user
 */
public class TestDetails {
    private int testId;
    private String patientName;
    private String testType;
    private String testResult;
    private String technician;
    private String doctor;
    
    public TestDetails() {
        
    }

    public TestDetails(int testId, String patientName, String testType, String testResult, String technician, String doctor) {
        this.testId = testId;
        this.patientName = patientName;
        this.testType = testType;
        this.testResult = testResult;
        this.technician = technician;
        this.doctor = doctor;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public String getTestResult() {
        return testResult;
    }

    public void setTestResult(String testResult) {
        this.testResult = testResult;
    }

    public String getTechnician() {
        return technician;
    }

    public void setTechnician(String technician) {
        this.technician = technician;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }
    
    
}
