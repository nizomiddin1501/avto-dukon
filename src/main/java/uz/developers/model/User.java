package uz.developers.model;

public class User {
    private Integer id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String photo;
    private String phone_number;


    public User(Integer id, String firstname, String lastname, String photo, String phone_number) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.photo = photo;
        this.phone_number = phone_number;
    }

    public User(Integer id, String firstname, String lastname, String email, String password, String photo, String phone_number) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.photo = photo;
        this.phone_number = phone_number;
    }

    public User(String firstname, String lastname, String email, String password, String photo, String phone_number) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.photo = photo;
        this.phone_number = phone_number;
    }

    public User() {
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", photo='" + photo + '\'' +
                ", phone_number=" + phone_number +
                '}';
    }
}
