<%-- 
    Document   : listado
    Created on : Jun 21, 2019, 9:47:41 PM
    Author     : Aeliner
--%>

<%@page import="reserv.Genero"%>
<%@page import="java.util.Base64"%>
<%@page import="Singletons.ctrlPeliFunc"%>
<%@page import="java.util.List"%>
<%@page import="reserv.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
                <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/navi.css" rel="stylesheet" type="text/css" media="all"/>
                <link href="../css/listado.css" rel="stylesheet" type="text/css"/>
         <script src="../js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="keywords" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'/>
        <title>Listado de Películas</title>
    </head>
    <body>
        <div class="full">
         <jsp:include page="/templates/menuLateral.jsp" />
          <div class="main">
         <div class="header" id="headersito">
                    <jsp:include page="/templates/head.jsp" />
                    </div>
                <% List<Pelicula> pelis = Persistencia.PersisPeliFunc.getInstance().getPeliculasActivas(); %>
                <% for (int i = 0; i < pelis.size(); i++) {
                Pelicula p = pelis.get(i);
                String base = "data:image/jpg;base64," + Base64.getEncoder().encodeToString(p.getImagen());%>
                <% String s = ""; for(Genero g : p.getGeneros()) { s+= g.getNombre()+", "; } s = s.substring(0,s.length()-2); %>
                <div id="movie-card-list">
	<div class="movie-card">
            
		<div class="color-overlay">
                    <img src="<%=base%>">
			<div class="movie-content">
				<div class="movie-header">
					<h1 class="movie-title"><%=p.getNombre()%></h1>
					<h4 class="movie-info"><%=s%></h4>
				</div>
				<p class="movie-desc"><%=p.getSinopsis()%></p>
				<a class="book" href="/reservTest/listadoServlet?t=<%=p.getNombre()%>"><i class="book1"></i>RESERVAR ENTRADAS</a>
			</div>
		</div>
	</div>
                <%}%>
                </div>
        </div>
        </div>
        
    </body>
</html>
