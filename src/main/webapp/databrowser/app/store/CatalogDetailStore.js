/*
 * File: app/store/CatalogDetailStore.js
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

Ext.define('databrowser.store.CatalogDetailStore', {
    extend: 'Ext.data.Store',

    requires: [
        'databrowser.model.CatalogDetailModel'
    ],

    constructor: function(cfg) {
        var me = this;
        cfg = cfg || {};
        me.callParent([Ext.apply({
            autoLoad: true,
            model: 'databrowser.model.CatalogDetailModel',
            storeId: 'CatalogDetailStore',
            pageSize: 20,
            fields: [
                {
                    name: 'an',
                    type: 'int'
                },
                {
                    name: 'name',
                    type: 'string'
                },
                {
                    name: 'author',
                    type: 'string'
                },
                {
                    name: 'description',
                    type: 'string'
                }
            ],
            proxy: {
                type: 'memory',
                enablePaging: true
            }
        }, cfg)]);
    }
});