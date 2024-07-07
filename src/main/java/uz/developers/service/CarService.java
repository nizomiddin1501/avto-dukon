package uz.developers.service;

import uz.developers.model.Car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CarService {


    private Connection connection;

    PreparedStatement preparedStatement;

    public CarService(Connection connection) {
        this.connection = connection;
    }


    public void addCar(Car car) {
        try {
            String insertQuery = "insert into car(title,description,year,price,model_id,member_id) values(?,?,?,?,?,?);";
            preparedStatement = this.connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, car.getTitle());
            preparedStatement.setString(2, car.getDescription());
            preparedStatement.setInt(3, car.getYear());
            preparedStatement.setInt(4, car.getPrice());
            preparedStatement.setInt(5, car.getModel_id());
            preparedStatement.setInt(6, car.getMember_id());

            preparedStatement.executeUpdate();
            System.out.println("Car added successfully!!!");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
