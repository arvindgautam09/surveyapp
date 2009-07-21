<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<link rel=stylesheet href="../GUI-Comp/styles/cms/OKInclude2.css">
<link rel="stylesheet" href="../GUI-Comp/js/windowfiles/dhtmlwindow.css"
	type="text/css" />
<script type="text/javascript"
	src="../GUI-Comp/js/windowfiles/dhtmlwindow1.js"></script>
<script src="../GUI-Comp/js/CommonAjaxFunctions.js"></script>
<script type="text/javascript" src="../GUI-Comp/js/modalfiles/modal1.js"></script>
<link rel="stylesheet" href="../GUI-Comp/js/modalfiles/modal.css"
	type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
.f12 {
	font-family: arial;
	font-size: 12px;
}

.ft16 {
	font-family: 'trebuchet ms', arial;
	font-size: 16px;
}

.ft11 {
	font-family: 'trebuchet ms', arial;
	font-size: 11px;
}
</style>


<script>
      
        var agreewin;
        var fileNames=new Array();
        var rowCount=0;
        function editSignature(userId)
        {
        var url="../security/signature.po";
            agreewin=dhtmlmodal.open("agreebox", "iframe",url , "Edit Signature", "width=720px,height=500px,left=100px,top=0px, center=0,resize=1,scrolling=0", "recal");
                  agreewin.onclose=function(){
              return true;
             }
        }
        function editTemplate()
        {
        var url="../controls/mailTemplate.po";
            agreewin=dhtmlmodal.open("agreebox", "iframe",url , "Template", "width=720px,height=500px, center=1,resize=1,scrolling=0", "recal");
                  agreewin.onclose=function(){
              return true;
             }
        }
        
        function removeBrowse(attachRowId)
        {
          attachRowId.innerHTML="";
          rowCount--;
          removeLastAttachMent();
        }
        function removeLastAttachMent()
        {
          if(rowCount==0)
           {
              document.getElementById('attachText').style.display='block';
		      document.getElementById('attachMoreText').style.display='none';
		      document.getElementById('attachCheckBoxTable').style.display='none';
		   }
		   else
		   {
		      document.getElementById('attachText').style.display='none';
		      document.getElementById('attachMoreText').style.display='block';
		   }
		   document.getElementById('attachTable').style.display='none';
       }
       
        function removeAttachfile(checkBoxObj,checkSpanId)
        { 
          var checkVal=checkBoxObj.value;
          document.getElementById(checkVal).innerHTML="";
          checkSpanId.innerHTML="";
            rowCount--;
          removeLastAttachMent();
        }
        function addCheckBox(fileName,checkValue)
        {
        	var x=document.getElementById('attachCheckBoxTable');
			var i=x.rows.length;    
		    x=x.insertRow(i);
			var z=0;
			var y=x.insertCell(z);
			var spanId=checkValue+"Check";
			var html='<span id='+spanId+'><input type="checkbox" value="'+checkValue+'" checked=true onclick="removeAttachfile(this,'+spanId+')"><font size="2" face="verdana"><i>'+fileName+"</i></font></span>";
			y.innerHTML=html;
			 document.getElementById('attachCheckBoxTable').style.display='block';
        }
        function attachFiles()
        {
        var x=document.getElementById('attachTable');
		var i=x.rows.length;    
		 x=x.insertRow(i);
		var z=0;
		var y=x.insertCell(z);
		var spanId="attachDiv"+i;
		var fileName="files["+i+"]";
		var imgHtml='<img src="../GUI-Comp/images/del.gif"  onclick=removeBrowse('+spanId+')>';
		y.innerHTML='<span id='+spanId+'><input type="file"  name="'+fileName+'" style="width:400px" onchange="hideBrowse(this,'+spanId+');">'+imgHtml+'</span>';
		document.getElementById('attachText').style.display='none';
		document.getElementById('attachMoreText').style.display='none';
		 document.getElementById('attachTable').style.display='block';
		 rowCount++;
        }
        function hideBrowse(fileObj,spanId)
        {
          var fileHtml=spanId.innerHTML;
          var duplicate=false;
         for(var i=0;i<fileNames.length;i++)
          {
          	if(fileNames[i]==fileObj.value)
          	 {
          	 	duplicate=true;
          	 	break;
          	 }
          }
          if(!duplicate)
          {
          	fileNames[rowCount-1]=fileObj.value;
          	var filename=getFileName(fileObj.value);
          	spanId.style.display='none';
          	addCheckBox(filename,spanId.id);
          	document.getElementById('attachMoreText').style.display='block';
          	document.getElementById('attachTable').style.display='none';
          }
          else 
          {
          	 alert("You can not upload a duplicate file.");
             removeBrowse(spanId);
          }
        }
        function getFileName(path)
        { 
				var pos=path.lastIndexOf("\\"); //unterminate string constant, use "\\" for backslash
				var filename = path.substring(pos+1);
				return filename;
	    }
	       function showTemplate(templateId)
           { 
           	tinyMCE.get("emailText").setContent("");
           	document.getElementById('subject').value="";
           	if(templateId!=null&&templateId!="")
           	{
          		insertEditorContent("","emailText") ; 
    	  		var queryString ="?templateId="+templateId;       
          		queryString=queryString +"&sid="+Math.random();            
          		var mainURL="../controls/templateDetail.po"+queryString;   
           		populateValues(mainURL);
           	}
        }
        function populateValues(url)
       {
            var ajaxRequest=getAjaxRequest();  
    		ajaxRequest.onreadystatechange = function(){          
    		if(ajaxRequest.readyState == 4){
        	if(ajaxRequest.status==200)
        	{            
	            if(ajaxRequest.responseText!="")
             	{  
             		var ajaxResponse=ajaxRequest.responseText;    
             		 showSubjectandBody(ajaxResponse);    
          		}
          	}
          	 }
         }
          	ajaxRequest.open("POST",url, true);	
    		ajaxRequest.send(null); 
       }
       function showSubjectandBody(templateText)
         {
          if(templateText.indexOf('~'))
          {
            var subjectBody=new Array();
            subjectBody=templateText.split('~');
             document.getElementById('subject').value=subjectBody[0];
             insertEditorContent(subjectBody[1],"emailText") ; 
          }
         }
           function insertEditorContent(data,editorId)
		  {
			tinyMCE.execInstanceCommand(editorId, "mceInsertContent", false, data);
		  }
           function openPreview(){ 
           if(validateTemplate()==true)
           {
			window.open('about:blank','previewwindow', "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,WIDTH=800,HEIGHT=600,top=30,left=120"); 
			mailForm.target = 'previewwindow';
			} 
			else return false;
		}
		function validateTemplate()
		{
			var str = tinyMCE.get('emailText').getContent();
			var ltoccurences = str.match(/&lt;&amp;/g);

			if(ltoccurences==null)
			{
				ltoccurences="";
				ltoccurences.length=0;
			}
			var gtoccurences = str.match(/&amp;&gt;/g);
			if(gtoccurences==null)
			{
				gtoccurences="";
				gtoccurences.length=0;
			}
			if(ltoccurences.length!=gtoccurences.length ){
				alert("Not a valid Template.\nUse Variable like <&NAME&>.");
				
				return false;
			}
			return true;
		} 
        </script>
