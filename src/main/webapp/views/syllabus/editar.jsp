<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <%@ include file="/views/layout/admin-head.jsp" %>

  <spring:url value="/resources/css/syllabus.css" var="syllabusCss" />
  <spring:url value="/resources/js/syllabus/create.js" var="syllabusJs" />

  <link href="${syllabusCss}" rel="stylesheet">
  <title>Registrar Syllabus</title>
</head>
<body id="app">
  <%@ include file="/views/layout/header.jsp" %>

  <%@ include file="/views/layout/sidebar.jsp" %>

  <div class="content">
  <div v-show="!see_preview">
    <div class="row">
    <div class="col-xs-12">
      <div class="text-center">
      <h1>Editar Syllabus del curso de ${ nombreAsignatura }</h1>
      </div>
    </div>
    </div>
    <div class="row" v-cloak>
    <div class="col-xs-12">
      <script>
      window.unidades = [];
      window.semanas = [];
      window.temas = [];
      window.bibliografia = [];
      window.lastUnidadId = 0;
      window.lastSemanaId = 0;
      window.lastTemaId = 0;
      window.lastRefId = 0;
      </script>

      <c:forEach var="unidad" items="${unidades}">
      <script>
      window.unidades.push({
         id: ++window.lastUnidadId,
         number: (window.unidades.length + 1),
      });
      </script>
      <c:forEach var="semana" items="${unidad.value}">
      <script>
      window.semanas.push({
         id: ++window.lastSemanaId,
         number: (window.semanas.length + 1),
         unidadId: "${unidad.key}"
      });
      </script>
      </c:forEach>
      </c:forEach>

      <c:forEach var="tema" items="${syllabus.temas}">
      <script>
      window.temas.push({
        id: (++window.lastTemaId)+"",
        name: "${tema.descripcion}",
        semanaId: "${tema.semana}",
        semana: "${tema.semana}",
        unidad: "${tema.unidad}",
        tipoId: "${tema.tipoId}"
      });
      </script>
      </c:forEach>

      <c:forEach var="libro" items="${syllabus.bibliografia}">
      <script>
      window.bibliografia.push({
        id: (++window.lastRefId)+"",
        author: "${libro.autor}",
        year: "${libro.anioPublicacion}",
        title: "${libro.titulo}",
        editorial: "${libro.editorial}",
        isbn: "${libro.isbn}",
        lugar: "${libro.lugarPublicacion}"
      });
      </script>
      </c:forEach>

      <div class="col-sm-6 col-md-3 column">
      <div class="row">
        <div class="text-center">
        <h3>Unidades</h3>
        <a class="btn btn-success" @click="addUnidad()" title="Agregar Unidad">
          <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
        </a>
        </div>
      </div>

      <div class="row">
        <div class="text-center">
        <%@ include file="/views/syllabus/unidades_syllabus.jsp" %>
        </div>
      </div>

      </div>

      <div class="col-sm-6 col-md-3 column" id="column-center">
      <div class="row">
        <div class="text-center">
        <h3>Semanas</h3>
        <a class="btn btn-success" @click="addSemana()" v-show="unidadSelected.id" title="Agregar Semana">
          <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
        </a>
        </div>
      </div>

      <div class="row">
        <div class="text-center">
        <%@ include file="/views/syllabus/semanas_syllabus.jsp" %>
        </div>
      </div>
      </div>

      <div class="col-sm-12 col-md-6 column">
      <div class="row">
        <div class="text-center">
        <%@ include file="/views/syllabus/temas_syllabus.jsp" %>
        </div>
      </div>
      </div>

    </div>
    </div>

    <div class="row">
    <div class="col-xs-12">
      <hr>
    </div>
    </div>

    <div class="row" v-cloak>
    <div class="col-xs-12">
      <div class="text-center">
      <h3>Referencia Bibliografica</h3>
      </div>
    </div>
    </div>

    <%@ include file="/views/syllabus/bibliografia_form.jsp" %>

    <div class="row" v-cloak>
    <div class="col-xs-12">
      <%@ include file="/views/syllabus/bibliografia_table.jsp" %>
    </div>
    </div>

    <div class="row" v-cloak>
    <div class="text-center">
      <a class="btn btn-primary" @click="see_preview = true">Previsualizar</a>
    </div>
    </div>
  </div>
  <div v-show="see_preview" v-cloak>
    <form class="form" method="POST" id="syllabusForm" v-on:submit.prevent="onSubmit()">
    <%@ include file="/views/syllabus/previsualizar_syllabus.jsp" %>
    </form>
  </div>
  </div>

  <div class="footer" style="height: 25px;" v-cloak>
  </div>
  <!-- Scripts -->
  <script src="${syllabusJs}"></script>
</body>
</html>