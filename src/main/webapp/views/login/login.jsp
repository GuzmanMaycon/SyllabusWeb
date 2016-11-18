<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <%@ include file="/views/layout/admin-head.jsp" %>
  <spring:url value="/resources/img/main_image.jpg" var="mainImg" />
  <spring:url value="/resources/img/main_image_2.jpg" var="mainImg2" />

  <title>Login</title>
  <style>
    #form-login {
        border: 0px;
    }
    @media(min-width: 992px) {
        #form-login {
            border: black solid 1px;
            padding: 20px 5px;
        }
    }
  #info-block {
    margin-top: 20px;
  }
  </style>
</head>
<body>
  <%@ include file="/views/layout/header.jsp" %>

  <div class="container">
    <div class="row">
      <div class="text-center">
        <h1 class="hidden-xs">Bienvenido al Sistema de Control y Seguimiento de Syllabus</h1>
        <h3 class="visible-xs">Bienvenido al Sistema de Control y Seguimiento de Syllabus</h3>
      </div>
    </div>

    <div class="row">
      <div class="hidden-xs hidden-sm col-md-7">
        <img id="img-main" src="${mainImg}">
        <img id="img-main-2" src="${mainImg2}">
      </div>
      <div class="col-xs-12 col-md-5" id="form-login">
        <div class="hidden-xs hidden-sm col-md-2">
          <i class="fa fa-users fa-4x" style="line-height: 100px;"></i>
        </div>
        <div class="col-sm-offset-3 col-md-offset-0 col-sm-6 col-md-10">
          <form class="form-horizontal" name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>

          <div class="form-group">
            <label class="control-label col-xs-4 col-sm-4 col-md-3">Usuario</label>
            <div class="col-xs-8 col-sm-8 col-md-9">
              <input type="text" class="form-control" name="username">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-xs-4 col-sm-4 col-md-3">Contraseña</label>
            <div class="col-xs-8 col-sm-8 col-md-9">
              <input type="password" class="form-control" name="password">
            </div>
          </div>

         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

          <button class="btn btn-primary col-xs-12">Ingresar</button>

          </form>
        </div>
      </div>
    </div>

    <div class="row visible-md visible-lg" id="info-block">
      <div class="panel panel-info">
        <div class="panel-heading">
          <h4>Información del Sistema</h4>
        </div>
        <div class="panel-body">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>