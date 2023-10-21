<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login and Signup Form</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="loader.css">
    <script src="carga.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

</head>
<body>


    <div class="container">
        <div class="form login">
            <h2>Login</h2>
<div>
<h2>${exito}</h2>
<h2>${error}</h2>
<h2>${noexiste}</h2>
</div>
            <form method="post" action="Login">
                <div class="inputBox">
                    <span class="fas fa-envelope"></span>
                    <input type="text" required name="carnet" id="carnet">
                    <label>Carnet</label>
                </div>
                <div class="inputBox">
                    <span class="fas fa-lock"></span>
                    <input type="password" maxlength="26" required name="pass" id="pass">
                    <label>Password</label>
                </div>
                
                <button class="btn">Login</button>
                
            </form>
                <a href="Alumno.jsp"><button class="btn">Solicitar Mi Cuenta</button></a>
            
        </div>
    </div>
</body>
</html>