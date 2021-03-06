/**
 * 
 */
Ext.define('RODAdmin.model.audit.RevisionObject', {
	extend : 'Ext.data.Model',
	fields : [ 
			{
        		name: 'objname', 
        		type: 'string'
    		},
    		{	
    			name: 'nrrows',
    			type: 'integer'
    		},
    		{	
    			name: 'object',
    			type: 'string'
    		},
    		{	
    			name: 'lastrevision',
    			type : 'date',
				dateFormat : 'd/m/Y H:i:s'
    		},
    		],
   	hasMany : [{
				model : 'RODAdmin.model.audit.RevisionRow',
				name : 'rows',
				associationKey : 'rows'
			}]
});