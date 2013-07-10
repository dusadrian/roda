/*
 * File: app/view/DetailGridPanelCls.js
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

Ext.define('databrowser.view.StudyView', {
    extend: 'Ext.tab.Panel',
//    extend: 'Ext.grid.Panel',
    alias: 'widget.studyview',
    autoRender: true,
    id: 'studyview',
    itemId: 'studyview',
    width: '100%',
    header: true,
    hideHeaders: false,
    store: 'StudyStore',
    loaddata: function(id){

    	//asta e o varianta idioata determinata oarecum de incapacitatea autorilor extjs de a explica cum se fac rahaturile simple    	
    	
    	var dtab = Ext.getCmp('sdetails');
    	var variablesgrid = Ext.getCmp('studyvariables');    
    	var filestab = Ext.getCmp('studydocuments');
    	var sStore = Ext.StoreManager.get(this.store);    	
    	sStore.load({
    		  id: id, //set the id here
    		  scope:this,
    		  callback: function(records, operation, success){
    		    if(success){
    		    	var rec = sStore.first();
   		    	console.log(rec.filesStore);
    		    	dtab.update(records[0].data);
    		    	variablesgrid.getView().bindStore(rec.variablesStore);
    		    	filestab.bindStore(rec.filesStore);
    		    }
    		  }
    		});
    },
    title: 'Study View',
    items: [
            {
                autoScroll: true,
                layout:'fit',
                title: 'Detalii',
            	id:'sdetails',
                tpl: new Ext.XTemplate(
                		'<div style="padding:10px;">',
                    	'<H2>{name}</H2>',		
                    	'<H3>{author}</H3>',
                    	'<p>{description}</p>',
                    	'</div>'
                    	),
            },{
                autoScroll: true,
                layout:'fit',
                title: 'Variabile',
            	id:'svariables',
                	items: [{
                            	xtype: 'gridpanel',
                            	id: 'studyvariables',
                            	width:'100%',
                            	autoScroll: true,
                            	remoteSort: false,                 	
//                            	title: 'Members',
                      //      	forceFit: true,
//                            	store: 'SeriesStore',
//                                header: false,
     //                           hideHeaders: true,                        	
                            	columns: [
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'name',
                                    hideable: false,
                                    text: 'name',
                                    width:150,
                                    fixed: true
                                },
                                {
                                    xtype: 'gridcolumn',
                                    dataIndex: 'label',
                                    hideable: false,
                                    text: 'label',
                                    flex:1
                                },
                            ]
                	}
                	]
            },{
                autoScroll: true,
                layout:'fit',
                title: 'Date',
            	id:'sdata'
            }, {
            	autoScroll: true,
              layout:'fit',
              title: 'Documente',
          	id:'sfiles',
            items : [{
            			id: 'studydocuments',
            			xtype:'dataview',
                      tpl: new Ext.XTemplate(
                  		'<div class="studyfiles">',                   		  
                  		  '<tpl for=".">',  
                  		  '<div class="studyfiledl">',
                    	'<H2 class="file-{filetype}">{filename}</H2>',		
                    	'<p>{filedescription}</p>',
                    	'<a href="{fileurl}">Descarca fisierul</a>',
                    	'</div>',
                    	'</tpl>',
                    	'</div>'	
                      ),

            			
            			
            			//            			tpl: [
//            			    '<tpl for=".">',  
////                         	'<H2>{filename}</H2>',		
////                        	'<H3>{filetype}</H3>',
////                        	'<p>{filedescription}</p>'
//                             ],          	
            	   }
            		]
            }
            ],    
//    store: 'CatalogDetailStore',
initComponent: function() {
    var me = this;
    me.callParent(arguments);  
}

});