<script type="text/javascript"
	src="js/tiny_mce/tiny_mce_src.js"></script>

<script type="text/javascript">



	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,advhr,advlink,emotions,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,tinyautosave,savelocal,dictionary,iBrowser,noneditable,preview",
        apply_source_formatting : true,
       
        nowrap : true,
        convert_newlines_to_brs : false,
        force_br_newlines : false,
		force_p_newlines : false,
		remove_trailing_nbsp : true,
		dialog_type : "modal",
		editor_selector : "mceAdvanced",
		forced_root_block:'div',
		  /*theme_advanced_blockformats : "pre,div,h1,h2,h3,h4,h5,h6,blockquote,dt,dd,code,samp",
        keep_styles : false,*/
        
		// Theme options
		theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,|,search,replace,|,bullist,numlist,|,undo,redo,|,link,unlink,code,|,insertdate,inserttime,preview,|,forecolor,backcolor,|,print,styleprops,|,hr,removeformat,charmap,",
		theme_advanced_buttons3 : "tablecontrols,|,emotions,advhr,nonbreaking,template,pagebreak,tinyautosave",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		//theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true
        
      
		// Example word content CSS (should be your site CSS) this one removes paragraph margins
		//content_css : "../GUI-Comp/css/word.css"
       
	});
tinyMCE.init({ 
mode : "textareas", 
theme : "advanced", 
readonly : true ,
theme_advanced_toolbar_location : "external", 
editor_selector : "mceSimple"
 
}); 

</script>


</head>


<body topmargin="7" leftmargin="7" rightmargin="7">

<form action="" name="mailForm"
	enctype="multipart/form-data" method="post">
<table cellspacing=0 cellpadding=0 border=1 align="center" width="90%"
	class="tableborderline">
	<tr>
		<td>

		<table border="0" align="center" cellpadding="0" cellspacing="0"
			width="100%">
			<tr bgcolor="#719ce8">
				<td height="18px" colspan="3" nowrap bgcolor="#719ce8"><span
					class="mainheading"><strong>&nbsp;&nbsp; Mail </strong></span></td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td>
		<table width="95%" border=0 cellpadding="0" cellspacing="0">
			<tr style="height: 10px"></tr>
			<tr>
				<td width=5% class=ft11 align='center'><b>TO</b></td>
				<td width=2% class=ft11><b>:</b></td>
				<td><input type="text" name="emailTo"
					style="width: 750px; height: 15px"></td>
			</tr>


			<tr style="height: 10px"></tr>
			<tr>
				<td width=5% class=ft11 align='center'><b>Subject</b></td>
				<td width=2% class=ft11><b>:</b></td>
				<td><input type="text" name="subject" id="subject"
					style="width: 750px; height: 15px"></td>
			</tr>
			<tr style="height: 10px"></tr>
			<tr style="height: 10px"></tr>
			<tr>
				<td></td>
				<td></td>
				<td style="width: 100%"><textarea id="emailText"
					class="mceAdvanced" name="emailText" rows="15" cols="100"
					style="width: 750px">
                    </textarea></td>
			</tr>
			<tr style="height: 10px"></tr>
			<tr style="height: 15px"></tr>
			<tr>
				<td colspan=3 align="center"><input type="submit"
					name="command" value="Preview" onclick="return openPreview()" /> <input
					type="hidden" name="command" value="SendMail"> <input
					type="image" src="images/send_.01.gif" alt="Send Mail" tabindex="3"
					style="cursor: hand"
					onclick="return mailForm.target = '',validateTemplate(); " />&nbsp;
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</BODY>
</html>
