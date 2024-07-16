package uz.developers.controller;

import uz.developers.model.User;
import uz.developers.service.DbConnection;
import uz.developers.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/client")
public class ClientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("clientList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String photo = req.getParameter("photo");
        String phone_number = req.getParameter("phoneNumber");
        User user = new User(firstname,lastname,email,password,photo,phone_number);
        UserService userService = new UserService(DbConnection.getConnection());
        userService.addUser(user);
        resp.sendRedirect("login.jsp");
        PrintWriter writer = resp.getWriter();
        writer.println("Registration success!!!");

    }




}
