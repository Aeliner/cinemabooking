<%-- 
    Document   : InfoPeli
    Created on : Jun 24, 2019, 5:27:47 PM
    Author     : Aeliner
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="reserv.Funcion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Base64"%>
<%@page import="reserv.Genero"%>
<%@page import="reserv.Pelicula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="<%=request.getContextPath()%>/js/jquery3.3.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/yui.js"></script>
        
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/css/detalle.css" rel='stylesheet' type='text/css'/>
    </head>
    <style>
.yui3-button {
    margin:10px 0px 10px 0px;
    color: #fff;
    background-color: #3476b7;
}
</style>

    
    <body>
        <% if(request.getSession().getAttribute("usuario") == null)
        {%>
            <jsp:forward page="login.jsp"/>
        <%}%>
        <div class="full">
         <jsp:include page="/templates/menuLateral.jsp" />
          <div class="main">
         <div class="header" id="headersito">
                    <jsp:include page="/templates/head.jsp" />
                    </div>
        <div class="movie-card">
            <% Pelicula p = (Pelicula) request.getSession().getAttribute("peli"); %>
            <% if (p == null){%>
                <jsp:forward page="index.jsp"/>
            <%}%>
            <%String base = "data:image/jpg;base64," + Base64.getEncoder().encodeToString(p.getImagen());%>
            <%if (p != null) {%>
            <script>
                var peli = "<%=p.getNombre()%>";

                $('#poster').html('<div class="alert"><strong>Cargando...</strong></div>');

                $.getJSON("https://api.themoviedb.org/3/search/movie?api_key=15d2ea6d0dc1d476efbca3eba2b9bbfb&query=" + peli + "&callback=?", function (json) {
                    if (json !== "Nothing found.") {
                       
                        $('#poster').append('<a id="aImg"><img src=\"http://image.tmdb.org/t/p/w500/' + json.results[0].poster_path + '\" class="cover"></a>');
                         $('#poster').append('<div class="title1"> <%=p.getNombre()%> <span class="restriction"><%= p.getRestriccionEdad().getNombre()%></span></div>');
                    } else {
                    }
                });
            </script>
            <%}%>


            <div class="container">

                <div id="poster">

                </div> <!-- poster --> 
                 
                
                    <img src="<%=base%>" class="portada">
                    <div class="details"> 
                        <!--titulo-->          
                    </div>      <!-- sinopsis-->
                <div class="description"> <!-- sinopsis y generitos --> 
                    


                    <div class="column2"> <!-- sinopsis-->
                        <p><%=p.getSinopsis()%></p>
                    </div>
                </div>
                    <div class="column1"> <!-- generitos-->
                        <%for (Genero gg : p.getGeneros()) {%>
                        <span class="tag"><%=gg.getNombre()%></span>
                        <%}%>
                    </div>
                    <a class="video" id="trailersito"><i class="video1"></i>VER TRAILER</a>
                    <div class="trailer" id="divTrailer">
                        <% String s = "https://www.youtube.com/embed/"+p.getLink().split("=")[1]; %>
                        <iframe src="<%=s%>"> </iframe>
                    </div>
                <div id="demo" class="yui3-skin-sam yui3-g"> <!-- You need this skin class -->

  <div id="leftcolumn" class="yui3-u">
     <!-- Container for the calendar -->
     <div id="mycalendar"></div>
  </div>
  <div id="rightcolumn" class="yui3-u">
   <div id="links" style="padding-left:20px;">
      Selected date: <span id="selecteddate"></span>
   </div>
  </div>
</div>
            </div>
        </div>
        <script type="text/javascript">
YUI({lang: "es"}).use('calendar', 'datatype-date', 'cssbutton',  function(Y) {
    console.log(new Date());
    var d = new Date(<%=p.getFechaInic().getTime()%>);
    var d2 = new Date(<%=p.getFechaFin().getTime()%>);
    var calendar = new Y.Calendar({
      contentBox: "#mycalendar",
      width:'340px',
      margin:'0 auto',
      showPrevMonth: true,
      showNextMonth: true,
      minimumDate: d,
      maximumDate: d2,
      date: d}).render();
    var dtdate = Y.DataType.Date;
    calendar.on("selectionChange", function (ev) {
      var newDate = ev.newSelection[0];
      var date = dtdate.format(newDate);
      $.ajax({
            type: "POST",
            url: "/reservTest/infoPeli",
            data:{fecha:date, peli:"<%=p.getNombre()%>"},
            dataType: "text",
            success : function(data){
                var data2 = JSON.parse(data);
                var myNode = document.getElementById("rightcolumn");
                while (myNode.firstChild) {
                myNode.removeChild(myNode.firstChild);
}
                if(data2.length > 0)
                {
                for(var i = 0; i < data2.length; i++) {
                var obj = data2[i];
                var divFunc = document.createElement("div");
                divFunc.setAttribute("id", obj.id);
                divFunc.classList.add("divFuncion");
                var DD = "2D";
                if(obj.tresD)
                {
                    DD = "3D";
                }
                var textito = document.createTextNode("Sala "+obj.sala + " " + obj.fecha + " " + DD + " " + obj.idioma);
                divFunc.appendChild(textito);
                document.getElementById("rightcolumn").appendChild(divFunc);
}   
                agregarListeners();
}   
else
{
    var divNoFunc = document.createElement("div");
    divNoFunc.setAttribute("id", "noFunc");
    divNoFunc.classList.add("divNoFuncion");
    var textito = document.createTextNode("No hay funciones disponibles para esta fecha");
    divNoFunc.appendChild(textito);
    document.getElementById("rightcolumn").appendChild(divNoFunc);
}
            },
            error : function(data){
                
            }
        });
    });
});
        </script>
        <script src="<%=request.getContextPath()%>/js/detalle.js"></script>
          </div>
        </div>
    </body>
</html>
