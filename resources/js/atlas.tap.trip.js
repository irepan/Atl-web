var tripObject = null;
var originalTripObject = null;
var tripLegsObject = null;
var isInitTabManifest = false;
///////////////////////////////////////////////////////////////////////////////
function addRowsBefore() {

}
function addRowsAfter() {

}
function deleteRow() {

}

///////////////////////////////////////////////////////////////////////////////
$.extend($.fn.datagrid.defaults.editors, {
	workingcheckbox : {
		init : function(container, options) {
			var input = $('<input type="checkbox">').appendTo(container);
			return input;
		},
		getValue : function(target) {
			return $(target).prop('checked');
		},
		setValue : function(target, value) {
			$(target).prop('checked', value);
		}
	}

});

var cardview = $
		.extend(
				{},
				$.fn.datagrid.defaults.view,
				{
					renderRow : function(target, fields, frozen, rowIndex,
							rowData) {
						var cc = [];
						cc.push('<td style="height:auto;">');
						if (!frozen) {
							cc
									.push('<table width="931px" cellspacing="0" cellpadding="0" border="0" >');
							cc.push('<tr>');
							var check_tr = false;
							var check_tr2 = false;

							for (var i = 0; i < fields.length; i++) {
								//console.log('ind: ' + i + ' columna: '+ fields[i] + ' | valor: ' + rowData[fields[i]]);
								if (i > 26 && check_tr == false) {
									check_tr = true;
									cc.push('</tr>');
									cc.push('<tr>');
								}
								if (i > 46 && check_tr2 == false) {
									check_tr2 = true;
									cc.push('</tr>');
									cc.push('<tr>');
								}
								var copts = $(target).datagrid(
										'getColumnOption', fields[i]);

								if (i == 0) {
									cc
											.push("<td rowspan='3' width=22 style=';text-align:left;vertical-align:top;padding:0'>");
									cc
											.push('<div class="datagrid-cell" style="height:auto;">'
													+ rowData[fields[i]]
													+ '</div>');
									cc.push("</td>");
								} else if (i == 27 || i == 47) {

								} else if (i == 28 || i == 48) {
									cc.push("<td colspan='5'>");
									cc
											.push('<div class="datagrid-cell" style="height:auto;">'
													+ rowData[fields[i]]
													+ '</div>');
									cc.push("</td>");
								} else if (i == 29 || i == 49) {
									cc.push("<td colspan='4'>");
									cc
											.push('<div class="datagrid-cell" style="height:auto;">'
													+ rowData[fields[i]]
													+ '</div>');
									cc.push("</td>");
								} else if (i == 63) {
									cc.push("<td colspan='3'>");
									cc
											.push('<div class="datagrid-cell" style="height:auto;">'
													+ rowData[fields[i]]
													+ '</div>');
									cc.push("</td>");
								} else if (i == 33 || i == 38) {
									cc.push('<td>');
									cc
											.push('<div class="datagrid-cell" style="height:auto;">Z</div>');
									cc.push("</td>");
								} else if (i == 24) {
									cc.push('<td>');
									cc
											.push('<div class="datagrid-cell" style="height:auto;"> '
													+ (Math
															.floor(rowData[fields[i]] / 60))
													+ ' </div>');
									cc.push("</td>");
								} else if (i == 44) {
									cc.push('<td>');
									cc
											.push('<div class="datagrid-cell" style="height:auto;"> '
													+ (rowData[fields[i]] % 60)
													+ ' </div>');
									cc.push("</td>");
								} else if (i == 34 || i == 41 || i == 42) {
									var h = (Math
											.floor(rowData[fields[i]] / 60));
									var m = (rowData[fields[i]] % 60);
									var hrs = (h < 10 ? '0' + h : h);
									var mns = (m < 10 ? '0' + m : m);
									cc.push('<td>');
									cc
											.push('<div class="datagrid-cell" style="height:auto;"> '
													+ hrs
													+ ':'
													+ mns
													+ ' </div>');
									cc.push("</td>");
								} else {
									switch (rowData[fields[i]]) {
									case undefined:
										cc.push('<td>');
										cc
												.push('<div class="datagrid-cell" style="height:auto;"></div>');
										cc.push("</td>");
										break;
									case true:
										cc.push('<td field="' + fields[i]
												+ '">');
										cc
												.push('<div class="datagrid-cell" style="height:auto;"><input type="checkbox" name="'
														+ fields[i]
														+ '" checked value="1" disabled="disabled"></div>');
										cc.push("</td>");
										break;
									case false:
										cc.push('<td field="' + fields[i]
												+ '">');
										cc
												.push('<div class="datagrid-cell" style="height:auto;"><input type="checkbox" name="'
														+ fields[i]
														+ '" disabled="disabled"></div>');
										cc.push("</td>");
										break;
									default:
										if (i == 11 || i == 16 || i == 31
												|| i == 36 || i == 51
												|| i == 56) {
											cc.push('<td>');
											cc
													.push('<div class="datagrid-cell" style="height:auto;">'
															+ $.format
																	.date(
																			rowData[fields[i]],
																			'yyyy-MM-dd')
															+ '</div>');
											cc.push("</td>");
										} else if (i == 12 || i == 17
												|| i == 32 || i == 37
												|| i == 52 || i == 57) {
											cc.push('<td>');
											cc
													.push('<div class="datagrid-cell" style="height:auto;">'
															+ $.format
																	.date(
																			rowData[fields[i]],
																			'HH:mm')
															+ '</div>');
											cc.push("</td>");
										} else {
											cc.push('<td field="' + fields[i]
													+ '">');
											cc
													.push('<div class="datagrid-cell" style="height:auto;">'
															+ rowData[fields[i]]
															+ '</div>');
											cc.push("</td>");
										}
										break;
									}
								}
							}
							cc.push('</tr>');
							cc.push('</table>');
						}
						cc.push('</td>');
						return cc.join('');
					}
				});

