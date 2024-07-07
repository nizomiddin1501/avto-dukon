package uz.developers.model;

public class Model {

    private Integer id;
    private String name;
    private Integer brand_id;


    public Model(Integer id, String name, Integer brand_id) {
        this.id = id;
        this.name = name;
        this.brand_id = brand_id;
    }

    public Model(String name, Integer brand_id) {
        this.name = name;
        this.brand_id = brand_id;
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
                ", brand_id=" + brand_id +
                '}';
    }
}
