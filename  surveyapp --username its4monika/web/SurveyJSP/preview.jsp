
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
    String question = request.getParameter("question");
	String choices = request.getParameter("choices");
	String label1 = request.getParameter("label");
	String questionType = request.getParameter("questionType");
	String rowchoices = request.getParameter("rowchoices");
	//String desctext = request.getParameter("desctext");
	String label = "";
	int lastIndex = 0;
	if (questionType.equals("1") || questionType.equals("2")) {
		//desctext = "";
		label1 = "";
		rowchoices = "";
	} else if (questionType.equals("3")) {
		choices = "";
		//desctext = "";
		if (label1.length() != 0) {
			lastIndex = label1.lastIndexOf(",");
			label = label1.substring(0, lastIndex);
		}
	} else if (questionType.equals("4") || questionType.equals("5")) {
		label1 = "";
		//desctext = "";

	} else if (questionType.equals("6")) {
		choices = "";
		label1 = "";
		rowchoices = "";
	}
%>
<html>
<HEAD>
<TITLE>Preview</TITLE>
<link href="css/style_addConsultant.css" rel="stylesheet"
	type="text/css">
<link href="css/style_search.css" rel="stylesheet" type="text/css">
<link href="css/aw.css" rel="stylesheet" type="text/css">
<script src="js/aw.js"></script>
<script>
function createChoice()
{
	var question="<%=question%>"
	var choices="<%=choices%>"
	var label="<%=label%>"
	var questionType="<%=questionType%>"
	var rowchoices ="<%=rowchoices%>"
	var rw = rowchoices.split(",");
	if(!label==""){
		var lb=label.split(",");
		var str="<table width='300' border='0' align='left' ><tr><td align='left' class='suboption' >&nbsp;</td>";
		for(var i=0;i<lb.length;i++){
			str+="<td class='suboption'>"+lb[i]+"</td>";
		}
		str+="</tr>";
		for(var j=0;j<rw.length;j++)
		{
			str+="<tr><td align='right' class='suboption'>"+rw[j]+"</td>";
			for(var k=0;k<lb.length;k++)
			{
							str+="<td   class='suboption'><input type='checkbox' value='"+rw[j]+lb[k]+"' name='status'></td>";
						
			}
			str+="</tr>";
		}
		str+="</table>";
		document.getElementById('bylabel').innerHTML=str;
	}

	if(questionType=="6"){
		var str="<table width='780' border='0' align='center' ><tr><td align='left' class='suboption' >";
		str+="<textarea id='desctext'></textarea>";
		str+="</td></tr></table>";
		document.getElementById('desctext').innerHTML=str;
	}
	if(!choices==""){
		var ch=choices.split(",");
		if(!rowchoices==""){
		var str="<table width='300' border='0' align='left' ><tr><td align='center' class='suboption' >&nbsp;</td>";
		for(var i=0;i<ch.length;i++){
			str+="<td  align='center' class='suboption'>"+ch[i]+"</td>";
		}
		str+="</tr>";
		for(var j=0;j<rw.length;j++)
		{
			str+="<tr><td align='right'  class='suboption'>"+rw[j]+"</td>";
			for(var k=0;k<ch.length;k++)
			{
			if(questionType=="5"){
				str+="<td  align='center' class='suboption'><input type='checkbox' value='"+rw[j]+ch[k]+"' name='status'></td>";
			}
			else{
				str+="<td align='center' class='suboption'><input type='radio' value='"+rw[j]+ch[k]+"' name='status'></td>";
			}
			}
			str+="</tr>";
		}
		str+="</table>";
		}
		else{
		var str="<table width='300' border='0' align='left' ><tr>";
		
			for(var k=0;k<ch.length;k++)
			{
			if(questionType=="2"){
				str+="<td align='left' class='suboption'><input type='checkbox' value='"+rw[j]+ch[k]+"' name='status'>"+ch[k]+"</td>";
			}
			else{
				str+="<td align='left' class='suboption'><input type='radio' value='"+rw[j]+ch[k]+"' name='status'>"+ch[k]+"</td>";
			}
			}
			str+="</tr>";
		
		str+="</table>";
		}
		document.getElementById('quesPrevDiv').innerHTML=str;
	}
	}
</script>
</HEAD>

<body onload="createChoice();">
<table width="780" border="0" align="center">
	<tr>
		<td><input type="text" value="<%=question %>" style="border: 0"></td>
	</tr>
</table>
<table width="780" border="0" align="center">
	<tr>
		<td>
		<div id="quesPrevDiv"></div>
		<div id="bylabel"></div>
		<div id="desctext"></div>
		</td>
		</tr>
		<tr>
		<td>
		<input type="button" value="close" onclick="window.close();">
		</td>
	</tr>
</table>
</body>
</html>