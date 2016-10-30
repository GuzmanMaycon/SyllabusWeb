<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/css/admin.css" var="adminCss" />	
<spring:url value="/resources/css/app.css" var="appCss" />
<spring:url value="/resources/js/app.js" var="appJs" />

<link href="${adminCss}"rel="stylesheet">
<link href="${appCss}" rel="stylesheet">

<script src="${appJs}"></script>