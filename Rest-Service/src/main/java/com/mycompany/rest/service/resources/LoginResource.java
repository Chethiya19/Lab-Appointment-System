package com.mycompany.rest.service.resources;

import com.google.gson.Gson;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.List;
import org.json.JSONObject;

@Path("login")
public class LoginResource {
    Gson gson = new Gson();

    public LoginResource() {
    }
    
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String checkLogin(@FormParam("email") String email, @FormParam("password") String password) {
        JSONObject response = new JSONObject();
        boolean success = DBUtils.checkLogin(email, password);
        response.put("success", success);
        return response.toString();
    }
}