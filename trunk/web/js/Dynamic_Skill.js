var intTextBox=0;

//FUNCTION TO ADD TEXT BOX ELEMENT
function addElement()
{
intTextBox = intTextBox + 1;
var contentID = document.getElementById('content');
var newTBDiv = document.createElement('div');
newTBDiv.setAttribute('id','strText'+intTextBox);
newTBDiv.innerHTML = "<input type='text' id='addColChoice' name='addColChoice' style='width: 155' class='suboption'/>";
contentID.appendChild(newTBDiv);
}

//FUNCTION TO REMOVE TEXT BOX ELEMENT
function removeElement()
{
if(intTextBox != 0)
{
var contentID = document.getElementById('content');
contentID.removeChild(document.getElementById('strText'+intTextBox));
intTextBox = intTextBox-1;
}
}

function removeRowElement()
{
if(intTextBox != 0)
{
var contentID = document.getElementById('contentRow');
contentID.removeChild(document.getElementById('strText'+intTextBox));
intTextBox = intTextBox-1;
}
}

function addRowElement()
{
intTextBox = intTextBox + 1;
var contentID = document.getElementById('contentRow');
var newTBDiv = document.createElement('div');
newTBDiv.setAttribute('id','strText'+intTextBox);
newTBDiv.innerHTML = "<input type='text' id='addRowChoice' name='addRowChoice' style='width: 155' class='suboption' />";
contentID.appendChild(newTBDiv);
}
