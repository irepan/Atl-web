	/**
	* Section Code for Tap-TRIP
	**/
	$(document).ready(function() {        
		// exec functions javascript for load information
		loadDataGridManifest();
		constructorComponents();
	});
	
	/**
	 * 
	 */
	function constructorComponents(){
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

	/**
	 * 
	 */
	function loadDataGridManifest(){
		// load dynamic data on grid  					
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
	}

	/**load information of leg selected
	 * 
	 * @param idManifest
	 */
	function searchManifestData(idManifest){
		//search info Manifest selected
		console.log(idManifest);
		
		//load info leg selected
		var listLegManifest = $.map(idManifest, function(value, key) {
			function itemlla(id,text){
				this.id = id
				this.value = text
			}			
			return (key.substring(0,13) == 'legManifests_' && value != '') ? new itemlla(key,value) : null; 
		});					
		var _legManifest = (listLegManifest.length != 0) ? listLegManifest[0].value[0] : null;
		
		// load dynamic data on grid  
		$('#manOrder').textbox('setValue',idManifest.manifestOrder);
			
		//generated list for combobox leg
		var listLegsAssign = $.map(idManifest, function(value, key) {
			function itemlla(id,text){
				this.id = id
				this.text = text
			}
			return (key.substring(0,4) == 'poa_' && value != '') ? new itemlla(key.substring(4,5),key.substring(4,5)) : null; 
		});
		$('#leg').combobox({
		    data:listLegsAssign,
		    valueField:'id',
		    textField:'text',
		    onSelect: function(row){
		    	loadDataLegs(row, listLegManifest);
		    },
		    onLoadSuccess: function () {
		        var val = $(this).combobox("getData");
		        for (var item in val[0]) {
		          if (item == "id") {
		            $(this).combobox("select", val[0][item]);
		          }
		        }
		    }
		});	
		
		// load information passenger
		$.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + idManifest.pxId + '/info',
            dataType: 'json',
            success: function(data){
                $('#paxID').textbox('setValue', data.nameId);
        		$('#paxName').combobox('setValue',data.fullName);
        		
        		//visa 
        		$('#visa').combobox({
            		url:'/atlas-web/atlas-ws/passengers/' + data.id + '/visa/',
        			method: 'get',
        			dataType: "json",
        		    valueField:'passportNumber',
        		    textField:'number',
        		    onSelect: function(rec){
        		    	if(typeof rec === 'undefined'){
        		    		$('#passport').combobox('setValue','');
        		    	}
        		    	else{
            		    	$('#passport').combobox('setValue',rec.passportNumber);
        		    	}
        		    }
        		});	   
        		
        		//passport
        		$('#passport').combobox({
        			url:'/atlas-web/atlas-ws/passengers/' + data.id + '/passport',
        			method: 'get',
        			dataType: "json",
        		    valueField:'number',
        		    textField:'number',
        		    onSelect: function(rec){
        		    	if(typeof rec === 'undefined'){
        		    		 $('#passportExpiration').textbox('setValue', '');
		    			}else{
		    				 $('#passportExpiration').textbox('setValue', rec.expeditionDate);
		    				 
		    			};        		    			
        	        }
        		});
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
		$('#assignedLegs').combogrid("grid").datagrid({
			singleSelect: true,	
			data: listLegsAssignChk
		});
			
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

	/**
	 * method search name
	 */
	var myloader = function(param,success,error){
        var q = param.q || '';
        if (q.length < 1){return false}
        $.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + q + '/search',
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
		console.log('idx');
		console.log(idx);
		console.log('lstLegManifest');
		console.log(lstLegManifest);
		
		
	}
		
	