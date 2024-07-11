package uz.developers.service;

import uz.developers.model.User;

import java.sql.*;

public class UserService {


    private Connection connection;

    PreparedStatement preparedStatement;

    ResultSet resultSet;

    public UserService(Connection connection) {
        this.connection = connection;
    }


    public void addUser(User user) {
        try {
            String checkEmailQuery = "select count(*) from member where email = ?";
            preparedStatement = this.connection.prepareStatement(checkEmailQuery);
            preparedStatement.setString(1, user.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getInt(1) > 0) {
                    System.out.println("Email already exists. Please use a different email.");
                } else {
                    String insertQuery = "insert into member(firstname,lastname,email,password,photo,phone_number) values(?,?,?,?,?,?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, user.getFirstname());
                    preparedStatement.setString(2, user.getLastname());
                    preparedStatement.setString(3, user.getEmail());
                    preparedStatement.setString(4, user.getPassword());
                    preparedStatement.setString(5, user.getPhoto());
                    preparedStatement.setString(6, user.getPhone_number());
                    preparedStatement.executeUpdate();
                    System.out.println("User added successfully!!!");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while adding user", e);
        }
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            String query = "select * from member where email=? and password=?";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String firstname = resultSet.getString(2);
                String lastname = resultSet.getString(3);
                email = resultSet.getString(4);
                password = resultSet.getString(5);
                String photo = resultSet.getString(6);
                String phone_number = resultSet.getString(7);
                user = new User(id,firstname,lastname,email,password,photo,phone_number);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }


}
