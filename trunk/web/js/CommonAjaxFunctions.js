function getAjaxRequest()
{
//alert("in getAjaxRequest");
	var ajaxRequest;  
    try
    {               
        ajaxRequest = new XMLHttpRequest();
    } 
    catch (e)
    {            
        try
        {
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");		
        } 
        catch (e)
        {			
            try
            {				
            	ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");			
            } 
            catch (e)
            {				
            	alert("Your browser broke!");
            	return false;			
            }		
        }                
    }    
    return ajaxRequest;
}     

//outputObj--where we want to show the message
//inputObj--if we want to focus and blank the field value then we need to paas the object of that field.

function populateValueWithAjax(url,outputObj,inputObj,editButton)
{ 
    var ajaxRequest=getAjaxRequest();  
    ajaxRequest.onreadystatechange = function(){          
    if(ajaxRequest.readyState == 4){
        if(ajaxRequest.status==200)
        {            
            if(ajaxRequest.responseText!="")
             {  
             var ajaxResponse=ajaxRequest.responseText;             
           
            	if(outputObj.type==undefined){
                
                    if(editButton){ 
                      
                        if(alltrim(ajaxResponse.substring(37,40))=="No"){
                          outputObj.innerHTML=ajaxResponse;
                          editButton.style.display='none';
                           
                        }else{
                          outputObj.innerHTML=ajaxResponse; 
                          editButton.style.display='block';                          
                        }                    
                    
                    }else if(inputObj)
                    {  
                    inputObj.value="";
                    inputObj.focus();
                    outputObj.innerHTML=ajaxResponse;  
                    }else
                    {
                    outputObj.innerHTML=ajaxResponse;    
                    }    
                    
          	}else{
                    outputObj.value=ajaxRequest.responseText;
                }
             }
            else
            { 
                if(outputObj!=null)                 
                {
                    if(outputObj.type==undefined)
                        outputObj.innerHTML="";
                    else
                        outputObj.value="";
                }
            }          
        } 
     }
    }               
    ajaxRequest.open("GET",url, true);	
    ajaxRequest.send(null); 
}


 /************* To get all user list on the basis of company selected ************/
            
    function getUserList(compid,select,enable,outputObj,inputObj,buttonObj)
    { 
      var comp_id=compid;
    if(comp_id==null || comp_id=="")
       comp_id="0";      

    var queryString ="?companyId="+comp_id+"&Show="+select+"&enableAll="+enable;           
    queryString=queryString +"&sid="+Math.random();            
    var mainURL="../security/userListForCompany.po"+queryString;            
    var outobj=document.getElementById(outputObj); 

    if(inputObj=='N'){
    var inobj;
    }else{
    var inobj=document.getElementById(inputObj);     
    }

    var editButton=document.getElementById(buttonObj);
    populateValueWithAjax(mainURL,outobj,inobj,editButton); 

    }

/************* To get user list on the basis of company and profile selected ************/

function getUserListOnProfile(compid,select,enable,profile,userid,outputObj,inputObj,buttonObj)
{

var comp_id=compid;
if(comp_id==null || comp_id=="")
comp_id="0";

var queryString ="?companyId="+comp_id+"&Show="+select+"&userid="+userid+"&Profile="+profile+"&enableAll="+enable;
queryString=queryString +"&sid="+Math.random();
var mainURL="../security/getUserListOnProfile.po"+queryString;
var outobj=document.getElementById(outputObj);

if(inputObj=='N'){
var inobj;
}else{
var inobj=document.getElementById(inputObj);
}

var editButton=document.getElementById(buttonObj);
populateValueWithAjax(mainURL,outobj,inobj,editButton);

}




 function alltrim(str) {
return str.replace(/^\s+|\s+$/g, '');
}
