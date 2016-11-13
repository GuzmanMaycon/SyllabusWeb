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

	<%@ include file="/views/layout/coordinador-sidebar.jsp" %>

	<div class="content">
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
						<td>${row.asignatura.nombre}</td>
						<td>${row.asignatura.plan.nombre}</td>
						<td>${row.syllabus.estado}</td>
						<td>
						<c:choose>
						<c:when test='${row.syllabus.estado == "NO ENTREGADO"}'>
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/asignatura/${row.id}/syllabus/registrar">Entregar Syllabus</a>
						</c:when>
						<c:when test='${row.syllabus.estado == "ACEPTADO"}'>
							<i class="fa fa-check" aria-hidden="true"></i>
						</c:when>
						<c:otherwise>
							<a class="btn btn-default" >Editar Syllabus</a>
						</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>