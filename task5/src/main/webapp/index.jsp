<%@ page import="be.abdullah.alrawe.domain.model.Car" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="template/style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home |</title>
</head>
<body>
<header>
    <div class="banner">
        <nav class="container">
            <h1>Show room</h1>
            <ul>
                <li><a id="current" href="Controller?command=home">Home</a></li>
                <li><a href="insert.jsp">Insert</a></li>
                <li><a href="Controller?command=overview">Overview</a></li>
                <li><a href="Controller?command=search">Search</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="container">
    <% // If the user surf to index.jsp manually
        if(request.getAttribute("oldest") != null && request.getAttribute("exp") != null && request.getAttribute("total") != null){
            Car oldest = (Car) request.getAttribute("oldest");
            Car mostExp = (Car) request.getAttribute("exp");
            double totalPrice = (double) request.getAttribute("total");

    %>
    <h2>About Show Room</h2>
        <p>Welcome to our Show Room where you can easily insert, delete and edit your data.
            The website is responsive, so you can handle that data in all devices.
            The website is built in the concept of mobile first.</p>

        <p>
            We currently have  <%="<span class='orange'>" + request.getAttribute("amount") + "</span> cars."%>
        </p>
        <p>
            Oldest car is <%="<span class='orange'>" + oldest.getBrand() + " " + oldest.getModel() +
            "</span> which was made in <span class='orange'>" + oldest.getYear() +"</span>."%>
        </p>
        <p>Most expensive car is <%= "<span class='orange'>" + mostExp.getBrand() + " " + mostExp.getModel() + "</span> which costs <span class='orange'>" + mostExp.getPrice() + " &euro;</span>."%></p>
        <p>Total car price is <%= "<span class='orange'>"+ totalPrice + "</span>."%></p>
        <%}/*else {
            response.sendRedirect("Controller");
        }*/%>

</main>




<footer>
    SHOW ROOM &copy 2012 - <%out.print(LocalDate.now().getYear());%>
</footer>
</body>
</html>