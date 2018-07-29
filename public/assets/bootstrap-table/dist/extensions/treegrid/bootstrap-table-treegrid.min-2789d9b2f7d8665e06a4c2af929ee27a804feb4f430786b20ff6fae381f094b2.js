/*
* bootstrap-table - v1.12.1 - 2018-03-12
* https://github.com/wenzhixin/bootstrap-table
* Copyright (c) 2018 zhixin wen
* Licensed MIT License
*/

!function(a){"use strict";a.extend(a.fn.bootstrapTable.defaults,{treeShowField:null,idField:"id",parentIdField:"pid",onGetNodes:function(b,c){var d=this,e=[];return a.each(c,function(a,c){b[d.options.idField]===c[d.options.parentIdField]&&e.push(c)}),e},onCheckRoot:function(a){var b=this;return!a[b.options.parentIdField]}});var b=a.fn.bootstrapTable.Constructor,c=b.prototype.initRow,d=b.prototype.initHeader;b.prototype.initHeader=function(){var b=this;d.apply(b,Array.prototype.slice.apply(arguments));var c=b.options.treeShowField;c&&a.each(this.header.fields,function(a,d){return c===d?(b.treeEnable=!0,!1):void 0})};var e=function(b,d,f,g){var h=this,i=h.options.onGetNodes.apply(h,[b,f]);b._nodes=i,g.append(c.apply(h,[b,d,f,g]));for(var j=i.length-1,k=0;j>=k;k++){var l=i[k];l._level=b._level+1,l._parent=b,k===j&&(l._last=1),h.options.rowStyle=function(a){var b=a[h.options.idField]?a[h.options.idField]:0,c=a[h.options.parentIdField]?a[h.options.parentIdField]:0;return{classes:"treegrid-"+b+" treegrid-parent-"+c}},e.apply(h,[l,a.inArray(l,f),f,g])}};b.prototype.initRow=function(a,b,d,f){var g=this;return g.treeEnable?g.options.onCheckRoot.apply(g,[a,d])?(void 0===a._level&&(a._level=0),g.options.rowStyle=function(a){var b=a[g.options.idField]?a[g.options.idField]:0;return{classes:"treegrid-"+b}},e.apply(g,[a,b,d,f]),!0):!1:c.apply(g,Array.prototype.slice.apply(arguments))}}(jQuery);
