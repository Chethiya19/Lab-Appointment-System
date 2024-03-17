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
@Path("testdetails")
public class TestDetailsResource {
    Gson gson = new Gson();

    public TestDetailsResource() {
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTests(){ 
        
        
        return Response
                .ok(gson.toJson(new DBUtils().getTests()))
                .build();
    }
    
    @GET
    @Path("{testId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTest(@PathParam("testId") int id){ 
        try {
        TestDetails testdetails = new DBUtils().getTest(id);
        
        if (testdetails != null) {
                  return Response
                    .ok(gson.toJson(testdetails))
                    .build();
        } 

        return Response
                .status(Response.Status.NOT_FOUND)
                .build();
        } catch(Exception e) {
             return Response
                .status(Response.Status.INTERNAL_SERVER_ERROR)
                .build();
        }
    }
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addTest(String json){ 
        TestDetails testdetails = gson.fromJson(json, TestDetails.class); 
        new DBUtils().addTest(testdetails);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    
    @PUT
    @Path("{testId}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateTest(String json, @PathParam("testId") int id){ 
        TestDetails testdetails = gson.fromJson(json, TestDetails.class);
        new DBUtils().updateTest(testdetails);
        return Response
                    .ok()
                    .build();
    }
    
    
    @DELETE
    @Path("{testId}")
    public Response deleteTest(@PathParam("testId") int id){ 
        new DBUtils().deleteTest(id);
        return Response
            .ok()
            .build();
    }
}
