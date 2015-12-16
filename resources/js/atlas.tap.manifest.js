/**
 * Section Code for Tap-TRIP
 */

$(document).ready(function () {});

var isStarting = true;

function initiallizeManifest() {
	if (!isInitTabManifest) {
		getTripManifest();
		isInitTabManifest = true;
	}
}

$('#tabs').tabs({
	border : false,
	onSelect : function (title) {
		if (title == "Manifest") {
			initiallizeManifest();
		}
	}
});

// Method for cancel changes on tab manifest
function cancelChanges() {
	isStarting = true;
	tripObject = originalTripObject;
	loadGridManifests(0, true);
	isStarting = false;
	showMsg('Warning', 'Changes was canceled.');
}

// Method for update changes on tab manifest
function updateTripManifest() {
	$.ajax({
		url : '/atlas-web/trip/saveTripManifest',
		type : 'POST',
		dataType : 'json',
		data : JSON.stringify(tripObject),
		contentType : 'application/json',
		mimeType : 'application/json',
		success : function (data) {
			tripObject = data;
			sortTripManifest();
			originalTripObject = jQuery.extend(true, {}, tripObject);
			showMsg('Information', 'Changes was updated successfully.');
		},
		error : function (xhr, status, error) {
			showMsg('Warning', 'Error on update ' + error);
		}
	});
}

// Method for get data of manifests
function getTripManifest() {
	$.ajax({
		type : 'GET',
		url : '/atlas-web/trip/' + getParameterByNameEncode('id')
		 + '/getTripManifest',
		dataType : "json",
		cache : false,
		timeout : 5000,
		success : function (data) {
			tripObject = data;
			sortTripManifest();
			originalTripObject = jQuery.extend(true, {}, tripObject);
			loadGridManifests(0, true);
			console.log(tripObject);
			isStarting = false;
		},
		error : function (xhr, status, error) {
			showMsg('Warning', 'Error on update ' + error);
		}
	});
}

// Method for sort the manifests for the grid
function sortTripManifest() {
	tripObject["tripManifests"].sort(function (a, b) {
		return parseFloat(a.order) - parseFloat(b.order);
	});
}

// Method for load data on grid manifest
function loadGridManifests(rowIndex, loadManifestInfo) {
	$('#manifestList').datagrid({
		width : '100%',
		height : 244,
		border : 1,
		toolbar : '#manifestToolbar',
		title : '',
		pagination : false,
		idField : '',
		rownumbers : false,
		fitColumns : false,
		singleSelect : true,
		columns : new Array(getColumnsGrid()),
		timer : 2,
		onLoadSuccess : function () {
			$(this).datagrid('selectRow', rowIndex);
			var currentRow = $(this).datagrid("getSelected");
			if (loadManifestInfo) {
				loadInfoManifest(currentRow);
			} else {
				loadAssignLegs(currentRow);
			}
		},
		// event action row
		onClickRow : function (rowIndex) {
			var currentRow = $(this).datagrid("getSelected");
			loadInfoManifest(currentRow);
		}
	}).datagrid("loadData", getInfoManifestsGrid());
}

// Method for load info of each manifest
function loadInfoManifest(currentRow) {
	$('#manOrder').textbox('setValue',
		getTripManifestValue(tripObject, currentRow.idTm, "order"));
	$('#paxID').textbox('setValue',
		getTripManifestValue(tripObject, currentRow.idTm, "idPx"));
	$('#paxName').textbox('setValue',
		getTripManifestValue(tripObject, currentRow.idTm, "namePx"));
	$('#pxProfileComments')
	.textbox(
		'setValue',
		getTripManifestValue(tripObject, currentRow.idTm,
			"profileComments"));

	loadTripComments(currentRow);
	loadAssignLegs(currentRow);
	loadLegsCombo(currentRow);
}

