<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<img src="<c:url value="/image/statistics.png"/>" />
		<span>Hibernate Statistics</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<div class="long">Prepared Statement Count</div>
			<div class="short"><c:out value="${statistics.prepareStatementCount}" /></div>
		</div>
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<div class="long">Entity Load Count</div>
			<div class="short"><c:out value="${statistics.entityLoadCount}" /></div>
			<div class="clear"></div>
			<div class="long">Entity Fetch Count </div>
			<div class="short"><c:out value="${statistics.entityFetchCount}" /></div>
		</div>
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<div class="long">Collection Load Count</div>
			<div class="short"><c:out value="${statistics.collectionLoadCount}" /></div>
			<div class="clear"></div>
			<div class="long">Collection Fetch Count </div>
			<div class="short"><c:out value="${statistics.collectionFetchCount}" /></div>
			<div class="clear"></div>
			<div class="long">Collection Recreate Count </div>
			<div class="short"><c:out value="${statistics.collectionRecreateCount}" /></div>
		</div>
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<div>Customer Entity</div>
			<div class="clear"></div>
			<div class="long">Fetch</div>
			<div class="short"><c:out value="${statisticsCustomer.fetchCount}" /></div>
			<div class="clear"></div>
			<div class="long">Load</div>
			<div class="short"><c:out value="${statisticsCustomer.loadCount}" /></div>
			<div class="spacer"></div>
		
			<div>Order Entity</div>
			<div class="clear"></div>
			<div class="long">Fetch</div>
			<div class="short"><c:out value="${statisticsOrder.fetchCount}" /></div>
			<div class="clear"></div>
			<div class="long">Load</div>
			<div class="short"><c:out value="${statisticsOrder.loadCount}" /></div>
			<div class="spacer"></div>
		
			<div>PaymentMethod Entity</div>
			<div class="clear"></div>
			<div class="long">Fetch</div>
			<div class="short"><c:out value="${statisticsPaymentMethod.fetchCount}" /></div>
			<div class="clear"></div>
			<div class="long">Load</div>
			<div class="short"><c:out value="${statisticsPaymentMethod.loadCount}" /></div>
		</div>
		<div class="spacer"></div>
		
		<a href="<spring:url value="/reset" />" class="button">Reset</a>
	</div>
</div>