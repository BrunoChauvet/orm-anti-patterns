<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>Aggregate Queries</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/reportAsMap" />" class="button">Click me</a> to report the total amount of Orders per Customer<br/>
			The calculation of the total amount of Orders is done in the Named Query
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="Named Query">
				@Query("SELECT new Map(c as customer, "
			            + "   SUM(o.amount) as total, "
			            + "   MIN(o.date) as since) "
			            + "FROM Customer c, Order o "
			            + "WHERE o.customer = c "
			            + "GROUP BY c "
			            + "ORDER BY c.name")
				public List&lt;Map&lt;String, Object&gt;&gt; customerReport();

			</pre>
			<div class="clear"></div>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			Avoid loading the complete object graph<br/>
			Take advantage of SELECT new
		</div>
	</div>
	<div class="clear"></div>
</div>