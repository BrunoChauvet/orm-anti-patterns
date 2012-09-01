<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<table class="ui-widget ui-widget-content ui-corner-all">
	<tr>
		<th>Customer</th>
		<th>Total Amount</th>
		<th>Since</th>
	</tr>
	<c:forEach items="${entries}" var="entry">
		<tr>
			<td><c:out value="${entry['customer'].name}"/></td>
			<td><fmt:formatNumber value="${entry['total']}" maxFractionDigits="2" type="currency" currencySymbol="$"/></td>
			<td><fmt:formatDate value="${entry['since']}"/></td>
		</tr>
	</c:forEach>
</table>