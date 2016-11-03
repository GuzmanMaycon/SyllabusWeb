<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="/views/layout/admin-head.jsp" %>
<title>Listar Asignaturas ciclo</title>
</head>
<body>
	<div class="container">
		<c:if test="${not empty mensajeError}">
		<div class="alert alert-danger">
			<p>${mensajeError}</p>
		</div>
		</c:if>
		<c:if test="${not empty mensajeOk}">
		<div class="alert alert-success">
			<p>${mensajeOk}</p>
		</div>
		</c:if>
		<div class="row">
			<h2>Lista de Asignaturas del ciclo ${periodoActual}</h2>
		</div>
		
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Plan</th>					
						<th>Estado del Syllabus</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${lista}">
					<tr>						 
						<td>${row.nombre}</td>
						<td>${row.plan}</td>
						<td>${row.estado}</td>
					</tr>
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>