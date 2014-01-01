require 'test_helper'

module Icofont
	class GlyphTest < ActiveSupport::TestCase
		setup do
			glyphs_path = File.expand_path("../../../fixtures/icofont.txt", __FILE__)
			Paths.stubs(:glyphs_path).returns(glyphs_path)
		end

		test "it stores and fetches glyphs" do
			Glyph.store %w(home)
			data = Glyph.fetch
			assert_equal 'home', data[0], 'first'

			Glyph.store %w(pencil aid)
			data = Glyph.fetch
			assert_equal 'pencil', data[0], 'second 1'
			assert_equal 'aid', data[1], 'second 2'
		end
	end
end