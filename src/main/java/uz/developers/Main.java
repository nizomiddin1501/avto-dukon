package uz.developers;

import uz.developers.model.Brand;
import uz.developers.model.User;
import uz.developers.service.BrandService;
import uz.developers.service.UserService;
import uz.developers.service.DbConnection;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        //add user


        //add brand name


        boolean islui = true;

        while (islui) {
            System.out.println("0 => Exit, 1 => New User, 2 => New Brand");
            int i = scanner.nextInt();
            switch (i) {
                case 0:
                    return;
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
                }

                case 2: {
                    System.out.println("Enter brand name");
                    String name = scanner.next();
                    Brand brand = new Brand(name);
                    BrandService brandService = new BrandService(DbConnection.getConnection());
                    brandService.addBrand(brand);
                }
            }
        }


    }
}
