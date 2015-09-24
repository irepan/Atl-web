<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta name="_csrf" content="${_csrf.token}"/>
	    <!-- default header name is X-CSRF-TOKEN -->
	    <meta name="_csrf_header" content="${_csrf.headerName}"/>	
		<title><tiles:getAsString name="title" /></title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/main.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/themes/default/easyui.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/Atlas/icon.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/themes/color.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/atlas.css"/>'/>
		<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.11.3.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/js/jquery.easyui.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/js/jquery.edatagrid.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/js/atlas.js"/>'></script>
	
		<!-- Required Stylesheets -->
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/reset.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/text.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/ptsans/stylesheet.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fluid.css"/>'/>

		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/mws.style.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/icons/icons.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/themes/atlas-icons.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/demo.css"/>'/>

		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/mws.theme.css"/>'/>
		
		<!--[if lt IE 9]>
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/excanvas.min.js"/>'/></script>
		<![endif]-->
		
		<script type="text/javascript" src='<c:url value="/resources/plugins/tipsy/jquery.tipsy.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/dateformat/jquery-dateFormat.js"/>'></script>
		
		<script type="text/javascript" src='<c:url value="/resources/js/mws.js"/>'/></script>
		
		
				
	</head>
	<body>
		<tiles:insertAttribute name="header" />
		<div id="mws-wrapper">
			<tiles:insertAttribute name="menu" />
			<div id="mws-container" class="clearfix">  
				<div class="container">
					<tiles:insertAttribute name="content" />
				</div>
				<div id="mws-footer">
					Copyright Aviation Information Services 2015. All Rights Reserved.
				</div>
			</div>
		</div>
	</body>
</html>