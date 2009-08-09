<%@ taglib prefix="s" uri="/struts-tags"%>
State: <s:property value="%{state}" />
<br />
<s:if test="towns != null">
	<s:select id="towns_list" list="towns" label="Tourist Places" />
</s:if> 