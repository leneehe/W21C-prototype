/*
* bootstrap-table - v1.12.1 - 2018-03-12
* https://github.com/wenzhixin/bootstrap-table
* Copyright (c) 2018 zhixin wen
* Licensed MIT License
*/

!function(a){"use strict";var b=!1,c=function(c){var d=c.sortModalSelector,e="#"+d;if(!a(e).hasClass("modal")){var f='  <div class="modal fade" id="'+d+'" tabindex="-1" role="dialog" aria-labelledby="'+d+'Label" aria-hidden="true">';f+='         <div class="modal-dialog">',f+='             <div class="modal-content">',f+='                 <div class="modal-header">',f+='                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',f+='                     <h4 class="modal-title" id="'+d+'Label">'+c.options.formatMultipleSort()+"</h4>",f+="                 </div>",f+='                 <div class="modal-body">',f+='                     <div class="bootstrap-table">',f+='                         <div class="fixed-table-toolbar">',f+='                             <div class="bars">',f+='                                 <div id="toolbar">',f+='                                     <button id="add" type="button" class="btn btn-default"><i class="'+c.options.iconsPrefix+" "+c.options.icons.plus+'"></i> '+c.options.formatAddLevel()+"</button>",f+='                                     <button id="delete" type="button" class="btn btn-default" disabled><i class="'+c.options.iconsPrefix+" "+c.options.icons.minus+'"></i> '+c.options.formatDeleteLevel()+"</button>",f+="                                 </div>",f+="                             </div>",f+="                         </div>",f+='                         <div class="fixed-table-container">',f+='                             <table id="multi-sort" class="table">',f+="                                 <thead>",f+="                                     <tr>",f+="                                         <th></th>",f+='                                         <th><div class="th-inner">'+c.options.formatColumn()+"</div></th>",f+='                                         <th><div class="th-inner">'+c.options.formatOrder()+"</div></th>",f+="                                     </tr>",f+="                                 </thead>",f+="                                 <tbody></tbody>",f+="                             </table>",f+="                         </div>",f+="                     </div>",f+="                 </div>",f+='                 <div class="modal-footer">',f+='                     <button type="button" class="btn btn-default" data-dismiss="modal">'+c.options.formatCancel()+"</button>",f+='                     <button type="button" class="btn btn-primary">'+c.options.formatSort()+"</button>",f+="                 </div>",f+="             </div>",f+="         </div>",f+="     </div>",a("body").append(a(f)),c.$sortModal=a(e);var g=c.$sortModal.find("tbody > tr");if(c.$sortModal.off("click","#add").on("click","#add",function(){var a=c.$sortModal.find(".multi-sort-name:first option").length,b=c.$sortModal.find("tbody tr").length;a>b&&(b++,c.addLevel(),c.setButtonStates())}),c.$sortModal.off("click","#delete").on("click","#delete",function(){var a=c.$sortModal.find(".multi-sort-name:first option").length,b=c.$sortModal.find("tbody tr").length;b>1&&a>=b&&(b--,c.$sortModal.find("tbody tr:last").remove(),c.setButtonStates())}),c.$sortModal.off("click",".btn-primary").on("click",".btn-primary",function(){var d=c.$sortModal.find("tbody > tr"),e=c.$sortModal.find("div.alert"),f=[],g=[];c.options.sortPriority=a.map(d,function(b){var c=a(b),d=c.find(".multi-sort-name").val(),e=c.find(".multi-sort-order").val();return f.push(d),{sortName:d,sortOrder:e}});for(var h=f.sort(),i=0;i<f.length-1;i++)h[i+1]==h[i]&&g.push(h[i]);if(g.length>0)0===e.length&&(e='<div class="alert alert-danger" role="alert"><strong>'+c.options.formatDuplicateAlertTitle()+"</strong> "+c.options.formatDuplicateAlertDescription()+"</div>",a(e).insertBefore(c.$sortModal.find(".bars")));else{if(1===e.length&&a(e).remove(),c.$sortModal.modal("hide"),c.options.sortName="","server"===c.options.sidePagination){var j=c.options.queryParams;return c.options.queryParams=function(a){return a.multiSort=c.options.sortPriority,j(a)},b=!1,void c.initServer(c.options.silentSort)}c.onMultipleSort()}}),(null===c.options.sortPriority||0===c.options.sortPriority.length)&&c.options.sortName&&(c.options.sortPriority=[{sortName:c.options.sortName,sortOrder:c.options.sortOrder}]),null!==c.options.sortPriority&&c.options.sortPriority.length>0){if(g.length<c.options.sortPriority.length&&"object"==typeof c.options.sortPriority)for(var h=0;h<c.options.sortPriority.length;h++)c.addLevel(h,c.options.sortPriority[h])}else c.addLevel(0);c.setButtonStates()}};a.fn.bootstrapTable.methods.push("multipleSort"),a.extend(a.fn.bootstrapTable.defaults,{showMultiSort:!1,showMultiSortButton:!0,sortPriority:null,onMultipleSort:function(){return!1}}),a.extend(a.fn.bootstrapTable.defaults.icons,{sort:"glyphicon-sort",plus:"glyphicon-plus",minus:"glyphicon-minus"}),a.extend(a.fn.bootstrapTable.Constructor.EVENTS,{"multiple-sort.bs.table":"onMultipleSort"}),a.extend(a.fn.bootstrapTable.locales,{formatMultipleSort:function(){return"Multiple Sort"},formatAddLevel:function(){return"Add Level"},formatDeleteLevel:function(){return"Delete Level"},formatColumn:function(){return"Column"},formatOrder:function(){return"Order"},formatSortBy:function(){return"Sort by"},formatThenBy:function(){return"Then by"},formatSort:function(){return"Sort"},formatCancel:function(){return"Cancel"},formatDuplicateAlertTitle:function(){return"Duplicate(s) detected!"},formatDuplicateAlertDescription:function(){return"Please remove or change any duplicate column."},formatSortOrders:function(){return{asc:"Ascending",desc:"Descending"}}}),a.extend(a.fn.bootstrapTable.defaults,a.fn.bootstrapTable.locales);var d=a.fn.bootstrapTable.Constructor,e=d.prototype.initToolbar;d.prototype.initToolbar=function(){this.showToolbar=this.showToolbar||this.options.showMultiSort;var d=this,f="sortModal_"+this.$el.attr("id"),g="#"+f;if(this.$sortModal=a(g),this.sortModalSelector=f,e.apply(this,Array.prototype.slice.apply(arguments)),"server"===d.options.sidePagination&&!b&&null!==d.options.sortPriority){var h=d.options.queryParams;d.options.queryParams=function(a){return a.multiSort=d.options.sortPriority,h(a)}}if(this.options.showMultiSort){var i=this.$toolbar.find(">.btn-group").first(),j=this.$toolbar.find("div.multi-sort");!j.length&&this.options.showMultiSortButton&&(j='  <button class="multi-sort btn btn-default'+(void 0===this.options.iconSize?"":" btn-"+this.options.iconSize)+'" type="button" data-toggle="modal" data-target="'+g+'" title="'+this.options.formatMultipleSort()+'">',j+='     <i class="'+this.options.iconsPrefix+" "+this.options.icons.sort+'"></i>',j+="</button>",i.append(j),c(d)),this.$el.on("sort.bs.table",function(){b=!0}),this.$el.on("multiple-sort.bs.table",function(){b=!1}),this.$el.on("load-success.bs.table",function(){b||null===d.options.sortPriority||"object"!=typeof d.options.sortPriority||"server"===d.options.sidePagination||d.onMultipleSort()}),this.$el.on("column-switch.bs.table",function(a,b){for(var e=0;e<d.options.sortPriority.length;e++)d.options.sortPriority[e].sortName===b&&d.options.sortPriority.splice(e,1);d.assignSortableArrows(),d.$sortModal.remove(),c(d)}),this.$el.on("reset-view.bs.table",function(){b||null===d.options.sortPriority||"object"!=typeof d.options.sortPriority||d.assignSortableArrows()})}},d.prototype.multipleSort=function(){var a=this;b||null===a.options.sortPriority||"object"!=typeof a.options.sortPriority||"server"===a.options.sidePagination||a.onMultipleSort()},d.prototype.onMultipleSort=function(){var b=this,c=function(a,b){return a>b?1:b>a?-1:0},d=function(d,e){for(var f=[],g=[],h=0;h<b.options.sortPriority.length;h++){var i="desc"===b.options.sortPriority[h].sortOrder?-1:1,j=d[b.options.sortPriority[h].sortName],k=e[b.options.sortPriority[h].sortName];(void 0===j||null===j)&&(j=""),(void 0===k||null===k)&&(k=""),a.isNumeric(j)&&a.isNumeric(k)&&(j=parseFloat(j),k=parseFloat(k)),"string"!=typeof j&&(j=j.toString()),f.push(i*c(j,k)),g.push(i*c(k,j))}return c(f,g)};this.data.sort(function(a,b){return d(a,b)}),this.initBody(),this.assignSortableArrows(),this.trigger("multiple-sort")},d.prototype.addLevel=function(b,c){var d=0===b?this.options.formatSortBy():this.options.formatThenBy();this.$sortModal.find("tbody").append(a("<tr>").append(a("<td>").text(d)).append(a("<td>").append(a('<select class="form-control multi-sort-name">'))).append(a("<td>").append(a('<select class="form-control multi-sort-order">'))));var e=this.$sortModal.find(".multi-sort-name").last(),f=this.$sortModal.find(".multi-sort-order").last();a.each(this.columns,function(a,b){return b.sortable===!1||b.visible===!1?!0:void e.append('<option value="'+b.field+'">'+b.title+"</option>")}),a.each(this.options.formatSortOrders(),function(a,b){f.append('<option value="'+a+'">'+b+"</option>")}),void 0!==c&&(e.find('option[value="'+c.sortName+'"]').attr("selected",!0),f.find('option[value="'+c.sortOrder+'"]').attr("selected",!0))},d.prototype.assignSortableArrows=function(){for(var b=this,c=b.$header.find("th"),d=0;d<c.length;d++)for(var e=0;e<b.options.sortPriority.length;e++)a(c[d]).data("field")===b.options.sortPriority[e].sortName&&a(c[d]).find(".sortable").removeClass("desc asc").addClass(b.options.sortPriority[e].sortOrder)},d.prototype.setButtonStates=function(){var a=this.$sortModal.find(".multi-sort-name:first option").length,b=this.$sortModal.find("tbody tr").length;b==a&&this.$sortModal.find("#add").attr("disabled","disabled"),b>1&&this.$sortModal.find("#delete").removeAttr("disabled"),a>b&&this.$sortModal.find("#add").removeAttr("disabled"),1==b&&this.$sortModal.find("#delete").attr("disabled","disabled")}}(jQuery);
