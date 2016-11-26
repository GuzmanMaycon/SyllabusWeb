<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <%@ include file="/views/layout/admin-head.jsp" %>

  <spring:url value="/resources/js/temas/registrar_avance.js" var="registrarAvanceJs" />
  <title>Insert title here</title>
</head>
<body>
  <%@ include file="/views/layout/header.jsp" %>

  <%@ include file="/views/layout/sidebar.jsp" %>

  <script>
    document.getElementById("registrar-avance-link").className += " item-sidebar-active";
  </script>

	<div class="content" id="app">
    <c:if test="${not empty mensajeError}">
    <div class="alert alert-danger">
      <p>${mensajeError}</p>
    </div>
    </c:if>
    <form method="POST" id="avanceForm" v-on:submit.prevent="onSubmit()">
    <div class="row">
      <h2>Registro de avance del Curso de ${ nombreAsignatura }</h2>
    </div>

    <div class="row">
      <table class="table">
        <thead>
          <tr>
            <th>Descripcion del tema</th>
            <th>Cumplido</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="tema" items="${temas}">
          <tr>
            <td>${ tema.descripcion }</td>
            <td>
              <div class="checkbox">
                <label>
                  <input id="tema_${tema.id}"
                       type="checkbox"
                       value="${tema.id}"
                       name="temas[]"
                       data-cumplido="0"
                       @click="selectTema(${tema.id})"><span id="span_${tema.id}">No</span>
                </label>
              </div>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="row">
      <div class="text-center">
        <a href="${basePath}/grupo/${grupoId}/valida" type="button" class="btn btn-default">Regresar</a>
        <button type="submit" class="btn btn-primary">Validar avance</button>
      </div>
    </div>

    </form>
  </div>
 
  <!-- Scripts -->
  <script src="${registrarAvanceJs}"></script>
 
</html>