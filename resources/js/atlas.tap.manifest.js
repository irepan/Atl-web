	/**
	* Section Code for Tap-TRIP
	**/
	$(document).ready(function() {        
		// exec functions javascript for load information
		loadDataGridManifest();
		loadDataCombobox();
		
		$('#assignedLegs').combogrid({
			panelWidth: 250,
			multiple: true,
			idField: 'itemid',
			editable:false,
			textField: 'legNum',
			columns: [[
				{field:'selectedleg', title:'     ',	width:20,formatter:function(value,row,index){ 
                    if(row.selectedleg){
                        return '<input type="checkbox" name="selectedleg" checked value="1" >'; 
                    }
                    else{
                        return '<input type="checkbox" name="selectedleg" >'; 
                    }
                }},
				{field:'legNum',		title:'Leg',	width:20},
				{field:'manCode',		title:'Code',	width:30}
			]],
			fitColumns: true			
		});
		
	});


	function loadDataGridManifest(){
		// load dynamic data on grid  			
		$(document).ready(function() {
		    $.ajax({
			    // type method call 
		    	type:"GET",  
		    	// url 
		        url: '/atlas-web/atlas-ws/trip/'+ getParameterByNameEncode('id') +'/manifest',
		        // type data on load
		        dataType: "json",
		        cache: false,
		        timeout: 5000,
		        success: function(data) {
		            $('#manifestList').datagrid({	
		            	width: '100%',
            			height: 244,
            			border: 1,
						toolbar: '#manifestToolbar',
						title: '',
						pagination: false,
						idField: '',
						rownumbers: false,
						fitColumns: false,
						singleSelect: true,		            	
			            //load dynamic columns on tables
		                columns: new Array(data[0].columns),
		                //event action row 
		                onClickRow:function(rowIndex){
	                	  	var currentRow =$("#manifestList").datagrid("getSelected");
		                	searchManifestData(currentRow);
		                }
		            }).datagrid("loadData",data[0].data);
		        }
		    });
		});	
	}

	function searchManifestData(idManifest){
		//search
		console.log(idManifest);
		// load dynamic data on grid  
		$('#manOrder').textbox('setValue',idManifest.manifestOrder);	
		$('#paxName').textbox('setValue',idManifest.passengerName);
		
		//generated list for combobox leg
		var listLegsAssign = $.map(idManifest, function(value, key) {
			function itemlla(id,text){
				this.id = id
				this.text = text
			}
			return (key.substring(0,4) == 'poa_' && value != '') ? new itemlla(key.substring(4,5),key.substring(4,5)) : null; 
		});
		//load infor leg selected
		var listLegManifest = $.map(idManifest, function(value, key) {
			function itemlla(id,text){
				this.id = id
				this.value = text
			}			
			return (key.substring(0,13) == 'legManifests_' && value != '') ? new itemlla(key,value) : null; 
		});				
		$('#leg').combobox({
		    data:listLegsAssign,
		    valueField:'id',
		    textField:'text',
		    onSelect: function(row){
		    	loadDataLegs(row, listLegManifest);
		    }
		});	
		
		
		// generated List Leg Assign
		var listLegsAssignChk = $.map(idManifest, function(value, key) {
			function itemlla(chk, id,text){
				this.selectedleg = chk,
				this.legNum = id
				this.manCode = text
			}
			
			return (key.substring(0,4) == 'poa_') ? new itemlla(value !=''? true:false,key.substring(4,5),value) : null; 
		});		
		// load info assign legs
		$('#assignedLegs').combogrid("grid").datagrid("loadData", listLegsAssignChk);
		
		//

		$('#visa').combobox({
		    url:'/atlas-web/resources/js/data/combobox_data_empty.json',
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'text'
		});	

		$('#passport').combobox({
		    url:'/atlas-web/resources/js/data/combobox_data_empty.json',
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'text'
		});			
	}


	var myloader = function(param,success,error){
        var q = param.q || '';
        if (q.length < 1){return false}
        $.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + q + '/',
            dataType: 'json',
            success: function(data){
                var items = $.map(data.rows, function(value, key){
                    return {
                        id: value.id,
                        name: value.fullName
                    };
                });
                success(items);
            },
            error: function(){
                error.apply(this, arguments);
            }
        });
    }
	
	function loadDataLegs(idx, lstLegManifest){
		console.log(idx);console.log(lstLegManifest);
	}
	
	function loadDataCombobox(){
		// load data info
		$('#hostAuthCode').combobox({
		    url:'/atlas-web/atlas-ws/authorization/',
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'description'
		});	

		$('#account').combobox({
		    url:'/atlas-web/atlas-ws/person/accountnumber/',
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'description'
		});	

		$('#expenseLocation').combobox({
		    url:'/atlas-web/atlas-ws/lookup/expenselocation',
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'description'
		});	
	}		
	