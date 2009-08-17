<link href="../../css/aw.css" rel="stylesheet" type="text/css">
<script src="../../js/aw.js"></script>
<script type="text/javascript">
	var actionTabObject = new AW.UI.Tabs;
	actionTabObject.setItemText(["Add", "Edit", "Delete"]);
	actionTabObject.setItemImage(["add", "edit", "delete"]);
	//actionTabObject.setSelectedItems([0]);
	actionTabObject.setItemCount(3);
	
	document.write(actionTabObject);
	actionTabObject.onItemClicked = function(event, index)
	{
		switch(index){
			case '0':
				window.location = "addCategory.jsp";
				actionTabObject.setSelectedItems([0]);
				break;
			case '1':
				window.location = "/SurveyJsp/category.action";
				actionTabObject.setSelectedItems([1]);
				break;
			case '2':
				window.location = "deleteCategory.jsp";
				actionTabObject.setSelectedItems([2]);
				break;
			default:
				window.location = "addCategory.jsp";
				actionTabObject.setSelectedItems([0]);
				break;
		}
	};
</script>
