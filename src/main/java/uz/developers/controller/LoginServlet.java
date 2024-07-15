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

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getSession().getAttribute("auth");
        if (auth != null) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF=8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        PrintWriter writer = resp.getWriter();
        UserService userService = new UserService(DbConnection.getConnection());
        User login = userService.userLogin(email, password);
        if (login != null) {
            req.getSession().setAttribute("auth", login);
            resp.sendRedirect("home.jsp");
        } else {
            writer.write("<h1>Password or login error</h1>");
            resp.sendRedirect("login.jsp");
        }
    }
}





