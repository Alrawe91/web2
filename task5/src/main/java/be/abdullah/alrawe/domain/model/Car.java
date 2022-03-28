package be.abdullah.alrawe.domain.model;
import java.util.Calendar;

public class Car implements Comparable{
    private int id;
    private String brand, model;
    private double price;
    private int year;

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", price=" + price +
                ", year=" + year +
                '}';
    }

    public Car(String brand, String model, double price, int year) {
        setBrand(brand);
        setModel(model);
        setPrice(price);
        setYear(year);
    }

    public void setBrand(String brand){
        if(brand == null || brand.trim().length() == 0){
            throw new IllegalArgumentException("Brand cant be empty");
        }

        this.brand = capitalize(brand);
    }

    public void setModel(String model){
        if(model == null || model.trim().length() == 0){
            throw new IllegalArgumentException("Model cant be empty");
        }
        this.model = capitalize(model);
    }

    public void setYear(int year){
        if(year > Calendar.getInstance().get(Calendar.YEAR) || year < 1886){
            throw new IllegalArgumentException("Manufacturing year must be more than 1886 and cant be in the future");
        }
        this.year = year;
    }

    public void setPrice(double price){
        if(price <= 0){
            throw new IllegalArgumentException("Price cant be negative");
        }
        this.price = price;
    }

    public void update(Car car){
        setBrand(car.brand);
        setModel(car.model);
        setYear(car.year);
        setPrice(car.price);
    }

    private String capitalize(String s){
        return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId(){
        return this.id;
    }

    public double getPrice() {
        return this.price;
    }

    public int getYear() {
        return this.year;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Car)) return false;
        Car other = (Car) o;
        return this.brand.equalsIgnoreCase(other.brand) && this.model.equalsIgnoreCase(other.model);
    }

    @Override
    public int compareTo(Object o) {
        return Double.compare(this.getPrice(), ((Car) o).getPrice());
    }
}