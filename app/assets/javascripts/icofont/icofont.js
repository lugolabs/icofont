(function() {

	var Icofont = function(glyphList) {
		this._glyphList = glyphList;
		this._icofontsContainer = $('#icofonts-container');		
		this._bindAll(this);
	};

	Icofont.prototype = {
		_update: function() {
			var glyphs = this._glyphList.all();
			for (var g in glyphs) {
				$('a#' + g).addClass('selected');
			}
		},

		_toggle: function(e, link) {
			e.preventDefault();
			var iconName = link.id.replace('icofont-', '');
			link = $(link);
			
			if (link.hasClass('selected')) {
				link.removeClass('selected');
				this._glyphList.remove(iconName);
			} else {
				var glyph = {};
				glyph[iconName] = this._getContent(link);
				link.addClass('selected');
				this._glyphList.add(glyph);
			}
		},

		_getContent: function(link) {
			var unicode = window
				.getComputedStyle(link.find('i')[0], ':before')
				.getPropertyCSSValue('content')
				.cssText;
			return this._escapeUnicode(unicode);
		},

		_escapeUnicode: function(str) {
	    var result = "";
	    for(var i = 0; i < str.length; ++i){
        /* You should probably replace this by an isASCII test */
        if(str.charCodeAt(i) > 126 || str.charCodeAt(i) < 32)
          result += '&#x' + this._fixedHex(str.charCodeAt(i), 4) + ';';
        else
          result += str[i];
	    }
	    return result;
		},

		_fixedHex: function(number, length){
	    var str = number.toString(16);
	    while(str.length < length) str = "0" + str;
	    return str;
		},

		_bindAll: function(self) {
			this._icofontsContainer.on('click', 'a.btn', function (e) {
				self._toggle(e, this);
			})

			this._glyphList.on('glyphs:change', function() {
				self._update();
			})
		}
	};

	var Sidebar = function(glyphList) {
		this._glyphList = glyphList;
		this.icofontsSelectedContainer = $('#icofonts-selected');
		this._bindAll(this);
	};

	Sidebar.prototype = {
		_refresh: function() {
			var glyphs = this._glyphList.all(),
				list = [];
			for (var g in glyphs) {
				list.push('<a href="#' + g + '">' + g + '</a> ');
			}
			this.icofontsSelectedContainer.html(list.join(''));
		},

		_update: function() {
				this._log('Updating ...')
				this._updateBtn.prop('disabled', 'disabled');
				var glyphs = this._glyphList.all();
				console.log(glyphs);
				// this._glyphList.update(glyphs);
		},

		_updated: function(result) {
			this._updateBtn.prop('disabled', '');
			this._log();
		},

		_log: function(msg) {
			this._msgContainer = this._msgContainer || $('#icofonts-msg');
			this._msgContainer.html(msg || '');
		},

		_bindAll: function(self) {
			var events = ['glyphs:change', 'glyphs:add', 'glyphs:remove'];
			for (var i = 0, length = events.length; i < length; i++) {
				this._glyphList.on(events[i], function() {
					self._refresh();
				});	
			}

			this._glyphList.on('glyphs:updated', function(result) {
				self._updated(result);
			});	

			this._updateBtn = $('#icofonts-update-btn').on('click', function() {
				self._update();
			})
		}
	};

	var GlyphList = function() {
		this._glyphs = {};
		this._eventful = $(this);
	};

	GlyphList.prototype = {
		all: function() {
			return this._glyphs;
		},

		fetch: function() {
			var self = this;
			$.ajax({
				url: '/icofont/glyphs',
				success: function(result) {
					self._set(result);
				}
			});
		},

		_set: function(result) {
			this._glyphs = result;
			this._trigger('change');
		},

		add: function(glyph, unicode) {
			$.extend(this._glyphs, glyph);
			this._trigger('add');
		},

		remove: function(glyph) {
			if (this._glyphs[glyph]) {
				delete this._glyphs[glyph];
			}
			this._trigger('remove');
		},

		update: function(glyphs) {
			var self = this;
			$.post('/icofont/glyphs/update', {glyphs: glyphs}, function(result) {
				self._trigger('updated', result);
			});
		},

		_trigger: function(name, data) {
			this._eventful.trigger('glyphs:' + name, {data: data});
		},

		on: function(eventName, fn) {
			this._eventful.on(eventName, fn);
		}
	};


	$(function () {
		var glyphList = new GlyphList;
		new Sidebar(glyphList);
		new Icofont(glyphList);
		glyphList.fetch();
	});
	
})();