// Method for load info and set event on change in input trip comments
function loadTripComments(currentRow) {
	$('#pxTripComments').textbox({
		onChange : function (newValue, oldValue) {
			if (!isStarting && (newValue != oldValue)
				 && newValue != undefined) {
				setTripManifestValue(tripObject, currentRow.idTm,
					"manifestComments", newValue);
			}
		}
	});
	$('#pxTripComments').textbox(
		'setValue',
		getTripManifestValue(tripObject, currentRow.idTm,
			"manifestComments"));
}

// Method for load combo legs and set event for load info for each leg manifest
function loadLegsCombo(currentRow) {
	var listLegsAssign = $.map(currentRow, function (value, key) {
			function itemlla(numLeg, idLeg, idTm) {
				this.numLeg = numLeg;
				this.idTm = idTm;
				this.idLeg = idLeg;
			}
			return (key.substring(0, 4) == 'poa_' && value != '') ? new itemlla(key
				.substring(4, 5), key.substring(6, 7), currentRow.idTm) : null;
		});
	$('#leg').combobox({
		data : listLegsAssign,
		valueField : 'numLeg',
		textField : 'numLeg',
		onSelect : function (row) {
			loadInfoLegManifest(row.idLeg, row.idTm);
		},
		onLoadSuccess : function () {
			var val = $(this).combobox("getData");
			for (var item in val[0]) {
				if (item == "numLeg") {
					$(this).combobox("select", val[0][item]);
				}
			}
		}
	});
}

// Method for load info of grid assign legs, and set event for select and
// unselect
function loadAssignLegs(currentRow) {
		var listLegsAssignChk = $.map(currentRow, function (value, key) {
			function itemlla(chk, numLeg, idLeg, value) {
				this.selectedleg = chk;
				this.numLeg = numLeg;
				this.idLeg = idLeg;
				this.manCode = value;
			}
			return (key.substring(0, 4) == 'poa_') ? new itemlla(value != '' ? true
				 : false, key.substring(4, 5), key.substring(6, 7), value)
			 : null;
		});
		
	$('#assignedLegs')
	.combogrid({
		panelWidth : 250,
		multiple : true,
		idField : 'itemid',
		editable : false,
		textField : 'numLeg',
		columns : [[{
					field : 'selectedleg',
					title : '     ',
					width : 20,
					formatter : function (value, row, index) {
						if (row.selectedleg) {
							return '<input type="checkbox" name="selectedleg" checked value="1" >';
						} else {
							return '<input type="checkbox" name="selectedleg" >';
						}
					},editor:{
						type:'checkbox',
						options:{
							valueField:'selectedleg',
							required:true
						}
					}
				}, {
					field : 'numLeg',
					title : 'Leg',
					width : 20
				}, {
					field : 'manCode',
					title : 'Code',
					width : 30,
					editor:{
						type:'textbox',
						options:{
							valueField:'manCode',
							textField:'code',
							required:true
						}
					}
				}
			]],
		fitColumns : true
	}).combogrid("grid").edatagrid({
		singleSelect : true,
		data : listLegsAssignChk
		
	});
}

// Method for load info of each leg manifest
function loadInfoLegManifest(idLeg, idTm) {
	var tripManifest = getTripManifestObject(tripObject, idTm);
	loadInfoManifestCode(idLeg, tripManifest);
	loadInfoStay(idLeg, tripManifest);
	loadInfoReason(idLeg, tripManifest);
	loadInfoDisembark(idLeg, tripManifest);
	loadInfoHostAuthCode(idLeg, tripManifest);
	loadInfoExpenseLocation(idLeg, tripManifest);
	loadInfoAccount(idLeg, tripManifest);
}

// Method for load info of manifest code
function loadInfoManifestCode(idLeg, tripManifest) {
	$('#manCode').textbox({
		required:true,
		onChange : function (newValue, oldValue) {
			if (!isStarting && (newValue != oldValue)
				 && newValue != undefined) {
				setLegManifestValue(tripManifest, idLeg,
					"manifestCode", newValue);
				var selectedrow = $("#manifestList").datagrid(
						"getSelected");
				loadGridManifests($("#manifestList").datagrid(
						"getRowIndex", selectedrow), false);

			}
		}
	});
	$('#manCode').textbox('setValue',
		getLegManifestValue(tripManifest, idLeg, "manifestCode"));
}

