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
</header>
    <%
        String error = "", model = "", brand = "";

        if(request.getAttribute("error") != null){
            error = (String) request.getAttribute("error");
        }

        if(request.getParameter("model") != null && request.getParameter("brand") != null){
            model = request.getParameter("model");
            brand = request.getParameter("brand");
        }


    %>
<main class="container">
    <h2>Search car</h2>
    <p>Give the model and the brand of the car you want to retrieve</p>
</main>
    <p id="error">
        <%=error%>
    </p>

<form action="Controller" class="styled-form container">
    <div>
        <label for="brand">Brand</label>
        <input type="text" name="brand" id="brand" value="<%=brand%>">
    </div>

    <div>
        <label for="model">Model</label>
        <input type="text" name="model" id="model" value="<%=model%>">
    </div>

    <div>
        <button type="submit">Search</button>
    </div>

    <input type="hidden" name="command" value="searchResult">
</form>


<footer>
    SHOW ROOM &copy 2012 - <%out.print(LocalDate.now().getYear());%>
</footer>
<script>
    msg = document.getElementById("error");
    if(msg.innerHTML.trim().length > 0){
        msg.style.display = "block";
    }
</script>
</body>
</html>