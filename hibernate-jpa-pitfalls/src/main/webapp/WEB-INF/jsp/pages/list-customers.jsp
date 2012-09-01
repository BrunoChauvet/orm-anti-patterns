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
	<c:forEach items="${customers}" var="customer" varStatus="statusCustomer">
		<c:choose>
			<c:when test="${statusCustomer.index < 10}">
				<tr class="customer-separator"><td colspan="4"></td></tr>
				<tr>
					<td rowspan="${fn:length(customer.orders) + 1}">
						<c:out value="${customer.name}" />
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach items="${customer.orders}" var="order">
					<tr>
						<td><fmt:formatNumber value="${order.amount}" maxFractionDigits="2" type="currency" currencySymbol="$"/></td>
						<td><fmt:formatDate value="${order.date}"/></td>
						<td><c:out value="${order.paymentMethod.name}"/></td>
					</tr>
					<c:if test="${statusOrder.index == 0}"><tr><td>Data truncated</td></tr></c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${customer.orders}" var="order"></c:forEach>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${fn:length(customers) > 10}">
		<tr><td>Data not displayed after 10 customers</td></tr>
	</c:if>
</table>