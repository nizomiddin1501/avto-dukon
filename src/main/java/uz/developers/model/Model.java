package uz.developers.model;

public class Model {

    private Integer id;
    private String name;

    private String brandName;
    private Integer brand_id;

    private String photo;

    //private String[] photo;


    public Model(Integer id, String name, Integer brand_id) {
        this.id = id;
        this.name = name;
        this.brand_id = brand_id;
    }

    public Model(String name, Integer brand_id,String photo) {
        this.name = name;
        this.brand_id = brand_id;
        this.photo = photo;
    }

    public Model() {
    }

//    public Model(Integer id, String name, String brandName) {
//        this.id = id;
//        this.name = name;
//        this.brandName = brandName;
//    }

    public Model(Integer id, String name,  String photo, String brandName) {
        this.id = id;
        this.name = name;
        this.photo = photo;
        this.brandName = brandName;

    }

    public Model(Integer id, String name,String photo) {
        this.id = id;
        this.name = name;
        this.photo = photo;
    }


    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(Integer brand_id) {
        this.brand_id = brand_id;
    }


    @Override
    public String toString() {
        return "Model{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brandName='" + brandName + '\'' +
                '}';
    }
}
