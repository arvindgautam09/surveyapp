<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.okaya.services.survey.dataBean.QuestionCategoryDB"%>
<%@page import="com.okaya.services.survey.dataBean.QuestionDB"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
	QuestionCategoryDB quesCategory = new QuestionCategoryDB();
	QuestionDB quesDB = new QuestionDB();
	List categoryList = (List) session.getAttribute("CategoryList");
	List QuesNameList = (List) session.getAttribute("QuesNameList");
	if (categoryList == null) {
		categoryList = new ArrayList();
	}
	if (QuesNameList == null) {
		QuesNameList = new ArrayList();
	}
	int quesCategoryId;
	String quesCategoryName = "";
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
<script language="javascript" src="../js/CommonAjaxFunctions.js"></script>
<script language="javascript" src="../js/Dynamic_Skill.js"></script>
<script>
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
document.getElementById('question').style.display='none';
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
function getQuestionName(){
var questionCategory=document.getElementById("questionCategory").value;
var url="GetQuestionNameAjaxAction.action?questionCategory="+questionCategory+"&qsmId="+0;
var ajaxRequest=getAjaxRequest(); 
ajaxRequest.onreadystatechange = function() 
{ 
if
(ajaxRequest.readyState == 4) 
{ 
if 
(ajaxRequest.status == 200) { 
var resoText= ajaxRequest.responseText; 
//alert(resoText);
if(resoText!="")
            {   var strList=resoText.split(","); 
                var colStr="<SELECT NAME='questionName' class='suboption' style='width: 155' id='questionName'onchange='getQuesDetail()' ><option value='select'><font face='verdana' size='1' color='black'>----------select-----------</font></option>";        
              

            	for(var i=0;i<(strList.length-1);i++)
            	{
            	var colArr=strList[i].split(";");
            	colStr+="<option value='"+colArr[1]+"'>"+colArr[0]+"</option>";  
            		
            	}
            	colStr+="</select>";
            	document.getElementById("ques_nameid").innerHTML=colStr;
            	
            }
                 
} 
else { 
alert('There was a problem with the request.'); 
} 
}
} 
ajaxRequest.open("POST",url,true); 
ajaxRequest.send(null); 
}

function getQuesDetail(){
//alert("in getQuesDetail");
var qsmId=document.getElementById("questionName").value; 
var url="GetQuestionNameAjaxAction.action?qsmId="+qsmId+"&index="+0;
var ajaxRequest=getAjaxRequest(); 
ajaxRequest.onreadystatechange = function() 
{ 
if
(ajaxRequest.readyState == 4) 
{ 
if 
(ajaxRequest.status == 200) { 
var resoText= ajaxRequest.responseText; 
if(resoText!="")
           {   
             var strList=resoText.split("/"); 
             var colList=strList[0].split(",");
             var rowList=strList[1].split(",");
              var colStr="";
              var rowstr="";
              //for column choices
              if(colList!="")
              {
              for(var i=0;i<(colList.length-1);i++)
              	{
            	var colArr=colList[i].split(";");
            	colStr+="<input type='text' value='"+colArr[0]+"' name='ansChoice' class='suboption'><br>";
            	}
            	document.getElementById("EnterAnsChoice").style.display="block"         	  
            	document.getElementById("ans_choiceid").innerHTML=colStr;  
            	document.getElementById("editQuestionChoices").style.display="block"
            	}
            	
            	else{
                document.getElementById("EnterAnsChoice").style.display="block"
            	document.getElementById("ans_choiceid").innerHTML=""
            	document.getElementById("editQuestionChoices").style.display="block"
            	}
            //for row choices	 
            if(rowList!="")
              { 
            for(var i=0;i<(rowList.length-1);i++)
              	{
            	var colArr=rowList[i].split(";");
            	rowstr+="<input type='text' value='"+colArr[0]+"' name='rowChoice' class='suboption'><br>";
            	}    
              document.getElementById("EnterRowChoice").style.display="block"	         	           	
           	  document.getElementById("row_choiceid").innerHTML=rowstr;  
           	  document.getElementById("editQuestionChoices").style.display="block"
           	  }
           	  else{
           	  document.getElementById("row_choiceid").innerHTML=""
           	 document.getElementById("EnterRowChoice").style.display="block"
           	 	 document.getElementById("editQuestionChoices").style.display="block"
           	
           	  //document.getElementById("row_choiceid").innerHTML="No row Choices"
           	  }
            	
            	
            }
               
} 
else { 
alert('There was a problem with the request.'); 
} 
}
} 
ajaxRequest.open("POST",url,true); 
ajaxRequest.send(null); 
}
</script>
</HEAD>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv1();">

