<%@ page import="be.abdullah.alrawe.domain.model.Car" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="template/style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Search |</title>
</head>
<body>
<header>
    <div class="banner">
        <nav class="container">
            <h1>Show room</h1>
            <ul>
                <li><a href="Controller?command=home">Home</a></li>
                <li><a href="insert.jsp">Insert</a></li>
                <li><a  href="Controller?command=overview">Overview</a></li>
                <li><a id="current" href="Controller?command=search">Search</a></li>
            </ul>
        </nav>
    </div>
    <main class="container">
        <%
            if(request.getAttribute("searchResult")!= null){
                Car car = (Car) request.getAttribute("searchResult");
        %>
        <h2>Result</h2>
        <p>Brand : <%="<span class='orange'>"+car.getBrand()+ "</span>"%></p>
        <p>Model : <%="<span class='orange'>"+car.getModel()+ "</span>"%></p>
        <p>Year :  <%="<span class='orange'>"+car.getYear()+ "</span>"%></p>
        <p>Price : <%="<span class='orange'>"+car.getPrice()+ " &euro;</span>"%></p>
    </main>
    <%}%>


</header>
<footer>
    SHOW ROOM &copy 2012 - <%out.print(LocalDate.now().getYear());%>
</footer>

</body>
</html>