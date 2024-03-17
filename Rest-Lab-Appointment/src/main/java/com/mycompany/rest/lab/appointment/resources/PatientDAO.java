package com.mycompany.rest.lab.appointment.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PatientDAO {

    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/lab_appointment_system";
        String username = "root";
        String password = "";
        return DriverManager.getConnection(url, username, password);
    }

    public boolean validateUser(String email, String password) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM patient WHERE email = ? AND password = ?")) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
