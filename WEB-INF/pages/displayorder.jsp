<div id="order">
	<div class="easyui-panel" title="Display Order" style="width:450px;height:515px;padding-left:15px">
		<div id="displayOrderToolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">Move Up</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true" onclick="">Move Down</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="showMsg('Warning','Save')">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="showMsg('Warning','Cancel')">Cancel</a>
		</div>
		<div class="easyui-accordion" style="width:415px;height:454px;">
				<div title="Communications" data-options="iconCls:''" style="overflow:auto;padding:0px;">
					<table class="easyui-datagrid" id="commDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" url="data/datagrid"
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th field="commType"     width="300">Type</th>
								<th field="DISPLAY_ORDER" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>BUSINESS PHONE</td>
								<td>1</td>
							</tr>
							<tr>
								<td>BUSINESS TOLL FREE NUMBER</td>
								<td>2</td>
							</tr>
							<tr>
								<td>UNICOM FREQUENCY</td>
								<td>3</td>
							</tr>
							<tr>
								<td>ARINC FREQUENCY</td>
								<td>4</td>
							</tr>
							<tr>
								<td>AIR TO GROUND FREQUENCY</td>
								<td>5</td>
							</tr>
							<tr>
								<td>TOWER FREQUENCY</td>
								<td>6</td>
							</tr>
							<tr>
								<td>CLEARANCE DEL 1 FREQUENCY</td>
								<td>7</td>
							</tr>
							<tr>
								<td>CLEARANCE DEL 2 FREQUENCY</td>
								<td>8</td>
							</tr>
							<tr>
								<td>APPROACH FREQUENCY</td>
								<td>9</td>
							</tr>
							<tr>
								<td>DEPARTURE FREQUENCY</td>
								<td>10</td>
							</tr>
							<tr>
								<td>GROUND FREQUENCY</td>
								<td>11</td>
							</tr>
							<tr>
								<td>ATIS FREQUENCY</td>
								<td>12</td>
							</tr>
							<tr>
								<td>ASOS FREQUENCY</td>
								<td>13</td>
							</tr>
							<tr>
								<td>AWOS FREQUENCY</td>
								<td>14</td>
							</tr>
							<tr>
								<td>AWOS TYPE</td>
								<td>15</td>
							</tr>
							<tr>
								<td>BUSINESS FAX</td>
								<td>16</td>
							</tr>
							<tr>
								<td>BUSINESS EMAIL</td>
								<td>17</td>
							</tr>
							<tr>
								<td>BUSINESS SITA 1</td>
								<td>18</td>
							</tr>
							<tr>
								<td>BUSINESS SITA 2</td>
								<td>19</td>
							</tr>
							<tr>
								<td>ATIS PHONE</td>
								<td>20</td>
							</tr>
							<tr>
								<td>ASOS PHONE</td>
								<td>21</td>
							</tr>
							<tr>
								<td>AWOS PHONE</td>
								<td>22</td>
							</tr>
							<tr>
								<td>CUSTOMS PHONE</td>
								<td>23</td>
							</tr>
							<tr>
								<td>IMMIGRATION PHONE</td>
								<td>24</td>
							</tr>
							<tr>
								<td>AGRICULTURE PHONE</td>
								<td>25</td>
							</tr>
							<tr>
								<td>FSS PHONE</td>
								<td>26</td>
							</tr>
							<tr>
								<td>AIRPORT MANAGER PHONE</td>
								<td>27</td>
							</tr>
							<tr>
								<td>BUSINESS WEBSITE</td>
								<td>28</td>
							</tr>
						</tbody>
					</table> 
				</div>
				<div title="Personnel" data-options="iconCls:''" style="padding:0px;">
					<table class="easyui-datagrid" id="personnelDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" url="data/datagrid"
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th field="fullName"     width="300">Name</th>
								<th field="DISPLAY_ORDER" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Allason, Alan</td>
								<td>1</td>
							</tr>
							<tr>
								<td>Bell, John W.</td>
								<td>2</td>
							</tr>
							<tr>
								<td>Clark, Harold</td>
								<td>3</td>
							</tr>
							<tr>
								<td>Cousins, Fred</td>
								<td>4</td>
							</tr>
							<tr>
								<td>Curry, John</td>
								<td>5</td>
							</tr>
							<tr>
								<td>Garyham, Geoffrey</td>
								<td>6</td>
							</tr>
							<tr>
								<td>Green, Joe</td>
								<td>7</td>
							</tr>
							<tr>
								<td>Jones, Jane, J.</td>
								<td>8</td>
							</tr>
							<tr>
								<td>Larson, Brian Scott</td>
								<td>9</td>
							</tr>
							<tr>
								<td>Logan, Jack</td>
								<td>10</td>
							</tr>
							<tr>
								<td>Sampson, Jonathan</td>
								<td>11</td>
							</tr>
							<tr>
								<td>Smithson, Timothy</td>
								<td>12</td>
							</tr>
						</tbody>
					</table> 
				</div>
				<div title="Aircraft" data-options="iconCls:''" style="padding:0px;">
					<table class="easyui-datagrid" id="aircraftDisplayOrderGrid" style="border: 1px"  
						toolbar="" title="" pagination="false" idField="id" rownumbers="false" url="data/datagrid"
						fit="true" fitColumns="false" singleSelect="true" >
						<thead>
							<tr>
								<th field="registrationNumber"     width="300">Registration Number</th>
								<th field="DISPLAY_ORDER" width="94">Display Order</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>N2005</td>
								<td>1</td>
							</tr>
							<tr>
								<td>N2004</td>
								<td>2</td>
							</tr>
							<tr>
								<td>N2008T</td>
								<td>3</td>
							</tr>
							<tr>
								<td>N2001</td>
								<td>4</td>
							</tr>
							<tr>
								<td>NLR31</td>
								<td>5</td>
							</tr>
							<tr>
								<td>N2010</td>
								<td>6</td>
							</tr>
							<tr>
								<td>NSKY01</td>
								<td>7</td>
							</tr>
							<tr>
								<td>N0001</td>
								<td>8</td>
							</tr>
							<tr>
								<td>N451ST</td>
								<td>9</td>
							</tr>
							<tr>
								<td>N5008</td>
								<td>10</td>
							</tr>
							<tr>
								<td>NC2005</td>
								<td>11</td>
							</tr>
							<tr>
								<td>NCC1701</td>
								<td>12</td>
							</tr>
						</tbody>
					</table> 
				</div>
			</div>
		</div>
