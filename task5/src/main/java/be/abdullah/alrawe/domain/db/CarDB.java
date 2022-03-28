package be.abdullah.alrawe.domain.db;
import be.abdullah.alrawe.domain.model.Car;
import java.util.ArrayList;
import java.util.Collections;

public class CarDB {
    private int sequence = 0;
    private final ArrayList<Car> cars = new ArrayList<>();

    public CarDB() {
        this.add(new Car("BMw", "x5",21000,2016));
        this.add(new Car("bMw", "x4",20000,2015));
        this.add(new Car("BMW", "xR6",23000,2017));
        Collections.sort(cars);

    }

    public void updateCar(int id, String brand, String model, double price, int year){
        Car updated = new Car(brand, model, price, year);

        for (Car car : cars) {
            if (id != car.getId()){
                if(updated.equals(car)){
                    throw new IllegalArgumentException("Car already exist");
                }
            }else {
                car.update(updated);
            }
        }
        Collections.sort(cars);
    }
    public void add(Car car){
        if(car == null){
            throw new IllegalArgumentException();
        }

        for(Car c:cars){
            if(c.equals(car)){
                throw new IllegalArgumentException("Car already exists");
            }
        }

        this.sequence++;
        car.setId(sequence);
        cars.add(car);
        Collections.sort(cars);
    }

    public Car search(String brand, String model){
        if(brand == null || brand.trim().isEmpty()){
            throw new IllegalArgumentException("Brand cant be empty");
        }

        if(model == null || model.trim().isEmpty()){
            throw new IllegalArgumentException("Model cant be empty");
        }

        for(Car car:cars){
            if(car.getBrand().equalsIgnoreCase(brand) && car.getModel().equalsIgnoreCase(model)){
                return car;
            }
        }

        throw new IllegalArgumentException("Could not find car with model " + model + " and brand " + brand);
    }
    public void remove(int id){
        cars.removeIf(car -> car.getId() == id);
    }

    public Car getCar(int id){
        for(Car car:cars){
            if(car.getId() == id){
                return car;
            }
        }
        return null;
    }

    public double getTotalPrice(){
        double prices = 0;
        for(Car car:cars){
            prices += car.getPrice();
        }
        return prices;
    }

    public Car getOldestCar(){
        int oldest = Integer.MAX_VALUE;
        Car c = null;
        for(Car car: cars){
            if(car.getYear() < oldest){
                oldest = car.getYear();
                c = car;
            }
        }
        return c;
    }

    public Car getMostExpCar(){
        double price = 0;
        Car c = null;
        for(Car car:cars){
            if (car.getPrice() > price){
                price = car.getPrice();
                c = car;
            }
        }
        return c;
    }

    public int getAmount(){
        return this.cars.size();
    }

    public ArrayList<Car> getAllCars() {
        return this.cars;
    }
}