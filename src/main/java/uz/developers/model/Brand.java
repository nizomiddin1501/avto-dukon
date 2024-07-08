package uz.developers.model;

public class Brand {

    private Integer id;
    private String name;


    public Brand(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Brand(String name) {
        this.name = name;
    }

    public Brand() {
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

    @Override
    public String toString() {
        return "Brand{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
