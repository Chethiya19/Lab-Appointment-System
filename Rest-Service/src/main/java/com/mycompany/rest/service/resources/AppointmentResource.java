/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

/**
 *
 * @author user
 */
@Path("appointments")
public class AppointmentResource {

    Gson gson = new Gson();

    public AppointmentResource() {
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response makeAppointment(String json) {
        Appointment appointment = gson.fromJson(json, Appointment.class);
        new DBUtils().makeAppointment(appointment);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAppointments() {
        return Response
                .ok(gson.toJson(new DBUtils().getAppointments()))
                .build();
    }

    @GET
    @Path("{Aid}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAppointment(@PathParam("Aid") int id) {
        try {
            Appointment appointment = new DBUtils().getAppointment(id);

            if (appointment != null) {
                return Response
                        .ok(gson.toJson(appointment))
                        .build();
            }

            return Response
                    .status(Response.Status.NOT_FOUND)
                    .build();
        } catch (Exception e) {
            return Response
                    .status(Response.Status.INTERNAL_SERVER_ERROR)
                    .build();
        }
    }

}
