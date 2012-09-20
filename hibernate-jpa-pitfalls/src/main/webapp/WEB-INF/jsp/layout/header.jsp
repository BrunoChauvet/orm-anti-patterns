<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div id="logo">
	<img src="<c:url value="/image/logo-strap.png"/>" />
</div>

<div id="menu">
	<ul id="jMenu">
		<li><a class="fNiv" href="<spring:url value="/" />">Home</a></li>
		<li><a class="fNiv" href="<spring:url value="/stats" />">Database</a>
			<ul>
				<li><a href="<spring:url value="/stats" />">Hibernate Statistics</a></li>
				<li><a href="<spring:url value="/load" />">Load Database</a></li>
			</ul>
		</li>
		<li><a class="fNiv" href="<spring:url value="/actions" />">Actions</a>
			<ul>
				<li><a href="<spring:url value="/lazyinitexception" />">LazyInitException</a></li>
				<li><a href="<spring:url value="/nplusone" />">N+1</a></li>
				<li><a href="<spring:url value="/paginatejoinfetch" />">Pagination bad</a></li>
				<li><a href="<spring:url value="/paginateresults" />">Pagination good</a></li>
				<li><a href="<spring:url value="/aggregatequeries" />">Aggregate Queries bad</a></li>
				<li><a href="<spring:url value="/aggregatequeriessql" />">Aggregate Queries good</a></li>
				<li><a href="<spring:url value="/extralazy" />">Extra Lazy Fetching</a></li>
			</ul>
		</li>
	</ul>
</div>
