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
	<div class="container">
		<c:if test="${not empty mensajeOk}">
		<div class="alert alert-success">
			<p>${mensajeOk}</p>
		</div>
		</c:if>
		<div class="row">
			<h2>Lista de Grupos del ciclo ${periodoActual}</h2>
		</div>
		
		<div class="row">
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
						<td>${row.nombreCurso}</td>
						<td>${row.grupo}</td>
						<td>${row.avance}%</td>
					</tr>
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>