<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="questionList!=null">
<td >Select Question <font color="red">*</font><b> :&nbsp; </b>
	<s:select list="questionList" listKey="qsm_id" listValue="qsm_question"
		id="questionId" name="questionId"
		headerKey="0" headerValue="----------select----------" cssStyle="width:155px" onchange="showQuestionDetails();" theme="simple" cssClass="suboptionh" ></s:select>
		</td>
</s:if>