package uz.developers.model;

public class Brand {

    private Integer id;
    private String name;
    private String photo;


    public Brand(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Brand(Integer id, String name, String photo) {
        this.id = id;
        this.name = name;
        this.photo = photo;
    }

    public Brand(String name,String photo) {
        this.name = name;
        this.photo = photo;
    }

    public Brand() {
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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
