	/**
	* Section Code for Tap-TRIP
	**/
	$(document).ready(function() {        
		// exec functions javascript for load information
		loadDataGrcurrentRowManifest();
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
	function loadDataGrcurrentRowManifest(){
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
	        	var dataTripManifest = {
	        			header : data[0].columns,
	        			content: data[0].data
	        	};
	        	
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
	                columns: new Array(dataTripManifest.header),
	                onLoadSuccess: function () {
	    		        $(this).datagrid('selectRow',0);	 
	    		        var currentRow = $(this).datagrid("getSelected");
	                	searchManifestData(dataTripManifest.header, currentRow);	    		        
	    		    },	                
	                //event action row 
	                onClickRow:function(rowIndex){
                	  	var currentRow = $(this).datagrid("getSelected");
	                	searchManifestData(dataTripManifest.header, currentRow);
	                }
	            }).datagrid("loadData",dataTripManifest.content);
	            
	            $('#manOrder').textbox('textbox').bind('keydown', function(e){
	            	if (e.keyCode == 13){	// when press ENTER key, accept the inputed value.
	            		// parameter value for method of selection       		
	            	}
	            });	            
	        }
	    });
	}

	/**
	 * load information of leg selected
	 * @param currentRowManifest
	 */
	function searchManifestData(headerManifest, currentRowManifest){
		//search info Manifest selected
		
		$('#pxTripComments').textbox('setValue', currentRowManifest.comments);

		// generated List Leg Assign
		var headerManifestPoa = {};
		$.each(headerManifest, function (i,v)
		{
			if (v.field.substring(0,4) == 'poa_'){
				var nameItem = v.field;
				headerManifestPoa[nameItem] = v.title ;
			} 
		});
		
		//load info leg selected
		var listLegManifest = $.map(currentRowManifest, function(value, key) {
			function itemlla(id,text){
				this.id = id
				this.value = text
			}			
			return (key.substring(0,13) == 'legManifests_' && value != '') ? new itemlla(key,value) : null; 
		});		

		//visa 
		$('#visa').combobox({
    		url:'/atlas-web/atlas-ws/passengers/' + currentRowManifest.pxId + '/visa/',
			method: 'get',
			dataType: "json",
		    valueField:'passportNumber',
		    textField:'number' ,
		    onSelect: function(rec){
		    	if(typeof rec === 'undefined'){
		    		$('#passport').combobox('setValue','');
		    		$('#passportExpiration').textbox('setValue', '');
		    	}
		    	else{
    		    	$('#passport').combobox('setValue',rec.passportNumber);
		    	}
		    }
		});	   
		
		//passport
		$('#passport').combobox({
			url:'/atlas-web/atlas-ws/passengers/' + currentRowManifest.pxId + '/passport',
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
		
		// load dynamic data on grid  
		$('#manOrder').textbox('setValue',currentRowManifest.manifestOrder);
		
		// load information passenger
		$.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + currentRowManifest.pxId + '/info',
            dataType: 'json',
            success: function(data){
                $('#paxID').textbox('setValue', data.nameId);
        		$('#paxName').combobox('setValue',data.fullName);
        		$('#pxProfileComments').textbox('setValue', data.passengerComments);
            }
        });// load information passenger			
			
		//generated list for combobox leg
		var listLegsAssign = $.map(currentRowManifest, function(value, key) {
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
		    	//load info leg-legmanifest
		    	loadDataLegs(row.id, listLegsAssign, headerManifestPoa, currentRowManifest);
		    },
		    onLoadSuccess: function () {
		        var val = $(this).combobox("getData");
		        for (var item in val[0]) {
		          if (item == "id") {
		            $(this).combobox("select", val[0][item]);
		          }
		        }
		    }
		});//generated list for combobox leg	
		
		// generated List Leg Assign
		var listLegsAssignChk = $.map(currentRowManifest, function(value, key) {
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
		});// generated List Leg Assign
			
	}

	/**
	 * method search name
	 */
	var searchNameText = function(param,success,error){
        var q = param.q || '';
        if (q.length < 1){return false}
        $.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + q + '/1/search',
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
	
	/**
	 * method search name
	 */
	var searchNameTextShort = function(param,success,error){
        var q = param.q || '';
        if (q.length < 1){return false}
        $.ajax({
            url: '/atlas-web/atlas-ws/passengers/' + q + '/2/search',
            dataType: 'json',
            success: function(data){
                var items = $.map(data.rows, function(value, key){
                    return {
                        id: value.id,
                        name: value.nameId
                    };
                });
                success(items);
            },
            error: function(){
                error.apply(this, arguments);
            }
        });
    }
	
	function loadDataLegs(idx, listLegsAssign, headerManifestPoa, currentRowManifest){
		console.log('idx');
		console.log(idx);
		console.log('listLegsAssign');
		console.log(listLegsAssign);
		console.log('headerManifestPoa');
		console.log(headerManifestPoa);
		console.log('currentRowManifest');
		console.log(currentRowManifest);
		
		/**
		 * get leg and airport selected of grid manifest
		 */
		var _airport = '';
		$.each(headerManifestPoa, function(index, value) {
			if(value.substring(0,1) == idx ) _airport = value;
		});
		
		console.log(_airport);
		
		/**
		 * search data row of legmanifest 
		 */
		var dataRowLegManifest = '';
		$.each(currentRowManifest, function(index, value){
			if(index.substring(0,13) == 'legManifests_' && index.substring(13,14) == idx){
				$.each(value, function(i, v){
					if(v.leg.poaAirportId == _airport.substring(2,_airport.length)){
						dataRowLegManifest = v;
					}
				});
			}
		});
		
		console.log(dataRowLegManifest);
		
		/**
		 * set data in components
		 */
		$('#manCode').textbox('setValue', dataRowLegManifest.manifestCode);
		$('#hostAuthCode').combobox('setValue',dataRowLegManifest.authorizationCode);
		if(dataRowLegManifest.passengerSponsor == null){
			$('#sponsor').combobox('setValue','');
		}else{
			$('#sponsor').combobox('setValue',dataRowLegManifest.passengerSponsor.fullName);
		}
		$('#account').combobox('setValue',dataRowLegManifest.accountNumber);
		$('#expenseLocation').combobox('setValue',dataRowLegManifest.expenseLocation);
		if(dataRowLegManifest.visa == null){
			$('#visa').combobox('setValue','');
		}else{
			$('#visa').combobox('setValue',dataRowLegManifest.visa.passportNumber);
		}
		$('#stay').textbox('setValue',dataRowLegManifest.stay);
		if(dataRowLegManifest.passport == null){
			$('#passport').combobox('setValue','');
			$('#passportExpiration').textbox('setValue','');			
		}else{
			$('#passport').combobox('setValue',dataRowLegManifest.passport.number);
			$('#passportExpiration').textbox('setValue',dataRowLegManifest.passport.expeditionDate);			
		}

		$('#dsm').attr('checked',dataRowLegManifest.disembark);
		$('#reasonForTravel').textbox('setValue',dataRowLegManifest.reason);
		
		
	}
		
	