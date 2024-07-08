package uz.developers.service;

import uz.developers.model.Brand;
import uz.developers.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandService {


    private Connection connection;

    PreparedStatement preparedStatement;

    public BrandService(Connection connection) {
        this.connection = connection;
    }

    public List<Brand> getAllBrands() {
        List<Brand> brandList = new ArrayList<>();
        try {
            String query = "select * from brand";
            preparedStatement = this.connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Brand brand = new Brand();
                brand.setId(resultSet.getInt(1));
                brand.setName(resultSet.getString(2));
                brandList.add(brand);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brandList;
    }





    public void addBrand(Brand brand) {
        try {
            String checkNameQuery = "select count(*) from brand where name = ?";
            preparedStatement = this.connection.prepareStatement(checkNameQuery);
            preparedStatement.setString(1,brand.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                if (resultSet.getInt(1)>0){
                    System.out.println("Brand already exists. Please use a different name.");
                }else {
                    String insertQuery = "insert into brand(name) values(?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1,brand.getName());
                    preparedStatement.executeUpdate();
                    System.out.println("Brand added successfully!!!");

                }

            }


        } catch (SQLException e) {
            throw new RuntimeException("Error while adding brand", e);
        }
    }


}
