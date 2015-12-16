<div class="easyui-panel" title="Aircraft"
	style="width: 477px; height: 597px; padding: 5px">
	<div id="crewPosGroupToolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="javascript:newAircraft();">New Aircraft</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="javascript:duplicateAircraft();">Duplicate Aircraft</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="javascript:deleteAircraft();">Delete Aircraft</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"
			onclick="javascript:saveAircraft();">Save</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-undo" plain="true"
			onclick="javascript:cancelAircraft();">Cancel</a>
	</div>
	<div style="margin: 0px 0px 0px 0px; height: 30px">
		<input id="acList" class="easyui-combogrid" style="width: 342px"
			value=""
			data-options="
						panelWidth: 466,
						multiple: false,
						editable:false,
						idField: 'registrationNumber',
						textField: 'registrationNumber',
						method: 'get',
						url: '/atlas-web/aircraft/listActive',
						columns: [[
						{field:'registrationNumber',	title:'Registration #',	width: 75, sortable:'true'},
						{field:'manufacturer',		title:'Manufacturer',	width: 85, sortable:'true'},
						{field:'make',				title:'Make',			width: 70, sortable:'true'},
						{field:'model',				title:'Model',			width: 70, sortable:'true'}
						]],
						fitColumns: true" />
		<select id="acActiveList" class="easyui-combobox" name="acActiveList"
			data-options="editable:false" style="width: 110px;; height: 20px">
			<option value="Active">Active</option>
			<option value="Inactive">Inactive</option>
		</select>
	</div>
	<div class="easyui-accordion" style="width: 466px; height: 491px;">
		<div title="Status" data-options="iconCls:''"
			style="overflow: auto; padding: 0px">
			<table>
				<thead>
					<tr>
						<th width="110"></th>
						<th width="110"></th>
						<th width="110"></th>
						<th width="110"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4"><label>Comments</label></td>
					</tr>
					<tr>
						<td colspan="4"><input class="easyui-textbox" id="acComments"
							data-options="multiline:true,disabled:false"
							style="width: 450px; height: 122px"
							value="" /></td>
					</tr>
					<tr>
						<td colspan="4"><label>Owner(s) </label> <a href="#"
							class="easyui-linkbutton" iconCls="icon-help"
							style="height: 20px" plain="false"
							onclick="javascript:openMoreOwner();">More ...</a></td>
					</tr>
					<tr>
						<td colspan="4"><select id="acOwnersList"
							class="easyui-combobox" name="acOwnersList"
							data-options="editable:false" style="width: 450px;; height: 20px">
						</select></td>
					</tr>
				</tbody>
			</table>
			<div style="padding: 5px">
				<table class="easyui-datagrid" id="acCurrentTimes"
					style="width: 448px; height: 211px; border: 1px" toolbar=""
					pagination="false" idField="id" rownumbers="false"
					fit="false" fitColumns="false"
					singleSelect="true">
					<thead>
						<tr>
							<th field="PAIR" width="215" align="left">Currrent Times</th>
							<th field="TIME" width="215" align="right"></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div title="Clocks" data-options="iconCls:''"
			style="overflow: auto; padding: 0px">
			<div class="easyui-tabs" fit="false"
				style="width: 464px; height: 421px">
				<div title="Times" style="padding: 5px; height: 187px">
					<div id="acTimesToolbar">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="javascript:newManualEntry());">New
							Manual Entry</a> <a href="#" class="easyui-linkbutton"
							iconCls="icon-remove" plain="true"
							onclick="javascript:deleteManualEntry());">Delete Manual
							Entry</a>
					</div>
					<table>
						<thead>
							<tr>
								<th width="100"></th>
								<th width="120"></th>
								<th width="100"></th>
								<th width="120"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>As Of D:T</label></td>
								<td><input id="acAsOfDTList" class="easyui-combogrid"
									style="width: 120px" value=""
									data-options="
											panelWidth: 390,
											multiple: false,
											editable:false,
											idField: 'AS_OF_DATE',
											textField: 'AS_OF_DATE',
											method: 'get',
											columns: [[
											{field:'AS_OF_DATE',	title:'As Of D:T',		width:120,  sortable:'false'},
											{field:'DESCRIPTION',	title:'Description',	width:250, sortable:'false'}
											]],
											fitColumns: false" /></td>
								<td><label>New As of D:T</label></td>
								<td><input id="acNewAsOfDTDate" class="easyui-datetimebox"
									data-options="showSeconds:false,disabled:false"
									style="width: 120px; height: 20px" value="" /></td>
							</tr>
							<td><label>Description</label></td>
							<td colspan="3"><input id="acAsOfDTDesc"
								class="easyui-textbox" data-options="disabled:false"
								style="width: 350px; height: 20px" value="" /></td>
							<tr>
							</tr>
						</tbody>
					</table>
					<table class="easyui-datagrid" id="acTimesLogbookClocksList"
						style="width: 449px; height: 144px; border: 1px" idField="PAIR"
						 fit="false" fitColumns="false"
						singleSelect="true">
						<thead>
							<tr>
								<th field="PAIR" width="189" align="left">Logbook Clocks</th>
								<th field="START" width="60" align="right">Start</th>
								<th field="USAGE" width="60" align="right">Usage</th>
								<th field="END" width="60" align="right">End</th>
								<th field="CURRENT" width="60" align="right">Current</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div style="padding: 3px"></div>
					<table class="easyui-datagrid" id="acRelatedClocksList"
						style="width: 449px; height: 144px; border: 1px" idField="PAIR"
						fit="false" fitColumns="false"
						singleSelect="true">
						<thead>
							<tr>
								<th field="PAIR" width="132" align="left">Related Clocks</th>
								<th field="RATIO1" width="57" align="center">Ratio</th>
								<th field="START" width="60" align="right">Start</th>
								<th field="USAGE" width="60" align="right">Usage</th>
								<th field="END" width="60" align="right">End</th>
								<th field="CURRENT" width="60" align="right">Current</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div title="Setup" style="padding: 5px; height: 187px">
					<table class="easyui-datagrid" id="logbookClocksList"
						style="width: 449px; height: 185px; border: 1px"
						toolbar="#logbookClocksToolbar" idField="PAIR"
						fit="false" fitColumns="false"
						singleSelect="true">
						<thead>
							<tr>
								<th field="PAIR" width="429" align="left">Logbook Clock</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div id="logbookClocksToolbar">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="">New Logbook Clock</a> <a href="#"
							class="easyui-linkbutton" iconCls="icon-remove" plain="true"
							onclick="">Delete Logbook Clock</a>
					</div>
					<div style="padding: 3px"></div>
					<table class="easyui-datagrid" id="relatedClocksList"
						style="width: 449px; height: 185px; border: 1px"
						toolbar="#relatedClocksToolbar" idField="PAIR"
						fit="false" fitColumns="false"
						singleSelect="true">
						<thead>
							<tr>
								<th field="EVERY" width="60" align="center">For Every</th>
								<th field="PAIR1" width="155" align="left">Logbook Clock</th>
								<th field="RECORD" width="60" align="center">Record</th>
								<th field="PAIR2" width="155" align="left">Related Clock</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div id="relatedClocksToolbar">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add"
							plain="true" onclick="">New Related Clock</a> <a href="#"
							class="easyui-linkbutton" iconCls="icon-remove" plain="true"
							onclick="">Delete Related Clock</a>
					</div>
				</div>
			</div>
		</div>
		<div title="Setup" data-options="iconCls:''"
			style="overflow: auto; padding: 0px">
			<table>
				<thead>
					<tr>
						<th width="110"></th>
						<th width="110"></th>
						<th width="110"></th>
						<th width="110"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label>Registration #</label></td>
						<td><input id="acRegNum" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Last Updated</label></td>
						<td><input id="acLastUpdated" class="easyui-textbox"
							data-options="disabled:true" style="width: 110px; height: 20px"
							value="" /></td>
					</tr>
					<tr>
						<td><label>Product Serial #</label></td>
						<td><input id="acProdSerialNum" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Alias</label></td>
						<td><input id="acAlias" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
					</tr>
					<tr>
						<td><label>Manufacturer</label></td>
						<td><select id="acManuf" class="easyui-combobox" name="host"
							data-options="editable:false" style="width: 110px;; height: 20px">
						</select></td>
						<td><label>Make</label></td>
						<td><select id="acMake" class="easyui-combobox" name="host"
							data-options="editable:false" style="width: 110px; height: 20px">
						</select></td>
					</tr>
					<tr>
						<td><label>Model</label></td>
						<td><select id="acModel" class="easyui-combobox" name="host"
							data-options="editable:false" style="width: 110px;; height: 20px">
						</select></td>
						<td><label>Configuration</label></td>
						<td><select id="acConfig" class="easyui-combobox" name="host"
							data-options="editable:false" style="width: 110px;; height: 20px">
						</select></td>
					</tr>
					<tr>
						<td><label>Number of Engines</label></td>
						<td><input id="acNumOfEng" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Is Type?</label> <input id="acIsType"
							type="checkbox" onclick="" /></td>
						<td><label>Is Request?</label> <input id="acIsRequest"
							type="checkbox" onclick="" /></td>
					</tr>
					<tr>
						<td><label>Home Base</label></td>
						<td><input id="acHomeBase" class="easyui-combobox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Location</label></td>
						<td><select id="acLocation" class="easyui-combobox"
							name="host" data-options="editable:false"
							style="width: 110px;; height: 20px">
						</select></td>
					</tr>
					<tr>
						<td><label>Qualifying Type</label></td>
						<td><select id="acQualType" class="easyui-combobox"
							name="host" data-options="editable:false"
							style="width: 110px;; height: 20px">
						</select></td>
						<td><label>Category</label></td>
						<td><input id="acCategory" class="easyui-textbox"
							data-options="disabled:true" style="width: 110px; height: 20px"
							value="" /></td>
					</tr>
					<tr>
						<td><label>Class</label></td>
						<td><input id="acClass" class="easyui-textbox"
							data-options="disabled:true" style="width: 110px; height: 20px"
							value="" /></td>
						<td><label>Rating Required?</label></td>
						<td><input id="acRatReq" type="checkbox" onclick="" /></td>
					</tr>
					<tr>
						<td><label>Operations Rule</label></td>
						<td><select id="acOpRule" class="easyui-combobox" name="host"
							data-options="editable:false" style="width: 110px; height: 20px">
						</select></td>
						<td><label>Noise Type</label></td>
						<td><select id="acNoiseType" class="easyui-combobox"
							name="host" data-options="editable:false"
							style="width: 110px;; height: 20px">
						</select></td>
					</tr>
					<tr>
						<td><label>Crew Composition</label></td>
						<td><select id="acCrewGroup" class="easyui-combobox"
							name="host" data-options="editable:false"
							style="width: 110px;; height: 20px">
						</select></td>
						<td><label>Number of Seats</label></td>
						<td><input id="acNumOfSeats" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
					</tr>
					<tr>
						<td><label>Logistics Template</label></td>
						<td><select id="acLogTemplate" class="easyui-combobox"
							name="host" data-options="editable:false"
							style="width: 110px;; height: 20px">
						</select></td>
						<td><label>Decal</label></td>
						<td><input id="acDecal" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
					</tr>
					<tr>
						<td><label>Color</label></td>
						<td><input id="acColor" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Trim</label></td>
						<td><input id="acTrim" class="easyui-textbox"
							style="width: 110px; height: 20px" value="" /></td>
					</tr>
					<tr>
						<td><label>HF Equipped?</label></td>
						<td><input id="acHFequip" type="checkbox" onclick="" /></td>
						<td><label>SATCOM Equipped?</label></td>
						<td><input id="acSATCOMequip" type="checkbox" onclick="" /></td>
					</tr>
					<tr>
						<td><label>LR NAV Equipped?</label></td>
						<td><input id="acLRNAVequip" type="checkbox" onclick="" /></td>
						<td><label>Reg # History</label></td>
						<td><input id="acRegHistList" class="easyui-combogrid"
							style="width: 110px" value=""
							data-options="
											panelWidth: 200,
											multiple: false,
											editable:false,
											idField: 'REG_NUM',
											textField: 'REG_NUM',
											method: 'get',
											columns: [[
											{field:'REG_NUM',	title:'Registration #',		width:50, sortable:'false'},
											{field:'DATE',		title:'Date',				width:50, sortable:'false'}
											]],
											fitColumns: true" /></td>
					</tr>
					<tr>
						<td><label>Manufacture Date</label></td>
						<td><input id="acManufDate" class="easyui-datebox"
							style="width: 110px; height: 20px" value="" /></td>
						<td><label>Certification Date</label></td>
						<td><input id="acCertDate" class="easyui-datebox"
							style="width: 110px; height: 20px" value="" /></td>
					</tr>
					<tr>
						<td><label>In Service</label></td>
						<td><input style="width: 110px; height: 20px"
							id="acInServDate" class="easyui-datebox" value="" /></td>
						<td><label>Out Service</label></td>
						<td><input style="width: 110px; height: 20px"
							id="acOutServDate" class="easyui-datebox" value="" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div title="Performance" data-options="iconCls:''"
			style="overflow: auto; padding: 0px">
			<div class="easyui-layout" style="width: 464px; height: 421px"
				fit="false">
				<div data-options="region:'north',split:false,collapsible:false"
					style="height: 122px" title="Weights">
					<table>
						<thead>
							<tr>
								<th width="130"></th>
								<th width="90"></th>
								<th width="130"></th>
								<th width="90"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>AC Empty</label></td>
								<td><input id="acEmptyWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
								<td><label>AC Fuel Reserve</label></td>
								<td><input id="acFuelReserveWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>AC Max Gross Take Off</label></td>
								<td><input id="acMGTOWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
								<td><label>AC Max Zero Fuel</label></td>
								<td><input id="acMZFWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>AC Max Fuel</label></td>
								<td><input id="acMaxFuelWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
								<td><label>AC Max Landing</label></td>
								<td><input id="acMaxLandingWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>Avg Crewmember</label></td>
								<td><input id="acAvgCrewWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
								<td><label>Avg Passenger</label></td>
								<td><input id="acAvgPaxWt" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div data-options="region:'center',split:false,collapsible:false"
					style="height: 200px" title="Runway Requirements">
					<table>
						<thead>
							<tr>
								<th width="130"></th>
								<th width="90"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>Take Off</label></td>
								<td><input id="acTakeOffRR" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>Landing</label></td>
								<td><input id="acLandingRR" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div data-options="region:'east',split:false,collapsible:false"
					style="width: 236px" title="Fuel Factors">
					<table>
						<thead>
							<tr>
								<th width="130"></th>
								<th width="90"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>Air Delay</label></td>
								<td><input id="acAirDelayFF" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>Ground Delay</label></td>
								<td><input id="acGroundDelayFF" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
							<tr>
								<td><label>Taxi</label></td>
								<td><input id="acTaxiFF" class="easyui-textbox"
									style="width: 90px; height: 20px" value="" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div data-options="region:'south',split:false,collapsible:false"
					style="height: 204px" title="Stage Lengths">
					<table>
						<thead>
							<tr>
								<th width="110"></th>
								<th width="110"></th>
								<th width="110"></th>
								<th width="110"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>Effective Date</label></td>
								<td><select id="acEffectiveDateList"
									class="easyui-combobox" name="effectiveDateList"
									data-options="editable:false"
									style="width: 110px; height: 20px">
								</select></td>
								<td colspan="2"><a href="#" class="easyui-linkbutton"
									iconCls="icon-help" style="width: 225px; height: 20px"
									plain="false" onclick="javascript:openStageLengths();">Enter
										Stage Lengths</a></td>
							</tr>
						</tbody>
					</table>
					<div
						style="margin-left: 5px; margin-top: 5px; height: 145px; width: 450px">
						<table class="easyui-datagrid" id="stageLengthsGrid"
							style="width: 450px; border: 1px" toolbar="" pagination="false"
							idField="id" rownumbers="false" 
							fit="true" fitColumns="false" singleSelect="true">
							<thead data-options="frozen:true">
								<tr>
									<th field="FROM" width="40" align="right">From</th>
									<th field="TO" width="40" align="right">To</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th field="TAS" width="30" align="right">TAS</th>
									<th field="W_ALT" width="40" align="right">W Alt</th>
									<th field="CR_FF" width="35" align="right">Cr FF</th>
									<th field="C" width="30" align="right">CTM</th>
									<th field="C_BURN" width="45" align="right">C Burn</th>
									<th field="C_DIST" width="40" align="right">C Dist</th>
									<th field="D_T" width="30" align="right">DTM</th>
									<th field="D_BURN" width="45" align="right">D Burn</th>
									<th field="D_DIST" width="40" align="right">D Dist</th>
									<th field="TNKR" width="35" align="right">Tnkr</th>
									<th field="APP" width="30" align="right">App</th>
									<th field="APP_FI" width="45" align="right">App Fl</th>
									<th field="HR" width="50" align="right">$Hr</th>
									<th field="MI" width="50" align="right">$Mi</th>
									<th field="PAX_HR" width="50" align="right">$PxHr</th>
									<th field="PAX_MI" width="50" align="right">$PxMi</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="ownerWindow" class="easyui-window" title="Owner"
	style="width: 485px; height: 530px; padding: 5px;"
	data-options="modal:true,closed:true,closable:true,
                collapsible:false,minimizable:false,maximizable:false">
	<object type="text/html" width="459px" height="490px"
		style="overflow: auto"> </object>
</div>
<div id="stageLengthsWindow" class="easyui-window" title="Stage Lengths"
	style="width: 893px; height: 420px; padding: 5px;"
	data-options="modal:true,closed:true,closable:true,
                collapsible:false,minimizable:false,maximizable:false">
	<object type="text/html" width="863px"
		height="378px" style="overflow: auto"> </object>
</div>

<script type="text/javascript">
function loadAircrafts(){
	$(document).ready(function() {
	    $.ajax({
	    	type:"POST",  
	        url: '/atlas-web/aircraft/list',
	        dataType: "json",
	        cache: false,
	        timeout: 5000,
	        success: function(data) {
	            $('#commDisplayOrderGrid').datagrid({
	            	columns:[[
								{field:'commType',title:'Type',editor:{type:'text'}, width: 300,
									formatter: function(value,row,index){
										if (row.commPurpose){
											return row.commPurpose+" "+row.commType;
										}else if(row.commOrder){
											return row.commType;
										} else {
											return value;
										}
									}},
	            	          	{field:'commOrder', sortable:true, title:'Display Order',
								editor:{type:'numberbox',
									options:{												
										editable:false
									}
								}, width:94},
	            	 ]]
	            }).datagrid("loadData",data);
	        }
	    });
	});
}
</script>