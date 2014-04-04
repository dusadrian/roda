/**
 * 
 */
Ext.define('RODAdmin.store.cms.pages.PageType', {
    extend: 'RODAdmin.store.Base',	

    requires: [
        'RODAdmin.model.cms.pages.PageType',
    ],

    model: 'RODAdmin.model.cms.pages.PageType',
    
    autoload: true,
    //proxy: {type: 'main', url: 'http://roda.apiary.io/admin/cmspageinfo/'},
    proxy: {type: 'main', url: 'cmspagetypeinfo/'},

});