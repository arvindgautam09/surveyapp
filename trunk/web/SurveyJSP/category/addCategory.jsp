<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<s:head />
<link href="../../css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="../../css/style_search.css" rel="stylesheet" type="text/css">

<TITLE>e-Survey</TITLE>
</head>
<body topmargin="7px" rightmargin="7px" leftmargin="7px">
<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td><!-- Include common action tabs Add Edit Deletes --> <jsp:include
					page="../shared/categoryTabs.jsp"></jsp:include> <script
					type="text/javascript">actionTabObject.setSelectedItems([0]);</script>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<table class="tableborderl" width="780px" border="1" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<div id="addDiv">
				<s:form name="addFrm" id="addFrm" action="addCategory.action" validate="true">
					<table width="780" border="0" align="center" cellpadding="0"
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
								<tr align="center">
									<td class="suboptionh">Question Category<font color="red">*</font><b>
									:&nbsp; </b> <s:textfield name="questionCategory" theme="simple"
										cssStyle="width:155px;" /> <s:fielderror></s:fielderror> </td>
								</tr>

								<tr align="center">
									<td align="center"><input type="hidden" name="button"
										value="Add"> <input type="image"
										src="../../images/add_x01.gif" alt="Add New" /></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
				</s:form></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>