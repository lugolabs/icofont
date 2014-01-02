require 'tmpdir'
require 'fileutils'
require_relative '../icofont'

class IcofontGenerator < Rails::Generators::Base
	include FileUtils::Verbose

	GITHUB_REPO = 'https://github.com/lugolabs/icofont-glyphs'

	desc "Generates the SVG fonts file based on glyphs on #{Icofont::Paths.glyphs_path}"
	def create_svg
		create_file Icofont::Paths.glyphs_path
	end

	desc 'Copies the SVG glyphs necessary to generate the icofonts'
	def copy_glyphs
		svg_root = Icofont::Paths.svg_root
		unless Dir.exists?(svg_root)
			tmp_dir = Dir.mktmpdir
			git clone: "#{GITHUB_REPO} #{tmp_dir}"
			mv File.join(tmp_dir, Icofont::Paths.svg_folder), svg_root
			rm_rf tmp_dir
		end
	end
end
