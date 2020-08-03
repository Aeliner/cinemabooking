<%-- 
    Document   : PerfilUsuario
    Created on : 28/06/2019, 18:37:40
    Author     : matheo
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reserv.Usuario"%>
<%@page import="reserv.Cliente"%>
<%@page import="reserv.Encargado"%>
<%@page import="Singletons.IUsuario"%>
<%@page import="Singletons.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
        <title>Informacion personal</title>
        <%
            boolean Esta_logueado = false;
            if (session.getAttribute("usuario") == null) {
                String redirectURL = "http://localhost:8084/reservTest/vistas/index.jsp";
                response.sendRedirect(redirectURL);
            } else {
                Esta_logueado = true;
            }
        %>

    </head>
    <body>
        <div class="full">
            <jsp:include page="/templates/menuLateral.jsp" />
            <div class="main">
                <div class="header" style="min-height: 60px;">
                    <jsp:include page="/templates/head.jsp" />
                </div>
                <div class="main-contact">
                    <%  if (Esta_logueado) {
                            String mail = session.getAttribute("usuario").toString();
                            IUsuario IU = Fabrica.getInstance().getCtrlUsuario();
                            Usuario usuario = null;
                            if (request.getSession().getAttribute("tipo") == "encargado") {
                                usuario = IU.traerEncCorreo(mail);
                            } else {
                                usuario = IU.Trear_Cliente_Mail(mail);
                            }
                                System.out.print("MAIL->"+mail);
                                Date date = usuario.getFechaNac();
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
                                String strDate = dateFormat.format(date);  
                                //Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(strDate);
                           
                    %>  
                    <div class="wrapper fadeInDown ">
                        <h1 id="titulo" class="fadeIn first"></h1>
                    </div>
                    <div class="container">
                        <div class="center">Informacion personal</div>
                    </div>
                    <div class="contact-form">

                        <div class="col-md-6 contact-left">
                            <div class="wrapper fadeInDown">
                                <div id="formContent">
                                    <form  id="mi" class="mi" action="http://localhost:8084/reservTest/ModificarUsuario" method="POST" onsubmit="return ValidarDatos();">
                                        <div class="fadeIn first">
                                            <h1>Datos basicos</h1>
                                        </div>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"> Nombre</i></span>
                                        <input type="text" placeholder="Nombre" required name="nombre" value='<%=usuario.getNombre()%>'/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"> Apellido</i></span>
                                        <input type="text" placeholder="Apellido" required name="apellido" value='<%=usuario.getApellido()%>'/>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"> Mail</i></span>
                                        <div display='none' class="alert alert-danger" role="alert" id="Error_mail" name="Error_mail">
                                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                            <span class="sr-only">Error:</span>
                                            Mail ya utilizado.
                                        </div>
                                        <input type="email" class="fadeIn second" name="mail" id="mail" placeholder="Mail" required value='<%=usuario.getCorreo()%>'>
                                        <span type="text" name="mail_original" id="mail_original" ><%=usuario.getCorreo()%></span>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"> Fecha de nacimiento</i></span>
                                        <input type="date" id="login" class="fadeIn second" placeholder="Fecha de nacimiento" name="fecha" required value='<%=strDate%>'>
                                        <div class="col-md-6" style=" float: right;">
                                            <input type="submit" value="Guardar"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 contact-left">
                            <div class="wrapper fadeInDown">
                                <div id="formContent">
                                    <form  id="mi2" class="mi" action="http://localhost:8084/reservTest/CambioClave" method="POST" onsubmit="return validaFormCont();">
                                        <div class="fadeIn first">
                                            <h1>Cambiar clave</h1>
                                        </div>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"> Clave-actual</i></span>
                                        <div display='none' class="alert alert-danger" role="alert" id="Error_clave_p" name="Error_clave_p">
                                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                            <span class="sr-only" id="Er_clave_p">Error:</span>
                                            La clave no coincide
                                        </div>
                                        <input type="password" name="claveAc" id="ci_actal" class="fadeIn third" placeholder="Clave Actual" required>

                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"> Clave</i></span>
                                        <div display='none' class="alert alert-danger" role="alert" id="Error_clave" name="Error_clave">
                                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                            <span class="sr-only" id="Er_clave">Error:</span>
                                            Claves no coinciden.
                                        </div>
                                        <input class="mi" type="password" name="clave" id="ci_a" class="fadeIn third" placeholder="Clave" required> 
                                        <input type="password" name="clavedos" id="ci_b" class="fadeIn third"  placeholder="Repetir Clave" required>
                                        <div class="col-md-6" style=" float: right;">
                                            <input type="submit" value="Cambiar"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <script src="../js/usuarioperfil.js" type="text/javascript"></script>
    </body>
</body>
</html>
