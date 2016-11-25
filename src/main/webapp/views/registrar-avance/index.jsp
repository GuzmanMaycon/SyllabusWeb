<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      <c:forEach var="registro" items="${registros}">
      <c:set var="sesion" value="${registro.key}" />
      <c:set var="tipoClase" value="${fn:toLowerCase(sesion.clase.tipo.descripcion)}" />
      <div class="col-sm-6 col-md-4 col-md-offset-1 col-lg-4">
        <div class="panel panel-info">
          <div class="panel-heading">
            <label class="text-capitalize">${tipoClase} - <fmt:formatDate pattern="dd/MM/yyyy" value="${sesion.fecha}" /></label>
          </div>

          <div class="panel-body">
            <div class="text-center">
              <c:choose>
                <c:when test="${registro.value}">
                <a class="btn disabled">
                  <i class="fa fa-check fa-fw" aria-hidden="true"></i>&nbsp;<span>Entregado</span>
                </a>
                </c:when>
                <c:otherwise>
                <a class="btn" href="${basePath}/grupo/${grupoId}/sesion/${sesion.id}/avance">
                  <i class="fa fa-pencil-square-o fa-fw" aria-hidden="true"></i>&nbsp;<span>Por Entregar</span>
                </a>
                </c:otherwise>
              </c:choose>
            </div>
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