<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
	<head>
	    <meta name="_csrf" content="${_csrf.token}"/>
	    <!-- default header name is X-CSRF-TOKEN -->
	    <meta name="_csrf_header" content="${_csrf.headerName}"/>	
		<title><tiles:getAsString name="title" /></title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/main.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/themes/default/easyui.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/themes/icon.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/themes/color.css"/>'/>
		<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/atlas.css"/>'/>
		<script type="text/javascript" src='<c:url value="/resources/js/jquery.min.js"/>'></script>
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

		<!-- Demo and Plugin Stylesheets -->
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/demo.css"/>'/>

		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/colorpicker/colorpicker.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/jimgareaselect/css/imgareaselect-default.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/fullcalendar/fullcalendar.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/fullcalendar/fullcalendar.print.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/tipsy/tipsy.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/sourcerer/Sourcerer-1.2.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/jgrowl/jquery.jgrowl.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/plugins/spinner/spinner.css"/>'/>
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/jui/jquery.ui.css"/>'/>
		<!-- Theme Stylesheet -->
		<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/mws.theme.css"/>'/>

		<!-- JavaScript Plugins -->

		<script type="text/javascript" src='<c:url value="/resources/js/jquery-1.7.1.min.js"/>'/></script>

		<script type="text/javascript" src='<c:url value="/resources/plugins/jimgareaselect/jquery.imgareaselect.min.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.dualListBox-1.3.min.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jgrowl/jquery.jgrowl.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.filestyle.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/fullcalendar/fullcalendar.min.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.dataTables.js"/>'/></script>
		<!--[if lt IE 9]>
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/excanvas.min.js"/>'/></script>
		<![endif]-->
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/jquery.flot.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/jquery.flot.pie.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/jquery.flot.stack.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/flot/jquery.flot.resize.min.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/colorpicker/colorpicker.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/tipsy/jquery.tipsy.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/sourcerer/Sourcerer-1.2.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.placeholder.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.validate.js"/>'></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/jquery.mousewheel.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/plugins/spinner/ui.spinner.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/js/jquery-ui.js"/>'></script>

		<script type="text/javascript" src='<c:url value="/resources/js/mws.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/js/demo.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/js/themer.js"/>'/></script>
		<script type="text/javascript" src='<c:url value="/resources/js/demo.dashboard.js"/>'/></script>

				
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
					Copyright 2015. All Rights Reserved.
				</div>
			</div>
		</div>
	</body>
</html>