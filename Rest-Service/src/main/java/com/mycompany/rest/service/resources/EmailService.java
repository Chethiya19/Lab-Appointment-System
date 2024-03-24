package com.mycompany.rest.service.resources;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.Properties;

@Path("email")
public class EmailService {

    @POST
    @Path("send")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.TEXT_PLAIN)
    public Response sendEmail(EmailData emailData) {
        // Initialize mail properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com"); // Change this
        properties.put("mail.smtp.port", "587"); // Change this

        // Set your email credentials
        final String username = "abc.lab.appointment.system@gmail.com"; // Change this
        final String password = "npio fpwq schd oztm"; // Change this

        // Create session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailData.getFrom()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailData.getTo()));
            message.setSubject(emailData.getSubject());
            message.setText(emailData.getBody());

            // Send message
            Transport.send(message);

            return Response.status(Response.Status.OK).entity("Email sent successfully.").build();
        } catch (MessagingException e) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Failed to send email.").build();
        }
    }
}
