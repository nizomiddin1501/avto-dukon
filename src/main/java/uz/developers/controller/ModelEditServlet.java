package uz.developers.controller;

import uz.developers.model.Model;
import uz.developers.service.DbConnection;
import uz.developers.service.ModelService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modelEdit")
public class ModelEditServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        ModelService modelService = new ModelService(DbConnection.getConnection());
        Model existingModel = modelService.getModelById(Integer.parseInt(id));
        if (existingModel != null) {
            req.setAttribute("model", existingModel);
            req.getRequestDispatcher("modelEdit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("modelList.jsp"); // Redirect if the user is not found
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ModelService modelService = new ModelService(DbConnection.getConnection());
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String photo = req.getParameter("photo");


        Model model = new Model(id,name,photo);
        modelService.updateModel(model);
        resp.sendRedirect("modelList.jsp");
    }

}
