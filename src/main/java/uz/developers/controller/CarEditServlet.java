package uz.developers.controller;

import uz.developers.model.Car;
import uz.developers.service.CarService;
import uz.developers.service.DbConnection;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/carEdit")
public class CarEditServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        CarService carService = new CarService(DbConnection.getConnection());
        Car existingCar = carService.getCarById(Integer.parseInt(id));
        if (existingCar != null) {
            req.setAttribute("car", existingCar);
            req.getRequestDispatcher("carEdit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("carList.jsp");
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarService carService = new CarService(DbConnection.getConnection());
        int id = Integer.parseInt(req.getParameter("id"));
        int price = Integer.parseInt(req.getParameter("firstname"));


        Car car = new Car(id,price);
        carService.updateCar(car);
        resp.sendRedirect("carList.jsp");
    }

}
