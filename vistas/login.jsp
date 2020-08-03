<%-- 
    Document   : login
    Created on : 22/06/2019, 21:28:01
    Author     : matheo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="../css/all.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link href="../css/login.css" rel="stylesheet" type="text/css" media="all" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <script src="../js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="keywords" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <title>Login</title>
    </head>
    <body>
        <div class="full">
            <jsp:include page="/templates/menuLateral.jsp" />
            <div class="main">
                <div class="header" style="min-height: 60px;">
                    <jsp:include page="/templates/head.jsp" />
                </div>
                <div class="main-contact">
                    <div class="wrapper fadeInDown">
                        <div id="formContent">
                            <div class="fadeIn first">
                                <h2>Inicio de sesion</h2>
                            </div>
                            <!-- Login Form -->
                            <form id="mi"  action="http://localhost:8084/reservTest/Validar_Login" method="POST">
                                <div class="wrapper">
                                    <input type="email" id="login" class="fadeIn second" name="mail" placeholder="Correo..." required>
                                <i  class="fas fa-envelope"></i>
                                </div>
                                <div class="wrapper">
                                <input type="password" id="password" class="fadeIn third" name="clave" placeholder="Clave" required>
                                <i class="fas fa-lock"></i>
                                </div>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <fieldset class="form-group">
                                    <input  type="radio" id="gridRadios1" value="Normal" name="tipo" checked>
                                    <label for="gridRadios1"> Cliente </label>
                                    <div class="form-check disabled">
                                        <input  type="radio" id="gridRadios3" value="Encargado" name="tipo">
                                        <label  for="gridRadios3"> Encargado </label>
                                    </div>
                                </fieldset>
                                <br>
                                <br>
                                <input type="submit" class="fadeIn fourth" value="Iniciar sesion">
                            </form>
                            <!-- Remind Passowrd -->
                            <div id="formFooter">
                                <a class="underlineHover" href="http://localhost:8084/reservTest/vistas/registrarse.jsp">No tienes cuenta? registrate</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/Login.js" type="text/javascript"></script>
    </body>
</html>
