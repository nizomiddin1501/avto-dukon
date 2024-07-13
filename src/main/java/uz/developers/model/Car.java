package uz.developers.model;

public class Car {
    private Integer id;
    private String title;
    private String description;
    private int year;
    private int price;
    private Integer model_id;
    private String modelName;
    private Integer brand_id;
    private String brandName;
    private String photo;
    private Integer member_id;

    public Car() {
    }

    public Car(Integer id, int price) {
        this.id = id;
        this.price = price;
    }

    public Car(Integer id, String title, String brandName, int year, int price,String photo, String modelName) {
        this.id = id;
        this.title = title;
        this.brandName = brandName;
        this.year = year;
        this.price = price;
        this.photo = photo;
        this.modelName = modelName;

    }

    public Car(Integer id, String title, String description, int year, int price, Integer model_id, Integer member_id) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.year = year;
        this.price = price;
        this.model_id = model_id;
        this.member_id = member_id;
    }

    public Car(String title, String description, int year, int price, Integer model_id,Integer brand_id) {
        this.title = title;
        this.description = description;
        this.year = year;
        this.price = price;
        this.model_id = model_id;
        this.brand_id = brand_id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Integer getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(Integer brand_id) {
        this.brand_id = brand_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Integer getModel_id() {
        return model_id;
    }

    public void setModel_id(Integer model_id) {
        this.model_id = model_id;
    }

    public Integer getMember_id() {
        return member_id;
    }

    public void setMember_id(Integer member_id) {
        this.member_id = member_id;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", year=" + year +
                ", price=" + price +
                ", model_id=" + model_id +
                ", member_id=" + member_id +
                '}';
    }
}
