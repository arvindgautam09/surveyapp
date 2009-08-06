<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="css/style_search.css" rel="stylesheet" type="text/css">
</head>
<body>
<fieldset><legend>Host A Survey</legend>

<form name="hostFrm" id="hostFrm">


<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">
	
	<tr>
		<td>

		<table width="780" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr align="center">
				<td align="right" class="suboption">Select Survey Type :</td><td align="left"><select
					name="surveyname" class="suboption" style="width: 155"
					id="surveyname" onchange="hideMsg1();" title="Select Survey">
					<option value="select">----------select-----------</option>
					<option value="1">ESS</option>
					<option value="2">Clients Feedback</option>
					
				</select></td>
			</tr>
			<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
			<tr align="center">
				<td align="right" class="suboption">Select Survey Name :</td><td align="left"><select
					name="surveyname" class="suboption" style="width: 155"
					id="surveyname" onchange="hideMsg1();" title="Select Survey">
					<option value="select">----------select-----------</option>
					<option value="1">ESS (Monthly)</option>
					<option value="2">Clients Feedback</option>
					<option value="3">ESS (Once)</option>
					<option value="4">ESS (OTC)</option>
				</select></td>
			</tr>
			<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
			<tr align="center">
				<td align="right" class="suboption">Select Email Ids :</td><td align="left"><select name="repeatinterval" class="suboption"
					style="width: 155" id="repeatinterval" onchange="hideMsg1();"
					title="Select Repeat Interval">
					<option value="select">----------select-----------</option>
				
				</select></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><jsp:include page="MailFormat.jsp" /></td>
			</tr>


		</table>
		</td>
	</tr>

</table>
</form>

</fieldset>
</body>
</html>