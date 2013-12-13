require 'tmpdir'
require 'fileutils'
require 'rubygems'
require 'fontcustom'

module Icofont
	class FontProcessor
		def initialize(icons)
			@icons = icons
		end

		def generate
			with_glyphs do |tmp_dir|
				clean_dir output_path
				generate_vectors tmp_dir
			end
		end

		private

		def generate_vectors(vectors_path)
			options = {
        # debug: 			true,
				input:      vectors_path, 
				output:     output_path,
				templates:  [templates_path],
				font_name:  FONT_NAME,
				css_prefix: CSS_PREFIX,
    		no_hash: 		true,
				verbose:    true
			}

			opts = Fontcustom::Options.new(options)
			Fontcustom::Generator::Font.start [opts]
      Fontcustom::Generator::Template.start [opts]
		end

		def templates_path
			@templates_path ||= File.expand_path("../templates/#{ORIGINAL_FONT_NAME}.css", __FILE__)
		end

		def output_path
			@output_path ||= File.join(Rails.root, 'app/assets/icofont')
		end

		def with_glyphs
			tmp_dir = Dir.mktmpdir
			files = @icons.map { |icon| File.join(all_icons_path, "#{icon}.svg") }
			FileUtils.cp files, tmp_dir
			yield tmp_dir
			FileUtils.rm_rf tmp_dir
		end

		def all_icons_path
			@all_icons_path ||= File.expand_path('.iconic/glyphs', '~')
		end

		def clean_dir(folder_path)
			FileUtils.rm_r(folder_path) if Dir.exists?(folder_path)
			Dir.mkdir folder_path
		end

	end
end