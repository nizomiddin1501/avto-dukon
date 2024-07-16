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
import java.io.PrintWriter;


@WebServlet("/model")
public class ModelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        User auth = (User) req.getSession().getAttribute("auth");
//        if (auth != null) {
//            resp.sendRedirect("model.jsp");
//        } else {
//            resp.sendRedirect("login.jsp");
//        }

        req.getRequestDispatcher("modelList.jsp").forward(req, resp);


    }




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int brand_id = Integer.parseInt(req.getParameter("brand_id"));
        String name = req.getParameter("name");
        String photo = req.getParameter("photo");

        Model model = new Model(name,brand_id,photo);
        ModelService modelService = new ModelService(DbConnection.getConnection());
        modelService.addModel(model);
        resp.sendRedirect("modelList.jsp");
        PrintWriter writer = resp.getWriter();
        writer.println("Model added successfully!!!");
    }


}
