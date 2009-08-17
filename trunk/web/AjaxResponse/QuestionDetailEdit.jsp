<%@ taglib prefix="s" uri="/struts-tags"%>

<s:set name="colPresent" value="1" />
<s:set name="rowPresent" value="1" />
<s:if test="questionDetail!=null">
	<table width="500" border="0" align="center">
		<tr>
			<td  class="suboption" align="center" >Enter Question <b>&nbsp;&nbsp;&nbsp;:&nbsp; </b>
			<s:textfield value="%{questionDetail.qsm_question}"
				name="questionText" cssClass="suboption" theme="simple" cssStyle="width:155px"/></td>
		</tr>
		
		<tr>
			<td><s:if test="questionDetail.optionSet!=null">
				<table width="500" border="0" align="center">
					<s:iterator status="options" value="questionDetail.optionSet"
						id="optionBean">
						<s:if test="qso_type.equals('C')">
							<s:if test="#colPresent==1">

								<tr>
									<td  class="suboption" align="center" width="340px">Answer Choices<b>&nbsp;&nbsp;&nbsp;:&nbsp; </b></td>
								
								<s:set name="colPresent" value="0" />
								</tr>
							</s:if>
						<tr>
								<td  class="suboption" align="right" width="375px"><s:hidden value="%{qso_id}" name="colChoiceId" /> <s:textfield
									value="%{qso_option}" name="editAnsChoice"  theme="simple" cssClass="suboption" theme="simple" cssStyle="width:155px"/></td>
							</tr>
						</s:if>
					</s:iterator>
					<s:if test="#colPresent==0">
						<tr>
							<td  class="suboption" align="right" width="375px"><img src='images/add1.gif'
								onClick="javascript:addElement();"> <img
								src='images/del.gif' onClick="javascript:removeElement();">
							<div id="content"></div>
							</td>
						</tr>

					</s:if>
				</table>
				<table>
					<s:iterator status="options" value="questionDetail.optionSet"
						id="optionBean">
						<s:if test="qso_type.equals('R')">
							<s:if test="#rowPresent==1">

								<tr>
									<td  class="suboption" align="center" width="340px">Row Choices<b>&nbsp;&nbsp;&nbsp;:&nbsp; </b></td>
								</tr>
								<s:set name="rowPresent" value="0" />
							</s:if>
							<tr>
								<td  class="suboption" align="right" width="375px"><s:hidden value="%{qso_id}" name="rowChoiceId" /> <s:textfield
									value="%{qso_option}" name="editRowChoice" cssClass="suboption" theme="simple" cssStyle="width:155px"/></td>
							</tr>
						</s:if>
					</s:iterator>
					<s:if test="#rowPresent==0">
						<tr>
							<td  class="suboption" align="right" width="375px"><img src='images/add1.gif'
								onClick="javascript:addRowElement();"> <img
								src='images/del.gif' onClick="javascript:removeRowElement();">
							<div id="contentRow"></div>
							</td>
						</tr>
					</s:if>
				</table>
			</s:if></td>
		</tr>
	</table>
</s:if>
