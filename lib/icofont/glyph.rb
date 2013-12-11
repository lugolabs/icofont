module Icofont
	class Glyph
		attr_reader :css_class, :unicode

		def initialize(css_class, unicode)
			@css_class = css_class
			@unicode = unicode
		end

		def self.fetch
			glyphs = []
			File.readlines(Glyph.data_path).each do |line|
				glyphs << line.gsub("\n", "")
			end
			glyphs
		end

		def self.set_data_path(data_path)
			@@data_path = data_path
		end

		def self.data_path
			@@data_path
		end

		def self.store(glyphs)
			File.open(Glyph.data_path, 'w') do |f|
				glyphs.each do |g|
					f.puts g
				end
			end
		end
	end
end