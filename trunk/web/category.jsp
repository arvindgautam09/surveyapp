
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<link href="css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="css/style_search.css" rel="stylesheet" type="text/css">
<link href="css/aw.css" rel="stylesheet" type="text/css">
<script src="js/aw.js"></script>

<html>
<HEAD>
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
				<form name="addFrm" id="addFrm">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Add
						Category: </strong></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr align="center">
								<td align="center" class="suboptionh">Category Name&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text"
									name="category" value=""></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Add"> <input type="image"
									src="images/add_x01.gif" alt="Add New" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</form>
				</div>

				<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete role \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->

				<div id="deleteDiv">
				<form name="delFrm" id="delFrm">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Delete
						Category: </strong></span></td>
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
									color="red">*</font><b> :&nbsp; </b><select name="delCategory"
									class="suboption" style="width: 155" id="delCategory">
									<option value="0">--Others--</option>
									<option value="1">Accounts Related</option>
									<option value="2">Food related</option>
									<option value="3">HR related</option>
									<option value="4">Admin related</option>

								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Delete"> <input type="image"
									src="images/del_01.gif" alt="Delete" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</form>
				</div>


				<!--///////////////////////////////////////// edit role /////////////////////////////////////-->

				<div id="editDiv">
				<form name="editFrm" id="editFrm">
				<table width="780" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr bgcolor="#719ce8">
						<td height="18px" colspan="3" nowrap bgcolor="#719CE8"><span
							class="mainheading"><strong>&nbsp;&nbsp; Edit
						Category: </strong></span></td>
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
									color="red">*</font><b> :&nbsp; </b><select name="editCategory"
									class="suboption" style="width: 155" id="editCategory">
									<option value="0">--Others--</option>
									<option value="1">Accounts Related</option>
									<option value="2">Food related</option>
									<option value="3">HR related</option>
									<option value="4">Admin related</option>

								</select></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" class="suboptionh">Category Name&nbsp;:&nbsp;<input type="text"
									name="categoryName" value=""></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center"><input type="hidden" name="button"
									value="Update"> <input type="image"
									src="images/up_date_01.gif" alt="Update" /></td>
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
