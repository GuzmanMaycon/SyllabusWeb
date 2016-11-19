<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="/views/layout/admin-head.jsp" %>
	<spring:url value="/resources/css/coordinador.css" var="coordinadorCss" />
	<link href="${coordinadorCss}" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/layout/header.jsp" %>

	<%@ include file="/views/layout/sidebar.jsp" %>

	<script>
		document.getElementById("coordinador-asignar").className += " item-sidebar-active";
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
		  <div class="col-xs-12 col-md-12">
			<h2>Asignar Coordinador de Curso ${periodoActual}</h2>
		  </div>
		</div>
		<div class="row">
		  <div class="col-md-4" style="padding-top: 1%;">
		    <div class="input-group">
		      <input type="text" class="form-control" placeholder="Buscar curso">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button">
		        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		        </button>
		      </span>
		    </div>
		  </div>
		</div>
		
		<div class="row">
		  <div class="col-xs-12 col-sm-12 col-md-12" style="padding-top: 2%;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Nombre del Curso</th>
						<th>Plan</th>
						<th>Coordinador</th>						
						<th>Estado del Syllabus</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${lista}">
					<tr>						 
						<td>${row.asignaturaAperturada.asignatura.nombre}</td>
						<td>${row.numero}</td>
						<td>
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
					<tr>
						<th>Arquitectura de Computadoras</th>
						<th class="text-center">2016</th>
						<th class="text-center">Juan Gonzales</th>						
						<th class="text-center">Entregado</th>						
					</tr>
					<tr>
						<th>Arquitectura de Software</th>
						<th class="text-center">2009</th>
						<th class="text-center">Pablo Villanueva</th>						
						<th class="text-center">No Entregado</th>						
					</tr>
					<tr>
						<th>GTI</th>
						<th class="text-center">2009</th>
						<th class="text-center"></th>						
						<th class="text-center">No Entregado</th>						
					</tr>	
					<tr>
						<th>Idioma Extranjero II</th>
						<th class="text-center">2009</th>
						<th class="text-center">Miguel García</th>						
						<th class="text-center">Entregado</th>						
					</tr>
					<tr>
						<th>Idioma Extranjero IV</th>
						<th class="text-center">2009</th>
						<th class="text-center">Merby Butrón</th>						
						<th class="text-center">Rechazado</th>						
					</tr>
							
				</tbody>
			</table>
			<div class="text-center">
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAsignarCoordinador" data-whatever="GTI">
			Asignar Coordinador<span style="padding-left: 10px;" class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
			</div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="modalAsignarCoordinador" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">Asignar Coordinador para</h4>
		      </div>
		      <div class="modal-body">
				<div class="row">
				  <div class="col-md-6" style="padding-top: 1%;padding-bottom: 2%">
				    <div class="input-group">
				      <input type="text" class="form-control" placeholder="Buscar coordinador">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button">
				        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				        </button>
				      </span>
				    </div>
				  </div>
				</div>
		        <table class="table table-striped">
				<thead>
					<tr>
						<th class="text-center">Nombre</th>
						<th class="text-center">Grado Académico</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="text-center">Carlos Alcántara</th>
						<th class="text-center">Magister</th>					
					</tr>
					<tr>
						<th class="text-center">Pedro Pablo</th>
						<th class="text-center">Doctor</th>						
					</tr>
					<tr>
						<th class="text-center">Juan Chávez</th>
						<th class="text-center">Licenciado</th>						
					</tr>	
					<tr>
						<th class="text-center">Gustavo Bueno</th>
						<th class="text-center">Magister</th>					
					</tr>
					<tr>
						<th class="text-center">Sergio Palma</th>
						<th class="text-center">Licenciado</th>						
					</tr>		
				</tbody>
			</table>
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary">Asignar</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
</body>
<script>
$('#modalAsignarCoordinador').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Asignar Coordinador para ' + recipient)
	  modal.find('.modal-body textarea').val(recipient)
	})
</script>
</html>