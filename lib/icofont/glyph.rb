module Icofont
	class Glyph
		class << self
			def fetch(data_path = Paths.glyphs_path)
				glyphs = []
				File.readlines(data_path).each do |line|
					glyphs << line.gsub("\n", "")
				end
				glyphs
			end

			def store(glyphs, data_path = Paths.glyphs_path)
				File.open(data_path, 'w') do |f|
					glyphs.each do |g|
						f.puts g
					end
				end
			end
		end
	end
end