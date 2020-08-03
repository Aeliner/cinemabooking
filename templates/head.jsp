<%-- 
    Document   : head
    Created on : 04/06/2019, 10:28:44 PM
    Author     : Nuevo
--%>

<%@page import="reserv.Usuario"%>
<%@page import="reserv.Cliente"%>
<%@page import="reserv.Encargado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="top-header span_top">
    <div class="logo">
        <a href="index.jsp"><img src="<%=request.getContextPath()%>/imagenes/cineshoppingC2.png" alt="" /></a>
        <p>Reserva</p>
    </div>
    <div class="search v-search">
        <form>
            <input type="text" value="Buscar.." onfocus="this.value = '';" onblur="if (this.value == '') {
                        this.value = 'Buscar..';
                    }"/>
            <input type="submit" value="">
        </form>
    </div>
        <!--
        <button class="btn btn-info">Registrarse</button>
        <button class="btn btn-info">Iniciar sesion</button>
        -->
        <% if(session.getAttribute("usuario") == null) {%>
        <a href="http://localhost:8084/reservTest/vistas/login.jsp" class="btn btn-info">Iniciar sesion</a>
        <a href="http://localhost:8084/reservTest/vistas/registrarse.jsp" class="btn btn-info">Registrarse</a>
        <%}else{
            String logueado = (String) session.getAttribute("usuario");
        %>
        <a href="http://localhost:8084/reservTest/vistas/PerfilUsuario.jsp" class="btn btn-info">Mi cuenta</a>
        <a href="http://localhost:8084/reservTest/Cerrar_Sesion" class="btn btn-info">Cerrar sesion</a>
        <%}%>
    <div class="clearfix"></div>
        
</div>
