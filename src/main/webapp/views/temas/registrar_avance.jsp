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
	<div class="container">
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
						<td>1</td> 
						<td>${tema.semanaId}</td>
						<td>${tema.name}</td>
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