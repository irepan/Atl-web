/**
 * Section Code for lookup Authorization
 */
var isInit = false;

$(document).ready(function() {
	
});
$('#lookupAuthGrid').datagrid({
	onSelect:function(rowIndex,row){
		//var editors = $('#logTempGrid').datagrid('getEditors', rowIndex);
		var index=0;
		index=rowIndex;
		var code=$('#lookupAuthGrid').datagrid('getRows')[index]['code'];
		var desc=$('#lookupAuthGrid').datagrid('getRows')[index]['description'];
		$('#authCode').textbox('setValue',code);
		$('#description').textbox('setValue',desc);			
	}

});

	

function initiallizeAuth() {
	if (!isInit) {
		//var select=$("#hostAuthCode").combobox('getValue');
		//searchAuthList(select);
		searchAuthList();
		isInit = true;
	}
}

/**
 * 
 */
function searchAuthList(selectAuth){
	
	$(document).ready(function() {
	    $.ajax({
		    // type method call 
	    	type:"GET",  		    	
	       url:'/atlas-web/authorization/list',
	        // type data on load
	        dataType: "json",
	        success: function(data) {	  	
        		 $('#lookupAuthGrid').datagrid({
            		 columns: [[
								{field:'code',title:'Auth Code',width:177,									
							editor:{type:'text',
									options:{												
										editable:false
									}
								}
							},
							{field:'description',title:'Description',width:178,									
								editor:{type:'text',
										options:{												
											editable:false
										}
									}
								}	
							]]
            	}).datagrid("loadData",data); 
        		 var index=0;
        		 if(selectAuth!='')
        			 {
        			 	data = $("#lookupAuthGrid").datagrid("getData");
        			 	var total = data.total;        			 	
        			 	for(var i=0;i<total;i++){
        			 		var code=$('#lookupAuthGrid').datagrid('getRows')[i]['code'];
        			 		if(code==selectAuth){
        			 			index=i;
        			 			break;
        			 		}
        			 	}        			 		
        			}
        		 	$('#lookupAuthGrid').datagrid('selectRow',index);        		 	
        		 }	        
	    });
	});					
}

function openAuthLookup(){
	$('#lookupAuth').window('open');	
	initiallizeAuth();
}

function cancelAuth(){
	$('#lookupAuth').window('close');
}

function newAuth(){	
	var index= $('#lookupAuthGrid').datagrid('getRows').length;	
	$('#lookupAuthGrid').datagrid('appendRow',
			{
				code:'',
				description:''
			}
	);
	$('#lookupAuthGrid').datagrid('selectRow',index);  
	
}
function deleteAuth(){
	var rowselect = $('#lookupAuthGrid').datagrid('getSelected');
	var indexrow  = $('#lookupAuthGrid').datagrid('getRowIndex',rowselect);
	if($("#authCode").val()!='')
	{
		var authorization = {
        	id:$("#authCode").val(),
            code: $("#authCode").val(),
            description:$("#description").val(),
        }
	 $.ajax({
         url:'/atlas-web/authorization/delete',
         type: 'POST',
         dataType: 'json',
            data: JSON.stringify(authorization),  
            contentType: 'application/json',
            mimeType: 'application/json',
         success: function (data) {
         	if(data=="OK"){	            		
         		$('#lookupAuthGrid').edatagrid('deleteRow',indexrow);	
				$('#lookupAuthGrid').datagrid('acceptChanges');
				$('#lookupAuthGrid').datagrid('selectRow',0); 
         	}
          }
     });	 
	}
}
	
function saveAuth(){
	if($("#authCode").val()!='')
	{
        var authorization = {
            code: $("#authCode").val(),
            description:$("#description").val(),
        }
		var rowselect = $('#lookupAuthGrid').datagrid('getSelected');
		var index= $('#lookupAuthGrid').datagrid('getRowIndex',rowselect);
		$('#lookupAuthGrid').datagrid('updateRow',{
			index: index,
			row: {
				code: $("#authCode").val() ,
				description: $("#description").val()
			}
		});
		$('#lookupAuthGrid').datagrid('acceptChanges');	
		saveGridAuth();
		
	}
	
}

function saveGridAuth(){	
		
	data = $("#lookupAuthGrid").datagrid("getData");
	var total = data.total; 
	var authList = data.rows; 	
	var classAuth = {
			id:'1',
			auths:[]
	}
	classAuth.auths=authList;
    $.ajax({
        url:'/atlas-web/authorization/save',
        type: 'POST',
        dataType: 'json',
           data: JSON.stringify(classAuth),  
           contentType: 'application/json',
           mimeType: 'application/json',
        success: function (data) {
        	if(data=="OK"){	            		
        		searchAuthList($("#authCode").val());
        	}
         }
    });	 
}
   


        
	