// Method for load info host auth code
function loadInfoHostAuthCode(idLeg, tripManifest) {
	$('#hostAuthCode').textbox({
		editable : false,
		icons : [{
				iconCls : 'icon-search',
				handler : function (e) {
					//var val = $(e.data.target).textbox('getValue');
					//console.log(val)
					openAuthLookup();
				}
			}
		]
	})
	$('#hostAuthCode').textbox('setValue', getLegManifestValue(tripManifest, idLeg, "authorizationCode"));
}

// Method for load info host expense location 
function loadInfoExpenseLocation(idLeg, tripManifest) {
	$('#expenseLocation').textbox({
		editable : false,
		icons : [{
				iconCls : 'icon-search',
				handler : function (e) {
					//var val = $(e.data.target).textbox('getValue');
					//console.log(val)
					openAuthLookup();
				}
			}
		]
	})
	$('#expenseLocation').textbox('setValue', getLegManifestValue(tripManifest, idLeg, "expenseLocation"));
}

// Method for load info host expense location 
function loadInfoAccount(idLeg, tripManifest) {
	$('#account').textbox({
		editable : false,
		icons : [{
				iconCls : 'icon-search',
				handler : function (e) {
					//var val = $(e.data.target).textbox('getValue');
					//console.log(val)
					openAuthLookup();
				}
			}
		]
	})
	$('#account').textbox('setValue', getLegManifestValue(tripManifest, idLeg, "accountNumber"));
}

// Method for load info of stay
function loadInfoStay(idLeg, tripManifest) {
	$('#stay').textbox({
		onChange : function (newValue, oldValue) {
			if (!isStarting && (newValue != oldValue)
				 && newValue != undefined) {
				setLegManifestValue(tripManifest, idLeg, "stay",
					newValue);
			}
		}
	});
	$('#stay').textbox('setValue',
		getLegManifestValue(tripManifest, idLeg, "stay"));
}

// Method for load info of reason
function loadInfoReason(idLeg, tripManifest) {
	$('#reasonForTravel').textbox({
		onChange : function (newValue, oldValue) {
			if (!isStarting && (newValue != oldValue)
				 && newValue != undefined) {
				setLegManifestValue(tripManifest, idLeg, "reason",
					newValue);
			}
		}
	});
	$('#reasonForTravel').textbox('setValue',
		getLegManifestValue(tripManifest, idLeg, "reason"));
}

// Method for load info of reason
function loadInfoDisembark(idLeg, tripManifest) {
	$('#dsm').change(
		function () {
		setLegManifestValue(tripManifest, idLeg, "disembark", $(this)
			.is(":checked"));
	});
	$('#dsm').attr('checked',
		getLegManifestValue(tripManifest, idLeg, "disembark"));
}

// Method for load rows in grid manifests
function getInfoManifestsGrid() {
	var tripManifests = tripObject["tripManifests"];

	var data = {
		total : tripManifests.length,
		rows : []
	};

	// Get info of TripManifests
	$.each(tripManifests, function (k, v) {
		var row = {
			order : v.order,
			namePx : v.namePx
		};
		// Get TripLegs of trip
		$.each(tripLegsObject["legs"], function (k1, v1) {
			var code = "";
			// Get LegsManifests from TripManifest
			$.each(v["legsManifests"], function (k, v) {
				// Compare if exists the LegManifest respect TripLeg, if not
				// exists set null value in the row
				if (v1.id == v.legId) {
					code = v.manifestCode;
					return false;
				}
			});
			row["poa_" + v1.number + "_" + v1.id] = code;
		});
		row["idTm"] = v.idTm;
		data.rows.push(row);
	});

	return data;
}

// Method for load info for columns title in grid manifest
function getColumnsGrid() {
	var columns = [];
	columns.push({
		field : "order",
		title : "Order",
		width : "40px"
	});
	columns.push({
		field : "namePx",
		title : "Passennger Name",
		width : "200px"
	});

	$.each(tripLegsObject["legs"], function (k, v) {
		columns.push({
			field : "poa_" + v.number + "_" + v.id,
			title : v.number + "-" + v.poaAirportId,
			width : "52px"
		});
	});
	return columns;
}

