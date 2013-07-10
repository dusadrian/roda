/*
 * File: app/view/DataBrowserPanel.js
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

Ext.define('databrowser.view.DataBrowserPanel', {
    extend: 'Ext.panel.Panel',

//    requires: [
//        'databrowser.view.DetailGridPanelCls'
//    ],

    frame: true,
    height: 671,
    width: 900,
    layout: {
        align: 'stretch',
        type: 'hbox'
    },
    closable: false,
//    title: 'RODA - Data Browser',
    header:false,
    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            dockedItems: [
                {
                    xtype: 'tabpanel',
                    dock: 'left',
                    id: 'NavigatorTabPanel',
                    width: 400,
                    animCollapse: false,
                    collapseDirection: 'left',
                    collapsible: true,
                    resizable:true,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            id: 'CatalogsPanel',
                            autoScroll: true,
                            layout:'fit',
                            title: 'Cataloage',
                            tabConfig: {
                                xtype: 'tab',
                                id: 'CatalogsTabConfig'
                            },
                            items: [
                                {
                                    xtype: 'treepanel',
                                    id: 'CatalogsTreePanel',
                                    store: 'CatalogTreeStore',
                                    displayField: 'text',
                                    viewConfig: {
                                        id: 'CatalogsTreeView',
                                        autoScroll: true,
                                        rootVisible: false
                                    },
                                    listeners: {
                                        select: {
                                            fn: me.onCatalogsTreePanelSelect,
                                            scope: me
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            id: 'YearsPanel',
                            autoScroll: true,
                            layout:'fit',                            
                            title: 'Ani',
                            tabConfig: {
                                xtype: 'tab',
                                id: 'YearsTabConfig'
                            },
                            items: [
                                {
                                    xtype: 'treepanel',
                                    height: 389,
                                    id: 'YearsTreePanel',
                                    store: 'YearTreeStore',
                                    displayField: 'name',
                                    viewConfig: {
                                        id: 'YearsTreeView',
                                        autoScroll: true,
                                        rootVisible: false
                                    },
                                    listeners: {
                                        select: {
                                            fn: me.onYearsTreePanelSelect,
                                            scope: me
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            id: 'UsersPanel',
                            width: 226,
                            autoScroll: true,
                            layout:'fit',                            
                            layout: {
                                type: 'fit'
                            },
                            title: 'Utilizatori',
                            tabConfig: {
                                xtype: 'tab',
                                id: 'UsersTabConfig'
                            },
                            items: [
                                {
                                    xtype: 'gridpanel',
                                    height: 373,
                                    id: 'UsersGridPanel',
                                    width: 247,
                                    autoScroll: true,
                                    title: 'users',
                                    store: 'UsersStore',
                                    columns: [
                                        {
                                            xtype: 'gridcolumn',
                                            dataIndex: 'username',
                                            hideable: false,
                                            text: 'User'
                                        },
                                        {
                                            xtype: 'gridcolumn',
                                            dataIndex: 'password',
                                            hideable: false,
                                            text: 'Password'
                                        }
                                    ],
                                    viewConfig: {
                                        id: 'UsersGridView'
                                    }
                                }
                            ]
                        }
                    ]
                }
            ],
            items: [
                {
                   // xtype: 'detailgridpanelcls1',
                    xtype: 'dbcard',
 //                   xtype: 'studyview',
 //                   id:'studyview1',	
                    //                	  width:'500',
                	//                    height: 438,
 //                   rowLines: true,
                }
            ]
        });

        me.callParent(arguments);
    },

    onCatalogsTreePanelSelect: function(rowmodel, record, index, eOpts) {
        var gridPanel = Ext.getCmp('DetailsGridPanel');
        var dbcard = Ext.getCmp('dbcard');
        if (record.get('type') == 'C') {
        	dbcard.layout.setActiveItem('catalogview');
        	var gridpanel = Ext.getCmp('catalogview');
        	gridpanel.setTitle(record.get('text'));
        } else if (record.get('type') == 'S') {
        	dbcard.layout.setActiveItem('seriesview');	        	
        	var seriesviewob = Ext.getCmp('seriesview');
        	seriesviewob.setTitle(record.get('text'));
        	seriesviewob.loaddata(record.get('indice'));
        } else if (record.get('type') == 'St') {
        	dbcard.layout.setActiveItem('studyview');	
        	var studyviewob = Ext.getCmp('studyview');
        	studyviewob.setTitle(record.get('text'));
        	studyviewob.loaddata(record.get('indice'));
//        	ssstore.load();
        } else {
        	dbcard.layout.setActiveItem('initial');
        }
        
        
        
//        if (record.get('leaf') !== true && record.get('name') != 'RODA') 
//        {
//            //este posibila doar afisarea simpla
//            var sButton = Ext.getCmp('SButton'),
//                mButton = Ext.getCmp('MButton'),
//                cButton = Ext.getCmp('CButton');
//
//            sButton.toggle(true);
//            mButton.disabled = true;
//            cButton.disabled = true;
//
//            var studyYear = record.get('an');
//            var studyTitle = record.get('name');
//            var studyData = [{an: studyYear, name: studyTitle}];	
//
//            gridPanel.store.loadData(studyData);
//
//
//        }
//        else
//        {
//            gridPanel.store.removeAll();
//        }

    },

    onYearsTreePanelSelect: function(rowmodel, record, index, eOpts) {
        var gridPanel = Ext.getCmp('DetailsGridPanel');

        if (record.get('leaf') !== true && record.get('depth') > 1)
        {
            var data = record.childNodes;
            var year;
            var aut = "", descr = "", tari = "", geo_cov = "", unit = "", univ = "";
            var loadedInfo = [];

            //butoanele pentru afisarea simpla/medie/complexa
            var sButton = Ext.getCmp('SButton'),
                mButton = Ext.getCmp('MButton'),
                cButton = Ext.getCmp('CButton');

            gridPanel.store.removeAll();

            if (data.length > 0)
            {
                for (var i = 0; i < data.length; i++)
                {
                    if (record.get('depth') == 2) 
                    {
                        // daca a fost selectat un an, in panel-ul cu detalii vor fi afisate
                        // cataloagele din anul respectiv	
                        year = record.get('name');

                        // este posibila doar afisarea simpla
                        sButton.toggle(true);
                        mButton.disabled = true;
                        cButton.disabled = true;
                    }
                    else 
                    {
                        // daca a fost selectat un catalog, in panel-ul cu detalii vor fi afisate
                        // studiile din catalogul respectiv	
                        if (record.get('depth') >= 3) 
                        {
                            year = Ext.data.Model(data[i]).get('an');
                            aut = Ext.data.Model(data[i]).get('author');
                            descr = Ext.data.Model(data[i]).get('description');
                            tari = Ext.data.Model(data[i]).get('countries');
                            geo_cov = Ext.data.Model(data[i]).get('geo_coverage');
                            unit = Ext.data.Model(data[i]).get('unit_analysis');
                            univ = Ext.data.Model(data[i]).get('universe');

                            //sunt posibile toate tipurile de afisare
                            mButton.disabled = false;
                            cButton.disabled = false;
                        }
                    }
                    var title = Ext.data.Model(data[i]).get('name');
                    loadedInfo[i] = {an: year, name: title, author: aut, description: descr, countries: tari,
                    geo_coverage: geo_cov, unit_analysis: unit, universe: univ};
                }

                //gridPanel.store.loadData(loadedInfo);
                //gridPanel.store.add(loadedInfo);

                gridPanel.store.proxy.data = loadedInfo;
                gridPanel.store.load();

            }
        }
        else
        gridPanel.store.removeAll();

    }

});