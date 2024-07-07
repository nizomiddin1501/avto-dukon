package uz.developers.controller;

import uz.developers.model.Brand;
import uz.developers.model.Model;
import uz.developers.service.BrandService;
import uz.developers.service.DbConnection;
import uz.developers.service.ModelService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/modelAdd")
public class ModelServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int brand_id = Integer.parseInt(req.getParameter("brand_id"));
        String name = req.getParameter("name");

        Model model = new Model(name,brand_id);
        ModelService modelService = new ModelService(DbConnection.getConnection());
        modelService.addModel(model);
        //resp.sendRedirect("model.jsp");
        PrintWriter writer = resp.getWriter();
        writer.println("Model added successfully!!!");



    }


}
