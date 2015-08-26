<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form method="GET" action="universalImportProccess" modelAttribute="uploadForm" enctype="multipart/form-data" >
<div id="universalImport" class="easyui-panel" title="Universal Update Comparison and Import" style="width: 970px; height: 593px; padding: 5px">
	<div>
		<h1 style="float: left; padding-left: 5px">File Type</h1>
		<h1 style="float: left; padding-left: 55px">File Status</h1>
		<h1 style="float: left; padding-left: 58px">Previous File</h1>
		<h1 style="float: left; padding-left: 233px">New File</h1>
	</div>
	<div style="clear: both; margin-top: 5px">
		<select id="fileType" name="fileType" class="easyui-combobox" name="host" data-options="editable:false" style="width: 100px;; height: 20px">
			<option value="-1">Select type....</option>
			<option value="Airport">Airport</option>
			<option value="FBO">FBO</option>
			<option value="Hotel">Hotel</option>
			<option value="Transportation">Transportation</option>
			<option value="Catering">Catering</option>
		</select>
		<input type="radio" name="activeRB" id="activeRB" checked="checked" value="0" style="height: 10px" onclick="validateRadioBoxActive()"/>
		<label>Active</label> 
		<input type="radio" name="inactiveRB" id="inactiveRB" value="1" style="height: 10px" onclick="validateRadioBoxInactive()"/>
		<label>Inactive</label>
		<input name="previousFile" data-options="prompt:'Select previous file...'" style="width: 300px" type="file"> 
		<input name="newFile" data-options="prompt:'Select new file...'" style="width: 300px" type="file">
		<input id="active" name="active" value="true" type="hidden">
		<input type="submit" class="easyui-linkbutton" style="width: 125px" value="Compare & Import">
	</div>
</div>
</form:form>
<script type="text/javascript">
	function validateRadioBoxActive(){
		document.getElementById("inactiveRB").checked='';
		document.getElementById("active").value='true';			
	}
	function validateRadioBoxInactive(){
		document.getElementById("activeRB").checked='';
		document.getElementById("active").value='false';
	}
</script>