function getTripManifestObject(tripObject, manifestId) {
	return (tripObject["tripManifests"].filter(function (v) {
			return v["idTm"] == manifestId;
		}))[0];
}

function getTripManifestValue(tripObject, manifestId, field) {
	var obj = (tripObject["tripManifests"].filter(function (v) {
			return v["idTm"] == manifestId;
		}))[0];
	if (null != obj) {
		return obj[field];
	} else {
		showMsg('Warning', 'The Trip Manifest with id ' + manifestId
			 + ' does not exists.');
	}
}

function setTripManifestValue(tripObject, manifestId, field, value) {
	var obj = (tripObject["tripManifests"].filter(function (v) {
			return v["idTm"] == manifestId;
		}))[0];
	if (null != obj) {
		obj[field] = value;
		obj["status"] = "UPDATED";
	} else {
		showMsg('Warning', 'The Trip Manifest with id ' + manifestId
			 + ' does not exists.');
	}
}

function getLegManifestObject(manifestObject, legId) {
	return (manifestObject["legsManifests"].filter(function (v) {
			return v["legId"] == legId;
		}))[0];
}

function getLegManifestValue(manifestObject, legId, field) {
	var obj = (manifestObject["legsManifests"].filter(function (v) {
			return v["legId"] == legId;
		}))[0];
	if (null != obj) {
		return obj[field];
	} else {
		showMsg('Warning', 'The Leg Manifest with id ' + legId
			 + ' does not exists.');
	}
}

function setLegManifestValue(manifestObject, legId, field, value) {
	var obj = (manifestObject["legsManifests"].filter(function (v) {
			return v["legId"] == legId;
		}))[0];
	if (null != obj) {
		obj[field] = value;
		obj["status"] = "UPDATED";
		manifestObject["status"] = "UPDATED";
	} else {
		showMsg('Warning', 'The Leg Manifest with id ' + legId
			 + ' does not exists.');
	}
}

/**
 *
 */

function constructorComponents() {
	$('#assignedLegs')
	.combogrid({
		panelWidth : 250,
		multiple : true,
		idField : 'itemid',
		editable : false,
		textField : 'legNum',
		columns : [[{
					field : 'selectedleg',
					title : '     ',
					width : 20,
					formatter : function (value, row, index) {
						if (row.selectedleg) {
							return '<input type="checkbox" name="selectedleg" checked value="1" >';
						} else {
							return '<input type="checkbox" name="selectedleg" >';
						}
					}
				}, {
					field : 'legNum',
					title : 'Leg',
					width : 20
				}, {
					field : 'manCode',
					title : 'Code',
					width : 30
				}
			]],
		fitColumns : true
	});
	$('#hostAuthCode').combobox({
		url : '/atlas-web/trip/authorization/',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});

	$('#account').combobox({
		url : '/atlas-web/person/accountnumber/',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});

	$('#expenseLocation').combobox({
		url : '/atlas-web/lookup/expenselocation',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});
}

/**
 *
 */
function loadDataGrcurrentRowManifest() {
	// load dynamic data on grid
	$
	.ajax({
		// type method call
		type : "GET",
		// url
		url : '/atlas-web/trip/' + getParameterByNameEncode('id')
		 + '/manifest',
		// type data on load
		dataType : "json",
		cache : false,
		timeout : 5000,
		success : function (data) {
			var dataTripManifest = {
				header : data[0].columns,
				content : data[0].data
			};

			$('#manifestList').datagrid({
				width : '100%',
				height : 244,
				border : 1,
				toolbar : '#manifestToolbar',
				title : '',
				pagination : false,
				idField : '',
				rownumbers : false,
				fitColumns : false,
				singleSelect : true,
				// load dynamic columns on tables
				columns : new Array(dataTripManifest.header),
				onLoadSuccess : function () {
					$(this).datagrid('selectRow', 0);
					var currentRow = $(this).datagrid(
							"getSelected");
					searchManifestData(dataTripManifest.header,
						currentRow);
				},
				// event action row
				onClickRow : function (rowIndex) {
					var currentRow = $(this).datagrid(
							"getSelected");
					searchManifestData(dataTripManifest.header,
						currentRow);
				}
			}).datagrid("loadData", dataTripManifest.content);

			$('#manOrder').textbox('textbox').bind('keydown',
				function (e) {
				if (e.keyCode == 13) { // when press ENTER key,
					// accept the
					// inputed value.
					// parameter value for method of selection
				}
			});
		}
	});
}

