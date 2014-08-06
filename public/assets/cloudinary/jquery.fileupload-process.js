/*
 * jQuery File Upload Processing Plugin 1.2.2
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2012, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","./jquery.fileupload"],e):e(window.jQuery)}(function(e){"use strict";var s=e.blueimp.fileupload.prototype.options.add;e.widget("blueimp.fileupload",e.blueimp.fileupload,{options:{processQueue:[],add:function(i,r){var t=e(this);r.process(function(){return t.fileupload("process",r)}),s.call(this,i,r)}},processActions:{},_processFile:function(s){var i=this,r=e.Deferred().resolveWith(i,[s]),t=r.promise();return this._trigger("process",null,s),e.each(s.processQueue,function(e,s){var r=function(e){return i.processActions[s.action].call(i,e,s)};t=t.pipe(r,s.always&&r)}),t.done(function(){i._trigger("processdone",null,s),i._trigger("processalways",null,s)}).fail(function(){i._trigger("processfail",null,s),i._trigger("processalways",null,s)}),t},_transformProcessQueue:function(s){var i=[];e.each(s.processQueue,function(){var r={},t=this.action,o=this.prefix===!0?t:this.prefix;e.each(this,function(i,t){r[i]="string"===e.type(t)&&"@"===t.charAt(0)?s[t.slice(1)||(o?o+i.charAt(0).toUpperCase()+i.slice(1):i)]:t}),i.push(r)}),s.processQueue=i},processing:function(){return this._processing},process:function(s){var i=this,r=e.extend({},this.options,s);return r.processQueue&&r.processQueue.length&&(this._transformProcessQueue(r),0===this._processing&&this._trigger("processstart"),e.each(s.files,function(s){var t=s?e.extend({},r):r,o=function(){return i._processFile(t)};t.index=s,i._processing+=1,i._processingQueue=i._processingQueue.pipe(o,o).always(function(){i._processing-=1,0===i._processing&&i._trigger("processstop")})})),this._processingQueue},_create:function(){this._super(),this._processing=0,this._processingQueue=e.Deferred().resolveWith(this).promise()}})});