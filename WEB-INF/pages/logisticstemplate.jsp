<div id="logisticstemplate" class="easyui-panel" title="Logistics Template" style="width:785px;height:436px;padding:5px">

		<div id="logTempToolbar">
			<a href="#" class="easyui-linkbutton" label-title" iconCls="icon-add-after"    plain="true" onclick="javascript:addRowsBeforeL();">Add Logistics Item After</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRowL();">Delete Logistics Item</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true"  onclick="javascript:openNewLogTemplate();">New Logistics Template</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteLogTempHeader();">Delete Logistics Template</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="javascript:saveLT();">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="javascript:cancelLT();">Cancel</a>
						
		</div>
		<div style="font-weight:bold;">
			<label style="float: left; padding-left: 5px" class="panel-title label-title">Logistics Template</label>
			<label style="float: left; padding-left: 150px" class="panel-title label-title">Name</label>
			<label style="float: left; padding-left: 225px" class="panel-title label-title">Description</label>
		</div>
		<div style="clear:both;" >
			<input id="logTempList" class="easyui-combobox" name="host"  data-options="
			onSelect: function(rec){
            selectHeader(rec);
        },editable:false"         style="width:254px;;height:20px">
    <!--     style="width:190px;height:20px;"/>
				option value="Airport"			>Standard</option>
				<option value="FBO"				>General</option>
				<option value="Hotel"			>International</option>
				<option value="Transportation"	>EGGW</option>
				<option value="Catering"		>New Standard</option>
			</select-->
			
			<input id="logTempName" class="easyui-textbox"  style="width:254px;height:20px" data-options="disabled:false" value=""/>
			<input id="logTempDesc" class="easyui-textbox"  style="width:254px;height:20px" data-options="disabled:false" value=""/>
		</div>
		
		<div style="margin:10px 0px 0px 0px;">
	<table id="logTempGrid" class="easyui-datagrid"  
		   style="border: 1px"  
		   pagination="false" rownumbers="false" 
		   fitColumns="false" singleSelect="true" 		   		   
		   idField="logisticDetailOrder" >
		
		<thead>
			<tr>
				<th field="logisticDetailOrder" width="40" >Item</th>
				<th field="logisticDetailPOD" width="65" align="Left">POD/POA</th>
				<th field="logisticType" width="280" align="left" >Logistics Type</th>
				<th field="logisticDetailNote" width="385" align="left">Default Note</th>
				</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
	<div id="newLogTemplate" class="easyui-window" title="New Logistics Template" style="width:300px;height:150px;padding:5px;"        
		data-options="modal:true,closed:true,closable:false,
                collapsible:false,minimizable:false,maximizable:false">
      
		<div id="newlogTempToolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="javascript:saveLogTempHeader();">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="javascript:cancelForm();">Cancel</a>
						
		</div>
		<div style="padding:10px 10px 5px 5px">
	        <div style="font-weight:bold;">
				<h10 style="float:left;padding-left:7px">Name</h10>
				<input id="newLogTempName" class="easyui-textbox"  style="width:254px;height:20px" data-options="disabled:false" value=""/>
				<h10 style="float:left;padding-left:7px">Description</h10>
				<input id="newLogTempDesc" class="easyui-textbox"  style="width:254px;height:20px" data-options="disabled:false" value=""/>
			</div>
	    </div>
    </div>		
    <div id="wPreDelete" class="easyui-window" title="Delete Logistics Template" style="width:500px;height:150px;padding:10px;"        
		data-options="modal:true,closed:true,
                collapsible:false,minimizable:false,maximizable:false">
      <div style="margin:10px 0;"></div>
		<div style="text-align:center;padding:5px 5px 5px 5px">
	        <form id="fdel_logTemp" method="post" >
	       Are you sure you want to delete the current logistics template?	            
	        </form>
		    <div style="text-align:center;padding:5px">
		        <a href="#" class="easyui-linkbutton" onclick="javascript:yesDel();">Yes</a>
		        <a href="#" class="easyui-linkbutton"  onclick="javascript:noDel();">No</a>
		    </div>	        
	    </div>
    </div>		
    <div id="wWarning" class="easyui-window" title="Warning Logistics Template" style="width:500px;height:150px;padding:10px;"        
		data-options="modal:true,closed:true,closable:false,
                collapsible:false,minimizable:false,maximizable:false">
      <div style="margin:10px 0;"></div>
		<div style="text-align:center;padding:5px 5px 5px 5px">
	        <form id="fwarning_logTemp" method="post" >
	       This Logistic Template Name already exists.	            
	        </form>
		    <div style="text-align:center;padding:5px">
		        <a href="#" class="easyui-linkbutton" onclick="javascript:$('#wWarning').window('close');">OK</a>
		       
		    </div>	        
	    </div>
    </div>		
	</div>	