/**
 * load information of leg selected
 *
 * @param currentRowManifest
 */
function searchManifestData(headerManifest, currentRowManifest) {
	// search info Manifest selected

	$('#pxTripComments').textbox('setValue', currentRowManifest.comments);

	// generated List Leg Assign
	var headerManifestPoa = {};
	$.each(headerManifest, function (i, v) {
		if (v.field.substring(0, 4) == 'poa_') {
			var nameItem = v.field;
			headerManifestPoa[nameItem] = v.title;
		}
	});

	// load info leg selected
	var listLegManifest = $
		.map(
			currentRowManifest,
			function (value, key) {
			function itemlla(id, text) {
				this.id = id
					this.value = text
			}
			return (key.substring(0, 13) == 'legManifests_' && value != '') ? new itemlla(
				key, value)
			 : null;
		});

	// visa
	$('#visa')
	.combobox({
		url : '/atlas-web/trip/passengers/'
		 + currentRowManifest.pxId + '/visa/',
		method : 'get',
		dataType : "json",
		valueField : 'passportNumber',
		textField : 'number',
		onSelect : function (rec) {
			if (typeof rec === 'undefined') {
				$('#passport').combobox('setValue', '');
				$('#passportExpiration')
				.textbox('setValue', '');
			} else {
				$('#passport').combobox('setValue',
					rec.passportNumber);
			}
		}
	});

	// passport
	$('#passport').combobox({
		url : '/atlas-web/trip/passengers/' + currentRowManifest.pxId
		 + '/passport',
		method : 'get',
		dataType : "json",
		valueField : 'number',
		textField : 'number',
		onSelect : function (rec) {
			if (typeof rec === 'undefined') {
				$('#passportExpiration').textbox('setValue', '');
			} else {
				$('#passportExpiration').textbox('setValue',
					rec.expeditionDate);

			};
		}
	});

	$('#hostAuthCode').combobox({
		url : '/atlas-web/trip/authorization/',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});

	$('#account').combobox({
		url : '/atlas-web/person/accountnumber/',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});

	$('#expenseLocation').combobox({
		url : '/atlas-web/lookup/expenselocation',
		method : 'get',
		dataType : "json",
		valueField : 'id',
		textField : 'description'
	});

	// load dynamic data on grid
	$('#manOrder').textbox('setValue', currentRowManifest.manifestOrder);

	// load information passenger
	$
	.ajax({
		url : '/atlas-web/trip/passengers/' + currentRowManifest.pxId
		 + '/info',
		dataType : 'json',
		success : function (data) {
			console.log(data.nameId);
			$('#paxID').textbox('setValue', data.nameId);
			$('#paxName').combobox('setValue', data.fullName);
			$('#pxProfileComments').textbox('setValue',
				data.passengerComments);
		}
	}); // load information passenger

	// generated list for combobox leg
	var listLegsAssign = $.map(currentRowManifest, function (value, key) {
			function itemlla(id, text) {
				this.id = id
					this.text = text
			}
			return (key.substring(0, 4) == 'poa_' && value != '') ? new itemlla(key
				.substring(4, 5), key.substring(4, 5)) : null;
		});
	$('#leg').combobox({
		data : listLegsAssign,
		valueField : 'id',
		textField : 'text',
		onSelect : function (row) {
			// load info leg-legmanifest
			loadDataLegs(row.id, listLegsAssign, headerManifestPoa,
				currentRowManifest);
		},
		onLoadSuccess : function () {
			var val = $(this).combobox("getData");
			for (var item in val[0]) {
				if (item == "id") {
					$(this).combobox("select", val[0][item]);
				}
			}
		}
	}); // generated list for combobox leg

	// generated List Leg Assign
	var listLegsAssignChk = $.map(currentRowManifest, function (value, key) {
			function itemlla(chk, id, text) {
				this.selectedleg = chk,
				this.legNum = id
					this.manCode = text
			}
			return (key.substring(0, 4) == 'poa_') ? new itemlla(value != '' ? true
				 : false, key.substring(4, 5), value) : null;
		});
	$('#assignedLegs').combogrid("grid").datagrid({
		singleSelect : true,
		data : listLegsAssignChk
	}); // generated List Leg Assign

}

