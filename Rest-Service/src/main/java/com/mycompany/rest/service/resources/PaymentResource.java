/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.GET;
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

//    @GET
//    @Produces(MediaType.APPLICATION_JSON)
//    public Response getPayments() {
//        return Response
//                .ok(gson.toJson(new DBUtils().getPayments()))
//                .build();
//    }
//
//    @GET
//    @Path("{id}")
//    @Produces(MediaType.APPLICATION_JSON)
//    public Response getPayment(@PathParam("id") int id) {
//        try {
//            Payment payment = new DBUtils().getPayment(id);
//
//            if (payment != null) {
//                return Response
//                        .ok(gson.toJson(payment))
//                        .build();
//            }
//
//            return Response
//                    .status(Response.Status.NOT_FOUND)
//                    .build();
//        } catch (Exception e) {
//            return Response
//                    .status(Response.Status.INTERNAL_SERVER_ERROR)
//                    .build();
//        }
//    }
}
