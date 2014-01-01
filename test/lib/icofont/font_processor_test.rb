require 'test_helper'
require 'fileutils'
require 'mocha/setup'

module Icofont
	class FontProcessorTest < ActiveSupport::TestCase
		include FileUtils::Verbose

		test "generates files in correct paths" do

			Paths.stubs(:output_fonts_path).returns(PathsDummy.root)
			Paths.stubs(:output_css_path).returns(PathsDummy.output_css_path)
			Paths.stubs(:manifest_path).returns(PathsDummy.manifest_path)

			mkdir_p(Paths.output_css_path) unless Dir.exists?(Paths.output_css_path)

			font_processor = FontProcessor.new(%w(home home2))
			font_processor.generate

			['eot', 'ttf', 'woff', 'svg'].each do |f|
				assert_exists File.expand_path(Paths.output_fonts_path, "icofont.´#{f}"), f
			end
			assert_exists File.join(Paths.output_css_path, "icofont.css.erb"), 'stylesheets'
		end

		private

		def assert_exists(filename, msg = nil)
			assert File.exists?(filename), msg
		end
	end


	class PathsDummy
		class << self
			def output_fonts_path
				root
			end

			def output_css_path
				File.expand_path '../../../fixtures/stylesheets', __FILE__
			end

			def manifest_path
				File.join root, 'fontcustom-manifest.yml'
			end

			def root
				File.expand_path '../../../fixtures/fonts', __FILE__
			end
		end
	end

end