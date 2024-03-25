/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import java.sql.Timestamp;

/**
 *
 * @author user
 */
public class Payment {
    private int payment_id;
    private String person_name;
    private double amount;
    private String card_number;
    private String expiry_date;
    private String cvv;
    private Timestamp payment_date;
    private String email;

    public Payment(int payment_id, String person_name, double amount, String card_number, String expiry_date, String cvv, Timestamp payment_date, String email) {
        this.payment_id = payment_id;
        this.person_name = person_name;
        this.amount = amount;
        this.card_number = card_number;
        this.expiry_date = expiry_date;
        this.cvv = cvv;
        this.payment_date = payment_date;
        this.email = email;
    } 

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getPerson_name() {
        return person_name;
    }

    public void setPerson_name(String person_name) {
        this.person_name = person_name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
    }

    public String getExpiry_date() {
        return expiry_date;
    }

    public void setExpiry_date(String expiry_date) {
        this.expiry_date = expiry_date;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    

}