$.extend( true, $.fn.dataTable.Editor.defaults.i18n, {
	"create": {
        "button": "Add",
        "title":  "Add",
        "submit": "Add"
    },
    "edit": {
        "button": "Edit",
        "title":  "Edit",
        "submit": "Save"
    },
    "remove": {
        "button": "Delete",
        "title":  "Delete",
        "submit": "Delete",
        "confirm": {
            "_": "To delete the %d rows selected?",
            "1": "To delete the 1 row selected?"
        }
    },
    "error": {
        "system": "Saving failed, contact administrator。"
    }
});

$.extend( true, $.fn.dataTable.defaults, {
	"oLanguage":{
	    "sProcessing":   "Processing",
	    "sLengthMenu":   "Show _MENU_ results",
	    "sZeroRecords":  "No matching results",
	    "sInfo":         "Items from _START_ to _END_ , total _TOTAL_ ",
	    "sInfoEmpty":    "Items from 0 to 0, total 0 ", 
	    "sInfoFiltered": "( _MAX_ items were filtered.)",
	    "sInfoPostFix":  "",
	    "sSearch":       "",
	    "sUrl":          "",
	    "sEmptyTable":     "Empty table",
	    "sLoadingRecords": "Loading...",
	    "sInfoThousands":  ",",
	    "oPaginate": {
	        "sFirst":    "First page",
	        "sPrevious": "Previous page",
	        "sNext":     "Next page",
	        "sLast":     "Last page"
	    },
	    "oAria": {
	        "sSortAscending":  ": Ascending order",
	        "sSortDescending": ": Descending order"
	    }
	}
});

//Our custom field type
$.fn.DataTable.Editor.fieldTypes.datepicker = $.extend( true, {}, $.fn.DataTable.Editor.models.fieldType, {
    "create": function ( conf ) {
        var that = this;
 
        conf._enabled = true;
        // Create the elements to use for the input
        conf._input = $('<input type="text" class="form-control">')[0];
        //$(conf._input).attr("id", conf.id);
	    $(conf._input).datepicker({
	    	format: "yyyy-mm",
	        startView: 1,
	        minViewMode: 1,
	    	autoclose: true
		});
 
        return conf._input;
    },
    
    "get": function ( conf ) {
    	return $(conf._input).val();
    },
 
    "set": function ( conf, val ) {
        if ( ! conf._enabled) {
            return;
        }
        
 		$(conf._input).datepicker("update", val);
    },
 
    "enable": function ( conf ) {
        conf._enabled = true;
        $(conf._input).removeClass( 'disabled' );
    },
 
    "disable": function ( conf ) {
        conf._enabled = false;
        $(conf._input).addClass( 'disabled' );
    }
 
} );