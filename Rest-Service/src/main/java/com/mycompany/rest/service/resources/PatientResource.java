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

/**
 *
 * @author
 */
@Path("patients")
public class PatientResource {

    Gson gson = new Gson();

    public PatientResource() {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatients() {
        return Response
                .ok(gson.toJson(new DBUtils().getPatients()))
                .build();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatient(@PathParam("id") int id) {
        try {
            Patient patient = new DBUtils().getPatient(id);

            if (patient != null) {
                return Response
                        .ok(gson.toJson(patient))
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


    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addPatient(String json) {
        Patient patient = gson.fromJson(json, Patient.class);
        new DBUtils().addPatient(patient);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }

    @PUT
    @Path("{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updatePatient(String json, @PathParam("id") int id) {
        Patient patient = gson.fromJson(json, Patient.class);
        new DBUtils().updatePatient(patient);
        return Response
                .ok()
                .build();
    }

    @DELETE
    @Path("{id}")
    public Response deletePatient(@PathParam("id") int id) {
        new DBUtils().deletePatient(id);
        return Response
                .ok()
                .build();
    }

}
