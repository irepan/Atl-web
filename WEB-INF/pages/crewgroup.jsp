		<div class="easyui-panel" title="Crew Group" style="width:785px;height:436px;padding:5px">
			<div id="logTempToolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true" onclick="javascript:addRow();">Add Crew Group Item</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRow();">Delete Crew Group Item</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true" onclick="javascript:addRow();">New Crew Group</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRow();">Delete Crew Group</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="showMsg('Warning','Save')">Save</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="showMsg('Warning','Cancel')">Cancel</a>
			</div>
			<div>
				<label style="float:left;padding-left:5px">Crew Group</label>
				<label style="float:left;padding-left:190px">Name</label>
				<label style="float:left;padding-left:225px">Description</label>
			</div>
			<div style="clear:both;margin-top:5px">
				<input id="crewGroup" class="easyui-combobox" name="crewGroup" data-options="editable:false" style="width:254px;;height:20px">
				<input id="logTempName" class="easyui-textbox" style="width:254px;height:20px"/>
				<input id="logTempDesc" class="easyui-textbox" style="width:254px;height:20px"/>
			</div>
			<div style="margin:10px 0px 0px 0px;height:306px">
				<table class="easyui-datagrid" id="crewGroupGrid" style="border: 1px"  
					toolbar="" title="" pagination="false" idField="id" rownumbers="false" url="data/datagrid"
					fit="true" fitColumns="false" singleSelect="true" >
					<thead>
						<tr>
							<th field="ITEM"     	  width="385">Item</th>
							<th field="CREW_POSITION" width="385">Crew Position</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>PILOT IN COMMAND</td>
						</tr>
						<tr>
							<td>2</td>
							<td>CABIN ATTENDANT 1</td>
						</tr>
						<tr>
							<td>3</td>
							<td>CABIN ATTENDANT 2</td>
						</tr>
					</tbody>
				</table> 
			</div>
		</div>	
		
<script type="text/javascript">
<!--

//-->
	$('#crewGroup').combobox({
		method:'get',
		url:'/atlas-ws/crewgroup/list',
		valueField:'id',
		textField:'description',
		onLoadSuccess: function(){
			// select first element combobox
			$(this).combobox('select',$(this).combobox('getData')[0].id);
		},
		onSelect: function(row){
			$('#logTempName').textbox('setValue',row.id);
			$('#logTempDesc').textbox('setValue',row.description);
			//
		}
	});
</script>		
		