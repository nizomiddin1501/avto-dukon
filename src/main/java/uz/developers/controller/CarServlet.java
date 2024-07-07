package uz.developers.controller;

import uz.developers.model.Car;
import uz.developers.model.Model;
import uz.developers.service.CarService;
import uz.developers.service.DbConnection;
import uz.developers.service.ModelService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/carAdd")
public class CarServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        String title = req.getParameter("title");
        String description = req.getParameter("description");
        int year = Integer.parseInt(req.getParameter("year"));
        int price = Integer.parseInt(req.getParameter("price"));
        int model_id = Integer.parseInt(req.getParameter("model_id"));
        int member_id = Integer.parseInt(req.getParameter("member_id"));
        Car car = new Car(title,description,year,price,model_id,member_id);

        CarService carService = new CarService(DbConnection.getConnection());
        carService.addCar(car);
        //resp.sendRedirect("car.jsp");
        PrintWriter writer = resp.getWriter();
        writer.println("Car added successfully!!!");



    }


}