<table width="780" border="0" align="center" cellpadding="0"
	cellspacing="0">

	<tr>
		<td>
		<table width="780" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td><script>
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
</script></td>
			</tr>
		</table>

		<table width="780" border="1" align="center" cellpadding="0"
			cellspacing="0" class="tableborderl">
			<tr>
				<td><!--//////////////////////////////////////////////add question/////////////////////////////-->
				<div id="addDiv">
				<form name="addFrm" id="addFrm" action="addQuestionActions.action">
				<table width="780" border="0" align="center">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Question: </strong></span></td>
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
									<option value="0">Select</option>
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

								<td align="left"><select name="categoryName"
									id="categoryName" multiple="multiple" size="3"
									class="suboption">
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesCategoryName = (String) quesCategory.getQsc_name();
											quesCategoryId = quesCategory.getQsc_id();
									%>
									<option value="<%=quesCategoryId %>"><%=quesCategoryName%></option>
									<%
										}
									%>
								</select></td>
							</tr>
						</table>


						<div id="rowchoice">
						<table>
							<tr>
								<td align="right" class="suboption" width="350">Row Labels
								(each label separated by comma):</td>
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
						&nbsp;&nbsp;<input type="submit" class="button1" style="width: 80"
							value="Add"></td>
					</tr>
				</table>
				</form>
				</div>
				<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete question \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
				<div id="deleteDiv">
				<form name="delFrm" id="delFrm">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Question: </strong></span></td>
					</tr>
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
									name="deleteCategory" class="suboption" style="width: 155"
									id="deleteCategory">
									<option value="select">----------select-----------</option>
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesCategoryName = (String) quesCategory.getQsc_name();
											quesCategoryId = quesCategory.getQsc_id();
									%>
									<option value="<%=quesCategoryId %>"><%=quesCategoryName%></option>
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


				<!--///////////////////////////////////////// edit question /////////////////////////////////////-->

				<div id="editDiv">
				<form name="editFrm" id="editFrm">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Question: </strong></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="400" border="0" align="center"  >
							<tr>
								<td class="suboption" align="right">Select Category <font
									color="red">*</font><b> :&nbsp; </b></td><td><select name="editCategory"
									class="suboption" style="width: 155" id="editCategory"
									onchange="getQuestionName()" >
									<option value="select">----------select-----------</option>
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesCategoryName = (String) quesCategory.getQsc_name();
											quesCategoryId = quesCategory.getQsc_id();
											//System.out.println("quesCategoryId---->"+quesCategoryId);
									%>
									<option value="<%=quesCategoryId %>"><%=quesCategoryName%></option>
									<%
										}
									%>

								</select></td>
							</tr>
							<tr>
								<td class="suboption" align="right" >Select Question <font
									color="red">*</font><b> :&nbsp; </b></td><td><span id="ques_nameid"><select
									name="questionName" class="suboption" style="width: 155"
									id="questionName" onchange='getQuesDetail()'>
									<option value="select">----------select-----------</option>


								</select></span></td>
							</tr>
							
							
							</table>
							<div id="editQuestionChoices" style="display:none">							
							<table  width="500" border="1" align="center"  >
							
								<tr>
								<td class="suboption" align="right" width="208px">Question Category <font
									color="red">*</font><b> :&nbsp; </b></td>
									
									<td><select name="editCategory"
									class="suboption" style="width: 155" id="editQuestionCategory"
									 >
									<option value="select">----------select-----------</option>
									<%
										for (int i = 0; i < categoryList.size(); i++) {
											quesCategory = (QuestionCategoryDB) categoryList.get(i);
											quesCategoryName = (String) quesCategory.getQsc_name();
											quesCategoryId = quesCategory.getQsc_id();
											//System.out.println("quesCategoryId---->"+quesCategoryId);
%>
									<option value="<%=quesCategoryId %>"><%=quesCategoryName%></option>
									<%
										}
									%>

								</select>
                               
                                </td>
							</tr>
							
							<tr>
								<td class="suboption" align="right" width="208px">Enter Question  <font
									color="red">*</font><b> :&nbsp; </b></td>
									
									<td>
									<input type="text" class="suboption" name="newQuestion" id="newQuestion">                            
                                </td>
							</tr>
							
							<tr>
								<td class="suboption" align="right">Answer choices <font
									color="red">*</font><b> :&nbsp; </b></td><td><span id="ans_choiceid" class="suboption">
								<input type="text" name="ansChoice" class="suboption"></span> 
								<span id="EnterAnsChoice" style="display:none">
								<img src='../images/add1.gif' onClick="javascript:addElement();">
								<img src='../images/del.gif' onClick="javascript:removeElement();">
							    <div id="content"></div></span>
                                </td>
							</tr>
							<tr>
								<td class="suboption" align="right">Row choices <font
									color="red">*</font><b> :&nbsp; </b></td>
								<td><span id="row_choiceid" class="suboption"><input type="text" name="rowChoice" class="suboption"></span>
								<span id="EnterRowChoice" style="display:none"><img src='../images/add1.gif' onClick="javascript:addRowElement();">
								<img src='../images/del.gif' onClick="javascript:removeRowElement();">
							    <div id="contentRow"></div></span>
								</td>
							</tr>
							<tr><td></td></tr>
							<tr align="center">
								<td align="center" colspan="2"><input type="hidden" name="button"
									value="Update"> <input type="image"
									src="../images/up_date_01.gif" alt="Update" /></td>
							</tr>
							</table>
							</div>
							
						
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














