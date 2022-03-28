package be.abdullah.alrawe.domain.controller;

import be.abdullah.alrawe.domain.db.CarDB;
import be.abdullah.alrawe.domain.model.Car;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    private  final CarDB DB = new CarDB();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }


    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String command = "home";
        if (request.getParameter("command") != null) {
            command = request.getParameter("command");
        }
        String destination;

        switch (command){
            case "overview":
            case "cancel" :
                destination  = overview(request, response);
                 break;
            case "edit":
                destination  = edit(request, response);
                break;
            case "confirmDelete":
                destination  = confirmDelete(request, response);
                break;
            case "search":
                destination  = search();
                break;
            case "insert":
                destination  = insert(request, response);
                break;
            case "searchResult":
                destination  = searchResult(request, response);
                break;
            case "update":
                destination  = update(request, response);
                break;
            case "remove":
                destination  = remove(request, response);
                break;
            default:
                destination = home(request, response);
        }
        request.getRequestDispatcher(destination).forward(request, response);
    }

    private String confirmDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        DB.remove(id);
        return overview(request, response);
    }

    private String edit(HttpServletRequest request, HttpServletResponse response) {
        Car  car = DB.getCar(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("car", car);
        return "edit.jsp";
    }

    private String remove(HttpServletRequest request, HttpServletResponse response) {
        Car  car = DB.getCar(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("car", car);
        return "removeActivation.jsp";
    }

    private String update(HttpServletRequest request, HttpServletResponse response) {
        try{
            int year;
            double price;
            try{
                year = Integer.parseInt(request.getParameter("year"));
                price = Double.parseDouble(request.getParameter("price"));
            }catch (Exception e){
                throw new Exception("Year and price cant be empty and have to be numeric");
            }
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            int id = Integer.parseInt(request.getParameter("id"));

            DB.updateCar(id,brand, model,price,year);
            return overview(request, response);
        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
            return edit(request, response);
        }
    }

    private String searchResult(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("searchResult",DB.search(request.getParameter("brand"), request.getParameter("model")));
            return "searchResult.jsp";

        }catch (Exception e){
            request.setAttribute("error", e.getMessage());
            return search();
        }
    }

    private String overview(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("allCars", DB);
        return "overview.jsp";
    }

    private String home(HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("amount",DB.getAmount());
        request.setAttribute("oldest", DB.getOldestCar());
        request.setAttribute("exp", DB.getMostExpCar());
        request.setAttribute("total", DB.getTotalPrice());
        return "index.jsp";
    }

    private String search(){
        return "search.jsp";
    }

    private String insert(HttpServletRequest request, HttpServletResponse response){
        try {
            String brand =  request.getParameter("brand");
            String model =  request.getParameter("model");
            int year ;
            double price;
            try {
                year =  Integer.parseInt(request.getParameter("year"));
                price =  Double.parseDouble(request.getParameter("price"));
            }catch (NumberFormatException numberFormatException){
                throw new Exception("Price and year have to be numeric and can't be empty");
            }
            Car car = new Car(brand,model,price,year);
            DB.add(car);
            request.setAttribute("allCars",DB);
            return "overview.jsp";
        }catch (Exception exception) {
            request.setAttribute("error", exception.getMessage());
            return "insert.jsp";
        }
    }
}