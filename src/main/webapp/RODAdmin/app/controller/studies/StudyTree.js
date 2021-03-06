/**
 * 
 */
Ext.define('RODAdmin.controller.studies.StudyTree', {
	extend : 'Ext.app.Controller',

	/**
	 * @todo getstores De convertit toate apelurile catre store-uri spre
	 *       getStore.
	 */

	stores : [
	          'studies.StudyTree',
	          'studies.StudyItem',
	          'studies.Catalog',
	          'studies.Study',
	          'common.Audit'
	          ],

	          views : [
	                   'RODAdmin.view.studies.Studies',
	                   'RODAdmin.view.studies.StudyItemsview',
	                   'RODAdmin.view.studies.StudyDetails',
	                   'RODAdmin.view.studies.details.StudyProperties',
	                   "RODAdmin.view.studies.EditStudyWindow",
	                   'RODAdmin.view.studies.StudyContextMenu',
	                   'RODAdmin.view.studies.CatalogContextMenu',
	                   'RODAdmin.view.studies.AddStudyToGroupWindow',
	                   'RODAdmin.view.studies.StudyItemviewContextMenu',
	                   'RODAdmin.view.studies.CatalogDetails',
	                   'RODAdmin.view.studies.ImportStudyToGroupWindow',
	                   'RODAdmin.view.studies.AddImportFile'
	                   ],

	                   refs : [
	                           {
	                        	   ref : 'stdetailspanel',
	                        	   selector : 'studies panel#stdetailscontainer'
	                           }, 
//	                           {
//	                        	   ref : 'stusagepanel',
//	                        	   selector : 'studyusage'
//	                           }, 
	                           {
	                        	   ref : 'studyproperties',
	                        	   selector : 'studyproperties panel#stdata '
	                           }, 
//	                           {
//	                        	   ref : 'stcontent',
//	                        	   selector : 'studyproperties panel#stenvelope codemirror#stcontent'
//	                           },
	                           {
	                        	   ref : 'stenvelope',
	                        	   selector : 'studyproperties panel#stenvelope'
	                           },
	                           {
	                        	   ref : 'itemsview',
	                        	   selector : 'studyitemsview'
	                           }, {
	                        	   ref : "folderview",
	                        	   selector : "studyitemsview treepanel#stfolderview"
	                           }, {
	                        	   ref : 'folderselect',
	                        	   selector : 'studyedit treepanel#groupselect'
	                           }, {
	                               ref : 'studydetails',
	                               selector : 'studydetails'
	                           },
	                           {
	                               ref: 'stvariables',
	                               selector: 'studyvariables grid#studyvars'
	                           },
	                           {
	                               ref: 'stkeywords',
	                               selector: 'studykeywords'
	                           },
	                           {
	                               ref: 'catalogstudies',
	                               selector: 'catalogdetails grid#catalogstudies'
	                           },
	                           {
	                               ref: 'catalogdetails',
	                               selector: 'catalogdetails panel#cdetails'
	                           },
	                           {
	                               ref: 'sdetailscontainer',
	                               selector: 'studiesmain panel#stdetailscontainer'
	                           },
	          
	                           {
	               				ref : 'filesgrid',
	               				selector : 'studygimport form#estudyform fieldset#sfiles grid#filesdisplay'
	               			},

	                           
	                           
	                           
	                           ],



	                           /**
	                            * @method
	                            */
	                           init : function(application) {
	                        	   this.control({
	                        		   "studyitemsview treepanel#stfolderview" : {
	                        			   /**
	                        			    * @listener studyitemsview-treepanel-folderview-selectionchange
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyItemview StudyItemsview}
	                        			    *           treepanel#stfolderview executes
	                        			    *           {@link #onFolderviewSelectionChange}
	                        			    */
	                        			   selectionchange : this.onFolderviewSelectionChange,
	                        			   /**
	                        			    * @listener studyitemsview-treepanel-folderview-itemcontextmenu
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyItemview StudyItemsview}
	                        			    *           treepanel#stfolderview executes
	                        			    *           {@link #onTreeContextMenu}
	                        			    */
	                        			   itemcontextmenu : this.onTreeContextMenu
	                        		   },
	                        		   "studyitemsview treepanel#stfolderview toolbar button#reloadtree" : {
	                        			   /**
	                        			    * @listener studyitemsview-treepanel-stfolderview-toolbar-button-reloadtree
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyItemview StudyItemsview}
	                        			    *           treepanel#stfolderview toolbar button#reloadtree
	                        			    *           {@link #onReloadTreeClick}
	                        			    */
	                        			   click : this.onReloadTreeClick
	                        		   },
	                        		   "studyitemsview treepanel#stfolderview toolbar button#collapsetree" : {
	                        			   /**
	                        			    * @listener studyitemsview-treepanel-stfolderview-toolbar-button-collapsetree
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyItemview StudyItemsview}
	                        			    *           treepanel#stfolderview toolbar button#collapsetree
	                        			    *           {@link #onCollapseTreeClick}
	                        			    */
	                        			   click : this.onCollapseTreeClick
	                        		   },
	                        		   "studyitemsview treepanel#stfolderview toolbar button#expandtree" : {
	                        			   /**
	                        			    * @listener studyitemsview-treepanel-stfolderview-toolbar-button-expandtree
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyItemsview StudyItemsview}
	                        			    *           treepanel#stfolderview toolbar button#expandtree
	                        			    *           {@link #onExpandTreeClick}
	                        			    */	        	
	                        			   click : this.onExpandTreeClick
	                        		   },
	               					"studyitemsview treepanel#stfolderview > treeview" : {
	            			            /**
	            						 * @listener itemsview-treepanel-folderview-treeview-drop triggered-by:
	            						 *           {@link RODAdmin.view.studies.StudyItemsview StudyItemsview}
	            						 *           treepanel#folderview > treeview  
	            						 *           {@link #onTreeDrop}
	            						 */	        	
	            						drop: this.onTreeDrop
	            					},
	                        		   "studycontextmenu menuitem#deletestudy" : {
	                        			   /**
	                        			    * @listener studycontextmenu-menuitem-deletestudy
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyContextMenu StudyContextMenu}
	                        			    *           menuitem#deletestudy {@link #onDeleteStudyClick}
	                        			    */	        	
	                        			   click : this.onDeleteStudyClick
	                        		   },
	                        		   "studycontextmenu menuitem#editstudy" : {
	                        			   /**
	                        			    * @listener studycontextmenu-menuitem-editstudy triggered-by:
	                        			    *           {@link RODAdmin.view.studies.StudyContextMenu StudyContextMenu}
	                        			    *           menuitem#editstudy {@link #onEditStudyClick}
	                        			    */	        	
	                        			   click : this.onEditStudyClick
	                        		   },
	                        		   "catalogcontextmenu menuitem#addstudy" : {
	                        			   /**
	                        			    * @listener catalogcontextmenu-menuitem-addstudy
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.CatalogContextMenu CatalogContextMenu}
	                        			    *           menuitem#addstudy {@link #onAddStudyClick}
	                        			    */	        	
	                        			   click : this.onAddStudyClick
	                        		   },
	                        		   "catalogcontextmenu menuitem#importstudy" : {
	                        			   /**
	                        			    * @listener catalogcontextmenu-menuitem-addstudy
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.CatalogContextMenu CatalogContextMenu}
	                        			    *           menuitem#addstudy {@link #onAddStudyClick}
	                        			    */	        	
	                        			   click : this.onImportStudyClick
	                        		   },
	                        		   
	                        		   "catalogcontextmenu menuitem#newgroup" : {
	                        			   /**
	                        			    * @listener catalogcontextmenu-menuitem-newgriup
	                        			    *           triggered-by:
	                        			    *           {@link RODAdmin.view.studies.CatalogContextMenu CatalogContextMenu}
	                        			    *           menuitem#newgroup {@link #onNewGroupClick}
	                        			    */	        	
	                        			   click : this.onNewGroupClick
	                        		   },
	                        		   
	                       			'studygimport button#addfile' : {
	                    				/**
	                    				 * @listener studies-toolbar-button-icon-view-click
	                    				 *           triggered-by:
	                    				 *           {@link RODAdmin.view.studies.Studies Studies}
	                    				 *           toolbar button#icon-view {@link #onIconViewClick}
	                    				 */
	                    				click : this.addFile
	                    			},	
	                    			'addimportfile button#save' : {
	                    				click : this.saveImportFile
	                    			},
	                    			
	                       			'studygimport button#save' : {
	                    				/**
	                    				 * @listener studies-toolbar-button-icon-view-click
	                    				 *           triggered-by:
	                    				 *           {@link RODAdmin.view.studies.Studies Studies}
	                    				 *           toolbar button#icon-view {@link #onIconViewClick}
	                    				 */
	                    				click : this.importStudyFiles
	                    			},	
	                    			
	                        		   

	                        	   });
	                           },
	                           
	                           onTreeDrop : function(node,data,overModel,dropPosition) {
	                           	console.log('moved ' + data.records[0].data.name + ' to ' + overModel.data.name + ' ' + dropPosition );
	                           },
	                           
	                       	
	                           addFile : function(button, e, options) {
	                       			console.log ('adding file');
	                       			var win = Ext.WindowMgr.get('addimportfile');
	                       			if (!win) {
	                       				win = Ext.create('RODAdmin.view.studies.AddImportFile');
	                       			}
	                       			win.show();
	                       		},

	                           
	                       		importStudyFiles : function (button, e, options) {
	                       			console.log('importstudyfile');
	                       			button.up('window').close();
	                       		},
	                       		
	                       		saveImportFile : function(button, e, options) {
	                       			//this should be easy, it has only name and label and related question info
	                       				console.log('saveimportfile');

	                       				console.log(button.up('window').down('form').down('fieldset#fileinfo'));
	                       				var form = button.up('window').down('form');

	                       				//ok, let's see if we have a real file
	                       				var filefield = button.up('window').down('form').down('fieldset#fileinfo').down('filefield#fupload');
	                       				var filename = button.up('window').down('form').down('fieldset#fileinfo').down('textfield[name=name]').getValue();
	                       				var fileuri = button.up('window').down('form').down('fieldset#fileinfo').down('textfield[name=uri]').getValue();
	                       				var filetypeid = button.up('window').down('form').down('fieldset#fileinfo').down('combo[name=ftype]').getValue();
	                       				var filetypename = button.up('window').down('form').down('fieldset#fileinfo').down('combo[name=ftype]').getRawValue();
	                       				var filecases = button.up('window').down('form').down('fieldset#datafinfo').down('textfield[name=cases]').getValue();
	                       				var filereccount = button.up('window').down('form').down('fieldset#datafinfo').down('textfield[name=reccount]').getValue();
	                       				var filestore = this.getFilesgrid().getStore();

	                       				console.log(button.up('window').down('form').down('fieldset#fileinfo').down('filefield#fupload'));

	                       				if (filefield.value) { 
	                       					console.log('post savefile');
	                       					
	                       					
	                       				if(form.isValid()){
	                       					form.submit({
	                       					url: 'http://localhost:8080/roda/addfiletotemp',
	                       					method: 'POST',
	                       					timeout: 10,
	                       					waitMsg: 'Uploading your file...',
	                       					success: function(fp, o) {
	                       						console.log('success');
	                       						console.log(fp);
	                       						console.log(o);
	                       						var nextId = this.getStoreNextId(filestore);

	                       						var file = new RODAdmin.model.studies.CBEditor.File({
	                       									id : nextId,
	                       									fname: filename,
	                       									uri : fileuri,
	                       									uptype : 'filepost',
	                       									ftype : filetypename,
	                       									uploadid : 'uplid',
	                       									ftypeid : filetypeid,
	                       									cases: filecases,
	                       									reccount: filereccount
	                       								});
	                       						filestore.add(file);
	                       						filestore.commitChanges();					
	                       						button.up('window').close();
	                       						},
	                       					failure : function(form, action) {
	                       						console.log('failure');
	                       						console.log(form);
	                       						console.log(action);
	                       						switch (action.failureType) {
	                       						      case Ext.form.action.Action.CLIENT_INVALID:
	                       						      Ext.Msg.alert('Failure', 'Form fields may must be submitted with invalid values');
	                       						      break;
	                       					       case Ext.form.action.Action.CONNECT_FAILURE:
	                       						        Ext.Msg.alert('Failure', 'doesn\'t work');
	                       						        break;
	                       						   case Ext.form.action.Action.SERVER_INVALID:
	                       						        Ext.Msg.alert('Failure', action.response.responseText);
	                       						   break;
	                       						        }
	                       						       }
	                       					});
	                       				}

	                       				
	                       				} else {
	                       				
	                       				

	                       					if (filename.length < 2) {
	                       						alert('file name too small');
	                       						return;
	                       					}			
	                       				
	                       					var nextId = this.getStoreNextId(filestore);

	                       					var file = new RODAdmin.model.studies.CBEditor.File({
	                       								id : nextId,
	                       								fname: filename,
	                       								uri : fileuri,
	                       								uptype : 'urlget',
	                       								ftype : filetypename,
	                       								ftypeid : filetypeid,
	                       								cases: filecases,
	                       								reccount: filereccount
	                       							});
	                       					filestore.add(file);
	                       					filestore.commitChanges();
	                       					button.up('window').close();
	                       				}
//	                       			
	                       		},
	                       		
	                       		
	                       		
	                       		
	                       		
	                       		
	                       		
	                           
	                           /**
	                            * @method
	                            */
	                           onGroupselectCellClick : function(component, td, cellIndex, record, tr, rowIndex, e, eOpts) {
	                        	   console.log('were here');
	                        	   component.up('studyedit').down('form').down('fieldset').query('displayfield')[0].setValue(record.data.name);
	                        	   component.up('studyedit').down('fieldset').query('hiddenfield')[0].setValue(record.data.id);
	                           },
	                           /**
	                            * @method
	                            */
	                           onNewGroupClick : function(component, event) {
	                        	   var currentNode = this.getFolderview().getSelectionModel().getLastSelected();
	                        	   var win = Ext.create('RODAdmin.view.studies.GroupWindow');
	                        	   win.setTitle('Add a new subgroup to "' + currentNode.data.name + '" (id: ' + currentNode.data.indice + ')');
	                        	   win.setIconCls('group_add');
	                        	   win.down('form').down('fieldset').down('hiddenfield').setValue(currentNode.data.indice);
	                        	   console.log(currentNode.data);
	                        	   win.show();
	                           },
	                           /**
	                            * @method
	                            */
	                           onAddStudyClick : function(component, event) {
	                        	   var currentNode = this.getFolderview().getSelectionModel().getLastSelected();
	                        	   console.log(currentNode);
	                        	   var win = Ext.create('RODAdmin.view.studies.AddStudyToGroupWindow');
	                        	   win.setTitle('Add a new study to "' + currentNode.data.name + '" (id: ' + currentNode.data.indice + ')');
	                        	   win.setIconCls('file_add');
	                        	   win.down('form').down('fieldset').down('hiddenfield').setValue(currentNode.data.indice);
	                        	   win.down('form').down('fieldset').down('displayfield').setValue(currentNode.data.directory);
	                        	   win.show();
	                           },
	                           onImportStudyClick : function(component, event) {
	                        	   var currentNode = this.getFolderview().getSelectionModel().getLastSelected();
	                        	   console.log(currentNode);
	                        	   var win = Ext.create('RODAdmin.view.studies.ImportStudyToGroupWindow');
	                        	   win.setTitle('Import a new study to "' + currentNode.data.name + '" (id: ' + currentNode.data.indice + ')');
	                        	   win.setIconCls('file_add');
//	                        	   win.down('form').down('fieldset').down('hiddenfield').setValue(currentNode.data.indice);
//	                        	   win.down('form').down('fieldset').down('displayfield').setValue(currentNode.data.directory);
	                        	   win.show();
	                           },
	                           
	                           
	                           
	                           
	                           /**
	                            * @method
	                            */
	                           onDeleteStudyClick : function(component, event) {
	                        	   var currentNode = this.getFolderview().getSelectionModel().getLastSelected();
	                        	   var me = this;
	                        	   Ext.Msg.confirm('Delete Requirement', 'Are you sure you want to delete the study ' + currentNode.data.name
	                        	                   + '?', function(id, value) {
	                        		   if (id === 'yes') {
	                        			   console.log('we will delete');
	                        			   Ext.Ajax.request({
	                        				   url : RODAdmin.util.Globals.baseurl + '/adminjson/studydrop',
	                        				   method : "POST",
	                        				   params : {
	                        					   studyid : currentNode.data.indice
	                        				   },
	                        				   success : function() {
	                        					   RODAdmin.util.Alert.msg('Success!', 'Study deleted.');
	                        					   me.getFolderview().store.load();
//	                        					   store.load;
	                        				   },
	                        				   failure : function(response, opts) {
	                        					   Ext.Msg.alert('Failure', response);

	                        				   }
	                        			   });
	                        		   }
	                        	   }, this);
	                        	   event.stopEvent();
	                           },
	                           /**
	                            * @method
	                            */
	                           onEditStudyClick : function(button, event) {
                        		   console.log('edit study smth');
                        	//	   console.log(record);
                        		   
	                        	   var currentNode = this.getFolderview().getSelectionModel().getLastSelected();
	                        	   if (currentNode.itemtype == 'catalog') {	        
	                        		   console.log('edit study group');
		                        	   win = Ext.WindowMgr.get('catalogedit');
		                        	   console.log(win);
		                        	   if (!win) {
		                        		   win = Ext.create('RODAdmin.view.studies.EditCatalogWindow');
		                        	   }
		                        	   win.setTitle('Edit Study Group');
		                        	   var wtree = win.down('treepanel');
//		                        	   var studyitemstore = Ext.create('RODAdmin.store.studies.StudyItem');
		                        	   var studyitemstore = Ext.StoreManager.get('studies.StudyItem');
		                        	   
		                        	   studyitemstore.load({
		                        		   id : currentNode.data.indice, // set the id here
		                        		   scope : this,
		                        		   callback : function(records, operation, success) {
		                        			   if (success) {
		                        				   var studyitem = studyitemstore.first();
		                        				   win.down('form').getForm().loadRecord(studyitem);
		                        				   win.down('form').down('hiddenfield#groupid').setValue(studyitem.data.groupid);
		                        			   }
		                        		   }
		                        	   });
		                        	   win.show();
	                        	   } else {	   
                        		   console.log('edit study group');	                        		   
	                        	   win = Ext.WindowMgr.get('studyedit');
	                        	   console.log(win);
	                        	   if (!win) {
	                        		   win = Ext.create('RODAdmin.view.studies.EditStudyWindow');
	                        	   }
	                        	   win.setTitle('Edit Study');
	                        	   var wtree = win.down('treepanel');
	                        	   var studyitemstore = Ext.StoreManager.get('studies.StudyItem');
	                        	   
	                        	   studyitemstore.load({
	                        		   id : currentNode.data.indice, // set the id here
	                        		   scope : this,
	                        		   callback : function(records, operation, success) {
	                        			   if (success) {
	                        				   var studyitem = studyitemstore.first();
	                        				   win.down('form').getForm().loadRecord(studyitem);
	                        				   win.down('form').down('hiddenfield#groupid').setValue(studyitem.data.groupid);
	                        			   }
	                        		   }
	                        	   });
	                        	   win.show();
	                        	   }
	                           },
	                           /**
	                            * @method
	                            */
	                           onTreeContextMenu : function(component, record, item, index, e) {
	                        	   e.stopEvent();
	                        	   if (record.data.itemtype == 'catalog') {
	                        		   if (!this.foldermenu) {
	                        			   this.groupmenu = Ext.create('widget.catalogcontextmenu');
	                        		   }
	                        		   this.groupmenu.showAt(e.getXY());
	                        	   }
	                        	   else {
	                        		   if (!this.itemmenu) {
	                        			   this.itemmenu = Ext.create('widget.studycontextmenu');
	                        		   }
	                        		   this.itemmenu.showAt(e.getXY());
	                        	   }
	                           },
	                           /**
	                            * @method
	                            */
	                           onCollapseTreeClick : function(button, e, options) {
	                        	   console.log('onCollapseTreeClick');
	                        	   this.getFolderview().collapseAll();
	                           },
	                           /**
	                            * @method
	                            */
	                           onExpandTreeClick : function(button, e, options) {
	                        	   console.log('onExpandTreeClick');
	                        	   this.getFolderview().expandAll();
	                           },
	                           /**
	                            * @method
	                            */
	                           onReloadTreeClick : function(button, e, options) {
	                        	   var folderview = this.getFolderview();
	                        	   var currentNode = folderview.getSelectionModel().getLastSelected();
	                        	   console.log(currentNode);
	                        	   var mmstore = this.getFolderview().store;
	                        	   var me = this;
	                        	   mmstore.reload({
	                        		   callback : function(records, operation, success) {
	                        			   var root = me.getFolderview().store.getRootNode();
	                        			   var myid = root.findChild('indice', currentNode.data.indice, true);
	                        			   if (myid != null) {
	                        				   console.log(myid);
	                        				   folderview.getSelectionModel().select(myid);
	                        			   }
	                        		   }
	                        	   });
	                           },
	                           /**
	                            * @method
	                            */
	                           onFolderselectCellClick : function(component, td, cellIndex, record, tr, rowIndex, e, eOpts) {
	                        	   component.up('studyedit').down('form').down('fieldset').query('displayfield')[0].setValue(record.data.name);
	                        	   component.up('studyedit').down('fieldset').query('hiddenfield')[0].setValue(record.data.id);
	                           },
	                           /**
	                            * @method
	                            */
	                           onFolderviewSelectionChange : function(component, selected, event) {
	                        	   console.log('folderviewselectionchange');
	                        	   console.log(RODAdmin.util.Globals.stare);
	                        	   var stdpanel = this.getSdetailscontainer();
	                        	   console.log(stdpanel);
	                        	   var record = selected[0];
	                        	   var stdetails = this.getStudydetails();
                        		   //Variables!!!!
	                        	   //var stusage = this.geStusagepanel();
                        		   var stprop = this.getStudyproperties();
                        		   //var stcontent = this.getStcontent(); 
	                        	   if (record != null) {	    
//	                        		   var stenvelope = this.getStenvelope();
	                        		   console.log(record.data.itemtype);	
	                        		   stdetails.setTitle(record.data.name);
	                        		   stdpanel.setLoading(true);
	                        		   if (record.data.itemtype == 'catalog') {
	                        			   //lyusage.collapse(true);
	                        			   var catalogstore = Ext.StoreManager.get('studies.Catalog');
	                        			   //stcontent.setValue('');  
	                        			   //stenvelope.collapse();	
	                        			   catalogstore.load({
	                        				   scope : this,
	                        				   id : record.data.indice, 
	                        				   callback : function(records, operation, success) {
	                        					   if (success) {
	                        						   console.log(this.getSdetailscontainer());
	                        						   this.getSdetailscontainer().layout.setActiveItem('catalogdetails');
	                        						   var stitem = catalogstore.first();
	                        						   console.log(stitem);
	                        						   this.getCatalogdetails().update(stitem.data);
	                        						   this.getCatalogstudies().bindStore(stitem.studies());
//	                        						   stprop.update(stitem);
	                        						   stdpanel.setLoading(false);
	                        					   }
	                        				   }
	                        			   });
	                        		   }
	                        		   else {
	                        			   var stitemstore = Ext.StoreManager.get('studies.StudyItem');
	                        			   stitemstore.load({
	                        				   id : record.data.indice, 
	                        				   scope : this,
	                        				   callback : function(records, operation, success) {
	                        					   if (success) {
	                        						   console.log(this.getSdetailscontainer());
	                        						   this.getSdetailscontainer().layout.setActiveItem('studydetails');
	                        						   var stitem = stitemstore.first();
	                        					        stprop.update(stitem.data);
	                        					        var variables = this.getStvariables();
	                        					        variables.bindStore(stitem.variables());
	                        					        var keywords = this.getStkeywords();
	                        					        keywords.bindStore(stitem.keywords());
	                        					        stdpanel.setLoading(false);
	                        					   }
	                        				   }
	                        			   });
	                        		   }
	                        	   }
	                            else {
                       		   
                        		   stdetails.setTitle('');
                        		   stprop.update('');
                        		   //stusage.store.removeAll();
                        		   //stcontent.setValue('');
	                           }
	                   },
	               	getStoreNextId : function(ourstore) {
	            		var maxId = 0;
	            		if (ourstore.getCount() > 0) {
	            			maxId = ourstore.getAt(0).get('id'); // initialise to the first
	            													// record's id value.
	            			ourstore.each(function(rec) // go through all the records
	            					{
	            						maxId = Math.max(maxId, rec.get('id'));
	            					});
	            		}
	            		return maxId + 1;
	            	},

	                   
	                   
});