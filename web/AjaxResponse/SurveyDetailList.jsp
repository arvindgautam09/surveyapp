<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<s:if test="surveyListDB!=null">
	<table width="750" border="0" align="center">
		<tr>
			<td align="center" class="suboption" colspan="2"><s:fielderror /></td>
		</tr>
		<tr>
			<td align="right" class="suboption" width="353px">Survey Name:</td>
			<td align="left"><s:textfield id="editSurveyName"
				name="editSurveyName" cssClass="suboption" cssStyle="width:155"
				value="%{surveyListDB.srm_name}"></s:textfield></td>
		</tr>
		<tr>
			<td align="right" class="suboption">Survey Type:</td>
			<td><s:select name="surveyType" list="surveyTypeList"
				listKey="srt_id" listValue="srt_name" headerKey="0"
				headerValue="----------select-----------" cssClass="suboption"
				cssStyle="width: 155" title="Select Survey Type" theme="simple"
				value="%{surveyListDB.srm_srt_id}" /></td>
		</tr>
		<tr align="center">
			<td align="right" class="suboption">Repeat Count:</td>
			<td align="left"><select name="repeatcount" class="suboption"
				style="width: 155" id="repeatcount" title="Select Survey Count">
				<option value="0">Infinite</option>
				<%
					for (int i = 1; i <= 10; i++) {
				%>
				<option value="<%=i %>" selected="selected"><%=i%></option>

				<%
					}
				%>
			</select></td>
		</tr>
		<tr>
			<td align="right" class="suboption">Repeat Interval:</td>
			<td align="left" class="suboption"><select name="repeatinterval"
				class="suboption" style="width: 155" id="repeatinterval"
				title="Select Repeat Interval">
				<option value="0">None</option>
				<option value="1" selected="selected">1</option>
				<option value="5">5</option>
				<option value="7">7</option>
				<option value="30">30</option>
				<option value="180">180</option>
				<option value="365">365</option>
			</select>day(s)</td>
		</tr>
		<tr>
			<td align="right" class="suboption">Status:</td>
			<td><s:radio name="status" value="%{surveyListDB.srm_status}"
				list="#{'O':'Open','C':'Close'}" cssClass="suboption" /></td>
		</tr>

		<tr align="center">
			<td align="right" class="suboption">Questions Category:</td>
			<td align="left"><s:select name="questionCategory"
				cssClass="suboption" id="questionCategory" list="categoryList"
				listKey="qsc_id" listValue="qsc_name" headerKey="0"
				headerValue="----------select-----------" cssStyle="width: 155"
				title="Select Questions Category" onchange="edit_details();" /></td>

		</tr>
		<tr align="center">
			<td align="center" colspan="2">
			<div id="questionDiv" style="display: none">
			<table width="60%" align="center" border="1">
				<tr>
					<td width="33%">
					<table border="1">
						<tr>
							<td bordercolor="1"><s:url id="d_url"
								action="getQuestionListBox.action" /> <sx:div id="details"
								href="%{d_url}" listenTopics="show_details" formId="editFrm"></sx:div></td>
						</tr>
					</table>
					</td>
					<td width="33%">
					<table border="1">
						<tr>
							<td width="40%" align="center"><input class="button1"
								type="button" style="width: 80" name="add" value="Add>>"
								onclick="moveForUpdate();"></td>
						</tr>
						<tr>
							<td width="40%" align="center"><input class="button1"
								type="button" style="width: 80" name="remove"
								value="Remove<<"   onclick="moveDualList(document.editFrm.selectedQuestionList,document.editFrm.queslist, false);">
							</td>
						</tr>
					</table>
					</td>
					<td width="33%">
					<table border="0">
						<tr>
							<td>
							<table border="1" class="TableBorderline">
								<tr>

									<td nowrap="nowrap" align="left" colspan="2"><s:if test="surveyListDB.questionSet!=null"><s:select
										list="surveyListDB.questionSet" listKey="qsm_id"
										listValue="qsm_question" name="selectedQuestionList"
										name="selectedQuestionList" size="10" cssClass="suboption"
										cssStyle="width:155px" value="%{qsm_question}" multiple="true"></s:select></s:if>
									</td>
								</tr>
							</table>
					</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
		</tr>


	</table>
</s:if>