/**
 * method search name
 */
var searchNameText = function (param, success, error) {
	var q = param.q || '';
	if (q.length < 1) {
		return false
	}
	$.ajax({
		url : '/atlas-web/trip/passengers/' + q + '/1/search',
		dataType : 'json',
		success : function (data) {
			var items = $.map(data.rows, function (value, key) {
					return {
						id : value.id,
						name : value.fullName
					};
				});
			success(items);
		},
		error : function () {
			error.apply(this, arguments);
		}
	});
}

/**
 * method search name
 */
var searchNameTextShort = function (param, success, error) {
	var q = param.q || '';
	if (q.length < 1) {
		return false
	}
	$.ajax({
		url : '/atlas-web/trip/passengers/' + q + '/2/search',
		dataType : 'json',
		success : function (data) {
			var items = $.map(data.rows, function (value, key) {
					return {
						id : value.id,
						name : value.nameId
					};
				});
			success(items);
		},
		error : function () {
			error.apply(this, arguments);
		}
	});
}

function loadDataLegs(idx, listLegsAssign, headerManifestPoa,
	currentRowManifest) {

	/**
	 * get leg and airport selected of grid manifest
	 */
	var _airport = '';
	$.each(headerManifestPoa, function (index, value) {
		if (value.substring(0, 1) == idx)
			_airport = value;
	});

	/**
	 * search data row of legmanifest
	 */
	var dataRowLegManifest = '';
	$.each(currentRowManifest, function (index, value) {
		if (index.substring(0, 13) == 'legManifests_'
			 && index.substring(13, 14) == idx) {
			$.each(value, function (i, v) {
				if (v.leg.poaAirportId == _airport
					.substring(2, _airport.length)) {
					dataRowLegManifest = v;
				}
			});
		}
	});

	/**
	 * set data in components
	 */
	$('#manCode').textbox('setValue', dataRowLegManifest.manifestCode);
	$('#hostAuthCode').combobox('setValue',
		dataRowLegManifest.authorizationCode);
	if (dataRowLegManifest.passengerSponsor == null) {
		$('#sponsor').combobox('setValue', '');
	} else {
		$('#sponsor').combobox('setValue',
			dataRowLegManifest.passengerSponsor.fullName);
	}
	$('#account').combobox('setValue', dataRowLegManifest.accountNumber);
	$('#expenseLocation').combobox('setValue',
		dataRowLegManifest.expenseLocation);
	if (dataRowLegManifest.visa == null) {
		$('#visa').combobox('setValue', '');
	} else {
		$('#visa').combobox('setValue', dataRowLegManifest.visa.passportNumber);
	}
	$('#stay').textbox('setValue', dataRowLegManifest.stay);
	if (dataRowLegManifest.passport == null) {
		$('#passport').combobox('setValue', '');
		$('#passportExpiration').textbox('setValue', '');
	} else {
		$('#passport').combobox('setValue', dataRowLegManifest.passport.number);
		$('#passportExpiration').textbox('setValue',
			dataRowLegManifest.passport.expeditionDate);
	}

	$('#reasonForTravel').textbox('setValue', dataRowLegManifest.reason);

}