</div>
<script>
	$(document).ready(function() {
		loadPersonnelData();
		loadAircraftData();
		loadCommunicationsData();
	});
	
	function loadPersonnelData(){
		$(document).ready(function() {
		    $.ajax({
			    // type method call 
		    	type:"GET",  
		    	// url 
		        url: '/atlas-web/atlas-ws/person/personnel/list',
		        // type data on load
		        dataType: "json",
		        cache: false,
		        timeout: 5000,
		        success: function(data) {
		            $('#Personnel').datagrid({
		            	columns:[[
		            	          {field:'fullName',title:'Name'},editor:{type:'text'},
		            	          {field:'DISPLAY_ORDER',title:'Display Order',
		            	        	  formatter:function(value){
										var item=0;
										if(value==''){
											item=item++;
										}
										else 
											item=value;
										return item;
										},
									editor:{type:'numberbox',
										options:{												
											editable:false
										}
									}},
		            	 ]]
		            }).datagrid("loadData",data);
		        }
		    });
		});
	}
	
	function loadAircraftData(){
		$(document).ready(function() {
		    $.ajax({
		    	type:"GET",  
		        url: '/atlas-web/atlas-ws/aircraft/aircraftOrder/list',
		        dataType: "json",
		        cache: false,
		        timeout: 5000,
		        success: function(data) {
		            $('#Aircraft').datagrid({
		            	columns:[[
		            	          {field:'registrationNumber',title:'Registration Number'},editor:{type:'text'},
		            	          {field:'DISPLAY_ORDER',title:'Display Order',
		            	        	  formatter:function(value){
										var item=0;
										if(value==''){
											item=item++;
										}
										else 
											item=value;
										return item;
										},
									editor:{type:'numberbox',
										options:{												
											editable:false
										}
									}},
		            	 ]]
		            }).datagrid("loadData",data);
		        }
		    });
		});
	}
	
	function loadCommunicationData(){
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
		            $('#Communications').datagrid({
		            	columns:[[
		            	          {field:'commType',title:'Type'},editor:{type:'text'},
		            	          {field:'DISPLAY_ORDER',title:'Display Order',
		            	        	  formatter:function(value){
										var item=0;
										if(value==''){
											item=item++;
										}
										else 
											item=value;
										return item;
										},
									editor:{type:'numberbox',
										options:{												
											editable:false
										}
									}},
		            	 ]]
		            }).datagrid("loadData",data);
		        }
		    });
		});
	}
	function updateFields(){
		var communication = {
			commType:$('#commType').val(),
			order:$('#DISPLAY_ORDER').val()			
		}
		$.ajax({
            url: '/atlas-web/atlas-ws/addComm/communication/update',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(communication),  
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
</script>