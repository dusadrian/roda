/*
 * File: app.js
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

//@require @packageOverrides
Ext.Loader.setConfig({
    enabled: true,
    paths: {
        'Ext.ux': 'ux/'
    }
});

Ext.application({

    requires: [
        'Ext.grid.*',
        'Ext.ux.PreviewPlugin',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.toolbar.Paging',
        'Ext.ModelManager'
    ],
    models: [
        'CatalogsModel',
        'CatalogDetailModel',
        'UsersModel',
        'YearsModel',
        'StudyModel',
        'SeriesModel',
        'VariableModel',
       'StudyFileModel' 
     ],
    stores: [
        'StudyStore',
        'SeriesStore',
        'CatalogStore',
        'CatalogTreeStore',
        'UsersStore',
        'CatalogDetailStore',
        'YearTreeStore',
    ],
    views: [
        'DataBrowserPanel',
        'DetailGridPanelCls',
        'DBCard',
        'DetailsPanel',
        'StudyView',
        'SeriesView'
    ],
    autoCreateViewport: true,
    name: 'databrowser',

    launch: function() {
       Ext.syncRequire([
        'Ext.ux.PreviewPlugin'
        ]);
    }

});
