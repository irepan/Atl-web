
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
		