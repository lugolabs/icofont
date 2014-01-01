require 'tmpdir'
require 'fileutils'
require 'rubygems'
require 'fontcustom'

module Icofont
	class FontProcessor
		include FileUtils::Verbose

		def initialize(icons)
			@icons = icons
		end

		def generate
			clean_dir Paths.output_fonts_path
			rm Paths.output_css_file_path if File.exists?(Paths.output_css_file_path)
			return unless @icons && @icons.length > 0
			
			with_glyphs do |tmp_dir|
				generate_vectors tmp_dir
			end
		end

		private

		def generate_vectors(vectors_path)
			options = {
        # debug: 			true,
				input:      vectors_path, 
				output:     Paths.output_fonts_path,
				templates:  [Paths.templates_path],
				font_name:  FONT_NAME,
				css_prefix: "#{FONT_NAME}-",
    		no_hash: 		true,
				verbose:    true,
				manifest:   Paths.manifest_path
			}

			opts = Fontcustom::Options.new(options)
			Fontcustom::Generator::Font.start [opts]
      Fontcustom::Generator::Template.start [opts]

      move_css_to_output
		end

		def move_css_to_output
      mv File.join(Paths.output_fonts_path, "#{FONT_NAME}.css.erb"), Paths.output_css_file_path
		end

		def with_glyphs
			tmp_dir = Dir.mktmpdir
			files = @icons.map { |icon| File.join(Paths.svg_path, "#{icon}.svg") }
			cp files, tmp_dir
			yield tmp_dir
			rm_rf tmp_dir
		end

		def clean_dir(folder_path)
			rm_r(folder_path) if Dir.exists?(folder_path)
			# Dir.mkdir folder_path
			mkdir_p folder_path
		end
	end
end