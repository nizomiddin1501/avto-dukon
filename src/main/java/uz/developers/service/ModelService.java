package uz.developers.service;

import uz.developers.model.Brand;
import uz.developers.model.Model;

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
            String query = "select model.id, model.name, brand.name as brand_name from model " +
                    "inner join brand on brand.id = model.brand_id";
            preparedStatement = this.connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String brandName = resultSet.getString("brand_name");
                modelList.add(new Model(id,name,brandName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelList;
    }

    public void addModel(Model model) {
        try {
            String checkNameQuery = "select count(*) from model where name = ?";
            preparedStatement = this.connection.prepareStatement(checkNameQuery);
            preparedStatement.setString(1,model.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                if (resultSet.getInt(1)>0){
                    System.out.println("Model already exists. Please use a different name.");
                }else {
                    String insertQuery = "insert into model(name,brand_id) values(?,?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1,model.getName());
                    preparedStatement.setInt(2,model.getBrand_id());
                    preparedStatement.executeUpdate();
                    System.out.println("Model added successfully!!!");

                }

            }


        } catch (SQLException e) {
            throw new RuntimeException("Error while adding model", e);
        }
    }



}
