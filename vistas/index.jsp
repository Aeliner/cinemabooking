<%-- 
    Document   : index
    Created on : 04/06/2019, 10:25:04 PM
    Author     : Nuevo
--%>

<%@page import="java.util.Base64"%>
<%@page import="reserv.Genero"%>
<%@page import="java.util.List"%>
<%@page import="reserv.Pelicula"%>
<%@page import="Singletons.ctrlPeliFunc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../css/navi.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <script src="../js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="keywords" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <title>Inicio</title>
    </head>
    <body>
        <div class="full">
            <jsp:include page="/templates/menuLateral.jsp" />
            <div class="main">
                <div class="header" id="headersito">
                    <jsp:include page="/templates/head.jsp" />
                    <% List<Pelicula> pe = Persistencia.PersisPeliFunc.getInstance().PelisMasReservadas(); %>
                    <% if(pe.size() > 0 )
                    {
                        String base = "data:image/jpg;base64,"+Base64.getEncoder().encodeToString(pe.get(0).getImagen());
                    %>
                    <img src="<%=base%>">
                    <%}%>
                    <div class ="header-info">
                        <h1><%= pe.get(0).getNombre() %></h1>
                        <p class="age">
                            <a> 100 </a>
                        </p>
                        <p class="review reviewgo">
                            <% String s = ""; for(Genero g : pe.get(0).getGeneros()) { s+= g.getNombre()+", "; } s = s.substring(0,s.length()-2); %>
                            Géneros: <%=s%> 
                        </p>
                        <p class="review">
                            Año:
                        </p>
                        <p class="special">
                            Sinopsis: <%= pe.get(0).getSinopsis() %>
                        </p>
                        
                        <a class="book" href="#"><i class="book1"></i>RESERVAR</a>
                    </div>
                </div>
                <div class="accordion">
                <ul>
                    <% for(int i = 1; i < pe.size(); i++)
                    { String f = "data:image/png;base64,"+Base64.getEncoder().encodeToString(pe.get(i).getImagen()); %>
                        <li>
			<div class="image_title">
                            <a href="#"><%=pe.get(i).getNombre() %></a>
			</div>
			<a href="#"><img src="<%=f%>" alt="xD" border="0"></a>
                        </li>
                    <%}%>
		
                </ul>
                <jsp:include page="/templates/footer.jsp" />
                
            </div>
        </div>
        </div>
    </body>
</html>
