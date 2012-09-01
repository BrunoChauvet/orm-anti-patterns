<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<span>Pagination with a Left Join Fetch</span>
	</div>
	<div class="block-body">
		<div class="paragraph ui-corner-all">
			<a href="<spring:url value="/withSession/findCustomers/0" />" class="button">Click me</a> to display the first 5 Customers
			<br/><br/>
			This logs the following warning in the console
			<br/>
			<div class="ui-widget">
				<div class="ui-state-error ui-corner-all">
					<span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-alert"></span> 
					<strong>firstResult/maxResults specified with collection fetch; applying in memory!</strong>
				</div>
			</div>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			<pre class="brush: java" title="Named Query">
				@Query("SELECT DISTINCT c "
		            + "FROM Customer c "
		            + "LEFT JOIN FETCH c.orders "
		            + "ORDER BY c.name")
				public List&lt;Customer&gt; findCustomers(Pageable page);
			</pre>
			<div class="clear"></div>
		</div>
		
		<div class="spacer"></div>
		
		<div class="paragraph ui-corner-all">
			Select all the Customers and Orders and map SQL query results to entities until getting all data for the first 5 Customers
			<br/>
			<img src="<c:url value="/image/paginate-join-fetch.png"/>" />
			<br/>
			Random number of Orders per Customer
			<br/>
			Selects all and build up objects in memory until expected size
		</div>
	</div>
	<div class="clear"></div>
</div>