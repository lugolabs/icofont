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
			input = {
				vectors:   vectors_path,
				templates: Paths.templates_path
			}

			raw_options = {
        # debug: 			true,
				input:      input, 
				output:     Paths.output_fonts_path,
				templates:  ["#{FONT_NAME}.css.erb"],
				font_name:  FONT_NAME,
				css_selector: ".#{FONT_NAME}-{{glyph}}",
    		no_hash: 		true,
				verbose:    true,
				manifest:   Paths.manifest_path
			}

     	run_generators raw_options
      move_css_to_output
		end

		def run_generators(raw_options)
      options  = Fontcustom::Options.new(raw_options).options
      manifest = Fontcustom::Manifest.new(Paths.manifest_path, options)

      Fontcustom::Generator::Font.new(manifest.manifest).generate
      Fontcustom::Generator::Template.new(manifest.manifest).generate
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
			mkdir_p folder_path
		end
	end
end