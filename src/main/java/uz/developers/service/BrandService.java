package uz.developers.service;

import uz.developers.model.Brand;
import uz.developers.model.Model;
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
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                brandList.add(new Brand(id, name));
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
            preparedStatement.setString(1, brand.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                if (resultSet.getInt(1) > 0) {
                    System.out.println("Brand already exists. Please use a different name.");
                } else {
                    String insertQuery = "insert into brand(name) values(?);";
                    preparedStatement = this.connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, brand.getName());
                    preparedStatement.executeUpdate();
                    System.out.println("Brand added successfully!!!");

                }

            }


        } catch (SQLException e) {
            throw new RuntimeException("Error while adding brand", e);
        }
    }

    public void updateBrand(Brand brand) {
        try {
            String updateQuery = "update brand set name=? where id=?";
            preparedStatement = this.connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, brand.getName());
            preparedStatement.setInt(2, brand.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error while updating brand", e);
        }
    }


    public List<Brand> getBrand(int id) {  // this to edit brand
        List<Brand> brandList = new ArrayList<>();
        try {
            String query = "select * from brand where id = ?;";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                brandList.add(new Brand(id,name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brandList;
    }


    public Brand getBrandById(int brandId) {
        Brand brand = new Brand();
        try {
            String query = "select * from brand where id = ?;";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setInt(1, brandId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                brand = new Brand(id, name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return brand;
    }


    public void deleteBrand(int id) {
        try {
            String deleteQuery = "delete from brand where id =?";
            preparedStatement = this.connection.prepareStatement(deleteQuery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Brand is deleted");
        } catch (SQLException e) {
            throw new RuntimeException("Error while deleting brand", e);
        }
    }




}