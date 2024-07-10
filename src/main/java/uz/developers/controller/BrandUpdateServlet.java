package uz.developers.controller;

import uz.developers.model.Brand;
import uz.developers.service.BrandService;
import uz.developers.service.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/brandUpdate")
public class BrandUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int brandId = Integer.parseInt(req.getParameter("id"));
        String brandName = req.getParameter("name");

        Brand brand = new Brand(brandId,brandName);
        BrandService brandService = new BrandService(DbConnection.getConnection());
        brandService.editBrand(brand);

        PrintWriter writer = resp.getWriter();
        writer.println("Brand edited successfully!!!");



    }


}
