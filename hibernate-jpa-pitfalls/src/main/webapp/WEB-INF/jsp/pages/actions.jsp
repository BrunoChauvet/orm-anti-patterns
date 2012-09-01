<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
<a href="<spring:url value="/lazyinitexception" />">LazyInitException</a><br/>
<a href="<spring:url value="/nplusone" />">N+1</a><br/>
<a href="<spring:url value="/paginatejoinfetch" />">Pagination bad</a><br/>
<a href="<spring:url value="/paginateresults" />">Paginate good</a><br/>
<a href="<spring:url value="/aggregatequeries" />">Aggregate Queries bad</a><br/>
<a href="<spring:url value="/aggregatequeriessql" />">Aggregate Queries good</a><br/>
<a href="<spring:url value="/extralazy" />">Extra Lazy Fetching</a><br/>