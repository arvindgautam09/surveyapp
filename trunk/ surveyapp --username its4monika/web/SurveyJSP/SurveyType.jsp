<%@ page import="java.util.List"%>
<%@ page import="com.okaya.services.survey.dataBean.SurveyTypeDB;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<HEAD>

<link href="../css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="../css/style_search.css" rel="stylesheet" type="text/css">
<link href="../css/aw.css" rel="stylesheet" type="text/css">
<script src="../js/aw.js"></script>
<%
	SurveyTypeDB surType = new SurveyTypeDB();
	List surveyTypeList = (List) session.getAttribute("surveyTypeList");
	if (surveyTypeList == null) {
		surveyTypeList = null;
	}

	int id;
	String name = "";
	String result1 = (String)request.getAttribute("Update");
	String result2 = (String)request.getAttribute("Delete");
	System.out.println("result1 in jsp---->"+result1);
	System.out.println("result2 in jsp---->"+result2);
%>

<TITLE>e-Survey</TITLE>
<script>
function deleteType(){
document.getElementById('deleteDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('addDiv').style.display="none";
document.getElementById('msg1').innerHTML="";
document.getElementById('msg2').innerHTML="";
document.getElementById('msg3').innerHTML="";
document.getElementById('msg4').innerHTML="";
document.getElementById('msg5').innerHTML="";
document.getElementById('msg6').innerHTML="";
document.getElementById('ajaxDiv').innerHTML="";
document.getElementById('ajaxDiv1').innerHTML="";
document.getElementById('deleterole').value="select";
document.getElementById('DragContainer2').innerHTML="";
document.getElementById('DragContainer1').innerHTML="";
document.getElementById('rolename').value="";
document.getElementById('container3').innerHTML="";
document.getElementById('group').value="select";
}


function addType(){
document.getElementById('addDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
document.getElementById('msg1').innerHTML="";
document.getElementById('msg2').innerHTML="";
document.getElementById('msg3').innerHTML="";
document.getElementById('msg4').innerHTML="";
document.getElementById('msg5').innerHTML="";
document.getElementById('msg6').innerHTML="";
document.getElementById('rolename').value="";
document.getElementById('group').value="select";
document.getElementById('ajaxDiv').innerHTML="";
document.getElementById('ajaxDiv1').innerHTML="";
document.getElementById('deleterole').value="select";
document.getElementById('container3').innerHTML="";
document.getElementById('DragContainer2').innerHTML="";
document.getElementById('DragContainer1').innerHTML="";
}

function editType(){
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
document.getElementById('msg1').innerHTML="";
document.getElementById('msg2').innerHTML="";
document.getElementById('msg3').innerHTML="";
document.getElementById('msg4').innerHTML="";
document.getElementById('msg5').innerHTML="";
document.getElementById('msg6').innerHTML="";
document.getElementById('ajaxDiv').innerHTML="";
document.getElementById('ajaxDiv1').innerHTML="";
document.getElementById('rolename').value="";
document.getElementById('DragContainer2').innerHTML="";
document.getElementById('DragContainer1').innerHTML="";
document.getElementById('container3').innerHTML="";
document.getElementById('group').value="select";
document.getElementById('deleterole').value="select";
ajaxCall();
}

function hideDiv(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='block';
document.getElementById('deleteDiv').style.display="none";
}

function hideDiv1(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='block';
document.getElementById('deleteDiv').style.display="none";
}

function hideDiv2(){
document.getElementById('editDiv').style.display='block';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="none";
ajaxCall();
}

function hideDiv3(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="block";
}

function show(){
alert("in show");
document.editFrm.action="UpdateActions.action";
document.editFrm.submit();
alert("after submit");
var s = "<%=result1%>";
alert(s);
if(s=="True"){
alert("in if");
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}
}
</script>

</HEAD>



<%
	String DivValue = (String) session.getAttribute("viewDiv");
	if (DivValue == null) {
		DivValue = "";
	}
	if (DivValue.equals("viewDiv1")) {
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv1();">
<%
	}
	if (DivValue.equals("viewDiv2")) {
%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv2();">
<%
	}

	if (DivValue.equals("viewDiv3")) {
%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv3();">
<%
	} else {
%>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv();">
<%
	}
%>


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
alert(index);
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
				<form name="addFrm" id="addFrm" action="AddActions.action">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Survey Type: </strong></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr align="center">
								<td align="center" class="suboptionh">Survey
								Type&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text"
									name="surveyType"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Add"> <input type="image"
									src="../images/add_x01.gif" alt="Add New" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</form>
				</div>

				<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete role \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->

				<div id="deleteDiv">
				<form name="delFrm" id="delFrm" action="DeleteActions.action">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Survey Type: </strong></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="suboption" align="center">Select Survey Type <font
									color="red">*</font><b> :&nbsp; </b><select name="surveyType"
									class="suboption" style="width: 155" id="surveyType">
									<option value="select">----------select-----------</option>
									<%
										for (int i = 0; i < surveyTypeList.size(); i++) {
											surType = (SurveyTypeDB) surveyTypeList.get(i);
											name = (String) surType.getSrt_name();
											id = surType.getSrt_id();
									%>
									<option value="<%=name %>"><%=name%></option>
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
				<form name="editFrm" id="editFrm" action="UpdateActions.action">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Survey Type: </strong></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="suboption" align="center">Select Survey Type <font
									color="red">*</font><b> :&nbsp; </b><select
									name="editsurveyType" class="suboption" style="width: 155"
									id="editsurveyType">
									<option value="select">----------select-----------</option>
									<%
										for (int i = 0; i < surveyTypeList.size(); i++) {
											surType = (SurveyTypeDB) surveyTypeList.get(i);
											name = (String) surType.getSrt_name();
											id = surType.getSrt_id();
									%>
									<option value="<%=name %>"><%=name%></option>
									<%
										}
									%>
								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" class="suboptionh">Survey
								Type&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text"
									name="surveyType"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Update"> <input type="image"
									src="../images/up_date_01.gif" alt="Update" onclick=" return show();"/></td>
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