///////////////////////////////////////////////////////////////////////////
$(function() {

	var t = $('#tabs');
	var tabs = t.tabs('tabs');
	var tab = $('#tabs').tabs('getTab', 0);
	$('#tabs').tabs('update', {
		tab : tab,
		options : {
			title : 'Trip ID ' + getParameterByName('id')
		}
	});

	//
	$.ajax({
		type : "GET",
		dataType : "json",
		url : '/atlas-web/trip/' + getParameterByNameEncode('id') + '',
		success : function(data) {
			$('#tripComments').textbox('setValue', data.comment);
			tripLegsObject = data;
			console.log(tripLegsObject);
		}
	});

	$('#tripGrid').datagrid({
		method : 'get',
		url : '/atlas-web/trip/' + getParameterByNameEncode('id') + '/legs',
		toolbar : '#tripToolbar',
		//title: 'Trip Legs',
		width : '950px',
		height : '282px',
		border : '1px',
		singleSelect : true,
		fitColumns : true,
		remoteSort : false,
		//pagination:     'false',
		sortOrder : 'desc',
		view : cardview,
		columns : [ [ {
			field : 'number',
			width : 22,
			title : 'Lg'
		}, {
			field : 'flightCategoryCode',
			width : 28,
			title : 'Cat'
		}, {
			field : 'confirmed',
			width : 25,
			title : 'Cf'
		}, {
			field : 'closed',
			width : 25,
			title : 'Cl'
		}, {
			field : 'aircraft',
			width : '43',
			title : 'A/C'
		}, {
			field : 'configuration',
			width : '31',
			title : 'Cfg'
		}, {
			field : 'paxCount',
			width : '26',
			title : 'Px'
		}, {
			field : 'dutyStandardCode',
			width : '24',
			title : 'DS'
		}, {
			field : 'manOver',
			width : '25',
			title : 'M'
		}, {
			field : 'podAirportId',
			width : '40',
			title : 'POD'
		}, {
			field : 'podDOWLs',
			width : '24',
			title : ''
		}, {
			field : 'podDateLs',
			width : '75',
			title : 'POD Dt'
		}, {
			field : 'podDateLs',
			width : '43',
			title : 'ETD'
		}, {
			field : 'podTzLs',
			width : '26',
			title : ''
		}, {
			field : 'poaAirportId',
			width : '40',
			title : 'POA'
		}, {
			field : 'poaDOWLs',
			width : '24',
			title : ''
		}, {
			field : 'poaDateLs',
			width : '75',
			title : 'POA Dt'
		}, {
			field : 'poaDateLs',
			width : '43',
			title : 'ETA'
		}, {
			field : 'poaTzLs',
			width : '26',
			title : ''
		}, {
			field : 'fuelOut',
			width : '45',
			title : 'Fuel'
		}, {
			field : 'distanceNM',
			width : '38',
			title : 'Dist'
		}, {
			field : 'eteHt',
			width : '44',
			title : 'ETE'
		}, {
			field : 'dutyHt',
			width : '44',
			title : 'Dty'
		}, {
			field : 'winds',
			width : '26',
			title : 'Wd'
		}, {
			field : 'groundTimeMins',
			width : '24',
			title : 'GT'
		}, // convercion de horas 
		{
			field : 'ron',
			width : '23',
			title : 'ON'
		}, {
			field : 'openSeat',
			width : '22',
			title : 'ST'
		}

		//<!--for second row elements-->
		, {
			field : '',
			hidden : true
		}, {
			field : 'personName',
			hidden : true
		}, {
			field : 'authorizationCode',
			hidden : true
		}, {
			field : 'podDOWZ',
			hidden : true
		}, {
			field : 'podDateZ',
			hidden : true
		}, //date
		{
			field : 'podDateZ',
			hidden : true
		}, //time
		{
			field : 'Z',
			hidden : true
		}, //etiqueta fija con valor Z
		{
			field : 'tmDiffMins',
			hidden : true
		}, //convertir a hora en formato hhmm  
		{
			field : 'poaDOWZ',
			hidden : true
		}, {
			field : 'poaDateZ',
			hidden : true
		}, //date
		{
			field : 'poaDateZ',
			hidden : true
		}, //time
		{
			field : 'Z2',
			hidden : true
		}, //etiqueta fija con valor Z
		{
			field : 'fuelUsed',
			hidden : true
		}, {
			field : '',
			hidden : true
		}, //vaciar campo columna
		{
			field : 'eteMins',
			hidden : true
		}, // convertir a formato hh:mm 
		{
			field : 'dutyMins',
			hidden : true
		}, // convertir a formato hh:mm 
		{
			field : '',
			hidden : true
		}, //vaciar campo columna
		{
			field : 'groundTimeMins',
			hidden : true
		}, // convercion de minutos 
		{
			field : '',
			hidden : true
		}, //vaciar campo columna
		{
			field : 'bookedSeat',
			hidden : true
		}

		//<!--for third row elements-->
		, {
			field : '',
			hidden : true
		}, {
			field : 'accountNumber',
			hidden : true
		}, {
			field : 'cargoWeight',
			hidden : true
		}, {
			field : 'podDOWHb',
			hidden : true
		}, {
			field : 'podDateHb',
			hidden : true
		}, {
			field : 'podDateHb',
			hidden : true
		}, {
			field : 'tzHb',
			hidden : true
		}, {
			field : 'tmCalcDir',
			hidden : true
		}, {
			field : 'poaDOWHb',
			hidden : true
		}, {
			field : 'poaDateHb',
			hidden : true
		}, {
			field : 'poaDateHb',
			hidden : true
		}, {
			field : 'tzHb',
			hidden : true
		}, {
			field : 'fuelIn',
			hidden : true
		}, {
			field : '',
			hidden : true
		}, //vaciar campo columna
		{
			field : 'estLear',
			hidden : true
		}, {
			field : '',
			hidden : true
		}, //vaciar campo columna
		{
			field : 'charge',
			hidden : true
		}, {
			field : 'waitlistedSeat',
			hidden : true
		} ] ],
		onClickRow : function(rowIndex) {
			var currentRow = $("#tripGrid").datagrid("getSelected");
			searchLegData(currentRow);
			searchLegLogistics(currentRow);
			searchPassengers(currentRow);
		},
		onLoadSuccess : function() {
			$(this).datagrid('selectRow', 0);

			var currentRow = $("#tripGrid").datagrid('getRows')[0];
			searchLegData(currentRow);
			searchLegLogistics(currentRow);
			searchPassengers(currentRow);
		}
	});
});

