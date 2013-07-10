/*
 * File: app/model/CatalogsModel.js
 *
 * This file was generated by Sencha Architect version 2.2.1.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 4.2.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 4.2.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('databrowser.model.CatalogsModel', {
    extend: 'Ext.data.Model',

    fields: [
             {
                 name: 'name',
                 type: 'string'
             },
             {
                 name: 'indice',
                 type: 'integer'
             },
             
        {
            name: 'text',
            type: 'string',
            convert: function(v, r) {
            	if (r.get('an')) {
                return r.get('an') + ' - ' + r.get('name');
            	} else {
            		return r.get('name');
            	}
             }
        },
        {
            name: 'children'
        },
        {
        	name: 'icon',
        	type: 'string',
        	convert: function (v,r) {
        		if (r.get('type') == 'S' ) {
        			return 'img/series.png';
        		} else if (r.get('type') == 'C') {
        			return 'img/catalog.png';
        		} else if (r.get('type') == 'St') {
        			return 'img/study.png';
        		}
        	}
        },
        {
            name: 'an',
            type: 'int'
        },
        {
            name: 'type',
            type: 'string'
        },
        {
            name: 'author',
            type: 'string'
        }
    ]
});