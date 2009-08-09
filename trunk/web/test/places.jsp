<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
<sx:head />

<SCRIPT type="text/javascript">
	function city_change() {
		//alert("in city_change");
		dojo.event.topic.publish("city_changed");
	}
</SCRIPT>
</head>
<body>
Hello!
<br />

<s:form id="testForm" name="testForm" action="/towns.action">
	<s:select label="My City" list="cities" name="myCity"
		onchange="city_change(); return false;" />
	<s:submit value="%{'Make HTTP Call'}" />
</s:form>
<hr />
	<s:url id="tour_action_url" action="tours.action" />

	<sx:div preload="false" showLoadingText="false" id="details"
		href="%{tour_action_url}" theme="ajax" listenTopics="city_changed"
		formId="testForm">
	</sx:div>
<hr />
</body>
</html>