
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<link href="css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="css/style_search.css" rel="stylesheet" type="text/css">
<link href="css/aw.css" rel="stylesheet" type="text/css">
<script src="js/aw.js"></script>



<html>
<HEAD>
<TITLE>e-Product</TITLE>


<script language=JavaScript>

function ajaxCall(){
var ajaxRequest=getAjaxRequest();

// Create a function that will receive data sent from the server
ajaxRequest.onreadystatechange = function(){
//alert(ajaxRequest.readyState);
if(ajaxRequest.readyState == 4){
if(ajaxRequest.status==200)
{
var resoText= ajaxRequest.responseText;

var sss="?";
var s="@";
var ss="!";

var res2=resoText.substring(0,resoText.indexOf(sss));

var res=resoText.substring(resoText.indexOf(sss)+1,resoText.indexOf(s));
if(res=="?")
{
res="";
}
var res1=resoText.substring(resoText.indexOf(s)+1,resoText.indexOf(ss));

if(res1=="???" || res1=="?")
{
res1="";
}

document.getElementById('container3').innerHTML = res2;
document.getElementById('DragContainer1').innerHTML = res1;
document.getElementById('DragContainer2').innerHTML =res;
}
}
}
var userentity = document.getElementById('group').value;

var queryString = "?entity="+userentity;
queryString=queryString +"&sid="+Math.random();

ajaxRequest.open("POST","../security/userRoleTo.po"+queryString, true);
ajaxRequest.send(null);
}

function ajaxFunction()
{

var ajaxRequest=getAjaxRequest();

ajaxRequest.onreadystatechange = function(){

if(ajaxRequest.readyState == 4){

if(ajaxRequest.status==200)
{

var ajaxDisplay = document.getElementById('ajaxDiv');
//alert(ajaxRequest.responseText);
if(ajaxRequest.responseText!="")
{
ajaxDisplay.innerHTML = ajaxRequest.responseText;
document.getElementById('rolename').value="";
document.getElementById('rolename').focus();
}
else{
if(ajaxDisplay!=null)
{
ajaxDisplay.innerHTML="";
}
}
}
}
}


var roleName = document.getElementById('rolename').value;
roleName=alltrim(roleName);

if(roleName=='')
{
document.getElementById('rolename').value="";
document.getElementById('rolename').select();
return false;
}
var queryString ="?roleName="+roleName;


queryString=queryString +"&sid="+Math.random();
var url="../security/checkRoleName.po"+queryString;
//alert("========");
ajaxRequest.open("POST",url, true);

ajaxRequest.send(null);

}
function ajaxEditFunction()
{
var ajaxRequest=getAjaxRequest();

ajaxRequest.onreadystatechange = function(){

if(ajaxRequest.readyState == 4){

if(ajaxRequest.status==200)
{

var ajaxDisplay = document.getElementById('ajaxDiv1');

if(ajaxRequest.responseText!="")
{
ajaxDisplay.innerHTML = ajaxRequest.responseText;
document.getElementById('rolename1').value="";
document.getElementById('rolename1').focus();
}
else{
if(ajaxDisplay!=null)
{
ajaxDisplay.innerHTML="";
}
}
}
}
}


var roleName1 = document.getElementById('rolename1').value;
var oldrolename = document.getElementById('oldrolename').value;
roleName1=alltrim(roleName1);
oldrolename=alltrim(oldrolename);

if(roleName1=='')
{
document.getElementById('rolename1').value="";
document.getElementById('rolename1').select();
return false;
}
var queryString ="?roleName1="+roleName1+"&oldrolename="+oldrolename;

queryString=queryString +"&sid="+Math.random();
var url="../security/checkEditRoleName.po"+queryString;
//alert("========");
ajaxRequest.open("POST",url, true);

ajaxRequest.send(null);

}

function hideMsg()
{
document.getElementById('msg1').innerHTML="";
document.getElementById('msg2').innerHTML="";
if(document.getElementById('ajaxDiv').innerHTML!="")
{
document.getElementById('ajaxDiv').innerHTML="";
}

}

function hideMsg3()
{
document.getElementById('msg2').innerHTML="";
if(document.getElementById('ajaxDiv1').innerHTML!="")
{
document.getElementById('ajaxDiv1').innerHTML="";
}

}

function hideMsg1()
{
document.getElementById('msg3').innerHTML="";
document.getElementById('msg4').innerHTML="";
}

function hideMsg2()
{
document.getElementById('msg5').innerHTML="";
document.getElementById('msg6').innerHTML="";
document.getElementById('ajaxDiv1').innerHTML="";
}
function show(){
document.getElementById('edit').style.display='block';
}
function alltrim(str) {
return str.replace(/^\s+|\s+$/g, '');
}


</script>


<script>






