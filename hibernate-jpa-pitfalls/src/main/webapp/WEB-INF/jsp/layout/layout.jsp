<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	
	<link rel="shortcut icon" href="/favicon.png"/>
	<link rel="apple-touch-icon" href="/favicon.png"/>
	
	<title><tiles:insertAttribute name="title" ignore="true" /></title>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/redmond/jquery-ui-1.8.22.custom.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/shCore.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/shThemeDefault.css"/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jMenu.jquery.css"/>" />

	<!-- JS -->
	<script type="text/javascript" src="<c:url value="/js/jquery-1.7.2.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.22.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/shCore.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/shBrushJava.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/shBrushXml.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jMenu.jquery.min.js"/>"></script>
	
</head>
<body>
	<!-- Layout -->
	<div id="wrap">
		<div id="header"><tiles:insertAttribute name="header" /></div>
		<div id="content">
			<div id="main"><tiles:insertAttribute name="main" /></div>
		</div>
		<div id="footer"><tiles:insertAttribute name="footer" /></div>
	</div>
	
	<script>
		$(function() {
			$("#jMenu").jMenu({
			      openClick : false,
			      ulWidth : '150',
			      effects : {
			        effectSpeedOpen : 300,
			        effectSpeedClose : 300,
			        effectTypeOpen : 'slide',
			        effectTypeClose : 'slide',
			        effectOpen : 'linear',
			        effectClose : 'linear'
			      },
			      TimeBeforeOpening : 100,
			      TimeBeforeClosing : 400,
			      animatedText : false,
			      paddingLeft: 1
			    });
			$(".button").button();
			SyntaxHighlighter.all();
		});
	</script>
</body>
</html>
