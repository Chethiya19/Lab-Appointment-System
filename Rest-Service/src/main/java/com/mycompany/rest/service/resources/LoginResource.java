package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/login")
public class LoginResource {
Gson gson = new Gson(); 
    private PatientService patientService = new PatientService();

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response login(Patient patient) {
        boolean success = patientService.verifyLogin(patient.getEmail(), patient.getPassword());
        if (success) {
            // If login successful, return success response
            return Response.ok().entity("{\"success\": true}").build();
        } else {
            // If login failed, return unauthorized response
            return Response.status(Response.Status.UNAUTHORIZED).entity("{\"success\": false, \"message\": \"Invalid email or password\"}").build();
        }
    }

    @GET
    @Path("/patientName")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatientName(@QueryParam("email") String email) {
        String patientName = patientService.getLoggedPatientName(email);
        if (patientName != null) {
            // If patient name retrieved successfully, return success response with patient name
            return Response.ok().entity("{\"success\": true, \"name\": \"" + patientName + "\"}").build();
        } else {
            // If retrieval failed, return not found response
            return Response.status(Response.Status.NOT_FOUND).entity("{\"success\": false, \"message\": \"Patient not found\"}").build();
        }
    }
    
}
