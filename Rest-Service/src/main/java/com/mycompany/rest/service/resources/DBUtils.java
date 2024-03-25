/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author icbt
 */
public class DBUtils {

    static final String DB_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    static final String USER = "root";
    static final String PASS = "";

    public DBUtils() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {

        }
    }

    public Patient getPatient(int id) throws SQLException {
        Patient pt = null;
        try {

            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM patient WHERE id=" + id);) {
                while (rs.next()) {
                    pt = new Patient();
                    pt.setId(rs.getInt("id"));
                    pt.setName(rs.getString("name"));
                    pt.setEmail(rs.getString("email"));
                    pt.setPassword(rs.getString("password"));
                    pt.setDob(rs.getString("dateOfBirth"));
                    pt.setContact(rs.getString("contact"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }

        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }

        return pt;
    }

    public List<Patient> getPatients() {
        List<Patient> patients = new ArrayList<>();
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM patient");) {
                while (rs.next()) {
                    Patient pt = new Patient();
                    pt.setId(rs.getInt("id"));
                    pt.setName(rs.getString("name"));
                    pt.setEmail(rs.getString("email"));
                    pt.setDob(rs.getString("dateOfBirth"));
                    pt.setPassword(rs.getString("password"));
                    pt.setContact(rs.getString("contact"));
                    patients.add(pt);
                }
            } catch (SQLException e) {
            }

        } catch (Exception e) {

        }
        return patients;
    }

    public boolean addPatient(Patient pt) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("INSERT INTO patient (name, email, password, dateOfBirth, contact) "
                        + "VALUES ('" + pt.getName() + "', '" + pt.getEmail() + "', '"
                        + pt.getPassword() + "', '" + pt.getDob() + "', '" + pt.getContact() + "');");
                EmailSender.sendEmail(pt.getEmail(), "Welcome to ABC Laboratory Service", "Dear " + pt.getName() + ",\n\nThank you for signing up with our service.");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {

        }
        return false;
    }

    public boolean updatePatient(Patient pt) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("UPDATE patient SET name = '" + pt.getName() + "', email = '" + pt.getEmail() + "',  password = '" + pt.getPassword() + "', dateOfBirth = '" + pt.getDob() + "', contact = '" + pt.getContact() + "' WHERE (id = '" + pt.getId() + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }

    public boolean deletePatient(int id) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("DELETE FROM patient WHERE (id = '" + id + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {

        }
        return false;
    }

    public boolean authenticate(String email, String password) {
        String query = "SELECT * FROM patient WHERE email=? AND password=?";
        try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // If result set has next, credentials are correct
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean makeAppointment(Appointment appointment) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                String query = "INSERT INTO appointment (P_name, date, time, test_type) "
                        + "VALUES ('" + appointment.getP_name() + "', '" + appointment.getDate() + "', '"
                        + appointment.getTime() + "', '" + appointment.getTest_Type() + "');";
                stmt.executeUpdate(query);
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Appointment getAppointment(int Aid) throws SQLException {
        Appointment appointment = null;
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM appointment WHERE Aid=" + Aid);) {

                while (rs.next()) {
                    appointment = new Appointment();
                    appointment.setAid(rs.getInt("Aid"));
                    appointment.setP_name(rs.getString("p_name"));
                    appointment.setDate(rs.getString("date"));
                    appointment.setTime(rs.getString("time"));
                    appointment.setTest_Type(rs.getString("test_type"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }
        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }
        return appointment;
    }

    public List<Appointment> getAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM appointment")) {
            while (rs.next()) {
                Appointment appointment = new Appointment(
                        rs.getInt("Aid"),
                        rs.getString("p_name"),
                        rs.getString("date"),
                        rs.getString("time"),
                        rs.getString("test_type")
                );
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public TestDetails getTest(int id) throws SQLException {
        TestDetails td = null;
        try {

            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM test_details WHERE testId=" + id);) {
                while (rs.next()) {
                    td = new TestDetails();
                    td.setTestId(rs.getInt("testId"));
                    td.setPatientName(rs.getString("patientName"));
                    td.setTestType(rs.getString("testType"));
                    td.setTestResult(rs.getString("testResult"));
                    td.setTechnician(rs.getString("technician"));
                    td.setDoctor(rs.getString("doctor"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }

        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }

        return td;
    }

    public List<TestDetails> getTests() {
        List<TestDetails> testdetails = new ArrayList<>();
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM test_details");) {
                while (rs.next()) {
                    TestDetails td = new TestDetails();
                    td.setTestId(rs.getInt("testId"));
                    td.setPatientName(rs.getString("patientName"));
                    td.setTestType(rs.getString("testType"));
                    td.setTestResult(rs.getString("testResult"));
                    td.setTechnician(rs.getString("technician"));
                    td.setDoctor(rs.getString("doctor"));
                    testdetails.add(td);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }

        return testdetails;
    }

    public boolean addTest(TestDetails td) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("INSERT INTO test_details (testId, patientName, testType, testResult, technician, doctor) "
                        + "VALUES ('" + td.getTestId() + "', '" + td.getPatientName() + "', '" + td.getTestType() + "', '" + td.getTestResult() + "', '" + td.getTechnician() + "', '" + td.getDoctor() + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }

    public boolean updateTest(TestDetails td) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("UPDATE test_details SET patientName = '" + td.getPatientName() + "', testType = '" + td.getTestType() + "', testResult = '" + td.getTestResult() + "', technician = '" + td.getTechnician() + "', doctor = '" + td.getDoctor() + "' WHERE (testId = '" + td.getTestId() + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }

    public boolean deleteTest(int id) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("DELETE FROM test_details WHERE (testId = '" + id + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }

    public static boolean checkLogin(String email, String password) {
        try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  PreparedStatement statement = conn.prepareStatement("SELECT * FROM patient WHERE email = ? AND password = ?")) {
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Technician getTechnician(int id) throws SQLException {
        Technician tc = null;
        try {

            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM technician WHERE id=" + id);) {
                while (rs.next()) {
                    tc = new Technician();
                    tc.setId(rs.getInt("id"));
                    tc.setName(rs.getString("name"));
                    tc.setEmail(rs.getString("email"));
                    tc.setPassword(rs.getString("password"));
                    tc.setDob(rs.getString("dateOfBirth"));
                    tc.setContact(rs.getString("contact"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }

        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }

        return tc;
    }

    public List<Technician> getTechnicians() {
        List<Technician> technicians = new ArrayList<>();
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM technician");) {
                while (rs.next()) {
                    Technician tc = new Technician();
                    tc.setId(rs.getInt("id"));
                    tc.setName(rs.getString("name"));
                    tc.setEmail(rs.getString("email"));
                    tc.setDob(rs.getString("dateOfBirth"));
                    tc.setPassword(rs.getString("password"));
                    tc.setContact(rs.getString("contact"));
                    technicians.add(tc);
                }
            } catch (SQLException e) {
            }

        } catch (Exception e) {

        }
        return technicians;
    }

    public List<Technician> getAllTechnician() {
        List<Technician> technicians = new ArrayList<>();
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM technician");) {
                while (rs.next()) {
                    Technician tc = new Technician();
                    tc.setId(rs.getInt("id"));
                    tc.setName(rs.getString("name"));
                    tc.setEmail(rs.getString("email"));
                    tc.setDob(rs.getString("dateOfBirth"));
                    tc.setPassword(rs.getString("password"));
                    tc.setContact(rs.getString("contact"));
                    technicians.add(tc);
                }
            }
        } catch (SQLException e) {
            // Handle SQLException
            e.printStackTrace(); // or any other logging mechanism
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace(); // or any other logging mechanism
        }
        return technicians;
    }

    public boolean addTechnician(Technician tc) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("INSERT INTO technician (name, email, password, dateOfBirth, contact) "
                        + "VALUES ('" + tc.getName() + "', '" + tc.getEmail() + "', '"
                        + tc.getPassword() + "', '" + tc.getDob() + "', '" + tc.getContact() + "');");

                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {

        }
        return false;
    }

    public boolean updateTechnician(Technician tc) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("UPDATE technician SET name = '" + tc.getName() + "', email = '" + tc.getEmail() + "',  password = '" + tc.getPassword() + "', dateOfBirth = '" + tc.getDob() + "', contact = '" + tc.getContact() + "' WHERE (id = '" + tc.getId() + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }

    public boolean deleteTechnician(int id) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("DELETE FROM technician WHERE (id = '" + id + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {

        }
        return false;
    }

    public boolean makePayment(Payment payment) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                // Insert payment details into the payment table
                String query = "INSERT INTO payment (person_name, amount, card_number, expiry_date, cvv, payment_date) "
                        + "VALUES ('" + payment.getPerson_name() + "', '" + payment.getAmount() + "','" + payment.getCard_number() + "', '"
                        + payment.getExpiry_date() + "', '" + payment.getCvv() + "', '" + payment.getPayment_date() + "');";
                stmt.executeUpdate(query);

                // Retrieve email from the Patients table
                String emailQuery = "SELECT email FROM patient WHERE name = '" + payment.getPerson_name() + "'";
                ResultSet rs = stmt.executeQuery(emailQuery);
                String email = null;
                if (rs.next()) {
                    email = rs.getString("email");
                }

                // Send email if email is found
                if (email != null) {
                    EmailSender.sendEmail(email, "Welcome to ABC Laboratory Service", "Dear " + payment.getPerson_name() + ",\n\nYour payment is successful and so is your appointment." + "\n\nThank You.");
                    return true;
                } else {
                    System.out.println("Email not found for " + payment.getPerson_name());
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Report getReport(int rid) throws SQLException {
        Report rp = null;
        try {
 
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM report WHERE rid=" + rid);) {
                while (rs.next()) {
                    rp = new Report();
                    rp.setRid(rs.getInt("rid"));
                    rp.setPatient_name(rs.getString("patient_name"));
                    rp.setPdf_file(rs.getString("pdf_file"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }
 
        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }
 
        return rp;
    }
 
    public List<Report> getReports() {
        List<Report> report = new ArrayList<>();
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();  ResultSet rs = stmt.executeQuery("SELECT * FROM report");) {
                while (rs.next()) {
                    Report rp = new Report();
                    rp.setRid(rs.getInt("rid"));
                    rp.setPatient_name(rs.getString("patient_name"));
                    rp.setPdf_file(rs.getString("pdf_file"));
                    report.add(rp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
 
        } catch (Exception e) {
 
        }
 
        return report;
    }
 
    public boolean addReport(Report rp) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("INSERT INTO report (rid, patient_name, pdf_file) "
                        + "VALUES ('" + rp.getRid() + "', '" + rp.getPatient_name() + "', '" + rp.getPdf_file() + "');");
 
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
        }
        return false;
    }
 
    public boolean updateReport(Report rp) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("UPDATE  report SET rid = '" + rp.getRid() + "',patient_name = '" + rp.getPatient_name() + "' pdf_file = '" + rp.getPdf_file() + "' WHERE (rid = '" + rp.getRid() + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
 
        } catch (Exception e) {
 
        }
        return false;
    }
 
    public boolean deleteReport(int rid) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("DELETE FROM report WHERE (rid = '" + rid + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
 
        } catch (Exception e) {
 
        }
        return false;
    }

}
