    ///////////////////////////////////////////////////////////////////////////////
    function addRowsBefore(){
    
    }
    function addRowsAfter(){

    }
    function deleteRow(){

    }
    
    ///////////////////////////////////////////////////////////////////////////////
    $.extend($.fn.datagrid.defaults.editors,
	    {
	        workingcheckbox:
	            {
	                init: function (container, options) {
	                    var input = $('<input type="checkbox">').appendTo(container);
	                    return input;
	                },
	                getValue: function (target) {
	                    return $(target).prop('checked');
	                },
	                setValue: function (target, value) {
	                    $(target).prop('checked', value);
	                }
	            }
	
	    });    
    ///////////////////////////////////////////////////////////////////////////////
    /**
     * 
     */
    Date.prototype.format = function(format){
    	  if(!format){
    	      format = "yyyy-MM-dd hh:mm:ss";
    	  }


    	  var o = {
    	          "M+": this.getMonth() + 1, // month
    	          "d+": this.getDate(), // day
    	          "h+": this.getHours(), // hour
    	          "m+": this.getMinutes(), // minute
    	          "s+": this.getSeconds(), // second
    	         "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
    	         "S": this.getMilliseconds()
    	          // millisecond
    	 };
    	 if (/(y+)/.test(format)) {
    	      format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    	  }


    	  for (var k in o) {
    	      if (new RegExp("(" + k + ")").test(format)) { 
    	          format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" +o[k]).length));
    	     }
    	  }
    	  return format;
    	};
    	
    	
    	/**
    	 * gettime timestamp to time format
    	 * @returns {String}
    	 */
        function getTime() {
            var ts = arguments[0] || 0;
            var t, y, m, d, h, i, s;
            t = ts ? new Date(ts * 1000) : new Date();
            y = t.getFullYear();
            m = t.getMonth() + 1;
            d = t.getDate();
            h = t.getHours();
            i = t.getMinutes();
            s = t.getSeconds();
            return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d) + ' ' + (h < 10 ? '0' + h : h) + ':' + (i < 10 ? '0' + i : i) + ':' + (s < 10 ? '0' + s : s);
        }
    ///////////////////////////////////////////////////////////////////////////////
    var cardview = $.extend({}, $.fn.datagrid.defaults.view, {
        renderRow: function(target, fields, frozen, rowIndex, rowData){
            var cc = [];
            cc.push('<td>');
            if (!frozen ){
                cc.push('<table width="931px" >');
                cc.push('<tr>');
                var check_tr = false;
                var check_tr2 = false;

                for(var i=0; i<fields.length; i++){
                	//console.log('ind: ' + i + ' columna: '+ fields[i] + ' | valor: ' + rowData[fields[i]]);
                    if(i > 26 && check_tr == false) {
                        check_tr = true;
                        cc.push('</tr>');
                        cc.push('<tr>');
                    }
                    if(i > 46 && check_tr2 == false) {
                        check_tr2 = true;
                        cc.push('</tr>');
                        cc.push('<tr>');
                    }
                    var copts = $(target).datagrid('getColumnOption', fields[i]);
                    
                    if(i == 0){
                        cc.push("<td rowspan='3' width=22 style=';text-align:left;vertical-align:top;padding:0'>");
                        cc.push('<div class="datagrid-cell" style="height:auto;">'+rowData[fields[i]]+'</div>');
                        cc.push("</td>");                    	
                    }else if(i == 27 || i == 47){
                                           	
                    }else if(i == 28 || i == 48) {
                        cc.push("<td colspan='5'>");
                        cc.push('<div class="datagrid-cell" style="height:auto;">'+rowData[fields[i]]+'</div>');
                        cc.push("</td>");
                    } else if(i == 29 || i == 49) {
                        cc.push("<td colspan='4'>");
                        cc.push('<div class="datagrid-cell" style="height:auto;">'+rowData[fields[i]]+'</div>');
                        cc.push("</td>");
                    } else if(i == 63) {
                        cc.push("<td colspan='3'>");
                        cc.push('<div class="datagrid-cell" style="height:auto;">'+rowData[fields[i]]+'</div>');
                        cc.push("</td>");
                    } else if(i == 33 || i == 38){
                        cc.push('<td>');
                        cc.push('<div class="datagrid-cell" style="height:auto;">Z</div>');
                        cc.push("</td>");                          
                    }else if(i == 24){
                        cc.push('<td>');
                        cc.push('<div class="datagrid-cell" style="height:auto;"> ' + (Math.floor( rowData[fields[i]] / 60)) + ' </div>');
                        cc.push("</td>");                          
                    }else if(i == 44){
                        cc.push('<td>');
                        cc.push('<div class="datagrid-cell" style="height:auto;"> ' + (rowData[fields[i]] % 60) + ' </div>');
                        cc.push("</td>");                          
                    }else if(i == 34 || i == 41 || i == 42){
                    	var h = (Math.floor( rowData[fields[i]] / 60));
                    	var m = (rowData[fields[i]] % 60);
                    	var hrs = (h < 10 ? '0' + h : h);
                    	var mns = (m < 10 ? '0' + m : m);
                        cc.push('<td>');
                        cc.push('<div class="datagrid-cell" style="height:auto;"> ' + hrs  + ':' + mns + ' </div>');
                        cc.push("</td>");                          
                    }else {
                        switch (rowData[fields[i]]){
                        case undefined:
                            cc.push('<td>');
                            cc.push('<div class="datagrid-cell" style="height:auto;"></div>');
                            cc.push("</td>");    
                            break;
                        case true:
                              cc.push('<td field="'+ fields[i] + '">');
                              cc.push('<div class="datagrid-cell" style="height:auto;"><input type="checkbox" name="' + fields[i] + '" checked value="1" disabled="disabled"></div>');
                              cc.push("</td>");                                 
                            break;                              
                        case false:
                              cc.push('<td field="'+ fields[i] + '">');
                              cc.push('<div class="datagrid-cell" style="height:auto;"><input type="checkbox" name="' + fields[i] + '" disabled="disabled"></div>');
                              cc.push("</td>");                                         
                            break;
                        default:
                            if(i == 11 || i == 16 || i == 31 || i == 36 || i == 51 || i == 56){
                                cc.push('<td>');
                                cc.push('<div class="datagrid-cell" style="height:auto;">' + new Date(rowData[fields[i]]).format("yyyy-MM-dd") + '</div>');
                                cc.push("</td>");                            
                            }else if(i == 12 || i == 17 || i == 32 || i == 37 || i == 52 || i == 57){
                                cc.push('<td>');
                                cc.push('<div class="datagrid-cell" style="height:auto;">' + new Date(rowData[fields[i]]).format("hh:mm") + '</div>');
                                cc.push("</td>");                            
                            }else{ 
                            	cc.push('<td field="'+ fields[i] + '">');
                            	cc.push('<div class="datagrid-cell" style="height:auto;">'+rowData[fields[i]]+'</div>');
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
    $(function(){

	   	 var t = $('#tabs');  
		 var tabs = t.tabs('tabs');  
		 var tab = $('#tabs').tabs('getTab',0);
		 $('#tabs').tabs('update', {
	         tab: tab,
	         options: {
	             title: 'Trip ID ' + getParameterByName('id')
	         }
	     });


        $('#tripGrid').datagrid({
            method: 'get',
            url: '/atlas-web/atlas-ws/trip/' + getParameterByNameEncode('id') + '/legs',
            toolbar: '#tripToolbar',
            //title: 'Trip Legs',
            width: '950px',
            height: '282px',
            border: '1px',
            singleSelect:   true,
            fitColumns:     true,
            remoteSort:     false,
            //pagination:     'false',
            sortOrder:      'desc',
            view:           cardview,
            columns:[[
                    {field:'number',              width:22,   title:'Lg'}, 
                    {field:'flightCategoryCode',  width:28,   title:'Cat'}, 
                    {field:'confirmed',           width:25,   title:'Cf'},
                    {field:'closed',               width:25,  title:'Cl'}, 
                    {field:'aircraft',             width:'43',  title:'A/C'}, 
                    {field:'configuration',        width:'31',  title:'Cfg'}, 
                    {field:'paxCount',             width:'26',  title:'Px'}, 
                    {field:'dutyStandardCode',     width:'24',  title:'DS'}, 
                    {field:'manOver',              width:'25',  title:'M'}, 
                    {field:'podAirportId',         width:'40',  title:'POD'}, 
                    {field:'podDOWLs',             width:'24',  title:''}, 
                    {field:'podDateLs',            width:'75',  title:'POD Dt'}, 
                    {field:'podDateLs',            width:'43',  title:'ETD'}, 
                    {field:'podTzLs',              width:'26',  title:''}, 
                    {field:'poaAirportId',         width:'40',  title:'POA'}, 
                    {field:'poaDOWLs',             width:'24',  title:''}, 
                    {field:'poaDateLs',            width:'75',  title:'POA Dt'}, 
                    {field:'poaDateLs',            width:'43',  title:'ETA'}, 
                    {field:'poaTzLs',              width:'26',  title:''}, 
                    {field:'fuelOut',              width:'45',  title:'Fuel'}, 
                    {field:'distanceNM',           width:'38',  title:'Dist'}, 
                    {field:'eteHt',                width:'44',  title:'ETE'}, 
                    {field:'dutyHt',               width:'44',  title:'Dty'}, 
                    {field:'winds',                width:'26',  title:'Wd'}, 
                    {field:'groundTimeMins',       width:'24',  title:'GT'}, // convercion de horas 
                    {field:'ron',                  width:'23',  title:'ON'}, 
                    {field:'openSeat',             width:'22',  title:'ST'}
                	
                    //<!--for second row elements-->
                    ,{field:'',                		hidden: true},  
                    {field:'personName',            hidden: true},  
                    {field:'authorizationCode',     hidden: true},  
                    {field:'podDOWZ',               hidden: true},  
                    {field:'podDateZ',              hidden: true}, //date
                    {field:'podDateZ',              hidden: true}, //time
                    {field:'Z',                     hidden: true}, //etiqueta fija con valor Z
                    {field:'tmDiffMins',            hidden: true}, //convertir a hora en formato hhmm  
                    {field:'poaDOWZ',               hidden: true},  
                    {field:'poaDateZ',              hidden: true}, //date
                    {field:'poaDateZ',              hidden: true}, //time
                    {field:'Z2',                    hidden: true}, //etiqueta fija con valor Z
                    {field:'fuelUsed',              hidden: true},  
                    {field:'',           	    	hidden: true}, //vaciar campo columna
                    {field:'eteMins',               hidden: true}, // convertir a formato hh:mm 
                    {field:'dutyMins',              hidden: true}, // convertir a formato hh:mm 
                    {field:'',                 		hidden: true}, //vaciar campo columna
                    {field:'groundTimeMins',        hidden: true}, // convercion de minutos 
                    {field:'',                 		hidden: true}, //vaciar campo columna
                    {field:'bookedSeat',            hidden: true}  

                    //<!--for third row elements-->
                    ,{field:'',                		hidden: true},  
                    {field:'accountNumber',         hidden: true},  
                    {field:'cargoWeight',           hidden: true},  
                    {field:'podDOWHb',              hidden: true},  
                    {field:'podDateHb',             hidden: true},  
                    {field:'podDateHb',             hidden: true},  
                    {field:'tzHb',                  hidden: true},  
                    {field:'tmCalcDir',             hidden: true},  
                    {field:'poaDOWHb',              hidden: true},  
                    {field:'poaDateHb',             hidden: true},  
                    {field:'poaDateHb',             hidden: true},  
                    {field:'tzHb',                  hidden: true},  
                    {field:'fuelIn',                hidden: true},  
                    {field:'',                 		hidden: true}, //vaciar campo columna
                    {field:'estLear',               hidden: true},  
                    {field:'',                 		hidden: true}, //vaciar campo columna
                    {field:'charge',                hidden: true},  
                    {field:'waitlistedSeat',        hidden: true}
            ]],
            onClickRow: function(rowIndex){
                var currentRow = $("#tripGrid").datagrid("getSelected"); 
                searchTripData(currentRow);
                searchLegLogistics(currentRow);
                searchPassengers(currentRow);
            },
            onLoadSuccess: function()
            {
            	
            	var currentRow = $("#tripGrid").datagrid('getRows')[0];
                searchTripData(currentRow);
                searchLegLogistics(currentRow);
                searchPassengers(currentRow);
            }
        });
    });
    
    ////////////////////////////////////////////////////////////////////////////
    /**
    * Section Code for Tap-TRIP
    **/

    function searchTripData(idTrip){
        // load dynamic data on grid  
        $('#legComments').textbox('setValue', idTrip.comment);                       
    }       
    
    function searchPassengers(idLeg){
        // load info on  list passenger
    	 $('#lstPassengers').datalist({
    		 width: '100%',
    		 method: 'get',
    		 url: '/atlas-web/atlas-ws/trip/'+ idLeg.id + '/passengers'
         });     
    }

    function searchLegLogistics(idLeg){
        //search
        // load dynamic data on grid  
    	 $('#legLogistics').datagrid({
    		 method: 'get',
    		 url: '/atlas-web/atlas-ws/trip/' + idLeg.id + '/logistics',
    		 title: 'Logistics',
    		 width: '100%',
    	     height: 149, 
    	     border: 1,
             singleSelect:   true,
             fitColumns:     true,
             remoteSort:     false,    		 
    		 columns:[[
	             {field:'legLogisticsRecuested',    width: 60, title:'Rq',formatter:function(value,row,index){ 
                     if(row.legLogisticsRecuested){
                         return '<input type="checkbox" name="legLogisticsRecuested" checked value="1" disabled="disabled">'; 
                     }
                     else{
                         return '<input type="checkbox" name="legLogisticsRecuested" disabled="disabled">'; 
                     }
                 }},
	             {field:'legLogisticsConfirmed',    width: 60, title:'Cf', formatter:function(value,row,index){ 
                     if(row.legLogisticsConfirmed){
                         return '<input type="checkbox" name="legLogisticsConfirmed" checked value="1" disabled="disabled">'; 
                     }
                     else{
                         return '<input type="checkbox" name="legLogisticsConfirmed" disabled="disabled">'; 
                     }
                 }},
	             {field:'logisticType',             width: 260, title:'Type'},
	             {field:'legLogisticsPOD',          width: 100, title:'ICAO', formatter:function(value,row,index){ 
                     if(row.legLogisticsPOD){
                         return idLeg.podAirportId; 
                     }
                     else{
                         return idLeg.poaAirportId; 
                     }
                 }},
	             {field:'VENDOR_NAME',              width: 160, title:'Vendor Name'},
	             {field:'TELEPHONE',                width: 100, title:'Telephone'},
	             {field:'legLogisticsNote',         width: 800, title:'Notes'}
             ]]
    	 });
    }   

    function loadDataListTrip(){

    }
    
    