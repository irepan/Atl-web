<div id="logisticstemplate" class="easyui-panel" title="Logistics Template" style="width:785px;height:436px;padding:5px">

		<div id="logTempToolbar">
			<a href="#" class="easyui-linkbutton" label-title" iconCls="icon-add-after"    plain="true" onclick="javascript:addRowsBeforeL();">Add Logistics Item After</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRowL();">Delete Logistics Item</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true"  onclick="javascript:preNewLogTemplate();">New Logistics Template</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteLogTempHeader();">Delete Logistics Template</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="javascript:saveLT();">Save</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="javascript:cancelLT();">Cancel</a>
			
			<!-- a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="javascript:openAuthLookup();">Auth</a> -->
						
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
		   style="border: 1px"  pagination="false" rownumbers="false" 
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
	<!-- div id="newLogTemplate" class="easyui-window" title="New Logistics Template" style="width:300px;height:150px;padding:5px;"        
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
    </div> -->		
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
    
    <div id="lookupAuth" class="easyui-window" title="Authorization" 
	    style="width:400px;height:210px;padding:5px;overflow:hidden;"        
			data-options="modal:true,closed:true,closable:false,
	                collapsible:false,minimizable:false,maximizable:false">
	      
			<div id="lookupAuthToolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add"    plain="true" onclick="javascript:newAuth();">New Auth Code</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteAuth();">Delete Auth Code</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-save"   plain="true" onclick="javascript:saveAuth();">Save</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo"   plain="true" onclick="javascript:cancelAuth();">Cancel</a>
			</div>
			<div style="width: 370px; height:90px; overflow:hidden;">
				<table class="easyui-datagrid" id="lookupAuthGrid" 
				style="border: 1px; width: 100%; height:90%; "  
				toolbar="" pagination="false" idField="id" rownumbers="false" 
				fitColumns="false"    singleSelect="true">
				<thead>
					<tr>
						<th style="width:180px;" field="AUTH_CODE" >Auth Code</th>
						<th style="width:200px;" field="DESCRIPTION">Description</th>
					</tr>
				</thead>			
			</table>
		</div>
		<table id="authCodeInfo" style="width: 380px;">
			<thead>
				<tr>
					<th style="width:80px;"></th>
					<th style="width:255px;"></th>
				</tr>
			</thead>
			<tbody>
				<tr style="height:25px;">
					<td><label class="panel-title label-title">Auth Code</label></td>
					<td><input id="authCode"  class="easyui-textbox" data-options="disabled:false" style="width:255px;height:20px"/></td>
				</tr>
				<tr style="height:25px;">
					<td><label class="panel-title label-title">Description</label></td>
					<td><input id="description"  class="easyui-textbox" data-options="disabled:false" style="width:255px;height:20px" /></td>
				</tr>
			</tbody>
		</table>
   </div>
   </div>	
<script type="text/javascript" src="/atlas-web/resources/js/atlas.lookup.authorization.js"/></script>
<script type="text/javascript">
var podpoaList = [
    		    {podpoaId:'POA',podpoaName:'POA'},
    		    {podpoaId:'POD',podpoaName:'POD'}    		    
    		];
