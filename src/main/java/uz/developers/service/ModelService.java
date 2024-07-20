package uz.developers.service;

import uz.developers.model.Brand;
import uz.developers.model.Car;
import uz.developers.model.Model;
import uz.developers.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ModelService {


    private Connection connection;

    PreparedStatement preparedStatement;

    public ModelService(Connection connection) {
        this.connection = connection;
    }


    public List<Model> getAllModelList() {
        List<Model> modelList = new ArrayList<>();
        try {
            String query = "select model.id, model.name, model.photo, brand.name as brandName from model " +
                    "inner join brand on brand.id = model.brand_id";
            preparedStatement = this.connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String photo = resultSet.getString("photo");
                String brandName = resultSet.getString("brandName");
                modelList.add(new Model(id, name, photo, brandName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelList;
    }





    public List<Model> getModels() {
        List<Model> models = new ArrayList<>();
        try {
            String query = "select * from model;";
            preparedStatement = this.connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String photo = resultSet.getString("photo");
                models.add(new Model(id, name,photo));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return models;
    }

    public void addModel(Model model) {
        try {
            String checkNameQuery = "select count(*) from model where name = ?";
            preparedStatement = this.connection.prepareStatement(checkNameQuery);
            preparedStatement.setString(1, model.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getInt(1) > 0) {
                    System.out.println("Model already exists. Please use a different name.");
                } else {
                    String insertQuery = "insert into model(name,brand_id) values(?,?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, model.getName());
                    preparedStatement.setInt(2, model.getBrand_id());
                    preparedStatement.executeUpdate();
                    System.out.println("Model added successfully!!!");

                }

            }


        } catch (SQLException e) {
            throw new RuntimeException("Error while adding model", e);
        }
    }

    public boolean updateModel(Model model) {
        boolean rowUpdated = false;
        try {
            String updateQuery = "update model set name=?, photo=? where id=?";
            preparedStatement = this.connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, model.getName());
            preparedStatement.setString(2, model.getPhoto());
            preparedStatement.setInt(3, model.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error while updating model", e);
        }
        return rowUpdated;
    }




    public Model getModelById(int modelId) {
        Model model = new Model();
        try {
            String query = "select * from model where id = ?;";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1, modelId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String photo = resultSet.getString("photo");
                model = new Model(id, name,photo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return model;
    }


    public Model showModelById(int modId) {
        Model model = null;
        try {
            String query = "select model.id, model.name, model.photo, brand.name as brandName from model " +
                    "inner join brand on brand.id = model.brand_id where model.id=?;";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1,modId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String photo = resultSet.getString("photo");
                String brandName = resultSet.getString("brandName");
                model = new Model(id,name,photo,brandName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return model;
    }







    public void deleteModel(int id) {
        try {
            String deleteQuery = "delete from model where id =?";
            preparedStatement = this.connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Model is deleted");
        } catch (SQLException e) {
            throw new RuntimeException("Error while deleting model", e);
        }
    }




}
