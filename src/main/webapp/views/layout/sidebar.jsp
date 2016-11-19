<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar-default sidebar" role="navigation">
    <div class="navbar-collapse collapse">
    <ul class="nav in">
    	<sec:authentication property="principal.authorities" var="authorities" />
    	<li>
            <a class="sidebar-link" href="${basePath}/grupos/index">
                Inicio
            </a>
        </li>
    	<c:forEach items="${authorities}" var="authority" varStatus="vs">
    	<%-- INICIO ROLE ADMIN --%>
		<c:if test="${ authority.authority == 'ROLE_ADMIN' }">
        <li>
            <a class="sidebar-link" href="${basePath}/coordinador-asignar/index" id="coordinador-asignar">
                Asignar Coordinador
            </a>
        </li>
        <li>
            <a class="sidebar-link" href="${basePath}/validar-syllabus/index" id="validar-syllabus">
                Validar Syllabus
            </a>
        </li>
        <li>
            <a class="sidebar-link" href="${basePath}/grupos/index" id="consultar-avance-link">
                Consultar avance de Syllabus
            </a>
        </li>
        </c:if>
        <%-- FIN ROLE ADMIN --%>

        <%-- FIN ROLE ALUMNO --%>
        <c:if test="${ authority.authority == 'ROLE_ALUMNO' }">
        <li>
            <a class="sidebar-link" href="${basePath}/grupos/index">
                Validar avance
            </a>
        </li>
        </c:if>
        <%-- FIN ROLE ALUMNO --%>

        <%-- FIN ROLE DOCENTE --%>
        <c:if test="${ authority.authority == 'ROLE_DOCENTE' }">
        <li>
            <a class="sidebar-link" href="${basePath}/grupos/index">
                Registrar avance
            </a>
        </li>
        </c:if>
        <%-- FIN ROLE DOCENTE --%>

        <%-- INICIO ROLE COORDINADOR --%>
        <c:if test="${ authority.authority == 'ROLE_COORDINADOR' }">
        <li>
            <a class="sidebar-link" href="${basePath}/asignaturas_del_ciclo/index">
                Gestionar syllabus
            </a>
        </li>
        </c:if>
        <%-- FIN ROLE COORDINADOR --%>
        </c:forEach>
        <li>
            <a class="sidebar-link" href="javascript:formSubmit()">
                Cerrar sesión
            </a>
        </li>
    </ul>
    </div>
</div>