var headers=[];
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
			if(oldValue!='')
				$("#logTempList").combobox('disable');
			
			}
		});
		$('#logTempDesc').textbox({
			onChange:function(newValue,oldValue){
				historyDesc=oldValue;
				if(oldValue!='')
					$("#logTempList").combobox('disable');
				
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
				var rowsCh=$('#logTempGrid').datagrid('getChanges');
				if(rowsCh.length>0)
					{
						$("#logTempList").combobox('disable'); 
						editrow++;
					}
				else
					$("#logTempList").combobox('enable');				
			},
			onBeginEdit:function(rowIndex){
				var rowsCh=$('#logTempGrid').datagrid('getChanges');
				if(rowsCh.length>0)
				{
					$("#logTempList").combobox('disable'); 
					editrow++;
				}
				else
					$("#logTempList").combobox('enable');
		       
			}
		
		});

	});		
	
	function preNewLogTemplate(){
		$("#logTempList").combobox('disable');
		$("#logTempList").combobox('clear','');
		$('#logTempName').textbox('clear','');
		$('#logTempDesc').textbox('clear','');
		$('#logTempGrid').datagrid('loadData', {"total":0,"rows":[]});
		addrow++;
		
	}
	function loadDataCombobox(){
		addrow=0;
		if(headers.length==0)
			{
				$('#logTempList').combobox({
					url:'/atlas-web/logisticstemplate/logtemplateheader/list',			
					method: 'get',
					dataType: "json",
				    valueField:'id',
				    textField:'id'	,
				    onLoadSuccess: function (data) { //After loading, the first item is selected 
				    	if(data.length>0){
				    		headers=data;
					    	if($('#logTempName').val()==''){
				                $(this).combobox('select',$(this).combobox('getData')[0].id);
				                var logTempHeader = {
				    		            id: $(this).combobox('getData')[0].id,
				    		            desc:$(this).combobox('getData')[0].desc
				    		        }
				                selectHeader(logTempHeader);                
					    	}
				    	}
				    
				    }
				});	
			}
		
	}
	function loadDataComboboxAdd(){
		addrow=0;
		$('#logTempList').combobox({
			url:'/atlas-web/logisticstemplate/logtemplateheader/list',
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
		$("#logTempList").combobox('enable');
	}
	function addRowsBeforeL(){
		$("#logTempList").combobox('disable');
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
		$("#logTempList").combobox('disable');
		var rowselect = $('#logTempGrid').datagrid('getSelected');
		var indexrow  = $('#logTempGrid').datagrid('getRowIndex',rowselect);
		if(indexrow>=0)
			{
				//delLogTempDetail();		
				$('#logTempGrid').edatagrid('deleteRow',indexrow);	
				$('#logTempGrid').datagrid('acceptChanges');
				editrow++;
				saveLogTempDetailList();
				//updateLogTempHeaderDesc();	
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
		       url:'/atlas-web/logisticstemplate/logtemplate/' + header+'/details',
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
										formatter:function(value){
											return value;
											
										},
											editor:{type:'combobox',
												options:{
													url:'/atlas-web/logisticstemplate/logisticstype/list',
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
											return '<div style="height: 30px;"><pre>'+value+'</pre></div>';
											
										},
										editor:{
											type:'textbox' ,
											options:{												
												multiline:true
											}
										}
											
									}
										
										
										
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
	
	function deleteLogTempHeader(){
		if($('#logTempName').val()!='')
			{
				$('#newLogTempName').textbox('clear','');
				$('#wPreDelete').window('open');   
			}
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
		
		 $("#logTempList").combobox('enable');
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
		$("#logTempList").combobox('enable');
		
		if($('#logTempGrid').datagrid('getRows').length>0){
			$('#logTempGrid').datagrid('selectRow',0);
		 	$('#logTempGrid').datagrid('beginEdit', 0);
        	lastIndex=0;
		}
		if($("#logTempList").combobox('getValue')=='')
			{
				$('#logTempList').combobox('setValue',$('#logTempName').val());
				loadDataLogisticDetail($('#logTempName').val());
			}
	}		
	
	function yesDel(){
		var logTempHeader = {
	            id: $("#logTempList").combobox('getValue'),
	            desc:$('#logTempDesc').val(),
	        }	        
	        $.ajax({
	            url: '/atlas-web/logisticstemplate/logtemplateheader/del',
	            type: 'POST',
	            dataType: 'json',
                data: JSON.stringify(logTempHeader),  
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (data) {     
                	if(data=="ok"){	
	                	$('#logTempName').textbox('setValue','');
	                	$('#logTempDesc').textbox('setValue','');
	                	$('#logTempGrid').datagrid('loadData', {"total":0,"rows":[]});
		        		historyName='';
		        		historyDesc='';
	        	        //loadDataCombobox();
	        	        //$('.combobox-item-selected').remove(); 
	        	        var countListH=headers.length;
	        	        /*var list={
		    		            id:'',
		    		            desc:'',
		    		            details:[]
		    		        }*/
	        	        var listId=[];
	        	        var listDesc=[];
	        	        //var j=0;
	        	        if(countListH>0)
	        	        	{
		        	        	for(var x=0;x<countListH;x++){
		        	        		if(logTempHeader.id!=headers[x].id)
		        	        			{
			        	        		//	list[j]=headers[x];
			        	        			listId.push(headers[x].id);
			        	        			listDesc.push(headers[x].desc);
			        	        			//j++;
		        	        			}
		        	        	}
		        	        	//headers=list;
	        	        	}
	        	        $('#logTempList').combobox('reset');
	        	        $('#logTempList').combobox('reload');
	        	       // $('#logTempList').combobox('setValues', listId);  
	        	        if(listId.length>0)
	        	        	{
			        			//$("#logTempList").combobox('select',$("#logTempList").combobox('getData')[0].id);
			        			$("#logTempList").combobox('setValue',listId[0]);
			        			var tempHeader = {
					    		            id:listId[0],
					    		            desc:listDesc[0]
					    		        }
					            selectHeader(tempHeader);    
	        	        	}
	        			$("#logTempList").combobox('enable');
	        			$('#wPreDelete').window('close');  
                	}
            },
                failure: function(errMsg) {
	                alert(errMsg);
	            }
	        });	
		$("#logTempList").combobox('enable');
	}
	
	function noDel(){
		$('#wPreDelete').window('close');
		$("#logTempList").combobox('enable');
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
			            name: $("#logTempList").combobox('getValue'),
			            desc: $('#logTempDesc').val(),
					  	details : []
					};
			if(logTempHeader.name=='')
				logTempHeader.name=logTempHeader.id;
			/*var logTempHeader = {
		        		id: $('#logTempName').val(),
			            name: historyName.toString(),
			            desc: $('#logTempDesc').val(),
		        }  */  
			
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
			        }
			        listDetails.push(logTempDetail);
			}
			logTempHeader.details=listDetails;
	        $.ajax({
	            url: '/atlas-web/logisticstemplate/logisticstemplate/update',
	            type: 'POST',
	            dataType: 'json',
                   data: JSON.stringify(logTempHeader),  
                   contentType: 'application/json',
                   mimeType: 'application/json',
	            success: function (data) {
	            	if(data=="ok"){	            		
            			//loadDataComboboxAdd();
            			$('#logTempList').combobox('reset');
 	        	        $('#logTempList').combobox('reload');
                    	$('#logTempList').combobox('setValue',logTempHeader.id);
                    	selectHeader(logTempHeader);	
	            	}
	             }
	        });	 	
	}

</script>
