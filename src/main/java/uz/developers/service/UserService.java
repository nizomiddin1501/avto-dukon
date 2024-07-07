package uz.developers.service;

import uz.developers.model.User;

import java.sql.*;

public class UserService {


    private Connection connection;

    PreparedStatement preparedStatement;

    public UserService(Connection connection) {
        this.connection = connection;
    }


    public void addUser(User user) {
        try {
            int count = 0;
            String checkEmailQuery = "select count(*) from member where email = ?";
            preparedStatement = this.connection.prepareStatement(checkEmailQuery);
            preparedStatement.setString(1,user.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                if (resultSet.getInt(1)>0){
                    System.out.println("Email already exists. Please use a different email.");
                }else {
                    String insertQuery = "insert into member(firstname,lastname,email,password,photo,phone_number) values(?,?,?,?,?,?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1,user.getFirstname());
                    preparedStatement.setString(2,user.getLastname());
                    preparedStatement.setString(3,user.getEmail());
                    preparedStatement.setString(4,user.getPassword());
                    preparedStatement.setString(5,user.getPhoto());
                    preparedStatement.setString(6,user.getPhone_number());
                    preparedStatement.executeUpdate();
                    System.out.println("User added successfully!!!");

                }

            }


        } catch (SQLException e) {
            throw new RuntimeException("Error while adding user", e);
        }
    }


}
