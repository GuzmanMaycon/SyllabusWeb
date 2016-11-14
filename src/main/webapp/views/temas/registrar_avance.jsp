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

	<%@ include file="/views/layout/docente-sidebar.jsp" %>

	<div class="content">
		<c:if test="${not empty mensajeError}">
		<div class="alert alert-danger">
			<p>${mensajeError}</p>
		</div>
		</c:if>
		<form method="POST">
		<div class="row">
			<h2>Registro de avance del Curso de ${ course_name }</h2>
		</div>

		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>Unidad</th>
						<th>Semana</th>
						<th>Descripcion del tema</th>
						<th>Cumplido</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tema" items="${temaList}">
					<tr>
						<td>${tema.unidad}</td>
						<td>${tema.semana}</td>
						<td>${tema.descripcion}</td>
						<td>
							<div class="checkbox">
								<label>
									<input id="tema_${tema.id}"
										   type="checkbox"
										   value="${tema.id}"
										   name="temas[]"
										   data-cumplido="0"
										   @click="select_tema(${tema.id})"><span id="span_${tema.id}">No</span>
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