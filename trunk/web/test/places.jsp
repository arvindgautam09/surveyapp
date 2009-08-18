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

	<sx:div preload="false" showLoadingText="true" id="details"
		href="%{tour_action_url}" theme="ajax" listenTopics="city_changed"
		formId="testForm">
	</sx:div>
<hr />

<s:form name="validation_test" action="newCity" validate="true">
	<s:textfield label="City Name" name="myCity" />
	<s:submit value="%{'Submt'}"></s:submit>
</s:form>


<s:form validate="true" id="frmAddCategory" action="addCategory.action">
					<table width="780px" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr bgcolor="#719ce8">
							<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
								class="mainheading"><strong>&nbsp;&nbsp; Add
							Category: </strong></span></td>
						</tr>
						<tr>
							<td align="center" class="suboptionh">
								<div id="msgAddDiv"><s:property value="message" /></div>
							</td>
						</tr>
						<tr>
							<td>
							<table width="500" border="0" align="center">
								<tr>
									<td class="suboptionh"> 
										<s:textfield size="40" label="Question Category" labelposition="left" required="true" requiredposition="right" name="questionCategory"  /> 
									 </td>
								</tr>
								<tr align="center">
									<td ><s:submit align="center" type="image" value="Add" src="../../images/add_x01.gif" /> </td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
				</s:form>




</body>
</html>