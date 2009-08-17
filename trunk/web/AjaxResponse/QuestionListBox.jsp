<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="questionList!=null">

	<s:select list="questionList" listKey="qsm_id" listValue="qsm_question"
		id="queslist" name="queslist" multiple="multiple" size="10" cssClass="suboption" cssStyle="width:155px" value=""></s:select>
</s:if>