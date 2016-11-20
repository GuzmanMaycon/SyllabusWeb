<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <label>Semana ${semana.key}</label>
          </div>

          <div class="panel-body">
            <c:forEach var="registro" items="${semana.value}">
            <c:set var="tipoClase" value="${registro.key.descripcion}"/>
            <div class="col-xs-9">
              ${tipoClase}
            </div>
            <div class="col-xs-3">
              <c:if test="${!registro.value}">
              <a href="${basePath}/asignatura/${asignaturaAperturadaId}/semana/${semana.key}/${tipoClase}/avance">
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
        <div class="checkbox">
          <label>
            <input id="hay-tema-extra"
                   type="checkbox"
                   @click="hay_temas_extras = !(hay_temas_extras)">
            <span id="hay-tema-extra">¿Se ha dictado temas adicionales que no están en el syllabus?</span>
          </label>
        </div>
      </div>
    </div>

    <div class="row" v-show="hay_temas_extras">
      <ul>
        <li v-for="tema in temas_extras">{{ tema }}</li>
      </ul>
      <div class="col-xs-12">
        <div class="form-group">
          <input class="form-control"
                 type="text"
                 name="temas_extra[]"
                 v-model="nuevo_tema_extra"
                 placeholder="Ingrese el nuevo tema"
                 @keydown.enter.prevent="agregar_tema_extra()">
        </div>
      </div>
    </div>

    <div class="row">
      <div class="text-center">
        <a href="#" type="button" class="btn btn-default">Regresar</a>
        <button class="btn btn-primary">Guardar avance</button>
      </div>
    </div>

    </form>
  </div>

  <!-- Scripts -->
  <script src="${registrarAvanceJs}"></script>
</body>
</html>