package uz.developers.controller;

import uz.developers.model.Brand;
import uz.developers.model.User;
import uz.developers.service.BrandService;
import uz.developers.service.DbConnection;
import uz.developers.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/brandEdit")
public class BrandEditServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        BrandService brandService = new BrandService(DbConnection.getConnection());
        Brand existingBrand = brandService.getBrandById(Integer.parseInt(id));
        if (existingBrand != null) {
            req.setAttribute("brand", existingBrand);
            req.getRequestDispatcher("brandEdit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("BrandList.jsp");
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BrandService brandService = new BrandService(DbConnection.getConnection());
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        Brand brand = new Brand(id,name);
        brandService.updateBrand(brand);
        resp.sendRedirect("brandList.jsp");
    }

}
