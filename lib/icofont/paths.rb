module Icofont
	class Paths
		class << self
			def templates_path
				@@templates_path ||= File.expand_path("../templates/#{FONT_NAME}.css.erb", __FILE__)
			end

			def output_path
				@@output_path ||= File.join(Rails.root, "app/assets/#{FONT_NAME}")
			end

			def manifest_path
				@@manifest_path ||= File.join(Rails.root, ".#{FONT_NAME}/fontcustom-manifest.yml")
			end

			def glyphs_path
				@@glyphs_path ||= File.join(Rails.root, ".#{FONT_NAME}/#{FONT_NAME}.txt")
			end
		end
	end
end