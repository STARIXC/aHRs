package models;

public class Position {

    int id;
    int carder_category_id;
    int standardized_cadre_id;
    String position_title;
    int cadre_type_id;
    int basic_pay;

    public Position(int carder_category_id, int standardized_cadre_id, String position_title, int cadre_type_id, int basic_pay) {
        super();
        this.carder_category_id = carder_category_id;
        this.standardized_cadre_id = standardized_cadre_id;
        this.position_title = position_title;
        this.cadre_type_id = cadre_type_id;
        this.basic_pay = basic_pay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCarder_category_id() {
        return carder_category_id;
    }

    public void setCarder_category_id(int carder_category_id) {
        this.carder_category_id = carder_category_id;
    }

    public int getStandardized_cadre_id() {
        return standardized_cadre_id;
    }

    public void setStandardized_cadre_id(int standardized_cadre_id) {
        this.standardized_cadre_id = standardized_cadre_id;
    }

    public String getPosition_title() {
        return position_title;
    }

    public void setPosition_title(String position_title) {
        this.position_title = position_title;
    }

    public int getCadre_type_id() {
        return cadre_type_id;
    }

    public void setCadre_type_id(int cadre_type_id) {
        this.cadre_type_id = cadre_type_id;
    }

    public int getBasic_pay() {
        return basic_pay;
    }

    public void setBasic_pay(int basic_pay) {
        this.basic_pay = basic_pay;
    }

    public Position() {
        super();
    }

    @Override
    public String toString() {
        return "Position [id=" + id + ", carder_category_id=" + carder_category_id + ", standardized_cadre_id="
                + standardized_cadre_id + ", position_title=" + position_title + ", cadre_type_id=" + cadre_type_id
                + ", basic_pay=" + basic_pay + "]";
    }

    public Position(int id, int carder_category_id, int standardized_cadre_id, String position_title, int cadre_type_id,
            int basic_pay) {
        super();
        this.id = id;
        this.carder_category_id = carder_category_id;
        this.standardized_cadre_id = standardized_cadre_id;
        this.position_title = position_title;
        this.cadre_type_id = cadre_type_id;
        this.basic_pay = basic_pay;
    }

}
