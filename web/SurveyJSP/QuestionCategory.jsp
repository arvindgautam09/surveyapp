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
function deleteItem(){
document.getElementById('msgDeleteDiv').innerHTML="";
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
}
</script>
</HEAD>
<%String DivValue = (String)session.getAttribute("key");
	if(DivValue==null) {
		DivValue="";
		}
%>
<%
if(false) {
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
else{ }}
%>
<body topmargin="7" rightmargin="7" leftmargin="7" onload="">
<%
//}
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
				<td><!--//////////////////////////////////////////////add/////////////////////////////-->
				<div id="addDiv">
				<s:form name="addFrm" id="addFrm" action="addCategory.action"  validate="true">
				<!--<s:hidden name="categoryList" value="categoryList"></s:hidden>
				<s:set name="categoryList" value="%{categoryList}" scope="session"/>-->
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Category: </strong></span></td>
					</tr>
					
					<tr>
						<td align="center" class="suboptionh">
						<div id="msgAddDiv">
						<s:property
							value="message" /></div><s:fielderror/></td>
					</tr>
				
					<tr>
						<td>
						<table width="500" border="0" align="center" >
							<tr align="center">
								<td align="center" class="suboptionh">Category<font
									color="red">*</font><b> :&nbsp; </b><s:textfield name="questionCategory"
									value="" required="true" requiredposition="right"
									label="Question Category " theme="simple" cssClass="suboption" cssStyle="width:155px"/></td>
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
				</s:form>
				</div>


				<div id="deleteDiv">
				<s:form name="delFrm" id="delFrm" action="deleteCategory.action" validate="true">
			<!--<s:hidden name="categoryList" value="categoryList"></s:hidden>-->
				<table width="780" border="0" align="center" >
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Category: </strong></span></td>
					</tr>
					
					<tr>
						<td align="center" class="suboptionh"><div id="msgDeleteDiv">
						<s:property
							value="message" /></div></td>
					</tr>
					
					<tr>
						<td>
						<table width="500" border="0" align="center" >
							<tr>
								<td class="suboption" align="center">Select Category <b> :&nbsp; </b><s:if
									test="categoryList!=null">
									<s:select name="categoryId" id="categoryId"
										cssClass="suboption" cssStyle="width: 155"
										list="categoryList" listKey="qsc_id" listValue="qsc_name" theme="simple"/>
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
				<s:form name="editFrm" id="editFrm" action="updateCategory.action" validate="true">
				<!--<s:hidden name="categoryList" value="categoryList"></s:hidden>-->
			<table width="780" border="0" align="center" >
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap="nowrap" bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Category: </strong></span></td>
					</tr>
				
					<tr>
						<td align="center" class="suboptionh"><div id="msgEditDiv">
						<s:property
							value="message" /></div><s:fielderror/></td>
					</tr>
				
					<tr>
						<td>
						<table width="780" border="0" align="center" >
							<tr>
								<td class="suboption" align="center">Select Category <b> :&nbsp; </b> <s:if
									test="categoryList!=null">
									<s:select name="categoryId" id="categoryId"
										cssClass="suboption" cssStyle="width: 155"
										list="categoryList" listKey="qsc_id" listValue="qsc_name" theme="simple" />
								</s:if></td>
							</tr>
							
							<tr align="center">
								<td align="center" class="suboption">Category Name&nbsp;:&nbsp;<s:textfield 
									name="questionCategory" value="" required="true" requiredposition="right" cssClass="suboption"  theme="simple" cssStyle="width:155px"/></td>
							</tr>
							
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Update"> <input type="image"
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
</BODY>
</html>