<script type="text/javascript">
var podpoaList = [
    		    {podpoaId:'POA',podpoaName:'POA'},
    		    {podpoaId:'POD',podpoaName:'POD'}    		    
    		];
var historyName='';
var historyDesc='';
var firstcombo;
var count=0;
var addrow=0,editrow=0;
var lastIndex=0;

	$(function(){
		$('#logTempGrid').edatagrid();	  
		if(historyName=='' && historyDesc=='')
			loadDataCombobox();
		$('#logTempName').textbox({
		onChange:function(newValue,oldValue){
			historyName=oldValue;
			
			}
		});
		$('#logTempDesc').textbox({
			onChange:function(newValue,oldValue){
				historyDesc=oldValue;
			}
		});
		$('#logTempGrid').datagrid({
			onClickRow:function(rowIndex,row){
				//var editors = $('#logTempGrid').datagrid('getEditors', rowIndex);
				var index=0;
				index=rowIndex;
				if($('#logTempGrid').datagrid('getRows')[index]['logisticDetailPOD']==true){
					$('#logTempGrid').datagrid('getRows')[index]['logisticDetailPOD']='POD';
				}
				else if($('#logTempGrid').datagrid('getRows')[index]['logisticDetailPOD']==false){	
					$('#logTempGrid').datagrid('getRows')[index]['logisticDetailPOD']='POA';
				}
				if (lastIndex != rowIndex){
					$(this).datagrid('endEdit', lastIndex);
					$(this).datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;		
			},
			onBeginEdit:function(rowIndex,row){					
				editrow++;				
			}		
			
		});
	});		
	
	function loadDataCombobox(){
		addrow=0;
		$('#logTempList').combobox({
			url:'/atlas-web/atlas-ws/template/logistics/logtemplateheader/list',			
			method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'id'	,
		    onLoadSuccess: function () { //After loading, the first item is selected 
		    	if($('#logTempName').val()==''){
	                $(this).combobox('select',$(this).combobox('getData')[0].id);
	                var logTempHeader = {
	    		            id: $(this).combobox('getData')[0].id,
	    		            desc:$(this).combobox('getData')[0].desc
	    		        }
	                selectHeader(logTempHeader);
	                
		    	}
		    }
		});	
		
	}
	function loadDataComboboxAdd(){
		addrow=0;
		$('#logTempList').combobox({
			url:'/atlas-web/atlas-ws/template/logistics/logtemplateheader/list',
		   	method: 'get',
			dataType: "json",
		    valueField:'id',
		    textField:'id'			    
		});	
		
	}
	function selectHeader(headerlist){	
		$('#logTempName').textbox('setValue',headerlist.id.toString());
		$('#logTempDesc').textbox('setValue',headerlist.desc.toString());
		historyName='';
		historyDesc='';
		loadDataLogisticDetail(headerlist.id);
		addrow=0;
		editrow=0;
	}
	function addRowsBeforeL(){		
		addrow=addrow+1;
		var rowselect = $('#logTempGrid').datagrid('getSelected');
		var preindex=-1;
		var item=1;
		if($('#logTempName').val()!='')
			{
				if(rowselect!=null)
					{
						preindex  = $('#logTempGrid').datagrid('getRowIndex',rowselect);
						if(preindex!=-1)
							item = rowselect.logisticDetailOrder+1;
						else
							item=1;
					}
				
				if (preindex>-1){
				    var index = preindex+1;
				    $('#logTempGrid').datagrid('endEdit', preindex);
				} else {
				    index = 0;
				}
				$('#logTempGrid').datagrid('insertRow', {
					index: index,
				    row: {
						logisticDetailOrder: item,
						logisticDetailPOD: '',
						logisticType: '',
						logisticDetailNote:''
					}
				});
				
				$('#logTempGrid').datagrid('selectRow', index);		
		        $('#logTempGrid').datagrid('beginEdit', index);
		        lastIndex=index;
			}
	}
	function deleteRowL(){
		var rowselect = $('#logTempGrid').datagrid('getSelected');
		var indexrow  = $('#logTempGrid').datagrid('getRowIndex',rowselect);
		if(indexrow>=0)
			{
				delLogTempDetail();		
				$('#logTempGrid').edatagrid('deleteRow',indexrow);	
				$('#logTempGrid').datagrid('acceptChanges');
				editrow++;
				updateLogTempHeaderDesc();	
				editrow=0;	
			}
	}	
	
	function loadDataLogisticDetail(header){
		// load dynamic data on grid 	
		console.log(header);
		$(document).ready(function() {
		    $.ajax({
			    // type method call 
		    	type:"GET",  		    	
		       url:'/atlas-web/atlas-ws/template/logistics/logtemplate/' + header+'/details',
		        // type data on load
		        dataType: "json",
		        success: function(data) {	
		        	count=data.length;
	        		 $('#logTempGrid').datagrid({
	            		 columns: [[
									{field:'logisticDetailOrder',title:'Item',width:40,
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
									}
								},
								
									{field:'logisticDetailPOD',title:'POD/POA',width:65,align:'left',
										formatter:function(value){
											for(var i=0; i<2; i++){
												if (false == value || 'POA'== value) return 'POA';
												else if (true == value || 'POD'== value) return 'POD';
												else if ('' == value) return '';
											}
											return value;
										},
									editor:{type:'combobox',
											options:{
												valueField:'podpoaId',
												textField:'podpoaName',
												data:podpoaList,
												editable:false
											}
										}
									},
									
									{field:'logisticType',title:'Logistics Type',width:280,align:'left',
											editor:{type:'combobox',
												options:{
													url:'/atlas-web/atlas-ws/template/logistics/logisticstype/list',
												    method: 'get',
													dataType: "json",
												    valueField:'id',
												    textField:'name',	
													required:false,
													editable:false
												}
										}
									},						
									{field:'logisticDetailNote',title:'Default Note',width:385,align:'left',
										formatter:function(value){
											return '<pre>'+value+'</pre>';
										},
										editor:{type:'textarea' }},	
								]]
	            	}).datagrid("loadData",data);
	        		 if(count!=0){	        			        		 	
	        		 	for(var j=0;j<count;j++){
	        		 		if(data[j].logisticDetailPOD){
		    					$('#logTempGrid').datagrid('getRows')[j]['logisticDetailPOD']='POD';
		    				}
		    				else if(!data[j].logisticDetailPOD){	
		    					$('#logTempGrid').datagrid('getRows')[j]['logisticDetailPOD']='POA';
		    				}
	        		 	}
	        		 	$('#logTempGrid').datagrid('selectRow',0);
	        		 	$('#logTempGrid').datagrid('beginEdit', 0);	
	        		 	lastIndex=0;
	        		 	
	        		 }
		        }
		    });
		});				
	}
	function cancelForm(){
		$('#newLogTemplate').window('close');
	}
	
	function openNewLogTemplate(){
		$('#newLogTemplate').window('open');
		$('#newLogTempName').textbox('clear','');
		$('#newLogTempDesc').textbox('clear','');
	}
	function saveLogTempHeader(){
		if($("#newLogTempName").val()!='')
			{
		        var logTempHeader = {
		            id: $("#newLogTempName").val(),
		            desc:$("#newLogTempDesc").val(),
		        }
		        $.ajax({
		            url: '/atlas-web/atlas-ws/template/logistics/logtemplateheader/add',
		            type: 'POST',
		            dataType: 'json',
                    data: JSON.stringify(logTempHeader),  
                    contentType: 'application/json',
                    mimeType: 'application/json',
		            success: function (data) {
		            	if(data.id!=null)
		            		{
				            	loadDataComboboxAdd();	
							    $('#logTempList').combobox('setValue',data.id);
							    selectHeader(logTempHeader);
							    $('#newLogTemplate').window('close');
		            		}
		            	else{
		            		$('#wWarning').window('open');
		            		cancelLT();
		            	}
		            	
		            },
		            failure: function(errMsg) {
		               // alert(errMsg);
		            }
		        });	    
			}
	}
	function deleteLogTempHeader(){
		if($('#logTempName').val()!='')
			{
				$('#newLogTempName').textbox('clear','');
				$('#wPreDelete').window('open');   
			}
	}
	
	function updateLogTempHeaderDesc(){				
        var logTempHeader = {
    		id: $('#logTempName').val(),
            desc: $('#logTempDesc').val(),
        }		       
        $.ajax({
            url: '/atlas-web/atlas-ws/template/logistics/logtemplateheader/updatedesc',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(logTempHeader),  
            contentType: 'application/json',
            mimeType: 'application/json',
            success: function (data) {            	
	            	//alert('ok');
	            	loadDataComboboxAdd();
	            	$('#logTempList').combobox('setValue',$('#logTempName').val());
	            	selectHeader(logTempHeader);	            
            },
	            failure: function(errMsg) {
	                alert(errMsg);
	            }		            
        });		        		      
	}
	
	function saveLT(){	
		 var logTempHeader = {
	        		id: $('#logTempName').val(),
		            desc: $('#logTempDesc').val(),
	        }		       
		if(historyName!='' || historyDesc!='')
			{		
			saveLogTempDetailList();
			historyName='';
			historyDesc='';
			addrow=0;
			editrow=0;
		}
		else if(editrow!=0 || addrow!=0){
				saveLogTempDetailList();
				addrow=0;
				editrow=0;
		}	
	}
	
	function cancelLT(){
		if(historyName!=''){
			$('#logTempName').textbox('setValue',historyName.toString());
			historyName='';
		}
		if(historyDesc!=''){
			$('#logTempDesc').textbox('setValue',historyDesc.toString());
			historyDesc='';
		}
		if(editrow>0 || addrow>0){
			$('#logTempGrid').datagrid('rejectChanges');
			addrow=0;
			editrow=0;
		}
	}		
	
	function yesDel(){
		var logTempHeader = {
	            id: $('#logTempName').val(),
	            desc:$('#logTempDesc').val(),
	        }	        
	        $.ajax({
	            url: '/atlas-web/atlas-ws/template/logistics/logtemplateheader/del',
	            type: 'POST',
	            dataType: 'json',
                data: JSON.stringify(logTempHeader),  
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (data) {            	
                	$('#logTempName').textbox('setValue','');
        	        loadDataCombobox();
        			historyName='';
        			historyDesc='';
        			$('#wPreDelete').window('close');            
            },
                failure: function(errMsg) {
	                alert(errMsg);
	            }
	        });	
	}
	
	function noDel(){
		$('#wPreDelete').window('close');
	}
	
	
	function saveLogTempDetailList(){	
		$('#logTempGrid').datagrid('acceptChanges');		
			data = $("#logTempGrid").datagrid("getData");
			var total = data.total; 
			var rows = data.rows; 
			var podpoa;
			var listDetails=[];
			 var logTempHeader = {
		        		id: $('#logTempName').val(),
			            name: historyName.toString(),
			            desc: $('#logTempDesc').val(),
		        }    
			for(var i=0;i<total;i++){
				var order=i+1;
				var detpod=$('#logTempGrid').datagrid('getRows')[i]['logisticDetailPOD'];
				if(detpod=="POD" || detpod=="true")
					podpoa=true;
				else
					podpoa=false;				
			        var logTempDetail = {
			        	logisticDetailOrder:order,
			        	logisticDetailPOD:podpoa,
			        	logisticType:$('#logTempGrid').datagrid('getRows')[i]['logisticType'],
			        	logisticDetailNote:$('#logTempGrid').datagrid('getRows')[i]['logisticDetailNote'],
			        	logisticHeader:logTempHeader.id,
			        	logisticHeaderDesc:logTempHeader.desc,
			        	logisticHeaderHist:logTempHeader.name
			        }
			        listDetails.push(logTempDetail);
			}
	        $.ajax({
	            url: '/atlas-web/atlas-ws/template/logistics/logtemplatedetaillist/update',
	            type: 'POST',
	            dataType: 'json',
                   data: JSON.stringify(listDetails),  
                   contentType: 'application/json',
                   mimeType: 'application/json',
	            success: function (data) {
	            	if(data=="ok"){	            		
            			loadDataComboboxAdd();
                    	$('#logTempList').combobox('setValue',logTempHeader.id);
                    	selectHeader(logTempHeader);	
	            	}
	             }
	        });	 	
	}
	function delLogTempDetail(){			
		var row = $('#logTempGrid').datagrid('getSelected');
		
        var logTempDetail = {
        	logisticDetailOrder:row.logisticDetailOrder,
        	logisticDetailPOD:"",
        	logisticType:row.logisticType,
        	logisticDetailNote:"",
        	logisticHeader:$('#logTempList').combobox('getValue')
        }
	        $.ajax({
	            url: '/atlas-web/atlas-ws/template/logistics/logtemplatedetail/delete',
	            type: 'POST',
	            dataType: 'json',
	                  data: JSON.stringify(logTempDetail),  
	                  contentType: 'application/json',
	                  mimeType: 'application/json',
	            failure: function(errMsg) {
	                alert(errMsg);
	            }
	        });	
			
	}
</script>
