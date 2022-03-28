<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="template/style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert |</title>
</head>
<body>
<header>
    <div class="banner">
        <nav class="container">
            <h1>Show room</h1>
            <ul>
                <li><a href="Controller?command=home">Home</a></li>
                <li><a id="current" href="insert.jsp">Insert</a></li>
                <li><a href="Controller?command=overview">Overview</a></li>
                <li><a href="Controller?command=search">Search</a></li>
            </ul>
        </nav>
    </div>
</header>
<%
    String brand= "", price = "", model = "", year = "", error = "";
    if(request.getAttribute("error") != null){
        error = (String) request.getAttribute("error");
        brand = request.getParameter("brand");
        price = request.getParameter("price");
        model = request.getParameter("model");
        year = request.getParameter("year");
    }
%>

<main>
    <h2 class="container">
        Insert car
    </h2>
    <p id="error">
        <%=error%>
    </p>

    <form method="post" action="Controller" class="styled-form container"  novalidate>
        <div>
            <label for="brand">Brand</label>
            <input type="text" id="brand" name="brand" value=<%=brand%>>
        </div>

        <div>
            <label for="model">Model</label>
            <input type="text" id="model" name="model" value=<%=model%>>
        </div>

        <div>
            <label for="year">Year</label>
            <input type="text" id="year" name="year" value=<%=year%>>
        </div>

        <div>
            <label for="price">Price</label>
            <input type="number" id="price" name="price" value=<%=price%>>
        </div>

        <div id="btns-container">
            <button type="submit">Insert</button>
        </div>
        <input type="hidden" name="command" value="insert">
    </form>
</main>

<footer>
    SHOW ROOM &copy 2012 - <%out.print(LocalDate.now().getYear());%>
</footer>

<!-- Just playing with js  -->
<script>
    msg = document.getElementById("error");
    if(msg.innerHTML.trim().length > 0){
        msg.style.display = "block";
    }
</script>
</body>
</html>