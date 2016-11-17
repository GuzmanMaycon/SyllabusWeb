<spring:url value="/resources/img/logo.png" var="logoImg" />
<style type="text/css">
.navbar {
    margin-bottom: 0px;
    min-height: 90px;
}
#img-logo {
	width: 80%;
}
#span-username {
	line-height: 90px;
}
</style>

<c:url value="/j_spring_security_logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<script>
function formSubmit() {
	document.getElementById("logoutForm").submit();
}
</script>

<nav class="navbar navbar-default navbar-static-top navbar-bottom-0">
    <div class="container">
        <div class="navbar-header">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Branding Image -->
            <a class="navbar-brand" href="#">
                <img id="img-logo" src="${logoImg}">
            </a>
        </div>

        <div class="collapse navbar-collapse" id="app-navbar-collapse">
            <!-- Left Side Of Navbar -->
            <ul class="nav navbar-nav">
                &nbsp;
            </ul>

            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">
                <label id="span-username">
				${pageContext.request.userPrincipal.name}
				</label>
            </ul>
        </div>

    </div>
</nav>