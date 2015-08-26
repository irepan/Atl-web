<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!--<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
	<link rel="stylesheet" type="text/css" href="./resources/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/themes/icon.css">
	<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery.easyui.min.js"></script>
	<script type='text/javascript'>
    	function submit()
      	{
        	document.forms["loginForm"].submit();
     	}
   </script>
 </head> -->
 	<script type='text/javascript'>
    	function submit()
      	{
        	document.forms["loginForm"].submit();
     	}
   </script>
<body onload='document.loginForm.username.focus();'>

	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="Acceso al sistema" style="width:400px;padding:30px 70px 20px 70px">
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<form name='loginForm' action="<c:url value='/login' />" method='POST'>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="username" type="text" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
			</div>
	<!--		<div style="margin-bottom:20px">
				<input type="checkbox" checked="checked">
				<span>Remember me</span>
			</div> -->
			<div>
				<a href="javascript:submit();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
					<span style="font-size:14px;">Login</span>
				</a>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</body>
<!--</html> -->