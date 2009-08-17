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
<script language="javascript" src="../js/Dynamic_Skill.js"></script>
<sx:head cache="false" compressed="true" />
<script>

function deleteItem(){
document.getElementById('msgDelDiv').innerHTML="";
document.getElementById('deleteDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('addDiv').style.display="none";
}
function addItem(){
document.getElementById('msgAddDiv').innerHTML="";
document.getElementById('addDiv').style.display="block";
document.getElementById('editDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}
function editItem(){
document.getElementById('msgEditDiv').innerHTML="";
document.getElementById('editDiv').style.display="block";
document.getElementById('addDiv').style.display="none";
document.getElementById('deleteDiv').style.display="none";
}
function hideDiv(){
document.getElementById('editDiv').style.display='none';
document.getElementById('addDiv').style.display='block';
document.getElementById('deleteDiv').style.display="none";
document.getElementById('question').style.display='none';
}

function showScale(val)
{
	var str="<table width='780' border='0' align='center' >";	
	var start=0;
	var count=1;
	for(var i=start;i<val;i++)
	{
		str+="<tr><td width='350'align='right' class='suboption' >Label:<input type='text' value='' name='label'></td><td align='left' class='suboption' >Weight:&nbsp;<input type='text' value="+count+++" readonly></td></tr>";
	}
	str+="</table>";
	document.getElementById('quesPrevDiv').innerHTML=str;
	document.getElementById('quesPrevDiv').style.display='block';
	document.getElementById('choice').style.display='none';
}
function showQuestion(val)
{ 
    document.getElementById('question').style.display='block';
    document.getElementById('quesPrevDiv').style.display='none';
    document.getElementById('choice').style.display='block';
    document.getElementById('scale').style.display='none';
    //document.getElementById('descriptivetext').style.display='none';
    if(val=="3"){
	document.getElementById('scale').style.display='block';
	document.getElementById('choice').style.display='none';
	document.getElementById('rowchoice').style.display='block';
	//document.getElementById('descriptivetext').style.display='none';
	}
	if(val=="6"){
	document.getElementById('scale').style.display='none';
	document.getElementById('choice').style.display='none';
	document.getElementById('rowchoice').style.display='none';
	//document.getElementById('descriptivetext').style.display='block';
	}
	if(val=="1"||val=="2"){
    document.getElementById('choice').style.display='block';
	document.getElementById('rowchoice').style.display='none';
	//document.getElementById('descriptivetext').style.display='none';
	}
	if(val=="4"||val=="5"){
    document.getElementById('choice').style.display='block';
	document.getElementById('rowchoice').style.display='block';
	//document.getElementById('descriptivetext').style.display='none';
	}
}
function preview(){
var label="";
var question=document.getElementById('questiontext').value;
var choices=document.getElementById('answerChoices').value;
var questionType=document.getElementById('questionType').value;
var rowchoices=document.getElementById('rowChoices').value;
//var desctext = document.getElementById('desctext').value;
myForm=document.addFrm
el=myForm.elements["label"]
if(myForm.elements["label"]!=undefined){
for(var i=0;i<myForm.elements["label"].length;i++){
var label1=myForm.elements["label"][i].value;
label+=label1+","
}
}
var winRef =""; 
winRef=window.open("preview.jsp?question="+question+"&choices="+choices+"&label="+label+"&questionType="+questionType+"&rowchoices="+rowchoices,"Preview","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,WIDTH=500,HEIGHT=150,top=180,left=200");
return false;
}

function getQuestions() {
	dojo.event.topic.publish("questions");
}
function showQuestionDetails()
{
document.getElementById('editquestion').style.display='block';
	document.getElementById('editCategoryDiv').style.display='block';
	dojo.event.topic.publish("questionsDetail");
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
			</tr>
		</table>

		<table width="780" border="1" align="center" cellpadding="0"
			cellspacing="0" class="tableborderl">
			<tr>
				<td>
				<table width="780" border="0" align="center">
					<tr>
						<td>
						<div id="addDiv">
						<form name="addFrm" id="addFrm" action="addQuestionActions.action">
						<table width="780" border="0" align="center">
							<tr bgcolor="#719ce8">
								<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
									class="mainheading"><strong>&nbsp;&nbsp; Add
								Question: </strong></span></td>
							</tr>
							
							<tr>
								<td align="center" class="suboptionh">
								<div id="msgAddDiv"><s:property value="message" /></div>
								</td>
							</tr>
							
							<tr>
								<td>
								<table width="780" border="0" align="center">
									<tr>
										<td align="right" class="suboption" width="350">Select
										Question Type:</td>
										<td align="left"><select name="questionType"
											class="suboption" id="questionType" style="width: 250"
											onchange="showQuestion(this.value)">
											<option value="0">-------------------Select-------------------</option>
											<option value="1">Multiple Choice (Single Answer)</option>
											<option value="2">Multiple Choice (Multiple Answer)</option>
											<option value="3">Rating Scale (Multiple Answer)</option>
											<option value="4">Matrix of choices(Only One Answer
											Per Row)</option>
											<option value="5">Matrix of choices(Multiple Answers
											Per Row)</option>
											<option value="6">Descriptive Text</option>
										</select></td>
									</tr>
								</table>
								<div id="question">
								<table width="780" border="0" align="center">
									<tr>
										<td align="right" class="suboption" width="350">Enter
										Question:</td>

										<td align="left"><textarea id="questionText"
											name="questionText"></textarea></td>
									</tr>
									<tr>
										<td align="right" class="suboption" width="350">Add to
										Category:</td>

										<td align="left"><s:select name="questionCategory"
											id="questionCategory" list="categoryList" listKey="qsc_id"
											listValue="qsc_name" headerKey="0"
											
											cssClass="suboption" cssStyle="width: 155"
											title="Select Questions Category" theme="simple" /></td>
									</tr>
								</table>
								<div id="rowchoice">
								<table>
									<tr>
										<td align="right" class="suboption" width="350">Row
										Labels (each label separated by comma):</td>
										<td align="left" class="suboption"><textarea
											id="rowChoices" name="rowChoices"></textarea></td>
									</tr>
								</table>
								</div>
								<div id="choice">
								<table>
									<tr>
										<td align="right" class="suboption" width="350">Answer
										Choices (each choice separated by comma):</td>
										<td align="left" class="suboption"><textarea
											id="answerChoices" name="answerChoices"></textarea></td>
									</tr>
								</table>
								</div>
								<div id="scale">
								<table>
									<tr>
										<td align="right" class="suboption" width="350">Select
										Scale:</td>
										<td align="left"><select name="questionType"
											id="questionType" class="suboption"
											onchange="showScale(this.value)">
											<option value="0">--Choose Scale--</option>
											<option value="2">Scale of 2</option>
											<option value="4">Scale of 4</option>
											<option value="6">Scale of 5</option>
											<option value="8">Scale of 8</option>
											<option value="10">Scale of 10</option>
										</select></td>
									</tr>
								</table>
								</div>
								<div id="quesPrevDiv"></div>
								</div>
								</td>
							</tr>
							<tr>
								<td align="right" class="suboption" width="450" colspan="2">
								<input type="button" class="button1" style="width: 80"
									name="selectName" value="Preview" onclick="return preview();">
								&nbsp;&nbsp;<input type="submit" class="button1"
									style="width: 80" value="Add"></td>
							</tr>
						</table>
						</form>
						</div>
	<!--///////////////////////////////////////// delete question /////////////////////////////////////-->
						<div id="deleteDiv">
						<form name="delFrm" id="delFrm"
							action="deleteQuestionActions.action">
						<table width="780" border="0" align="center" c>
							<tr bgcolor="#719ce8">
								<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
									class="mainheading"><strong>&nbsp;&nbsp; Delete
								Question: </strong></span></td>
							</tr>
							
							<tr>
								<td align="center" class="suboptionh">
								<div id="msgDelDiv"><s:property value="message" /></div>
								</td>
							</tr>
							
							<tr>
								<td>
								<table width="500" border="0" align="center">
									<tr>
										<td class="suboption" align="right" width="218px">Select
										Category <font color="red">*</font><b> :&nbsp; </b></td>
										<td><s:select name="questionCategory"
											id="questionCategory" list="categoryList" listKey="qsc_id"
											listValue="qsc_name" headerKey="0"
											cssClass="suboption" cssStyle="width: 155"
											title="Select Questions Category"
											onchange="javascript:getQuestions();return false;" theme="simple" /></td>
									</tr>
									<tr>
										<td colspan="2" class="suboption" align="center"><s:url
											id="questionUrl" action="getQuestionSelectBox.action" /> <sx:div
											id="questionDiv" href="%{questionUrl}"
											listenTopics="questions" formId="delFrm"></sx:div></td>
									</tr>
									<tr align="center">
										<td align="center" colspan="2"><input type="hidden"
											name="button" value="Delete"> <input type="image"
											src="../images/del_01.gif" alt="Delete" /></td>
									</tr>
								</table>
						</table>
						</form>
						</div>

						<!--///////////////////////////////////////// edit question /////////////////////////////////////-->

						<div id="editDiv"><s:form name="editFrm" id="editFrm"
							action="updateQuestionActions.action">
							<table width="780" border="0" align="center" >
								<tr bgcolor="#719ce8">
									<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
										class="mainheading"><strong>&nbsp;&nbsp; Edit
									Question: </strong></span></td>
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
											<td class="suboption" align="right" width="217px">Select
											Category<b> :&nbsp; </b></td>
											<td><s:select name="questionCategory"
												id="questionCategory" list="categoryList" listKey="qsc_id"
												listValue="qsc_name" headerKey="0"
												headerValue="----------select-----------"
												cssClass="suboption" cssStyle="width: 155"
												title="Select Questions Category"
												onchange="javascript:getQuestions();return false;"
												theme="simple" /></td>
										</tr>
										<tr>

											<td colspan="2" class="suboption" align="center"><s:url
												id="questionUrl" action="getQuestionSelectOnchange.action" />
											<sx:div id="questionDiv" href="%{questionUrl}"
												listenTopics="questions" formId="editFrm"></sx:div></td>

										</tr>
										</table>
										<div id="editquestion" style="display:none">
										<table width="500" border="1" align="center">
										 <tr>
											<td class="suboption" align="center"  colspan="2"><span
												id="editCategoryDiv" style="display:none">Select Category <font color="red">*</font><b> :&nbsp; </b><s:select name="editQuestionCategory"
												id="editQuestionCategory" list="categoryList"
												listKey="qsc_id" listValue="qsc_name" headerKey="0"
												headerValue="----------select-----------"
												cssClass="suboption" cssStyle="width: 155"
												title="Select Questions Category" theme="simple" /></span></td>
										</tr> 
										<tr>

											<td colspan="2" class="suboption" align="center"><s:url
												id="questionUrl" action="getQuestionDetails.action" /> <sx:div
												id="questionDetailDiv" href="%{questionUrl}"
												listenTopics="questionsDetail" formId="editFrm"></sx:div></td>
										</tr>
									</table>
									</div>
									</td>
								</tr>
							
								<tr align="center">
									<td align="center" colspan="2"><input type="hidden"
										name="button" value="Update"> <input type="image"
										src="../images/up_date_01.gif" alt="Update" /></td>
								</tr>
							</table>
						</s:form></div>
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
