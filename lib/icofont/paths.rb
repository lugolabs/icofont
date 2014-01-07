module Icofont
	class Paths
		class << self
			def templates_path
				@@templates_path ||= File.expand_path("../templates", __FILE__)
			end

			def output_fonts_path
				@@output_fonts_path ||= expand_root("app/assets/#{FONT_NAME}")
			end

			def output_css_path
				@@output_css_path ||= expand_root("app/assets/stylesheets")
			end

			def output_css_file_path
				@@output_css_path ||= File.join(output_css_path, "#{FONT_NAME}.css.erb")
			end

			def manifest_path
				@@manifest_path ||= expand_root(".#{FONT_NAME}/fontcustom-manifest.yml")
			end

			def glyphs_path
				@@glyphs_path ||= expand_root(".#{FONT_NAME}/#{FONT_NAME}.txt")
			end
			
			def svg_path
				@@svg_path ||= File.join(svg_root, svg_folder)
			end

			def svg_root
				@@svg_root ||= File.expand_path(".#{FONT_NAME}", '~')
			end

			def svg_folder
				@@svg_folder ||= 'glyphs'
			end

			private

			def expand_root(path)
				File.join Rails.root, path
			end
		end
	end
end