////////////////////////////////////////////////////////////////////////////
/**
 * Section Code for Tap-TRIP
 **/

function searchLegData(idTrip) {

	// load dynamic data on grid  
	$('#legComments').textbox('setValue', idTrip.comment);
	//load info poaAirComments
	$.ajax({
		type : "GET",
		dataType : "json",
		url : '/atlas-web/airport/' + idTrip.podAirportId + '/'
				+ idTrip.podAirportRef,
		success : function(data) {
			$('#poaAirComments').textbox('setValue', data.comments);
		}
	});
}

function searchPassengers(idLeg) {
	// load info on  list passenger
	$('#lstPassengers').datalist({
		height : 218,
		method : 'get',
		valueField : 'id',
		textField : 'fullName',
		lines : true,
		singleSelect : true,
		url : '/atlas-web/trip/' + idLeg.id + '/passengers',
		textFormatter : function(value, row, index) {
			return '<a href="#1">' + value + '</a>';
		}
	});
}

function searchLegLogistics(idLeg) {
	//search
	// load dynamic data on grid  
	$('#legLogistics')
			.datagrid(
					{
						method : 'get',
						url : '/atlas-ws/trip/' + idLeg.id + '/logistics',
						title : 'Logistics',
						width : '100%',
						height : 149,
						border : 1,
						singleSelect : true,
						fitColumns : false,
						remoteSort : false,
						columns : [ [
								{
									field : 'legLogisticsRecuested',
									width : 30,
									title : 'Rq',
									formatter : function(value, row, index) {
										if (row.legLogisticsRecuested) {
											return '<input type="checkbox" name="legLogisticsRecuested" checked value="1" disabled="disabled">';
										} else {
											return '<input type="checkbox" name="legLogisticsRecuested" disabled="disabled">';
										}
									}
								},
								{
									field : 'legLogisticsConfirmed',
									width : 30,
									title : 'Cf',
									formatter : function(value, row, index) {
										if (row.legLogisticsConfirmed) {
											return '<input type="checkbox" name="legLogisticsConfirmed" checked value="1" disabled="disabled">';
										} else {
											return '<input type="checkbox" name="legLogisticsConfirmed" disabled="disabled">';
										}
									}
								},
								{
									field : 'logisticType',
									width : 120,
									title : 'Type'
								},
								{
									field : 'legLogisticsPOD',
									width : 40,
									title : 'ICAO',
									formatter : function(value, row, index) {
										if (row.legLogisticsPOD) {
											return '<a href="#1">'
													+ idLeg.podAirportId
													+ '</a>';
										} else {
											return '<a href="#1">'
													+ idLeg.poaAirportId
													+ '</a>';
										}
									}
								},
								{
									field : 'vendorName',
									width : 160,
									title : 'Vendor Name',
									formatter : function(value, row, index) {
										if (row.apVendor != null) {
											return '<a href="#1">'
													+ row.apVendor.vendorName
													+ '</a>';
										}
									}
								},
								{
									field : 'commValue',
									width : 100,
									title : 'Telephone',
									formatter : function(value, row, index) {
										if (row.apVendor != null) {
											if (typeof row.apVendor.communications != 'undefined'
													&& row.apVendor.communications != null) {
												return '<a href="#1">'
														+ row.apVendor.communications[0].commValue
														+ '</a>';
											}
										}
									}
								}, {
									field : 'legLogisticsNote',
									width : 800,
									title : 'Notes'
								} ] ]
					});
}
