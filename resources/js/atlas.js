
		///////////////////////////////////////////////////////////////////////
		// Get Value-root 
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}	
		
		function getParameterByNameEncode(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : results[1].replace(/\+/g, " ");
		}			
		
		///////////////////////////////////////////////////////////////////////
		// find X-CSRF-TOKEN value 
		$(function () {
			// Sets the X-CSRF-TOKEN header for every jQuery ajax non-GET request to make CSRF protection easy.
			$.ajaxSetup({
			  headers: {
			    'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
			  }
			});	
		});
		
		////////////////////////////////////////////////////////////////////////
		//return an array of objects according to key, value, or key and value matching
		function getObjects(obj, key, val) {
		    var objects = [];
		    for (var i in obj) {
		        if (!obj.hasOwnProperty(i)) continue;
		        if (typeof obj[i] == 'object') {
		            objects = objects.concat(getObjects(obj[i], key, val));    
		        } else 
		        //if key matches and value matches or if key matches and value is not passed (eliminating the case where key matches but passed value does not)
		        if (i == key && obj[i] == val || i == key && val == '') { //
		            objects.push(obj);
		        } else if (obj[i] == val && key == ''){
		            //only add if the object is not already in the array
		            if (objects.lastIndexOf(obj) == -1){
		                objects.push(obj);
		            }
		        }
		    }
		    return objects;
		}
		
		////////////////////////////////////////////////////////////////////////
		//return an array of values that match on a certain key
		function getValues(obj, key) {
		    var objects = [];
		    for (var i in obj) {
		        if (!obj.hasOwnProperty(i)) continue;
		        if (typeof obj[i] == 'object') {
		            objects = objects.concat(getValues(obj[i], key));
		        } else if (i == key) {
		            objects.push(obj[i]);
		        }
		    }
		    return objects;
		}

		////////////////////////////////////////////////////////////////////////
		//return an array of keys that match on a certain value
		function getKeys(obj, val) {
		    var objects = [];
		    for (var i in obj) {
		        if (!obj.hasOwnProperty(i)) continue;
		        if (typeof obj[i] == 'object') {
		            objects = objects.concat(getKeys(obj[i], val));
		        } else if (obj[i] == val) {
		            objects.push(i);
		        }
		    }
		    return objects;
		}		

		///////////////////////////////////////////////////////////////////////
		$.extend($.fn.textbox.methods, {
            addClearBtn: function(jq, iconCls){
                return jq.each(function(){
                    var t = $(this);
                    var opts = t.textbox('options');
                    opts.icons = opts.icons || [];
                    opts.icons.unshift({
                        iconCls: iconCls,
                        handler: function(e){
                            $(e.data.target).textbox('clear').textbox('textbox').focus();
                            $(this).css('visibility','hidden');
                        }
                    });
                    t.textbox();
                    if (!t.textbox('getText')){
                        t.textbox('getIcon',0).css('visibility','hidden');
                    }
                    t.textbox('textbox').bind('keyup', function(){
                        var icon = t.textbox('getIcon',0);
                        if ($(this).val()){
                            icon.css('visibility','visible');
                        } else {
                            icon.css('visibility','hidden');
                        }
                    });
                });
            }
        });
        $(function(){
            $('#paxID').textbox().textbox('addClearBtn', 'icon-clear');
        });
        $(function(){
            $('#paxName').textbox().textbox('addClearBtn', 'icon-clear');
        });
        $(function(){
            $('#sponsor').textbox().textbox('addClearBtn', 'icon-clear');
        });
		function showMsg(title,msg){
            $.messager.show({
                title:title,
                msg:msg,
                showType:'show'
            });
        }
		