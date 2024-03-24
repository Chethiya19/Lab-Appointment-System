package com.mycompany.rest.service.resources;

import jakarta.json.bind.annotation.JsonbCreator;
import jakarta.json.bind.annotation.JsonbProperty;

public class EmailData {
    private String from;
    private String to;
    private String subject;
    private String body;

    @JsonbCreator
    public EmailData(@JsonbProperty("from") String from,
                     @JsonbProperty("to") String to,
                     @JsonbProperty("subject") String subject,
                     @JsonbProperty("body") String body) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    // Getters and setters
    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
