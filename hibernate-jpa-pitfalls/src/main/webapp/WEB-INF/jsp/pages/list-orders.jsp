<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<table class="ui-widget ui-widget-content ui-corner-all">
	<tr>
		<th>Customer</th>
		<th>Order Amount</th>
		<th>Order Date</th>
		<th>Payment Method</th>
	</tr>
	<c:forEach items="${orders}" var="order">
		<tr>
			<td><c:out value="${order.customer.name}"/></td>
			<td><fmt:formatNumber value="${order.amount}" maxFractionDigits="2" type="currency" currencySymbol="$"/></td>
			<td><fmt:formatDate value="${order.date}"/></td>
			<td><c:out value="${order.paymentMethod.name}"/></td>
		</tr>
	</c:forEach>
</table>