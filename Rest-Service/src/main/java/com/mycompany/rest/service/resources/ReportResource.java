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
 
/**
*
* @author User
*/
@Path("report")
public class ReportResource {
    Gson gson = new Gson();
 
    public ReportResource() {
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getReports(){    
        return Response
                .ok(gson.toJson(new DBUtils().getReports()))
                .build();
    }
 
    @GET
    @Path("{rid}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getReport(@PathParam("rid") int id){ 
       System.err.println("Report "+ id);
        try {
        Report report = new DBUtils().getReport(id);
        if (report != null) {
                  return Response
                    .ok(gson.toJson(report))
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
    public Response addReport(String json){ 
        Report report = gson.fromJson(json, Report.class); 
        new DBUtils().addReport(report);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    @PUT
    @Path("{rid}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateReport(String json, @PathParam("rid") int id){ 
        Report report = gson.fromJson(json, Report.class);
        new DBUtils().updateReport(report);
        return Response
                    .ok()
                    .build();
    }

    @DELETE
    @Path("{rid}")
    public Response deleteReport(@PathParam("rid") int id){ 
        new DBUtils().deleteReport(id);
        return Response
            .ok()
            .build();
    }
}