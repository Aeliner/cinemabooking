<%-- 
    Document   : resgistrarse
    Created on : 11/06/2019, 09:47:49 PM
    Author     : Nuevo
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
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../css/login.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <script src="../js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="keywords" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <title>Registrarse</title>
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
                                <h1>Registrarse</h1>
                            </div>
                            <!-- Login Form -->
                            <form id="mi" action="http://localhost:8084/reservTest/Registrar_Cliente" method="POST" onsubmit="return ValidarDatos();">
                               
                                <div class="wrapper">
                                <input type="text"  class="fadeIn second" name="nombre" placeholder="Nombre" required>
                                <i class="fas fa-user-edit"></i>
                                </div>
                                <div class="wrapper">
                                <input type="text"  class="fadeIn second" name="apellido" placeholder="Apellido" required>
                                <i class="fas fa-user-edit"></i>
                                </div>
                                <div display='none' class=" alert alert-danger" role="alert" id="Error_ci" name="Error_ci" visibility='hidden' >
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" disabled="false" display='none'></span>
                                    <span class="sr-only">Error:</span>
                                    Cedula ya registrada.
                                </div>
                                <div display='none' class=" alert alert-danger" role="alert" id="Error_ciFormato" name="Error_ci" visibility='hidden' >
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" disabled="false" display='none'></span>
                                    <span class="sr-only">Error:</span>
                                    Cedula incorrecta
                                </div>
                                <div class="wrapper">
                                <input type="text" class="fadeIn second" id="cedula" name="cedula" placeholder="Cedula" required>
                                <i class="fas fa-id-card"></i>
                                </div>
                                <div display='none' class="alert alert-danger" role="alert" id="Error_mail" name="Error_mail">
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    <span class="sr-only">Error:</span>
                                    Mail ya utilizado.
                                </div>
                                <div class="wrapper">
                                <input type="email" class="fadeIn second" name="mail" id="mail" placeholder="Mail" required>
                                <i class="fas fa-envelope"></i>
                                </div>
                                    <div display='none' class="alert alert-danger" role="alert" id="Error_clave" name="Error_clave">
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    <span class="sr-only" id="Er_clave">Error:</span>
                                    Claves no coinciden.
                                </div>
                                <div class="wrapper">
                                <input type="password" name="clave" id="ci_a" class="fadeIn third" placeholder="Clave" required>
                                <i class="fas fa-lock"></i>
                                 </div>
                                <div class="wrapper">
                                <input type="password" name="clavedos" id="ci_b" class="fadeIn third"  placeholder="Repetir Clave" required>
                                <i class="fas fa-lock"></i>
                                 </div>
                                <div class="wrapper">
                                <input type="date" id="login" class="fadeIn second" placeholder="Fecha de nacimiento" name="fecha" required>
                                <i class="fas fa-calendar-alt"></i>
                                </div>
                                <input type="submit" class="fadeIn fourth" id="boton" value="Registrarse">
                            </form>
                            <!-- Remind Passowrd -->
                            <div id="formFooter">
                                <a class="underlineHover" href="http://localhost:8084/reservTest/vistas/login.jsp">Ya tienes cuenta? Inicia sesion.</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="../js/Registrar.js" type="text/javascript"></script>
    </body>
</html>
