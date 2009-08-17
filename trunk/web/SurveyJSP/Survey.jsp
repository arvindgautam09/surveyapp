<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<HEAD>
<TITLE>e-Product</TITLE>

<link href="../css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="../css/style_search.css" rel="stylesheet" type="text/css">
<link href="../css/aw.css" rel="stylesheet" type="text/css">
<script src="../js/aw.js"></script>
<sx:head cache="false" compressed="true" />
<script>




function alltrim(str) {
return str.replace(/^\s+|\s+$/g, '');
}


</script>


<script>






function deleteItem(){
document.getElementById('deleteDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('addDiv').style.display="none";
}


function addItem(){
document.getElementById('addDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}

function editItem(){
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
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
document.getElementById('edit').style.display='none';
}

/*function hideDiv2(){
document.getElementById('editDiv').style.display='block';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="none";
}

function hideDiv3(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='none';
document.getElementById('deleteDiv').style.display="block";
}*/


// this method access on add role block

function moveForAdd()
{
var val=document.addFrm.queslist.value;
if(document.addFrm.queslist.length==0)
{
alert("No privilege to move!");
}else{
if(val==null || val=="")
{
alert("Please select role for a user");
}else
{
moveDualList(document.addFrm.queslist,document.addFrm.selectedQuestionList,false);
}
}
}

function moveForUpdate()
{
alert("update");
var val=document.editFrm.queslist.value;
alert(val);
if(document.editFrm.queslist.length==0)
{
alert("No privilege to move!");
}else{
if(val==null || val=="")
{
alert("Please select role for a user");
}else
{
moveDualList(document.editFrm.queslist,document.editFrm.selectedQuestionList,false);
}
}
}


function moveDualList( srcList, destList, moveAll )
{
if(srcList.options.length==0)
{
alert("No item to remove");
}
if ((srcList.selectedIndex == -1) && (moveAll == false))
{
return;
}
newDestList = new Array( destList.options.length );
var len = 0;
for( len=0; len < destList.options.length; len++ )
{
if ( destList.options[ len ] != null )
{
newDestList[ len ] = new Option( destList.options[ len ].text, destList.options[len].value, destList.options[ len ].defaultSelected, destList.options[ len ].selected );
}
}
for(var i = 0; i < srcList.options.length; i++)
{
if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
{
newDestList[ len ] = new Option( srcList.options[i].text, srcList.options[i].value, srcList.options[i].defaultSelected, srcList.options[i].selected );
len++;
}
}
//newDestList.sort(compareOptionText );   BY TEXT
for ( var j = 0; j < newDestList.length; j++ )
{
if ( newDestList[ j ] != null )
{
destList.options[ j ] = newDestList[ j ];
}
}
for( var i = srcList.options.length - 1; i >= 0; i-- )
{
if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
{
srcList.options[i] = null;
}
}
} // End of moveDualList()


/*function checkAllAdd()
{
document.addRoleFrm.rolename.value=alltrim(document.getElementById("rolename").value);
alert(document.addRoleFrm.rolename.value);
if(document.addRoleFrm.rolename.value=="")
{
document.getElementById('msg2').innerHTML="Please Enter the Role Name";
//alert("Enter the role name to continue");
return false;
}
else
{

for(i=0;i<document.addRoleFrm.plist2.length;i++)
{
document.addRoleFrm.plist2.options[i].selected=true;
}
return true;

}

}*/

function show_details() {
document.getElementById('selectedCategory').style.display='block';
dojo.event.topic.publish("show_detail");

}
function edit_details() {
document.getElementById('questionDiv').style.display='block';
dojo.event.topic.publish("show_details");

}
function show(){
//document.getElementById('edit').style.display='block';
dojo.event.topic.publish("survey_details");
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
<body topmargin="7" rightmargin="7" leftmargin="7" onload="editItem();">
<%
}
if(DivValue.equals("AddKey")){
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="addItem();">
<%}

if(DivValue.equals("DeleteKey")){
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="deleteItem();">
<%}
else{
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv();">
<%}%>
<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>

		<table border='0' width='780' bgcolor='#ffffff'>
			<td width='780' height="3"></td>
		</table>
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
//window.location.reload();
if( index == 0 )
{
obj.setSelectedItems([0]);
addItem();
}
else if( index == 1 )
{
obj.setSelectedItems([1]);
editItem();

}
else if( index == 2 )
{
obj.setSelectedItems([2]);
deleteItem();
}
}
</script>
				<div style="border-top: 1px solid #999"></div>

			</tr>
		</table>

		<table width="780" border="1" align="center" cellpadding="0"
			cellspacing="0" class="tableborderl">
			<tr>
				<td>

				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
						<div id="addDiv"><s:form name="addFrm" id="addFrm"
							action="createSurvey.action">
							<table width="780" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr bgcolor="#719ce8">
									<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719ce8"><span
										class="mainheading"><strong>&nbsp;&nbsp;
									Create Survey : </strong></span></td>
								</tr>
							</table>
							<table width="780" border="0" align="center">
							<tr ><td align="center" class="suboption"  colspan="2"><s:fielderror/></td></tr>
								<tr align="center">
									<td align="right" class="suboption" width="350">Survey
									Type:</td>
									<td align="left"><s:if test="surveyTypeList!=null"><s:select name="surveyType"
										list="surveyTypeList" listKey="srt_id" listValue="srt_name"
										headerKey="0" 
										cssClass="suboption" cssStyle="width: 155"
										title="Select Survey Type" theme="simple" /></s:if></td>
								</tr>
								
								<tr align="center">
									<td align="right" class="suboption" width="350">Survey
									Name:</td>
									<td align="left"><s:textfield id="surveyName"
										name="surveyName" cssClass="suboption" cssStyle="width:155"
										value=""></s:textfield></td>
								</tr>
								
								<tr align="center">
									<td align="right" class="suboption" width="350">Repeat
									Count:</td>
									<td align="left"><select name="repeatcount"
										class="suboption" style="width: 155" id="repeatcount"
										title="Select Survey Count">
										<option value="0">Infinite</option>
										<%
											for (int i = 1; i <= 10; i++) {
										%>
										<option value="<%=i %>"><%=i%></option>
										<%
											}
										%>
									</select></td>
								</tr>


								<tr align="center">
									<td align="right" class="suboption" width="350">Repeat
									Interval:</td>
									<td align="left" class="suboption"><select
										name="repeatinterval" class="suboption" style="width: 155"
										id="repeatinterval" title="Select Repeat Interval">
										<option value="0">None</option>
										<option value="1">1</option>
										<option value="5">5</option>
										<option value="7">7</option>
										<option value="30">30</option>
										<option value="180">180</option>
										<option value="365">365</option>
									</select>day(s)</td>
								</tr>

								<tr align="center">
									<td align="right" class="suboption" width="350">Status:</td>
									<td align="left"><input type='radio' value="O"
										name="status" class="suboption"><font
										class="suboption">Open</font><input type='radio' value="C"
										name="status" class="suboption" checked="checked"> <font
										class="suboption">Close</font>
									<td>
								</tr>
								
								<tr align="center">
									<td align="right" class="suboption" width="350">Questions
									Category:</td>
									<td align="left"><s:if test="categoryList!=null"><s:select name="questionCategory"
										cssClass="suboption" id="questionCategory" list="categoryList"
										listKey="qsc_id" listValue="qsc_name" headerKey="0"
										headerValue="----------select-----------"
										cssStyle="width: 155" title="Select Questions Category"
										onchange="javascript:show_details();return false;" /></s:if></td>
									<td></td>



								</tr>
								<tr>

									<td colspan="2">

									<div id="selectedCategory" style="display: none">
									<table width="60%" align="center" border="1">
										<tr>

											<td width="33%">
											<table border="0">

												<tr>
													<td bordercolor="1"><s:url id="d_url"
														action="getQuestionListBox.action" /> <sx:div
														id="details" href="%{d_url}" listenTopics="show_detail"
														formId="addFrm"></sx:div></td>

												</tr>
											</table>
											</td>
											<td width="33%">
											<table>
												<tr>
													<td width="40%" align="center"><input class="button1"
														type="button" style="width: 80" name="add" value="Add>>"
														onclick="moveForAdd();"></td>
												</tr>
												<tr>
													<td width="40%" align="center"><input class="button1"
														type="button" style="width: 80" name="remove"
														value="Remove<<"   onclick="moveDualList(document.addFrm.selectedQuestionList,document.addFrm.queslist, false);">
													</td>
												</tr>
											</table>
											</td>
											<td width="33%">
											<table border="0">
												<tr>
													<td class="suboptionh" align="center"><strong></strong></td>
												</tr>
												<tr>
													<td>

													<table width="100%" border="0" valign="top"
														class="TableBorderline">

														<tr>
															<td nowrap="nowrap"><select multiple="multiple"
																size="10" name="selectedQuestionList" class="suboption"
																style="width: 155px">

															</select></td>
														</tr>
													</table>
												
											</table>
											
										</tr>




										<tr align="center">
											<td align="center" colspan="3"><input type="hidden"
												name="createSurvey" value="createSurvey"> <input
												type="image" src="../images/Create_survery.gif"
												alt="Create Survey" /> &nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>

									</table>
									</div>
							</table>

						</s:form></div>

						<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete role \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->

						<div id="deleteDiv"><s:form name="delFrm" id="delFrm"
							action="deleteSurvey.action">
							<table width="780" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr bgcolor="#719ce8">
									<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719ce8"><span
										class="mainheading"><strong>&nbsp;&nbsp;
									Delete Survey : </strong></span></td>
								</tr>
							</table>

							<table width="780" border="0" align="center" cellpadding="0"
								cellspacing="0">
								
								<tr>
									<td>

									<table width="780" border="0" align="center" cellpadding="0"
										cellspacing="0">

										<tr align="center">
											<td align="center" class="suboption">Select Survey Name
											:&nbsp; <s:if test="surveyNameList!=null">
												<s:select name="surveyName" cssClass="suboption"
													id="surveyName" list="surveyNameList" listKey="srm_id"
													listValue="srm_name" headerKey="0"
													headerValue="----------select-----------"
													cssStyle="width: 155" title="Select Survey Name" />
											</s:if></td>
										</tr>
										
										<tr>
											<td align="center" colspan="2"><input type="hidden"
												name="deleteSurvey" value="deleteSurvey"> <input
												type="image" src="../images/delete_survery.gif"
												alt="Delete Survey"
												onclick="javascript:return checkAllAdd();" /></td>
										</tr>

									</table>
									</td>
								</tr>

							</table>
						</s:form></div>

						<!--///////////////////////////////////////// edit role /////////////////////////////////////-->

						<div id="editDiv">
						<s:form name="editFrm" id="editFrm"
							action="updateSurvey.action">
							<table width="780" border="0" align="center">
								<tr bgcolor="#719ce8">
									<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719ce8"><span
										class="mainheading"><strong>&nbsp;&nbsp; Edit
									Survey : </strong></span></td>
								</tr>
							</table>
							<table width="500" border="0" align="center">
								
								<tr align="center">
									<td align="center" class="suboption">Select Survey Name
									:&nbsp; <s:if test="surveyNameList!=null"><s:select name="surveyName" cssClass="suboption"
										id="surveyName" list="surveyNameList" listKey="srm_id"
										listValue="srm_name" headerKey="0"
										headerValue="----------select-----------"
										cssStyle="width: 155" title="Select Survey Name"
										onchange="show();" theme="simple" /></s:if></td>
								</tr>

								<tr>
									<td><s:url id="d_url"
										action="getSurveyDetailOnChange.action" /> <sx:div
										id="surveydetail" href="%{d_url}"
										listenTopics="survey_details" formId="editFrm"></sx:div></td>
								</tr>


							
							

								<tr align="center">
									<td align="center" colspan="2"><input type="hidden"
										name="button" value="Update"> <input type="image"
										src="../images/edit_survey.gif" alt="Update" /></td>
								</tr>
							</table>
						</s:form>
						
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</BODY>
</html>
