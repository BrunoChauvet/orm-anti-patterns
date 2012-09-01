<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<img src="<c:url value="/image/database.png"/>" />
		<span>Database content</span>
	</div>
	<div class="block-body">
		<div>
			<div class="long">Total Customers: </div>
			<div class="medium"><c:out value="${customerSize}" /></div>
		</div>
		<div class="clear"></div>
		<div>
			<div class="long">Total Orders: </div>
			<div class="medium"><c:out value="${orderSize}" /></div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>

<br/>

<div class="ui-widget ui-widget-content ui-corner-all">
	<div class="ui-widget-header ui-corner-all ui-helper-clearfix">
		<img src="<c:url value="/image/database.png"/>" />
		<span>Load Database</span>
	</div>
	<div class="block-body">
		<c:choose>
			<c:when test="${not isLoading}">
				<form:form method="POST" commandName="form" id="load-database-form">
					<div>
						<div class="long">Customers: </div>
						<form:select path="customerAmount">
							<form:option value="10">10</form:option>
							<form:option value="100">100</form:option>
							<form:option value="1000">1000</form:option>
						</form:select>
					</div>
					<div class="clear"></div>
					<div>
						<div class="long">Orders per Customer: </div>
						<form:select path="ordersPerCutomer">
							<form:option value="10">10</form:option>
							<form:option value="100">100</form:option>
							<form:option value="1000">1000</form:option>
						</form:select>
					</div>
					<div class="clear"></div>
					<div>
						<a id="load-database-button" class="button" href="#">Load Database</a>
					</div>
					<div>
						<a id="clean-database-button" class="button" href="#">Clean Database</a>
					</div>
				</form:form>
			</c:when>
			<c:otherwise>
				<span>Database is loading</span><br/>
				<div id="load-progression" class="progressbar" style="width:240px;height:20px;"></div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="clear"></div>
</div>

<script type="text/javascript">
	var refreshInterval;

	function loadDatabase() {
		var data = $("#load-database-form").serialize();
		$.ajax({
			type : 'POST',
			data : data,
			url : "load"
		});
		window.location.reload();
	}
	
	function cleanDatabase() {
		$.ajax({
			type : 'POST',
			url : "clean"
		});
		window.location.reload();
	}
	
	function getLoadProgression() {
		$.ajax({
			type : 'GET',
			url : "loadProgression",
			success : function(result) {
				$('#load-progression').progressbar('value', result);
			}
		});
	}

	$(document).ready(function() {
		<c:if test="${isLoading}">
			refreshInterval = setInterval('getLoadProgression()', 500);
		</c:if>
		$('.progressbar').progressbar({
			   complete: function(event, ui) {window.location.reload();}
		});
		$("#load-database-button").bind('click', function() {loadDatabase();});
		$("#clean-database-button").bind('click', function() {cleanDatabase();});
	});
</script>