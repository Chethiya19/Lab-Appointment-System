/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("reports")
public class ReportResource {

    Gson gson = new Gson();

    public ReportResource() {
    }

    @POST
    @Path("upload")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response uploadReport(String json) {
        // Parse JSON to extract report details
        Report report = gson.fromJson(json, Report.class);

        // Save report to database or perform any required processing
        try {
            new DBUtils().uploadReport(report);
            return Response.status(Response.Status.CREATED).build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
        }
    }

}
