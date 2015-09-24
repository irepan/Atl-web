<div id="order">
	<div class="easyui-panel" title="Display Order" style="width:450px;height:515px;padding-left:15px">
		<div id="displayOrderCommunicationToolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-up" plain="true" onclick="moveUpCommunication();">Move Up</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-down"    plain="true" onclick="moveDownCommunication();">Move Down</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="updateComms()">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="loadCommunicationsData()">Cancel</a>
		</div>
		<div id="displayOrderPersonnelToolbar" style="display: none;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-up" plain="true" onclick="moveUpPersonnel();">Move Up</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-down"    plain="true" onclick="moveDownPersonnel();">Move Down</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="updatePersonnel()">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="loadPersonnelData()">Cancel</a>
		</div>
		<div id="displayOrderAircraftToolbar" style="display: none;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-up" plain="true" onclick="moveUpAircraft();">Move Up</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-move-down"    plain="true" onclick="moveDownAircraft();">Move Down</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="updateAircrafts()">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="loadAircraftData()">Cancel</a>
		</div>
		<div class="easyui-accordion" style="width:415px;height:454px;">
				<div title="Communications" data-options="onExpand:function(){expandCommunication();}" style="overflow:auto;padding:0px;" >
					<table class="easyui-datagrid" id="commDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" 
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th data-options="field:'commType', width:300">Type</th>
								<th field="commOrder" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table> 
				</div>
				<div title="Personnel" data-options="onExpand:function(){expandPersonnel();}" style="padding:0px;" onSelect="javascript:alert('Si selecciona person');">
					<table class="easyui-datagrid" id="personnelDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" 
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th field="fullName"     width="300">Name</th>
								<th field="personnelOrder" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table> 
				</div>
				<div title="Aircraft" data-options="onExpand:function(){expandAircraft();}" style="padding:0px;" onSelect="javascript:alert('Si selecciona air');">
					<table class="easyui-datagrid" id="aircraftDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" 
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th field="aircraftRegistrationId" width="600">Registration Number</th>
								<th field="aircraftOrder" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table> 
				</div>
			</div>
		</div>
