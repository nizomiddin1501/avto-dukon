package uz.developers.controller;

import uz.developers.model.Brand;
import uz.developers.model.User;
import uz.developers.service.BrandService;
import uz.developers.service.UserService;
import uz.developers.service.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/brandAdd")
public class BrandServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User auth = (User) req.getSession().getAttribute("auth");
        if (auth != null) {
            resp.sendRedirect("brand.jsp");
        } else {
            resp.sendRedirect("login.jsp");
        }
    }


        @Override
        protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String brandName = req.getParameter("brandName");

            Brand brand = new Brand(brandName);
            BrandService brandService = new BrandService(DbConnection.getConnection());
            brandService.addBrand(brand);
            resp.sendRedirect("brandList.jsp");
            PrintWriter writer = resp.getWriter();
            writer.println("Brand added successfully!!!");


        }


    }
