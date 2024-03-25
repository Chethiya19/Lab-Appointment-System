/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

/**
 *
 * @author user
 */
@Path("payment")
public class PaymentResource {
    Gson gson = new Gson();

    public PaymentResource() {
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response makePayment(String json) {
        Payment payment = gson.fromJson(json, Payment.class);
        new DBUtils().makePayment(payment);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
}
