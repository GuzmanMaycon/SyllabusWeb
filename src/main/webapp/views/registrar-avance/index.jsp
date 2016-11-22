<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <%@ include file="/views/layout/admin-head.jsp" %>

  <spring:url value="/resources/js/temas/registrar_avance.js" var="registrarAvanceJs" />
  <style>
    .table > tbody > tr > td {
      vertical-align: middle;
  }
  </style>
  <title>Registrar Avance de Syllabus</title>
</head>
<body id="app">
  <%@ include file="/views/layout/header.jsp" %>

  <%@ include file="/views/layout/sidebar.jsp" %>

  <script>
    document.getElementById("registrar-avance-link").className += " item-sidebar-active";
  </script>

  <div class="content">
    <c:if test="${not empty mensajeError}">
    <div class="alert alert-danger">
      <p>${mensajeError}</p>
    </div>
    </c:if>

    <form method="POST">
    <div class="row">
      <h2>Registro de avance del Curso de ${ nombreAsignatura }</h2>
    </div>

    <div class="row">
      <c:forEach var="semana" items="${semanas}">
      <div class="col-sm-6 col-md-4 col-md-offset-1 col-lg-4">
        <div class="panel panel-info">
          <div class="panel-heading">
            <c:set var="fecha" value="${semanasFecha[semana.key]}"/>
            <label>Semana ${semana.key} - <fmt:formatDate pattern="dd-MM-yyyy" value="${fecha}" /></label>
          </div>

          <div class="panel-body">
            <c:forEach var="registro" items="${semana.value}">
            <c:set var="tipoClase" value="${registro.key.tipo.descripcion}"/>
            <div class="col-xs-9">
              ${tipoClase}
            </div>
            <div class="col-xs-3">
              <c:if test="${!registro.value}">
              <a href="${basePath}/grupo/${grupoId}/semana/${semana.key}/${tipoClase}/avance">
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
              </a>
              </c:if>
              <c:if test="${registro.value}">
                <i class="fa fa-check" aria-hidden="true"></i>
              </c:if>
            </div>
            </c:forEach>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>

    <div class="row">
      <div class="text-center">
        <a href="${basePath}/grupos/index" type="button" class="btn btn-default">Regresar</a>
      </div>
    </div>

    </form>
  </div>

</body>
</html>