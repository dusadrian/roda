Ext.define('databrowser.view.Histogram', {
	extend : 'Ext.chart.Chart',
	alias : 'widget.histogram',
	animate: true,
	shadow:true,
	insetPadding : 60,
	store: 'VariableStore',
	theme : 'Base:gradients',
	axes: [
	       {
	    	   type : 'Numeric',
	    	   position: 'bottom',
	    	   fields: ['counts'],
	    	   label: {
	    		   renderer: Ext.util.Format.numberRenderer(0,0)
	    	   		},
	       		title: 'Cases',
	       		grid: true,
	       		minimum: 0,
	       },{
	    	  type: 'Category',
	    	  position: 'left',
	    	  fields: ['breaks'],
	    	  title: 'Categorie'
	       }],
	 series: [{
	          type : 'bar',
	          axis: 'bottom',
	          highlight: true,
	          tips: {
	        	  trackMouse: true,
	        	  width: 140,
	        	  height: 28,
	        	  renderer: function(storeItem, item) {
	        		  this.setTitle(storeItem.get('name') + ': ' + storeItem.get('value'));
	        	  }
	          },
	          label: {
	        	  display: 'insideEnd',
	        	  'text-anchor': 'middle',
	        	  field: 'value',
	        	  renderer: Ext.util.Format.numberRenderer('0'),
	        	  orientation: 'horizontal',
	        	  color: '#ff750e'
	          },
	          xField: 'breaks',
	          yField: 'counts',

	 }],
	 
	 initComponent: function () {
		 this.callParent(arguments);
	}
});