<%@ page import="be.abdullah.alrawe.domain.model.Car" %>
<%@ page import="be.abdullah.alrawe.domain.db.CarDB" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="template/style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Overview |</title>
</head>
<body>
<header>
    <div class="banner">
        <nav class="container">
            <h1>Show room</h1>
            <ul>
                <li><a href="Controller?command=home">Home</a></li>
                <li><a href="insert.jsp">Insert</a></li>
                <li><a id="current" href="Controller?command=overview">Overview</a></li>
                <li><a href="Controller?command=search">Search</a></li>
            </ul>
        </nav>
    </div>
    <main class="container">
        <%
            if(request.getAttribute("allCars") != null){
                CarDB DB = (CarDB) request.getAttribute("allCars");
        %>

        <h2>Overview</h2>
        <table class="styled-table">
            <thead>
            <tr>
                <th>Brand</th>
                <th>Model</th>
                <th>Year</th>
                <th>Price</th>
                <th>Edit</th>
                <th>Remove</th>
            </tr>
            </thead>
            <tbody>
            <% for(Car car:DB.getAllCars()) { %>
            <tr>
                <td><%=car.getBrand()%></td>
                <td><%=car.getModel()%></td>
                <td><%=car.getYear()%></td>
                <td><%=car.getPrice() + " &euro;"%></td>
                <td><a href=<%="Controller?command=edit&id="+car.getId()%>><i class="fa-solid fa-pen"></i></a></td>
                <td><a href=<%="Controller?command=remove&id="+car.getId()%>><i class="fa-solid fa-trash"></i></a></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <%}%>
    </main>


</header>
<footer>
    SHOW ROOM &copy 2012 - <%out.print(LocalDate.now().getYear());%>
</footer>

</body>
</html>