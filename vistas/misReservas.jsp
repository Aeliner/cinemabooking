<%-- 
    Document   : misReservas
    Created on : 01/07/2019, 09:05:33 PM
    Author     : Nuevo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="reserv.Reservas"%>
<%@page import="java.util.List"%>
<%@page import="reserv.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../css/navi.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../css/tablaReservas.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <script src="../js/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/bf66789927.js"></script>
        <script src="../js/funcionesVarias.js"></script>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="keywords" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <title>Mis reservas</title>
    </head>
    <body>
        <% if(request.getSession().getAttribute("usuario") == null)
        {%>
            <jsp:forward page="login.jsp"/>
        <%}%>
        <div class="full">
            <jsp:include page="/templates/menuLateral.jsp" />
            <div class="main">
                <div class="header" >
                    <jsp:include page="/templates/head.jsp" />
                </div>
                <div class="container">
                    <div class="centrado">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">En espera</a></li>
                            <li><a data-toggle="tab" href="#menu1">Canceladas</a></li>
                            <li><a data-toggle="tab" href="#menu2">Pagas</a></li>
                            <li><a data-toggle="tab" href="#menu3">No pagas</a></li>
                        </ul>

                        <%  String correo = (String) session.getAttribute("usuario");
                            Usuario log = Persistencia.PersisUsu.getInstance().Traer_ClientexCorreo(correo);
                            if (log == null) {
                                log = Persistencia.PersisUsu.getInstance().TraerxCorreoEnc(correo);
                            }%>

                        <div class="tab-content">
                            <div id="home" class="tab-pane fade in active">
                                <% if (Persistencia.PersisReserv.getInstance().traerEnEspera(log.getCedula()).size() > 0) { %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th><h1>Pelicula</h1></th>
                                            <th><h1>Fecha</h1></th>
                                            <th><h1>Hora</h1></th>
                                            <th><h1>Sala</h1></th>
                                            <th colspan="2"><h1>Opciones</h1></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Reservas> res = Persistencia.PersisReserv.getInstance().traerEnEspera(log.getCedula());
                                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat formatH = new SimpleDateFormat("HH:mm");
                                            for (Reservas r : res) {
                                                String fechita = format.format(r.getFuncioncita().getFechaHora());
                                                String hora = formatH.format(r.getFuncioncita().getFechaHora());
                                        %>
                                        <tr>
                                            <td><%= r.getFuncioncita().getPelicula().getNombre()%></td>
                                            <td><%= fechita%></td>
                                            <td><%= hora%></td>
                                            <td><%= r.getFuncioncita().getSala().getId()%></td>
                                            <td class="iconoMod"><a href="/reservTest/TomarDatos?idFun=<%= r.getFuncioncita().getId() %>&idRes=<%= r.getId() %>"><span class="fa fa-pencil-square-o fa-2x"></span></a></td>	
                                            <td class="iconoCan"><a href="javascript:cancelarReserva(<%= r.getId() %>)"><span class="fa fa-trash fa-2x"></span></a></td>	
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <% } else { %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th colspan="5"><h1>No tienes reservas en este estado</h1></th>
                                        </tr>
                                    </thead>
                                </table>
                                <% }   %>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <%
                                    if (Persistencia.PersisReserv.getInstance().traerCanceladas(log.getCedula()).size() > 0) {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th><h1>Pelicula</h1></th>
                                            <th><h1>Fecha</h1></th>
                                            <th><h1>Hora</h1></th>
                                            <th><h1>Sala</h1></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Reservas> resc = Persistencia.PersisReserv.getInstance().traerCanceladas(log.getCedula());
                                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat formatH = new SimpleDateFormat("HH:mm");
                                            for (Reservas r : resc) {
                                                String fechita = format.format(r.getFuncioncita().getFechaHora());
                                                String hora = formatH.format(r.getFuncioncita().getFechaHora());
                                        %>
                                        <tr>
                                            <td><%= r.getFuncioncita().getPelicula().getNombre()%></td>
                                            <td><%= fechita%></td>
                                            <td><%= hora%></td>	
                                            <td><%= r.getFuncioncita().getSala().getId()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <%
                                } else {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th colspan="5"><h1>No tienes reservas en este estado</h1></th>
                                        </tr>
                                    </thead>
                                </table>
                                <%
                                    }
                                %>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <%
                                    if (Persistencia.PersisReserv.getInstance().traerPagas(log.getCedula()).size() > 0) {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th><h1>Pelicula</h1></th>
                                            <th><h1>Fecha</h1></th>
                                            <th><h1>Hora</h1></th>
                                            <th><h1>Sala</h1></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Reservas> resp = Persistencia.PersisReserv.getInstance().traerPagas(log.getCedula());
                                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat formatH = new SimpleDateFormat("HH:mm");
                                        for (Reservas r : resp) {
                                            String fechita = format.format(r.getFuncioncita().getFechaHora());
                                                String hora = formatH.format(r.getFuncioncita().getFechaHora());
                                        %>
                                        <tr>
                                            <td><%= r.getFuncioncita().getPelicula().getNombre()%></td>
                                            <td><%= fechita%></td>
                                            <td><%= hora%></td>	
                                            <td><%= r.getFuncioncita().getSala().getId()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <%
                                } else {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th colspan="5"><h1>No tienes reservas en este estado</h1></th>
                                        </tr>
                                    </thead>
                                </table>
                                <%
                                    }
                                %>
                            </div>
                            <div id="menu3" class="tab-pane fade">
                                <%
                                    if (Persistencia.PersisReserv.getInstance().traerNoPagas(log.getCedula()).size() > 0) {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th><h1>Pelicula</h1></th>
                                            <th><h1>Fecha</h1></th>
                                            <th><h1>Hora</h1></th>
                                            <th><h1>Sala</h1></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Reservas> resnp = Persistencia.PersisReserv.getInstance().traerNoPagas(log.getCedula());
                                           SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
                                            SimpleDateFormat formatH = new SimpleDateFormat("HH:mm");
                                        for (Reservas r : resnp) {
                                            String fechita = format.format(r.getFuncioncita().getFechaHora());
                                                String hora = formatH.format(r.getFuncioncita().getFechaHora());
                                        %>
                                        <tr>
                                            <td><%= r.getFuncioncita().getPelicula().getNombre()%></td>
                                            <td><%= fechita%></td>
                                            <td><%= hora%></td>	
                                            <td><%= r.getFuncioncita().getSala().getId()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <%
                                } else {
                                %>
                                <table class="listado">
                                    <thead>
                                        <tr>
                                            <th colspan="5"><h1>No tienes reservas en este estado</h1></th>
                                        </tr>
                                    </thead>
                                </table>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