function deleteItem(){
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


function addItem(){
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

function editItem(){
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
document.getElementById('edit').style.display='none';
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


// this method access on add role block

function moveForAdd()
{
var val=document.addRoleFrm.plist1.value;
if(document.addRoleFrm.plist1.length==0)
{
alert("No privilege to move!");
}else{
if(val==null || val=="")
{
alert("Please select role for a user");
}else
{
moveDualList(document.addRoleFrm.plist1,document.addRoleFrm.plist2,false);
}
}
}

function moveForUpdate()
{
var val=document.updateRole.plist4.value;

if(document.updateRole.plist4.length==0)
{
alert("No privilege to move!");
}else{
if(val==null || val=="")
{
alert("Please select role for a user");
}else
{
moveDualList(document.updateRole.plist4,document.updateRole.plist3,false);
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


function checkAllAdd()
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

}



</script>

</HEAD>

<body topmargin="7" rightmargin="7" leftmargin="7" onload="hideDiv1();">






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
						<td><!--//////////////////////////////////////////////add role/////////////////////////////-->
						<div id="addDiv">
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr bgcolor="#719ce8">
								<td height="18px" colspan="3" nowrap bgcolor="#719ce8"><span
									class="mainheading"><strong>&nbsp;&nbsp; Create
								Survey : </strong></span></td>
							</tr>
						</table>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
						
							<tr align="center">
								<td align="right" class="suboption" width="350">Survey
								Type:</td>
								<td align="left"><select name="surveytype"
									class="suboption" style="width: 155" id="surveytype"
									onchange="hideMsg1();" title="Select Survey">
									<option value="select">----------select-----------</option>
									<option value="1">ESS (Monthly)</option>
									<option value="2">Clients Feedback</option>
									<option value="3">ESS (Once)</option>
									<option value="4">ESS (OTC)</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Survey
								Name:</td>
								<td align="left"><input type="text" name="surveyname"
									value=""></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Repeat
								Count:</td>
								<td align="left"><select name="repeatcount"
									class="suboption" style="width: 155" id="repeatcount"
									onchange="hideMsg1();" title="Select Survey Count">
									<option value="select">----------select-----------</option>
									<option value="Once">Once</option>
									<option value="Periodic">Periodic</option>

								</select></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>

							<tr align="center">
								<td align="right" class="suboption" width="350">Repeat
								Interval:</td>
								<td align="left"><select name="repeatinterval"
									class="suboption" style="width: 155" id="repeatinterval"
									onchange="hideMsg1();" title="Select Repeat Interval">
									<option value="select">----------select-----------</option>
									<option value="monthly">Monthly</option>
									<option value="weekly">Weekly</option>
								</select></td>
							</tr>

							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Questions
								Category:</td>
								<td align="left"><select name="questionscategory"
									class="suboption" style="width: 155" id="questionscategory"
									onchange="hideMsg1();" title="Select Questions Category">
									<option value="0">--Others--</option>
									<option value="1">Accounts Related</option>
									<option value="2">Food related</option>
									<option value="3">HR related</option>
									<option value="4">Admin related</option>
								</select></td>
							</tr>
							<tr>

								<td colspan="2">

								<table width="60%" align="center" border="0">
									<tr>

										<td width="33%">
										<table border="0">
											<tr>
												<td class="suboptionh"><strong>Selected
												Category</strong></td>
											</tr>
											<tr>
												<td bordercolor="1"><select multiple size="10"
													name="plist1" class="suboption">


													<option value="">aaaaaaaaaaaaaaaaaaaaa</option>
												</select></td>

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
													value="Remove<<"   onclick="moveDualList(document.addRoleFrm.plist2,document.addRoleFrm.plist1, false);">
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

												<table width="100%" border=1 valign="top"
													class="TableBorderline">

													<tr>
														<td nowrap><select multiple size="10" name="plist2"
															class="suboption">
															<option>aaaaaaaaaaaaaaaaaaaaa</option>
														</select></td>
													</tr>
												</table>
												</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>


								</td>
							</tr>


							<tr align="center">
								<td align="center" colspan="2"><input type="hidden"
									name="button" value="Add"> <input type="image"
									src="images/add_x01.gif" alt="Create Survey"
									onclick="javascript:return checkAllAdd();" /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden"
									name="button" value="Send"> <input type="image"
									src="images/send_.01.gif" alt="Send Survey"
									onclick="javascript:return checkAllAdd();" /></td>
							</tr>
						</table>
						</div>

						<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\delete role \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->

						<div id="deleteDiv">
						<form  name="delFrm"
							id="delFrm">
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr bgcolor="#719ce8">
								<td height="18px" colspan="3" nowrap bgcolor="#719ce8"><span
									class="mainheading"><strong>&nbsp;&nbsp; Delete
								Survey : </strong></span></td>
							</tr>
						</table>

						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>&nbsp;</td>
							</tr>

							<tr>
								<td>

								<table width="780" border="0" align="center" cellpadding="0"
									cellspacing="0">

									<tr align="center">
										<td align="center" class="suboption">Select Survey Name
										:&nbsp;<select name="surveyname" class="suboption"
											style="width: 155" id="surveyname" onchange="hideMsg1();"
											title="Select Survey">
											<option value="select">----------select-----------</option>
									<option value="1">ESS (Monthly)</option>
									<option value="2">Clients Feedback</option>
									<option value="3">ESS (Once)</option>
									<option value="4">ESS (OTC)</option>
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="center"><input type="hidden"
									name="button" value="delete"> <input type="image"
									src="images/del_01.gif" alt="Delete Survey"
									onclick="javascript:return checkAllAdd();" /></td>
									</tr>

								</table>
								</td>
							</tr>

						</table>
						</form>
						</div>

						<!--///////////////////////////////////////// edit role /////////////////////////////////////-->

						<div id="editDiv">
						<form name="editFrm"
							id="editFrm">
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr bgcolor="#719ce8">
								<td height="18px" colspan="3" nowrap bgcolor="#719ce8"><span
									class="mainheading"><strong>&nbsp;&nbsp; Edit
								Survey : </strong></span></td>
							</tr>
						</table>
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Select
								Survey Name:</td>
								<td align="left"><select name="surveyname"
									class="suboption" style="width: 155" id="surveyname"
									onchange="hideMsg1();" title="Select Survey">
									<option value="select">----------select-----------</option>
								</select>&nbsp;&nbsp;<input type="button" name="button"
									value="Edit" onclick="show();" class="suboptionh"/> </td>
							</tr>
						</table>
						<div id="edit">
						<table width="780" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Survey
								Type:</td>
								<td align="left"><select name="surveytype"
									class="suboption" style="width: 155" id="surveytype"
									onchange="hideMsg1();" title="Select Survey">
									<option value="select">----------select-----------</option>
									<option value="1">ESS (Monthly)</option>
									<option value="2">Clients Feedback</option>
									<option value="3">ESS (Once)</option>
									<option value="4">ESS (OTC)</option>
								</select>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Repeat
								Count:</td>
								<td align="left"><select name="repeatcount"
									class="suboption" style="width: 155" id="repeatcount"
									onchange="hideMsg1();" title="Select Survey Count">
									<option value="select">----------select-----------</option>
									<option value="Once">Once</option>
									<option value="Periodic">Periodic</option>

								</select></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>

							<tr align="center">
								<td align="right" class="suboption" width="350">Repeat
								Interval:</td>
								<td align="left"><select name="repeatinterval"
									class="suboption" style="width: 155" id="repeatinterval"
									onchange="hideMsg1();" title="Select Repeat Interval">
									<option value="select">----------select-----------</option>
									<option value="monthly">Monthly</option>
									<option value="weekly">Weekly</option>
								</select></td>
							</tr>

							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Questions
								Category:</td>
								<td align="left"><select name="questionscategory"
									class="suboption" style="width: 155" id="questionscategory"
									onchange="hideMsg1();" title="Select Questions Category">
									<option value="select">----------select-----------</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr align="center">
								<td align="right" class="suboption" width="350">Status:</td>
								<td align="left"><input type='radio' value="open"
									name="status">Open<input type='radio' value="close"
									name="status">Close
								<td>
							</tr>
							<tr>
								<td colspan="2">
								<table width="60%" align="center" border="0">
									<tr>
										<td class="suboptionh"><b> </b></td>
										<td>
										<table border="0">
											<tr>
												<td class="suboptionh"><strong>Selected
												Categories</strong></td>
											</tr>
											<tr>
												<td>
												<table width="100%" border=1 valign="top"
													class="TableBorderline">
													<tr>
														<td nowrap><select multiple size="10" style=""
															"120" name="plist1" class="suboption">


															<option value=""></option>
														</select></td>
													</tr>
												</table>
												</td>
											</tr>
										</table>
										</td>
										<td>
										<table width="60%">
											<tr>
												<td width="40%" align="center"><input class="button1"
													type="button" style="width: 80" name="add" value="Add>>"
													onclick="moveForAdd();"></td>
											</tr>
											<tr>
												<td width="40%" align="center"><input class="button1"
													type="button" style="width: 80" name="remove"
													value="Remove<<"   onclick="moveDualList(document.addRoleFrm.plist2,document.addRoleFrm.plist1, false);">
												</td>
											</tr>
										</table>
										</td>
										<td>
										<table border="0">
											<tr>
												<td class="suboptionh" align="center"><strong></strong></td>
											</tr>
											<tr>
												<td>

												<table width="100%" border=1 valign="top"
													class="TableBorderline">

													<tr>
														<td nowrap><select multiple size="10" style=""
															"120" name="plist2" class="suboption">
														<option>

</option>
														</select></td>
													</tr>
												</table>
												</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>


								</td>
							</tr>


							<tr align="center">
								<td align="center" colspan="2"><input type="hidden" name="button"
									value="Update"> <input type="image"
									src="images/up_date_01.gif" alt="Update" /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden"
									name="button" value="Send"> <input type="image"
									src="images/send_.01.gif" alt="Send Survey"
									onclick="javascript:return checkAllAdd();" /></td>
							</tr>
						</table>
						</div>
						</form>
						</div>
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
