require 'test_helper'

module Icofont
	class GlyphTest < ActiveSupport::TestCase
		def test_fetches_data
			Glyph.set_data_path data_path
			glyphs = Glyph.fetch
			assert_equal 3, glyphs.size, 'size'
			assert_equal 'icofont-home', glyphs[0].css_class, 'css_class'
			assert_equal '&#xe000;', glyphs[0].unicode, 'unicode'
		end

		# def test_fetches_data
		# 	glyph.store(['icofont-pencil', 'icofont-home', 'icofont-home-1'])
		# 	data = glyph.fetch
		# 	assert_equal 3, data.size, 'size'
		# 	assert_equal "icofont-pencil", data[0], 'first'
		# end

		# def test_stores_data
		# 	glyph.store(['icofont-pencil'])
		# 	data = glyph.fetch
		# 	# assert_equal 1, 'size after'
		# 	assert_equal 'icofont-pencil', data[0]
		# end

		# def glyph
		# 	Glyph.new(data_path)
		# end

		def data_path
			File.expand_path '../../../fixtures/icofonts.txt', __FILE__
		end
	end
end