</div>
<script>
	
	//COMMUNICATIONS
	function loadCommunicationsData(){
		$(document).ready(function() {
		    $.ajax({
			    // type method call 
		    	type:"GET",  
		    	// url 
		        url: '/atlas-web/atlas-ws/addComm/communication/list',
		        // type data on load
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

	function updateComms(){
		$.ajax({
           url: '/atlas-web/atlas-ws/addComm/communication/update',
           type: 'POST',
           dataType: 'json',
           data: JSON.stringify($('#commDisplayOrderGrid').datagrid('getData')),  
           contentType: 'application/json',
           mimeType: 'application/json',
           success: function (data) {
           	alert('ok');
           },
           failure: function(errMsg) {
               alert(errMsg);
           }
       });
	}
	
	function moveUpCommunication(){
		var rows = $('#commDisplayOrderGrid').datagrid('getRows');
        var row = $('#commDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#commDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex-1];
        if (row && belowRow){
        	var orderNow = row.commOrder;
        	var purposeNow = row.commPurpose;
        	var typeNow = row.commType;
        	var orderLasted = belowRow.commOrder;
        	var purposeLasted = belowRow.commPurpose;
        	var typeLasted = belowRow.commType;
        	if(order != 0){
        		$('#commDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex-1,
        		  row:{
        			  commType: typeNow,
        			  commPurpose: purposeNow,
        			  commOrder: orderLasted
        		  }
        		});
        		$('#commDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex,
          		  row:{
          			  commType: typeLasted,
          			  commPurpose: purposeLasted,
          			  commOrder: orderNow
          		  }
          		});
        	}
        	$('#commDisplayOrderGrid').datagrid('selectRow',rowIndex-1);
        }
	}
	
	function moveDownCommunication(){
		var rows = $('#commDisplayOrderGrid').datagrid('getRows');
        var row = $('#commDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#commDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex+1];
        if (row && belowRow){
        	var order = row.commOrder;
        	var purpose = row.commPurpose;
        	var type = row.commType;
        	if(order != 0){
        		$('#commDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex,
        		  row:{
        			  commType: belowRow.commType,
        			  commPurpose: belowRow.commPurpose,
        			  commOrder: order
        		  }
        		});
        		$('#commDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex+1,
          		  row:{
          			  commType: type,
          			  commPurpose: purpose,
          			  commOrder: belowRow.commOrder
          		  }
          		});
        	}
        	$('#commDisplayOrderGrid').datagrid('selectRow',rowIndex+1);
        }
	}

	//PERSONNEL
	
	function loadPersonnelData(){
		$(document).ready(function() {
		    $.ajax({
		    	type:"GET",  
		        url: '/atlas-web/atlas-ws/person/personnel/list',
		        dataType: "json",
		        cache: false,
		        timeout: 500,
		        success: function(data) {
		            $('#personnelDisplayOrderGrid').datagrid({
		            	columns:[[
		            	          {field:'fullName',title:'Name',editor:{type:'text'}, width:300},
		            	          {field:'personnelOrder',title:'Display Order',
									editor:{type:'numberbox',
										options:{												
											editable:false
										}
									},width:94},
		            	 ]]
		            }).datagrid("loadData",data);
		        }
		    });
		});
	}
	
	function updatePersonnel(){
		$.ajax({
	           url: '/atlas-web/atlas-ws/person/personnelOrder/update',
	           type: 'POST',
	           dataType: 'json',
	           data: JSON.stringify($('#personnelDisplayOrderGrid').datagrid('getData')),  
	           contentType: 'application/json',
	           mimeType: 'application/json',
	           success: function (data) {
	           	alert('ok');
	           },
	           failure: function(errMsg) {
	               alert(errMsg);
	           }
	       });
	}

	function moveDownPersonnel(){
		var rows = $('#personnelDisplayOrderGrid').datagrid('getRows');
        var row = $('#personnelDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#personnelDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex+1];
        if (row && belowRow){
        	if(row.personnelOrder.personnelId){
        		var orderNow=row.personnelOrder.personnelOrder;
            }else{
            	var orderNow=row.personnelOrder.personnelId;
            }
        	var nameNow = row.fullName;
        	if(belowRow.personnelOrder.personnelOrder){
        		var orderLasted=belowRow.personnelOrder.personnelOrder;
            }else{
            	var orderLasted=belowRow.personnelOrder.personnelId;
            }
        	var nameLasted = belowRow.fullName;
        	if(orderNow != 0){
        		$('#personnelDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex+1,
        		  row:{
        			  fullName: nameNow,
        			  personnelOrder: orderLasted
        		  }
        		});
        		$('#personnelDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex,
          		  row:{
          			fullName: nameLasted,
          			personnelOrder: orderNow
          		  }
          		});
        	}
        	$('#personnelDisplayOrderGrid').datagrid('selectRow',rowIndex+1);
        }
	}

	function moveUpPersonnel(){
		var rows = $('#personnelDisplayOrderGrid').datagrid('getRows');
        var row = $('#personnelDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#personnelDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex-1];
        if (row && belowRow){
        	if(row.personnelOrder.personnelId){
        		var orderNow=row.personnelOrder.personnelOrder;
            }else{
            	var orderNow=row.personnelOrder.personnelId;
            }
        	var nameNow = row.fullName;
        	if(belowRow.personnelOrder.personnelOrder){
        		var orderLasted=belowRow.personnelOrder.personnelOrder;
            }else{
            	var orderLasted=belowRow.personnelOrder.personnelId;
            }
        	var nameLasted = belowRow.fullName;
        	if(orderNow != 0){
        		$('#personnelDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex-1,
        		  row:{
        			  fullName: nameNow,
        			  personnelOrder: orderLasted
        		  }
        		});
        		$('#personnelDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex,
          		  row:{
          			fullName: nameLasted,
          			personnelOrder: orderNow
          		  }
          		});
        	}
        	$('#personnelDisplayOrderGrid').datagrid('selectRow',rowIndex-1);	
        }
	}

	//AIRCRAFT
	
	function loadAircraftData(){
		$(document).ready(function() {
		    $.ajax({
		    	type:"GET",  
		        url: '/atlas-web/atlas-ws/aircraft/aircraftOrder/list',
		        dataType: "json",
		        cache: false,
		        timeout: 5000,
		        success: function(data) {
		            $('#aircraftDisplayOrderGrid').datagrid({
		            	columns:[[
		            	          {field:'aircraftRegistrationId',title:'Registration Number',editor:{type:'text'}, width:300},
		            	          {field:'aircraftOrder',title:'Display Order',
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
	
	function updateAircrafts(){
		$.ajax({
	           url: '/atlas-web/atlas-ws/aircraft/aircraftOrder/update',
	           type: 'POST',
	           dataType: 'json',
	           data: JSON.stringify($('#aircraftDisplayOrderGrid').datagrid('getData')),  
	           contentType: 'application/json',
	           mimeType: 'application/json',
	           success: function (data) {
	           	alert('ok');
	           },
	           failure: function(errMsg) {
	               alert(errMsg);
	           }
	       });
	}

	function moveUpAircraft(){
		var rows = $('#aircraftDisplayOrderGrid').datagrid('getRows');
        var row = $('#aircraftDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#aircraftDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex-1];
        if (row && belowRow){
            var orderNow = row.aircraftOrder;
            var nameNow = row.aircraftRegistrationId;
            var orderLasted = belowRow.aircraftOrder;
        	var nameLasted = belowRow.aircraftRegistrationId;
        	if(orderNow != 0){
        		$('#aircraftDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex-1,
        		  row:{
        			  aircraftRegistrationId: nameNow,
        			  aircraftOrder: orderLasted
        		  }
        		});
        		$('#aircraftDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex,
          		  row:{
          			aircraftRegistrationId: nameLasted,
          			aircraftOrder: orderNow
          		  }
          		});
        	}
        	$('#aircraftDisplayOrderGrid').datagrid('selectRow',rowIndex-1);	
        }
	}

	function moveDownAircraft(){
		var rows = $('#aircraftDisplayOrderGrid').datagrid('getRows');
        var row = $('#aircraftDisplayOrderGrid').datagrid('getSelected');
        var rowIndex = $("#aircraftDisplayOrderGrid").datagrid("getRowIndex", row);      
        var belowRow = rows[rowIndex+1];
        if (row && belowRow){
        	var orderNow = row.aircraftOrder;
            var nameNow = row.aircraftRegistrationId;
            var orderLasted = belowRow.aircraftOrder;
        	var nameLasted = belowRow.aircraftRegistrationId
        	if(orderNow != 0){
        		$('#aircraftDisplayOrderGrid').datagrid('updateRow', {
        		  index: rowIndex+1,
        		  row:{
        			  aircraftRegistrationId: nameNow,
        			  aircraftOrder: orderLasted
        		  }
        		});
        		$('#aircraftDisplayOrderGrid').datagrid('updateRow', {
          		  index: rowIndex,
          		  row:{
          			aircraftRegistrationId: nameLasted,
          			aircraftOrder: orderNow
          		  }
          		});
        	}
        	$('#aircraftDisplayOrderGrid').datagrid('selectRow',rowIndex+1);
        }
	}

	//PANELS
	function expandCommunication(){
		loadCommunicationsData();
		$('#displayOrderCommunicationToolbar').show();
		$('#displayOrderPersonnelToolbar').hide();
		$('#displayOrderAircraftToolbar').hide();
	}
	function expandPersonnel(){
		loadPersonnelData();
		$('#displayOrderCommunicationToolbar').hide();
		$('#displayOrderPersonnelToolbar').show();
		$('#displayOrderAircraftToolbar').hide();
	}
	function expandAircraft(){
		loadAircraftData();
		$('#displayOrderCommunicationToolbar').hide();
		$('#displayOrderPersonnelToolbar').hide();
		$('#displayOrderAircraftToolbar').show();
	} 
	
</script>