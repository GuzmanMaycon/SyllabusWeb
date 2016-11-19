<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="/views/layout/admin-head.jsp" %>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/layout/header.jsp" %>

	<%@ include file="/views/layout/admin-sidebar.jsp" %>

	<script>
		document.getElementById("consultar-avance-link").className += " item-sidebar-active";
	</script>
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
		  <div class="col-xs-12">
			<h2>Lista de Grupos del ciclo ${periodoActual}</h2>
		  </div>
		</div>
		
		<div class="row">
		  <div class="col-xs-12">
			<table class="table">
				<thead>
					<tr>
						<th>Nombre del Curso</th>
						<th>Grupo</th>					
						<th>Avance del Syllabus</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${lista}">
					<tr>						 
						<td>${row.asignaturaAperturada.asignatura.nombre}</td>
						<td class="text-center">${row.numero}</td>
						<td class="text-center">
							<c:if test="${esDocente}">
								<a href="${pageContext.request.contextPath}/asignatura/" class="btn btn-primary">Registrar Avance</a>
							</c:if>
							<c:if test="${esAlumno}">
								<a href="${pageContext.request.contextPath}/grupo/${row.id}/valida" class="btn btn-primary">Validar Avance</a>
							</c:if>
							<a href="${pageContext.request.contextPath}/grupo/${row.id}/syllabus/avance" class="btn btn-default">Ver Avance</a>
						</td>
					</tr>
					</c:forEach>				
				</tbody>
			</table>
		  </div>
		</div>
	</div>
</body>
</html>