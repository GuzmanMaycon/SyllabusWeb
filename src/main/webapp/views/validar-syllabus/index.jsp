<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="/views/layout/admin-head.jsp" %>
	<spring:url value="/resources/css/admin.css" var="adminCss" />
	<spring:url value="/resources/css/coordinador.css" var="coordinadorCss" />
	<link href="${coordinadorCss}" rel="stylesheet">
	<link href="${adminCss}" rel="stylesheet">
	<title>Validar Syllabus</title>
</head>
<body>

	<%@ include file="/views/layout/header.jsp" %>

	<%@ include file="/views/layout/admin-sidebar.jsp" %>

	<script>
		document.getElementById("validar-syllabus").className += " item-sidebar-active";
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
		<div class="panel panel-info">
			<div class="panel-heading">
			    <h3 class="panel-title">Mejore su búsqueda</h3>
			 </div>
			 <div class="panel-body">
			  	<div class="col-md-6">
			  		<div style="display: inline-block">
				  		Escuela Académica:
				  	</div>
					<div style="display: inline-block;padding-left: 10px;">
						<form class="form-inline">
						   <div class="input-group">
						      <select id="lunch" class="selectpicker form-control">
						         <option>Seleccione EAP</option>
						         <option>Ingeniería de Sistemas</option>
						         <option>Ingeniería de Software</option>
						       </select>
						    </div>
						 </form>
					</div>
			  	</div>
			  	<div class="col-md-6">
			  		<div style="display: inline-block">
				  		Curso:
				  	</div>
					<div style="display: inline-block;padding-left: 10px;">
						<form class="form-inline">
						   <div class="input-group">
						      <select id="lunch" class="selectpicker form-control">
						         <option>Seleccione curso</option>
						         <option>Introducción a la Programación</option>
						         <option>Física I</option>
						         <option>Física II</option>
						         <option>Modelamiento y Requisitos de Software</option>
						         <option>Idioma Extranjero IV</option>
						       </select>
						    </div>
						 </form>
					</div>
			  	</div>
			  	<div class="col-md-12 text-center" style="padding: 1%;">
			  		<button type="button" class="btn btn-primary" style="margin-right: 1%;">Buscar</button>
		        	<button type="button" class="btn btn-danger" style="margin-left: 1%;">Borrar Filtros<span style="padding-left: 10px;" class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
			  	</div>
			 </div>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading">
			    <h3 class="panel-title">Resultados</h3>
			 </div>
			 <div class="panel-body">
			 <div class="col-xs-12 col-sm-12 col-md-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Estado</th>
						<th>Ciclo de Estudio</th>
						<th>Nombre de Asignatura</th>						
						<th>Plan Académico</th>
						<th>Fecha de Publicación</th>
						<th>EAP</th>												
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
					<tr class="clickable-row">
						<th class="text-center">Vigente</th>
						<th class="text-center">Noveno</th>
						<th class="text-center">Sistemas Inteligentes</th>						
						<th class="text-center">2009</th>	
						<th class="text-center">20/11/2016</th>	
						<th class="text-center">Software</th>						
					</tr>
					<tr class="clickable-row">
						<th class="text-center">En espera</th>
						<th class="text-center">Décimo</th>
						<th class="text-center">Auditoría</th>						
						<th class="text-center">2009</th>	
						<th class="text-center">10/08/2016</th>	
						<th class="text-center">Sistemas</th>						
					</tr>
					<tr class="clickable-row">
						<th class="text-center">En espera</th>
						<th class="text-center">Octavo</th>
						<th class="text-center">E-Business</th>						
						<th class="text-center">2009</th>	
						<th class="text-center">10/08/2016</th>	
						<th class="text-center">Software</th>						
					</tr>	
				</tbody>
			</table>
			 </div>
			 <div class="text-center">
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAsignarCoordinador" data-whatever="GTI">
			Asignar Coordinador<span style="padding-left: 10px;" class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
			</div>
		</div>
		
		<div class="row">
		  
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