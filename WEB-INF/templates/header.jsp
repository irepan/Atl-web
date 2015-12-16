<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header Wrapper -->
	<div id="mws-header" class="clearfix">
    	<!-- Logo Wrapper -->
    	<div id="mws-logo-container">
        	<div id="mws-logo-wrap">
            	<img src="<c:url value='/resources/images/mws-logo.png'/>"/>
			</div>
        </div>
        <!-- User Area Wrapper -->
        <div id="mws-user-tools" class="clearfix">
        	<!-- User Notifications -->
        	<div id="mws-user-notif" class="mws-dropdown-menu">
            	<a href="#" class="mws-i-24 i-alert-2 mws-dropdown-trigger">Notifications</a>
                <span class="mws-dropdown-notif">1</span>
                <div class="mws-dropdown-box">
                	<div class="mws-dropdown-content">
                        <ul class="mws-notifications">
                            <!-- Notification Content -->
                        	<li class="read">
                            	<a href="#">
                                    <span class="message">
                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                    </span>
                                    <span class="time">
                                        January 21, 2012
                                    </span>
                                </a>
                            </li>
                        	<li class="unread">
                            	<a href="#">
                                    <span class="message">
                                        Lorem ipsum dolor sit amet
                                    </span>
                                    <span class="time">
                                        January 21, 2012
                                    </span>
                                </a>
                            </li>
                            <!-- End Notification Content -->
                        </ul>
                        <div class="mws-dropdown-viewall">
	                        <a href="#">View All Notifications</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- User Messages -->
            <div id="mws-user-message" class="mws-dropdown-menu">
            	<a href="#" class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
                <span class="mws-dropdown-notif">1</span>
                <div class="mws-dropdown-box">
                	<div class="mws-dropdown-content">
                        <ul class="mws-messages">
                        
                        	<!-- Message Content -->
                        	<li class="read">
                            	<a href="#">
                                    <span class="sender">John Doe</span>
                                    <span class="message">
                                        Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                    </span>
                                    <span class="time">
                                        January 21, 2012
                                    </span>
                                </a>
                            </li>
                        	<li class="unread">
                            	<a href="#">
                                    <span class="sender">John Doe</span>
                                    <span class="message">
                                        Lorem ipsum dolor sit amet
                                    </span>
                                    <span class="time">
                                        January 21, 2012
                                    </span>
                                </a>
                            </li>
                            <!-- End Messages -->
                        </ul>
                        <div class="mws-dropdown-viewall">
	                        <a href="#">View All Messages</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- User Functions -->
            <div id="mws-user-info" class="mws-inset">
            	<div id="mws-user-photo">
					<img alt="User Photo" src="<c:url value='/resources/css/icons/32/user.png'/>"/>
                </div>
                <div id="mws-user-functions">
                    <div id="mws-username">
                        Irepan Chavez
                    </div>
                    <ul>
                    	<li><a href="/atlas-web/profile">Profile</a></li>
                        <li><a href="/atlas-web/password">Change Password</a></li>
                        <li><a href="/atlas-web/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
            <!-- End User Functions -->
            
        </div>
    </div>
	<script>
		$(document).ready(function(){
			$("#mws-sidebar").animate({left: '-200px'});
			$("#mws-sidebar-bg").animate({left: '-200px'});
			$(".container").animate({left: '-200px'});
			width = $(".container").width();
			width = width+200;
			width = ''+width+'px';
			$(".container").animate({width: width});
		});
		toggle = 1;
		$("#mws-logo-wrap").click(function(){
			if(toggle == 1)
			{
				$("#mws-sidebar").animate({left: '0px'});
				$("#mws-sidebar-bg").animate({left: '0px'});
				$(".container").animate({left: '0px'});
				width = $(".container").width();
				width = width-200;
				width = ''+width+'px';
				$(".container").animate({width: width});
				toggle = 0;
			}
			else
			{
				$("#mws-sidebar").animate({left: '-200px'});
				$("#mws-sidebar-bg").animate({left: '-200px'});
				$(".container").animate({left: '-200px'});
				width = $(".container").width();
				width = width+200;
				width = ''+width+'px';
				$(".container").animate({width: width});
				toggle = 1;
			}
			
			
		});  
	</script>