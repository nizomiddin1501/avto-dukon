package uz.developers.service;

import uz.developers.model.Model;
import uz.developers.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                user = new User(id, firstname, lastname, email, password, photo, phone_number);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }


    public boolean updateClient(User user) {
        boolean rowUpdated = false;
        try {
            String query = "update member set firstname = ?, lastname = ?, email = ?, password = ?, photo = ?, phone_number = ? where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getFirstname());
            preparedStatement.setString(2, user.getLastname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getPhoto());
            preparedStatement.setString(6, user.getPhone_number());
            preparedStatement.setInt(7, user.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }








    public List<User> getAllClientList() {
        List<User> userList = new ArrayList<>();
        try {
            String selectQuery = "select * from member;";
            preparedStatement = this.connection.prepareStatement(selectQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstname = resultSet.getString("firstname");
                String lastname = resultSet.getString("lastname");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String photo = resultSet.getString("photo");
                String phone_number = resultSet.getString("phone_number");
                userList.add(new User(id, firstname, lastname, email, password, photo, phone_number));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }


    public User getUserById(int userId) {
        User user = new User();
        try {
            String query = "select * from member where id = ?;";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstname = resultSet.getString("firstname");
                String lastname = resultSet.getString("lastname");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String photo = resultSet.getString("photo");
                String phone_number = resultSet.getString("phone_number");
                user = new User(id, firstname,lastname,email,password,photo,phone_number);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


    public void deleteClient(int id) {
        try {
            String deleteQuery = "delete from member where id =?";
            preparedStatement = this.connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Client is deleted");
        } catch (SQLException e) {
            throw new RuntimeException("Error while deleting client", e);
        }
    }


}
