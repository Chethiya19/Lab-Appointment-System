/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PatientService {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public boolean verifyLogin(String email, String password) {
        try {
//            EmailSender emailSender = new EmailSender();
//            //send email
//            emailSender.sendEmail(email, "Login Information", password);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String sql = "SELECT * FROM patient WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // If result set is not empty, login is successful
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getLoggedPatientName(String email) {
        String patientName = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String sql = "SELECT name FROM patient WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                patientName = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patientName;
    }
}
