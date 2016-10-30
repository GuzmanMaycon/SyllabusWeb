<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="/views/layout/admin-head.jsp" %>
	
	<spring:url value="/resources/css/syllabus.css" var="syllabusCss" />	
	<spring:url value="/resources/js/syllabus.js" var="syllabusJs" />

	<link href="${syllabusCss}" rel="stylesheet">
	<title>Registrar Syllabus</title>
</head>
<body id="app">
	<div v-show="!see_preview">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="text-center">
	                <h1>Registrar Syllabus del curso de ${ course_name }</h1>
	            </div>
	        </div>
	    </div>
	    <div class="row" v-cloak>
	        <div class="col-lg-12">
	
	            <div class="col-sm-6 col-md-3 column">
	                <div class="row">
	                    <div class="text-center">
	                        <h3>Unidades</h3>
	                        <a class="btn btn-success" @click="add_unidad()" title="Agregar Unidad">
	                            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
	                        </a>
	                    </div>
	                </div>
	
	                <div class="row">
	                    <div class="text-center">
	                        <div id="unidades">
	                            <div class="clickable unidad"
	                                id="unidad_{{ unidad.id }}"
	                                v-for="unidad in unidades"
	                                @click="select_unidad(unidad)"
	                            >
	                                <p>
	                                    <span>{{ unidad.name }}</span>
	                                    <a type="button"
	                                       class="btn btn-danger float-right"
	                                       v-show="unidad_selected == unidad"
	                                       title="Eliminar"
	                                       @click="delete_unidad(unidad)"
	                                    >
	                                      <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                                    </a>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
	
	            <div class="col-sm-6 col-md-3 column" id="column-center">
	                <div class="row">
	                    <div class="text-center">
	                        <h3>Semanas</h3>
	                        <a class="btn btn-success" @click="add_semana()" v-show="unidad_selected.id" title="Agregar Semana">
	                            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
	                        </a>
	                    </div>
	                </div>
	
	                <div class="row">
	                    <div class="text-center">
	                        <h4><i>{{ unidad_selected.name }}</i></h4>
	                        <div id="semanas">
	                            <div class="clickable semana"
	                                 id="semana_{{ semana.id }}"
	                                 v-for="semana in semanasUnidadSeledted(unidad_selected)"
	                                 @click="select_semana(semana)"
	                            >
	                                <p>
	                                    <span>{{ semana.name }}</span>
	                                    <a type="button"
	                                       class="btn btn-danger float-right"
	                                       v-show="semana_selected == semana"
	                                       title="Eliminar"
	                                       @click="delete_semana(semana)"
	                                    >
	                                      <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                                    </a>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="col-sm-12 col-md-6 column">
	                <div class="row">
	                    <div class="text-center">
	                        <h3><i>{{ tema_title }}</i></h3>
	                        <div id="temas">
	                            <input v-model="edit_tema"
	                                   v-show="tema_selected.id"
	                                   class="input-text"
	                                   id="edit-tema"
	                                   data-id=""
	                                   @keyup.enter="actualizar_tema(tema_selected)">
	                            <input v-model="new_tema"
	                                   v-show="semana_selected.id && !(tema_selected.id)"
	                                   class="input-text"
	                                   placeholder="Ingrese el nuevo tema"
	                                   id="new-tema"
	                                   @keyup.enter="add_tema()">
	                            <a class="btn btn-success"
	                               v-show="semana_selected.id && !(tema_selected.id)"
	                               title="Agregar Tema"
	                               v-show="!tema_selected.id"
	                               @click="add_tema()"
	                               >
	                                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
	                            </a>
	                            <a class="btn btn-default"
	                               v-show="tema_selected.id"
	                               @click="actualizar_tema(tema_selected)">
	                               <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
	                            </a>
	                            <a class="btn btn-warning"
	                               v-show="tema_selected.id"
	                               @click="cancelar_actualizar()">
	                               <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
	                            </a>
	                            <div class="clickable tema"
	                                 id="tema_div_{{ tema.id }}"
	                                 v-for="tema in temasSemanaSelected(semana_selected)"
	                            >
	                                <p id="tema_{{ tema.id }}"
	                                   @click="add_binding(tema)" >
	                                    <span>{{ tema.name }}</span>
	                                    <a type="button"
	                                       class="btn btn-danger float-right"
	                                       v-show="tema_selected == tema"
	                                       title="Eliminar"
	                                       @click="delete_tema(tema)"
	                                    >
	                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                                    </a>
	                                </p>
	                            </div>
	                        </div>
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

	    <div class="row row-ref" v-cloak>
	        <div class="col-xs-12 col-sm-3 col-lg-3">
	            <div class="col-xs-3">
	                <div class="text-center">
	                    <label class="label-ref">Autor(es)</label>
	                </div>
	            </div>
	            <div class="col-xs-9">
	                <input class="input-ref" v-model="new_ref_autor" id="new_ref_autor" v-show="!(ref_selected.id)">
	                <input class="input-ref" v-model="edit_ref_autor" id="edit-ref-autor" data-id="" v-show="ref_selected.id">
	            </div>
	        </div>
	
	        <div class="col-xs-12 col-sm-3 col-lg-2">
	            <div class="col-xs-3">
	                <div class="text-center">
	                    <label class="label-ref">Año</label>
	                </div>
	            </div>
	            <div class="col-xs-9">
	                <input class="input-ref" v-model="new_ref_anio" id="new_ref_anio" v-show="!(ref_selected.id)">
	                <input class="input-ref" v-model="edit_ref_anio" id="edit-ref-anio" v-show="ref_selected.id">
	            </div>
	        </div>
	
	        <div class="col-xs-12 col-sm-4 col-lg-5">
	            <div class="col-xs-3">
	                <div class="text-center">
	                    <label class="label-ref">Título</label>
	                </div>
	            </div>
	            <div class="col-xs-9">
	                <input class="input-ref" v-model="new_ref_titulo" id="new_ref_titulo" v-show="!(ref_selected.id)">
	                <input class="input-ref" v-model="edit_ref_titulo" id="edit-ref-titulo" v-show="ref_selected.id">
	            </div>
	        </div>
	
	        <div class="col-xs-12 col-sm-2 col-lg-2">
	            <div class="text-center add-ref-container">
	                <a class="btn btn-success"
	                   @click="add_ref_bibliografica()"
	                   v-show="!(ref_selected.id)"
	                   title="Agregar Referencia Bibliografica">
	                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
	                </a>
	                <a class="btn btn-default"
	                   v-show="ref_selected.id"
	                   @click="actualizar_ref(ref_selected)">
	                   <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
	                </a>
	                <a class="btn btn-warning"
	                   v-show="ref_selected.id"
	                   @click="cancelar_actualizar_ref()">
	                   <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
	                </a>
	            </div>
	        </div>
	    </div>


	    <div class="row" v-cloak>
	        <div class="col-xs-12">
	            <table class="table">
	                <thead>
	                    <th>Autor(es)</th>
	                    <th>Año de publicación</th>
	                    <th>Título</th>
	                    <th></th>
	                </thead>
	                <tbody>
	                    <tr v-for="ref in ref_bibliografica"
	                        id="ref_{{ ref.id }}"
	                        class="clickable"
	                        @click="add_binding_ref(ref)">
	                        <td>{{ ref.author }}</td>
	                        <td>{{ ref.year }}</td>
	                        <td>{{ ref.title }}</td>
	                        <td>
	                            <a class="btn btn-danger"
	                               title="Eliminar"
	                               @click="delete_ref_bibliografica(ref)">
	                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	                            </a>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
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
	    <div class="row">
	        <div class="col-lg-12" id="app">
	            <div class="text-center">
	                <h1>Previsualizar syllabus del curso de Programacion I</h1>
	            </div>
	        </div>
	    </div>
	    <div class="row preview" >
	        <div class="col-sm-6">
	            <div v-for="unidad in unidades">
	                <h2>{{ unidad.name }}</h2>
	                <div class="col-sm-offset-1" v-for="semana in semanasUnidadSeledted(unidad)">
	                    <h3>{{ semana.name }}</h3>
	                    <div class="col-sm-offset-1" v-for="tema in temasSemanaSelected(semana)">
	                        <h4>{{ tema.name }}</h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-xs-12">
	            <h3>Referencia Bibliografica</h3>
	        </div>
	    </div>
	    <div class="row preview">
	        <div class="col-sm-6">
	            <ul v-for="ref in ref_bibliografica">
	                <li>{{ ref.title }}, {{ ref.author }}- {{ ref.year }}</li>
	            </ul>
	        </div>
	    </div>
	    <div class="row">
	        <div class="text-center">
	            <a class="btn btn-default" @click="see_preview = false">Cancelar previsualizacion</a>            
	            <button class="btn btn-primary">Guardar Syllabus</button>
	        </div>
	    </div>
	    </form>
	</div>

	<div class="footer" style="height: 25px;" v-cloak>
	</div>

    <!-- Scripts -->
    <script src="${syllabusJs}"></script>    
</body>
</html>