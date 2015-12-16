<!-- Necessary markup, do not remove -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="mws-sidebar-stitch"></div>
<div id="mws-sidebar-bg"></div>
<!-- Sidebar Wrapper -->
<div id="mws-sidebar">
	<!-- Search Box -->
	<div id="mws-searchbox" class="mws-inset">
		<input type="text" class="mws-search-input" />
		<input type="submit" class="mws-search-submit" />
	</div>
	<!-- Main Navigation -->
	<div id="mws-navigation">
		<ul>
			<li class="active"><a href='<c:url value="/"/>' class="mws-i-24 i-home">Home</a></li>
			<li>
				<a href="#" class="mws-i-24 i-list">Trips</a>
				<ul>
					<li><a href='<c:url value="/secure/trip"/>'>Add Trip</a></li>
					<li><a href='<c:url value="/secure/trip?id=SAMPLE_TRIP_1#"/>'>Show Sample Trip</a></li>
				</ul>
			</li>
			<li><a href='<c:url value="/admin/universalImport/universalImport"/>' class="mws-i-24 i-cog">Universal Import</a></li>
			<li><a href='<c:url value="/secure/aircraft/loadAircraft"/>' class="mws-i-24 i-cog">Aircraft</a></li>
			<li><a href='<c:url value="/admin/displayOrder/displayOrder"/>' class="mws-i-24 i-cog">Display Order</a></li>
			<li><a href='<c:url value="/info/about"/>' class="mws-i-24 i-text-styling">About</a></li>
		</ul>
	</div>
	<!-- End Navigation -->
</div>