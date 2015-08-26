
<div id="trip">
	<div id="tabs" class="easyui-tabs" style="width: 970px; height: 593px">
		<div id="tabTrip" title="Trip id" style="padding: 10px">
		
			<table id="tripGrid"> 
 			</table>
			
			<div id="tripToolbar" style="padding: 3px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					plain="true" onclick="javascript:addRowsBefore();">New Leg Before</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					plain="true" onclick="javascript:addRowsAfter();">New Leg After</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
					plain="true" onclick="javascript:deleteRow();">Delete Leg</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"
					onclick="showMsg('Warning','Save Trip')">Save</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true"
					onclick="showMsg('Warning','Cancel Trip')">Cancel</a>
			</div>
			
			<div style="margin: 0px 0 5px 0;"></div>
			<div class="easyui-layout" style="width: 950px; height: 255px;">
				<div data-options="region:'east',split:true" title="Crew"
					style="width: 140px;">
					<div id="lstCrew" class="easyui-datalist" 
						data-options=" textField: 'fullName' ,
							lines: false " 
						style="width: 100%; height: 218px; list-style-type: none; padding: 10px; margin: 0px">
					</div>
				</div>
				<div data-options="region:'west',split:true" title="Passengers"
					style="width: 150px">
					<div id="lstPassengers" class="easyui-datalist" 
						data-options=" textField: 'fullName' ,
							lines: false " 
						style="width: 150px; height: 218px; list-style-type: none; padding: 10px; margin: 0px">
					</div>
				</div>
				<div data-options="region:'center'">
					<div class="easyui-layout" style="width: 642px; height: 243px"
						fit="true">
						<div data-options="region:'west',split:false,collapsible:false"
							style="width: 214px" title="Leg Comments">
							<input class="easyui-textbox"
								id="legComments"
								data-options="multiline:true,fit:true"
								style="width: 310px; height: 60px"
							>
						</div>
						<div data-options="region:'center',split:false,collapsible:false"
							title="POA Airport Comments">
							<input class="easyui-textbox"
								id="poaAirComments"
								data-options="multiline:true,fit:true,disabled:true"
								style="width: 310px; height: 60px; background: #F9F9F9"
								>
						</div>
						<div data-options="region:'east',split:false,collapsible:false"
							style="width: 214px" title="Trip Comments">
							<input class="easyui-textbox"
								id="tripComments"
								data-options="multiline:true,fit:true"
								style="width: 310px; height: 60px"
								>
						</div>
						<div data-options="region:'south',split:false" style="height:152px">
							<table id="legLogistics"></table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="tabTripManifest" title="Manifest" style="padding: 10px">
			
			<table id="manifestList"></table>
			
			<div id="manifestToolbar" style="padding: 3px">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"
					plain="true" onclick="javascript:addRowsBefore();">Add Pax</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
					onclick="javascript:addRowsAfter();">Add One-Time Pax</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
					plain="true" onclick="javascript:deleteRow();">Delete Pax</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"
					onclick="showMsg('Warning','Save')">Save</a> 
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true"
					onclick="showMsg('Warning','Cancel')">Cancel</a>
			</div>
			
			<div style="margin: 0px 0 5px 0;"></div>
			<div class="easyui-layout" style="width: 950px">
				<div>
					<label style="float: left; padding-left: 5px" class="label-title">Order</label>
					<label style="float: left; padding-left: 10px" class="label-title">Leg</label>
					<label style="float: left; padding-left: 30px" class="label-title">ID</label>
					<label style="float: left; padding-left: 253px" class="label-title">Name</label>
					<label style="float: left; padding-left: 232px" class="label-title">Assign Leg(s)</label> 
					<label style="float: left; padding-left: 185px" class="label-title">Code</label>
				</div>
				<div style="clear: both; margin-top: 5px">
				
					<input id="manOrder" class="easyui-textbox"
						style="width: 40px; height: 20px" value="" /> 
					
					<input  id="leg"
						class="easyui-combobox" name="leg" data-options="editable:false" 
						style="width: 48px; height: 20px">
					
					<input id="paxID" style="width: 260px; height: 20px"
						data-options="
										prompt:' ',
										icons:[{iconCls:'icon-search',
										handler: function(e){var v = $(e.data.target).textbox('getValue');
										showMsg('Warning','Search for Pax ID: ' + (v ? v : 'empty'));
										}}]" />
										
					<input id="paxName" class="easyui-combobox" style="width: 260px; height: 20px" data-options="
					                loader: myloader,
					                mode: 'remote',
					                valueField: 'id',
					                textField: 'name'
					            ">								
					<input id="assignedLegs" style="width: 260px">
					
					<input id="manCode" class="easyui-textbox"
						style="width: 43px; height: 20px" value="" />
				</div>
				
				<div>
					<label style="float: left; padding-left: 5px" class="label-title">Host Auth Code</label> 
					<label style="float: left; padding-left: 145px" class="label-title">Sponsor</label> 
					<label style="float: left; padding-left: 187px" class="label-title">Account</label>
					<label style="float: left; padding-left: 187px" class="label-title">Expense Location</label>
				</div>
				
				<div style="clear: both; margin-top: 5px">
					<select id="hostAuthCode" class="easyui-combobox" name="host"
						data-options="editable:false" style="width: 230px;; height: 20px">
					</select> 
					<input id="sponsor" class="easyui-combobox" style="width: 230px; height: 20px" data-options="
					                loader: myloader,
					                mode: 'remote',
					                valueField: 'id',
					                textField: 'name'
					            ">										
					<select id="account" class="easyui-combobox" name="account"
						data-options="editable:false" style="width: 230px;; height: 20px">
					</select> 
					
					<select id="expenseLocation" class="easyui-combobox"
						name="expenseLocation" data-options="editable:false"
						style="width: 230px;; height: 20px">
					</select>
				</div>
				<div>
					<label style="float: left; padding-left: 5px" class="label-title">Visa</label>
					<label style="float: left; padding-left: 213px" class="label-title">Stay</label>
					<label style="float: left; padding-left: 210px" class="label-title">Passport</label>
					<label style="float: left; padding-left: 185px" class="label-title">Passport Expiration</label> 
					<label style="float: left; padding-left: 82px" class="label-title">Dsm</label>
				</div>
				<div style="clear: both; margin-top: 5px">
					<select id="visa" class="easyui-combobox" name="visa"
						data-options="editable:false" style="width: 224px;; height: 20px">
					</select> 
					<input id="stay" class="easyui-textbox"
						style="width: 224px; height: 20px" value="" /> 
					<select
						id="passport" class="easyui-combobox" name="passport"
						data-options="editable:false" style="width: 224px;; height: 20px">
					</select> 
					
					<input id="passportExpiration" class="easyui-textbox"
						data-options="disabled:true" style="width: 224px; height: 20px"
						value="" /> 
						
					<input id="dsm" type="checkbox" onclick="" />
					
				</div>
				<div>
					<label style="float: left; padding-left: 5px" class="label-title">Reason For Travel</label>
				</div>
				
				<div style="clear: both; margin-top: 5px">
					<input id="reasonForTravel" class="easyui-textbox" style="width: 930px; height: 20px" value="" />
				</div>
				<div>
					<label style="float: left; padding-left: 0px" class="label-title">Passenger Manifest Comments</label> 
					<label style="float: left; padding-left: 302px" class="label-title">Passenger Profile Comments</label>
				</div>
				<div style="clear: both; margin-top: 5px">
					<input class="easyui-textbox" data-options="multiline:true"
						style="width: 463px; height: 84px"
						value="This Text Box will allow the user to enter a comment for the selected Passenger for the Trip.">
					<input class="easyui-textbox"
						data-options="multiline:true,disabled:true"
						style="width: 463px; height: 84px"
						value="This Text Box will display the Passenger Profile comments from the Passenger Profile web form.">
				</div>
			</div>
		</div>
			
		<div id="tabTripLogistics" title="Logistics"    style="padding:10px">
			<div class="easyui-layout" style="width:642px;height:243px" fit="true">
				<div data-options="region:'north',split:false,collapsible:false" style="height:28px" border="true">
					<div id="logisticsToolbar" style="padding: 3px">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true" onclick="javascript:addRow();">Add Logistics</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRow();">Delete Logistics</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-edit"    plain="true" onclick="javascript:logisticsTemplate();">Logistics Template</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="showMsg('Warning','Save')">Save</a>
						<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="showMsg('Warning','Cancel')">Cancel</a>
					</div>
				</div>
				<div data-options="region:'west',split:false,collapsible:false" style="width:580px;padding:10px" border="true">
					<div>
						<select id="logisticLegs" class="easyui-combobox" name="logLegs" data-options="editable:false" style="width:551px;height:20px;float:left;padding-left:5px">
							<option value="1"	>LEG 1 - KAPA Th FEB 19 15 0800 MS / KBOS Th FEB 19 15 1340 ES</option>
							<option value="2"	>LEG 2 - KBOS Th FEB 19 15 1500 MS / KAPA Th FEB 19 15 1840 ES</option>
							<option value="3"	>LEG 3 - KAPA Th FEB 19 15 0800 MS / KBOS Th FEB 19 15 1340 ES</option>
							<option value="4"	>LEG 4 - KBOS Th FEB 19 15 1500 MS / KAPA Th FEB 19 15 1840 ES</option>
							<option value="5"	>LEG 5 - KAPA Th FEB 19 15 0800 MS / KBOS Th FEB 19 15 1340 ES</option>
							<option value="6"	>LEG 6 - KBOS Th FEB 19 15 1500 MS / KAPA Th FEB 19 15 1840 ES</option>
							<option value="7"	>LEG 7 - KAPA Th FEB 19 15 0800 MS / KBOS Th FEB 19 15 1340 ES</option>
							<option value="8"	>LEG 8 - KBOS Th FEB 19 15 1500 MS / KAPA Th FEB 19 15 1840 ES</option>
							<option value="9"	>LEG 9 - KAPA Th FEB 19 15 0800 MS / KBOS Th FEB 19 15 1340 ES</option>
							<option value="10"	>LEG 10 - KBOS Th FEB 19 15 1500 MS / KAPA Th FEB 19 15 1840 ES</option>
						</select>
					</div>
					<div style="margin:10px 0px 0px 0px;height:477px">
						<table class="easyui-datagrid" id="logisticsGrid" style="width:300px; height:300px; border: 1px"  
							toolbar="" title="" pagination="false" idField="id" rownumbers="false" 
							fit="true" fitColumns="false" singleSelect="true" >
							<thead>
								<tr>
									<th field="TYPE"   width="276">Type</th>
									<th field="VENDOR" width="138">Vendor</th>
									<th field="NONE2"  width="138"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>PURPOSE</td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr>
									<td>KAPA</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>FBO</td>
									<td colspan="2">TAC AIR</td>
									<td></td>
								</tr>
								<tr>
									<td>KAPA</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>GRND_TRANS</td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr>
									<td>KAPA</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>FBO</td>
									<td colspan="2">SIGNATURE FLIGHT SUPPORT</td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>GRND_TRANS</td>
									<td colspan="2">SAVOYA</td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>HOTEL</td>
									<td colspan="2">RADISSON BOSTON</td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>MEETING LOCATION</td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>MEETING LOCATION</td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>HOTEL</td>
									<td colspan="2"></td>
									<td></td>
								</tr>
								<tr>
									<td>KBOS</td>
									<td>Requested</td>
									<td>Confirmed</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div data-options="region:'center',split:false,collapsible:false" border="true">
					<div class="easyui-tabs" fit="true" style="width:300px;height:500px">
						<div title="Vendor" style="padding:5px;height:187px">
							<div class="easyui-layout" style="width:642px;height:243px" fit="true">
								<div data-options="region:'north',split:false,collapsible:false" style="height:116px" border="false">
									<table class="easyui-datagrid" id="vendorCommGrid" style="width: 200px; border: 1px"  
										toolbar="" pagination="false" idField="id" rownumbers="false" 
										fit="true" fitColumns="false" singleSelect="true" >
										<thead>
											<tr>
												<th field="PURPOSE_TYPE"  width="180">Communication</th>
												<th field="COMMUNICATION" width="177"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>BUSINESS PHONE</td>
												<td>303-799-8388</td>
											</tr>
											<tr>
												<td>BUSINESS TOLL FREE NUMBER</td>
												<td>800-799-8388</td>
											</tr>
											<tr>
												<td>BUSINESS FAX</td>
												<td>303-799-0057</td>
											</tr>
											<tr>
												<td>BUSINESS EMAIL</td>
												<td>apa@signatureflight.com</td>
											</tr>
											<tr>
												<td>BUSINESS WEBSITE</td>
												<td>www.signatureflight.com</td>
											</tr>
											<tr>
												<td>BUSINESS SITA 1</td>
												<td>EZEKKLB</td>
											</tr>
											<tr>
												<td>BUSINESS SITA 2</td>
												<td>EZETKLB</td>
											</tr>
											<tr>
												<td>ARINC FREQUENCY</td>
												<td>129.7</td>
											</tr>
											<tr>
												<td>AIR TO GROUND FREQUENCY</td>
												<td>131.4</td>
											</tr>
											<tr>
												<td>UNICOM FREQUENCY</td>
												<td>131.5</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div data-options="region:'center',split:false,collapsible:false" border="false" >
									<label>Address</label>
									<input class="easyui-textbox" id="vendorAddress" data-options="multiline:true,disabled:true" style="width:375px;height:58px" value="8001 S INTERPORT BLVD ....................................................... PO BOX 12345..................................................................... ENGLEWOOD COLORADO 80112 ............................................. US UNITED STATES">
									<label>Airport Vendor Comments</label>
									<input class="easyui-textbox" id="airportVendorComments" data-options="multiline:true,disabled:true" style="width:375px;height:112px" value="This Text Box will display the Airport Vendor comments from table COMPANY_AP_VNDR field CAV_COMMENTS">
									<label>General Vendor Comments</label>
									<input class="easyui-textbox" id="generalVendorComments" data-options="multiline:true,disabled:true" style="width:375px;height:112px" value="This Text Box will display the General Vendor comments from table COMPANY_VENDOR field CV_COMMENTS">
								</div>
							</div>
						</div>
						<div title="POD" style="padding:5px;height:187px">
							<div class="easyui-layout" style="width:642px;height:243px" fit="true">
								<div data-options="region:'north',split:false,collapsible:false" style="height:116px" border="false">
									<table class="easyui-datagrid" id="PODCommGrid" style="width: 200px; border: 1px"  
										toolbar="" pagination="false" idField="id" rownumbers="false"
										fit="true" fitColumns="false" singleSelect="true" >
										<thead>
											<tr>
												<th field="PURPOSE_TYPE"  width="180">Communication</th>
												<th field="COMMUNICATION" width="177"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>ATIS PHONE</td>
												<td>303-799-6722</td>
											</tr>
											<tr>
												<td>ASOS PHONE</td>
												<td>303-706-9098</td>
											</tr>
											<tr>
												<td>AWOS PHONE</td>
												<td></td>
											</tr>
											<tr>
												<td>CUSTOMS PHONE</td>
												<td>303-768-0309</td>
											</tr>
											<tr>
												<td>IMMIGRATION PHONE</td>
												<td>303-706-9096</td>
											</tr>
											<tr>
												<td>AGRICULTURE PHONE</td>
												<td>303-706-9097</td>
											</tr>
											<tr>
												<td>FSS PHONE</td>
												<td>1-800-WX-BRIEF</td>
											</tr>
											<tr>
												<td>AIRPORT MANAGER PHONE</td>
												<td>303-790-0598</td>
											</tr>
											<tr>
												<td>TOWER FREQUENCY</td>
												<td>118.900</td>
											</tr>
											<tr>
												<td>GROUND FREQUENCY</td>
												<td>121.800</td>
											</tr>
											<tr>
												<td>UNICOM FREQUENCY</td>
												<td>122.950</td>
											</tr>
											<tr>
												<td>CLEARANCE DEL1 FREQUENCY</td>
												<td>128.600</td>
											</tr>
											<tr>
												<td>CLEARANCE DEL2 FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>APPROACH FREQUENCY</td>
												<td>132.750</td>
											</tr>
											<tr>
												<td>DEPARTURE FREQUENCY</td>
												<td>132.750</td>
											</tr>
											<tr>
												<td>ATIS FREQUENCY</td>
												<td>120.300</td>
											</tr>
											<tr>
												<td>ASOS FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>AWOS FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>AWOS TYPE</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div data-options="region:'center',split:false,collapsible:false" border="false" >
									<label>Address</label>
									<input class="easyui-textbox" id="PODAddress" data-options="multiline:true,disabled:true" style="width:375px;height:58px" value="DENVER COLORADO ............................................................... US UNITED STATES">
									<label>Company Airport Comments</label>
									<input class="easyui-textbox" id="PODcompanyAirportComments" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the Company POD Airport comments from table COMPANY_AIRPORT field CMPY_AP_COMMENTS">
									<label>Country Overflight and Entry Requirements</label>
									<input class="easyui-textbox" id="PODcountryOverflightReq" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the POD Overflight and Entry Requirements from table COUNTRY field CTRY_UV_OVER_REQ">
									<label>Country VISA/Passport and General Info</label>
									<input class="easyui-textbox" id="PODcountryVISAPassports" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the POD VISA/Passport and General Info from table COUNTRY field CTRY_UV_VP_GEN_INFO">
								</div>
							</div>
						</div>
						<div title="POA" style="padding:5px;height:187px">
							<div class="easyui-layout" style="width:642px;height:243px" fit="true">
								<div data-options="region:'north',split:false,collapsible:false" style="height:116px" border="false">
									<table class="easyui-datagrid" id="vendorCommGrid" style="width: 200px; border: 1px"  
										toolbar="" pagination="false" idField="id" rownumbers="false" 
										fit="true" fitColumns="false" singleSelect="true" >
										<thead>
											<tr>
												<th field="PURPOSE_TYPE"  width="180">Communication</th>
												<th field="COMMUNICATION" width="177"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>ATIS PHONE</td>
												<td>617-567-0160</td>
											</tr>
											<tr>
												<td>ASOS PHONE</td>
												<td>617-657-5762</td>
											</tr>
											<tr>
												<td>AWOS PHONE</td>
												<td></td>
											</tr>
											<tr>
												<td>CUSTOMS PHONE</td>
												<td>617-568-1810</td>
											</tr>
											<tr>
												<td>IMMIGRATION PHONE</td>
												<td>617-561-5745</td>
											</tr>
											<tr>
												<td>AGRICULTURE PHONE</td>
												<td>617-568-1481</td>
											</tr>
											<tr>
												<td>FSS PHONE</td>
												<td>1-800-99-27433</td>
											</tr>
											<tr>
												<td>AIRPORT MANAGER PHONE</td>
												<td>617-567-5400</td>
											</tr>
											<tr>
												<td>TOWER FREQUENCY</td>
												<td>124.725</td>
											</tr>
											<tr>
												<td>GROUND FREQUENCY</td>
												<td>121.9</td>
											</tr>
											<tr>
												<td>UNICOM FREQUENCY</td>
												<td>122.950</td>
											</tr>
											<tr>
												<td>CLEARANCE DEL1 FREQUENCY</td>
												<td>121.650</td>
											</tr>
											<tr>
												<td>CLEARANCE DEL2 FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>APPROACH FREQUENCY</td>
												<td>127.200</td>
											</tr>
											<tr>
												<td>DEPARTURE FREQUENCY</td>
												<td>133.000</td>
											</tr>
											<tr>
												<td>ATIS FREQUENCY</td>
												<td>127.875</td>
											</tr>
											<tr>
												<td>ASOS FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>AWOS FREQUENCY</td>
												<td></td>
											</tr>
											<tr>
												<td>AWOS TYPE</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div data-options="region:'center',split:false,collapsible:false" border="false" >
									<label>Address</label>
									<input class="easyui-textbox" id="POAAddress" data-options="multiline:true,disabled:true" style="width:375px;height:58px" value="BOSTON MASSACHUSETTS ..................................................... US UNITED STATES">
									<label>Company Airport Comments</label>
									<input class="easyui-textbox" id="POAcompanyAirportComments" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the Company POA Airport comments from table COMPANY_AIRPORT field CMPY_AP_COMMENTS">
									<label>Country Overflight and Entry Requirements</label>
									<input class="easyui-textbox" id="POAcountryOverflightReq" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the POA Overflight and Entry Requirements from table COUNTRY field CTRY_UV_OVER_REQ">
									<label>Country VISA/Passport and General Info</label>
									<input class="easyui-textbox" id="POAcountryVISAPassports" data-options="multiline:true,disabled:true" style="width:375px;height:66px" value="This Text Box will display the POA VISA/Passport and General Info from table COUNTRY field CTRY_UV_VP_GEN_INFO">
								</div>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>

	</div>
</div>

<script type="text/javascript" src="./resources/js/atlas.tap.trip.js"/></script>
<script type="text/javascript" src="./resources/js/atlas.tap.manifest.js"/></script>
<script type="text/javascript" src="./resources/js/atlas.tap.logistics.js"/></script>




