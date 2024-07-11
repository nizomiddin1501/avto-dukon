package uz.developers;

import uz.developers.model.Brand;
import uz.developers.model.Car;
import uz.developers.model.Model;
import uz.developers.model.User;
import uz.developers.service.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        //add user


        //add brand name


        boolean islui = true;

        while (islui) {
            System.out.println(
                    "0 => Exit, " +
                    "1 => New User, " +
                    "2 => New Brand, " +
                    "3 => New Model, " +
                    "4 => New Car, " +
                    "5 => Brand List, " +
                    "6 => Model List, " +
                    "7 => Car List, " +
                    "8 => Edit Model");
            int i = scanner.nextInt();
            switch (i) {
                case 0: {
                    return;
                }

                case 1: {
                    UserService databaseService = new UserService(DbConnection.getConnection());
                    System.out.println("Enter firstname");
                    String firstname = scanner.next();

                    System.out.println("Enter lastname");
                    String lastname = scanner.next();

                    System.out.println("Enter email");
                    String email = scanner.next();

                    System.out.println("Enter password");
                    String password = scanner.next();

                    System.out.println("Enter photo");
                    String photo = scanner.next();

                    System.out.println("Enter phone number");
                    String phone_number = scanner.next();

                    User user = new User(firstname, lastname, email, password, photo, phone_number);
                    databaseService.addUser(user);
                    break;
                }

                case 2: {
                    System.out.println("Enter brand name");
                    String name = scanner.next();
                    Brand brand = new Brand(name);
                    BrandService brandService = new BrandService(DbConnection.getConnection());
                    brandService.addBrand(brand);
                    break;
                }

                case 3: {
                    System.out.println("Enter model name");
                    String name = scanner.next();

                    System.out.println("Enter brand id");
                    int brand_id = scanner.nextInt();
                    Model model = new Model(name,brand_id);
                    ModelService modelService = new ModelService(DbConnection.getConnection());
                    modelService.addModel(model);
                    break;
                }

                case 4: {
                    CarService carService = new CarService(DbConnection.getConnection());
                    System.out.println("Enter title");
                    String title = scanner.next();

                    System.out.println("Enter description");
                    String description = scanner.next();

                    System.out.println("Enter year");
                    int year = scanner.nextInt();

                    System.out.println("Enter price");
                    int price = scanner.nextInt();

                    System.out.println("Enter model id");
                    int model_id = scanner.nextInt();

                    System.out.println("Enter member ind");
                    int member_id = scanner.nextInt();

                    Car car = new Car(title,description,year,price,model_id,member_id);
                    carService.addCar(car);
                    break;
                }

                case 5: {
                    BrandService brandService = new BrandService(DbConnection.getConnection());
                    System.out.println(brandService.getAllBrands());
                    break;
                }

                case 6: {
                    ModelService modelService = new ModelService(DbConnection.getConnection());
                    System.out.println(modelService.getAllModelList());
                    break;
                }

                case 7: {
                    CarService carService = new CarService(DbConnection.getConnection());
                    System.out.println(carService.getAllCarList());
                    break;
                }

                case 8: {
                    ModelService modelService = new ModelService(DbConnection.getConnection());
                    System.out.println("Enter model's id");
                    int id = scanner.nextInt();

                    System.out.println("Enter model's name");
                    String name = scanner.next();

                    System.out.println("Enter model's brand_id");
                    int brand_id = scanner.nextInt();
                    Model model = new Model(id,name,brand_id);

                    modelService.updateModel(model);
                    break;
                }





            }
        }


    }
}
