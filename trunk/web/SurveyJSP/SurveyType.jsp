<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>
<s:head />
<link href="../css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="../css/style_search.css" rel="stylesheet" type="text/css">
<link href="../css/aw.css" rel="stylesheet" type="text/css">
<script src="../js/aw.js"></script>
<TITLE>e-Survey</TITLE>
<script>
function deleteType(){
document.getElementById('msgDeleteDiv').innerHTML="";
document.getElementById('deleteDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('addDiv').style.display="none";
}


function addType(){
document.getElementById('msgAddDiv').innerHTML="";
document.getElementById('addDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}

function editType(){
document.getElementById('msgEditDiv').innerHTML="";
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}

function hideDiv(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='block';
document.getElementById('deleteDiv').style.display="none";
}



</script>

</HEAD>


<%String DivValue = (String)session.getAttribute("key");
	if(DivValue==null) {
		DivValue="";
		}
%>
<%

if(DivValue.equals("UpdateKey")){
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="editType();">
<%
}
if(DivValue.equals("AddKey")){
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="addType();">
<%}

if(DivValue.equals("DeleteKey")){
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="deleteType();">
<%}
else{
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv();">
<%}%>


<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>

				<script>
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
				<td><!--//////////////////////////////////////////////add/////////////////////////////-->
				<div id="addDiv">
				<s:form name="addFrm" id="addFrm" action="addSurveyType" validate="true">
				<table width="780" border="0" align="center">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Survey Type: </strong></span></td>
					</tr>

					<tr>
						<td align="center" class="suboptionh">
						<div id="msgAddDiv"><s:property value="message" /><s:fielderror/></div>
						</td>
					</tr>

					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr align="center">
								<td class="suboption">
									<s:textfield label="Survey Type" labelposition="left"
									name="surveyType" required="true"
									requiredposition="right" cssClass="suboption"
									cssStyle="width:155px" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center">
								<s:submit type="image" align="center" src="../images/add_x01.gif" value="Add" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</s:form>
				</div>


				<div id="deleteDiv">
				<s:form name="delFrm" id="delFrm" action="deleteSurveyType">
				<table width="780" border="0" align="center">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Survey Type: </strong></span></td>
					</tr>

					<tr>
						<td align="center" class="suboptionh">
						<div id="msgDeleteDiv"><s:property value="message" /></div>
						</td>
					</tr>

					<tr>
						<td>
						<table width="780" border="0" align="center">
							<tr>
								<td class="suboption" align="center">Select Survey Type <font
									color="red">*</font><b> :&nbsp; </b><s:if
									test="surveyTypeList!=null">
									<s:select name="surveyTypeId" id="surveyTypeId"
										cssClass="suboption" cssStyle="width: 155"
										list="surveyTypeList" listKey="srt_id" listValue="srt_name"
										theme="simple" />
								</s:if></td>
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
				</s:form>
				</div>



				<div id="editDiv">
				<s:form name="editFrm" id="editFrm" action="updateSurveyType">
				<table width="780" border="0" align="center">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Survey Type: </strong></span></td>
					</tr>

					<tr>
						<td align="center" class="suboptionh">
						<div id="msgEditDiv"><s:property value="message" /></div>
						</td>
					</tr>

					<tr>
						<td>
						<table width="500" border="0" align="center">
							<tr>
								<td class="suboption" align="center" colspan="2">Select
								Survey Type <font color="red">*</font><b> :&nbsp; </b> <s:if
									test="surveyTypeList!=null">
									<s:select name="surveyTypeId" id="surveyTypeId"
										cssClass="suboption" cssStyle="width: 155"
										list="surveyTypeList" listKey="srt_id" listValue="srt_name"
										theme="simple" />
								</s:if></td>
							</tr>

							<tr align="center">
								<td align="right" class="suboption" width="227px">Survey
								Type&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;</td>
								<td align="left"><input type="text" name="surveyType"
									class="suboption" style="width: 155px"></td>
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
				</s:form>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</BODY>
</html>
