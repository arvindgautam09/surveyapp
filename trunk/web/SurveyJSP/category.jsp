<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.okaya.services.survey.dataBean.QuestionCategoryDB;"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
	QuestionCategoryDB quesCategory = new QuestionCategoryDB();
	List categoryList = (List) session.getAttribute("CategoryList");
	String DivValue = (String) request.getAttribute("viewDiv");
	String message = (String)request.getAttribute("message");
	System.out.println("DivValue-->"+DivValue);
	System.out.println("message-->"+message);
	if (DivValue == null) {
		DivValue = "";
	}
	if (message == null) {
		message = "";
	}
	if(categoryList==null){
		categoryList=new ArrayList();
	}
	int quesId; 
	String quesName = "";
%>
<html>
<head>
<s:head />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<TITLE>e-Survey</TITLE>
<link href="../css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="../css/style_search.css" rel="stylesheet" type="text/css">
<link href="../css/aw.css" rel="stylesheet" type="text/css">
<script src="../js/aw.js"></script>

<TITLE>e-Survey</TITLE>
<script>
function deleteType(){
document.getElementById('deleteDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('addDiv').style.display="none";
}

function addType(){
document.getElementById('addDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}

function editType(){
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}

function hideDiv(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='block';
document.getElementById('deleteDiv').style.display="none";

}
function hideDiv2(){
document.getElementById('editDiv').style.display='block';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="none";

}

function hideDiv3(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="block";

}
</script>
<head>
<%if (DivValue.equals("viewAdd")) {
	%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv();">
<%} if (DivValue.equals("viewUpdate")) {%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv2();">
<%} if (DivValue.equals("viewDelete")) {%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv3();">
<%} else{%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv();">
<%} %>
<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>
<script type="text/javascript">
var obj = new AW.UI.Tabs;
obj.setItemText(["Add", "Edit", "Delete"]);
obj.setItemImage(["add", "edit", "delete"]);
//obj.setSelectedItems([0]);
obj.setItemCount(3);

document.write(obj);

obj.onItemClicked = function(event, index)
{
buttonTabClick(index);
};

function buttonTabClick(index)
{
//window.location.reload();
if( index == 0 )
{
obj.setSelectedItems([0]);
addType();
}
else if( index == 1 )
{
obj.setSelectedItems([1]);
editType();

}
else if( index == 2 )
{
obj.setSelectedItems([2]);
deleteType();
}
}
</script>

			</tr>
		</table>

		<table width="780" border="1" align="center" cellpadding="0"
			cellspacing="0" class="tableborderl">
			<tr>
				<td><!--//////////////////////////////////////////////add role/////////////////////////////-->
				<div id="addDiv">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Category: </strong></span></td>
					</tr>
					<%if(message.equals("Insert")){ %>
					<tr align="center">
						<td class="suboptionh"><span id="msg1" class="suboption"><font
							color="blue"><i>Category Added Successsfully</i></font></span></td>
					</tr>
					<%} %>
					<tr>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>
						<form name="addFrm" id="addFrm" action="addcategoryActions.action">
							<table width="350" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr align="center">
									<td align="center" class="suboptionh">
									<s:textfield
										name="questionCategory" label="Category	Name"
										labelposition="right" required="true" requiredposition="right"
										cssClass="suboptionh" cssStyle="width: 155px;"></s:textfield></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr align="center">
									<td align="center" colspan="2">
									<s:hidden requiredposition="right" name="button" value="Add"></s:hidden>
									<input type="image" src="../images/add_x01.gif" alt="Add New" /></td>
									<s:submit name="submitNoValidate"
										value="submit without validation" method="noValidation"></s:submit>
								</tr>
							</table>
						</form>
						</td>
					</tr>
				</table>
				</div>

				<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete role \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->

				<div id="deleteDiv">
				<form name="delFrm" id="delFrm"
					action="deletecategoryActions.action">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Category: </strong></span></td>
					</tr>
					<%if(message.equals("Delete")){ %>
					<tr align="center">
						<td class="suboptionh"><span id="msg2" class="suboption"><font
							color="red"><i>Category Deleted Successsfully</i></font></span></td>
					</tr>
					<tr></tr>
					<%} %>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="suboption" align="center">Select Category <font
									color="red">*</font><b> :&nbsp; </b><select
									name="questionCategoryDelete" class="suboption"
									style="width: 155" id="questionCategoryDelete">
									<option value="0">--Others--</option>
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesName = (String) quesCategory.getQsc_name();
											quesId = quesCategory.getQsc_id();
									%>
									<option value="<%=quesName %>"><%=quesName%></option>
									<%
										}
									%>

								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Delete"> <input type="image"
									src="../images/del_01.gif" alt="Delete" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</form>
				</div>


				<!--///////////////////////////////////////// edit role /////////////////////////////////////-->

				<div id="editDiv">
				<form name="editFrm" id="editFrm"
					action="updatecategoryActions.action">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Category: </strong></span></td>
					</tr>
					<%if(message.equals("Update")){ %>
					<tr align="center">
						<td class="suboptionh"><span id="msg3" class="suboption"><font
							color="red"><i>Category Updated Successsfully</i></font></span></td>
					</tr>
					<tr></tr>
					<%} %>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="350" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td align="center" class="suboptionh" width="120px"
									align="right">Select Category <font color="red">*</font><b>
								:&nbsp; </b></td>
								<td><select name="editquestionCategory" class="suboption"
									style="width: 155" id="editquestionCategory">
									<option value="0">--Others--</option>
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesName = (String) quesCategory.getQsc_name();
											quesId = quesCategory.getQsc_id();
									%>
									<option value="<%=quesName %>"><%=quesName%></option>
									<%
										}
									%>

								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" class="suboptionh" align="right">Category
								Name&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td align="left"><s:textfield name="questionCategNew"
									value="" cssClass="suboption" cssStyle="width: 155"
									id="questionCategNew"></s:textfield></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" colspan="2"><input type="hidden"
									name="button" value="Update"> <input type="image"
									src="../images/up_date_01.gif" alt="Update" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</form>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</BODY>
</html>
