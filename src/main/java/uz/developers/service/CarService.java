package uz.developers.service;

import uz.developers.model.Car;
import uz.developers.model.Model;
import uz.developers.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarService {


    private Connection connection;

    PreparedStatement preparedStatement;

    public CarService(Connection connection) {
        this.connection = connection;
    }

    public List<Car> getAllCarList() {
        List<Car> carList = new ArrayList<>();
        try {
            String query = "select car.id, car.title, brand.name as brandName, car.year, car.price, car.photo, model.name as modelName from car " +
                    " inner join model on model.id = car.model_id " +
                    " inner join brand on brand.id = model.brand_id";
            preparedStatement = this.connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String brandName = resultSet.getString("brandName");
                int year = resultSet.getInt("year");
                int price = resultSet.getInt("price");
                String photo = resultSet.getString("photo");
                String modelName = resultSet.getString("modelName");
                carList.add(new Car(id,title,brandName,year,price,photo,modelName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carList;
    }


    public Car getCarById(int carId) {
        Car car = new Car();
        try {
            String query = "select car.id, car.title, brand.name as brandName, car.year, car.price, car.photo, model.name as modelName from car " +
                    " inner join model on model.id = car.model_id " +
                    " inner join brand on brand.id = model.brand_id where car.id=?";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1, carId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String brandName = resultSet.getString("brandName");
                int year = resultSet.getInt("year");
                int price = resultSet.getInt("price");
                String photo = resultSet.getString("photo");
                String modelName = resultSet.getString("modelName");
                //String description = resultSet.getString("description");
                car = new Car(id,title,brandName,year,price,photo,modelName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return car;
    }





    public void addCar(Car car) {
        try {
            String insertQuery = "insert into car(title,description,year,price,model_id,photo) values(?,?,?,?,?,?);";
            preparedStatement = this.connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, car.getTitle());
            preparedStatement.setString(2, car.getDescription());
            preparedStatement.setInt(3, car.getYear());
            preparedStatement.setInt(4, car.getPrice());
            preparedStatement.setInt(5, car.getModel_id());
//            preparedStatement.setInt(6, car.getBrand_id());
            preparedStatement.setString(6, car.getPhoto());


            preparedStatement.executeUpdate();
            System.out.println("Car added successfully!!!");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public boolean updateCar(Car car) {
        boolean rowUpdated = false;
        try {
            String updateQuery = "update car set price=? where id=?";
            preparedStatement = this.connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, car.getPrice());
            preparedStatement.setInt(2, car.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error while updating car", e);
        }
        return rowUpdated;
    }

    public void deleteCar(int id) {
        try {
            String deleteQuery = "delete from car where id =?";
            preparedStatement = this.connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Car is deleted");
        } catch (SQLException e) {
            throw new RuntimeException("Error while deleting car", e);
        }
    }


}
