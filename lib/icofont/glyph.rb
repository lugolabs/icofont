module Icofont
	class Glyph
		class << self
			def fetch
				glyphs = []
				File.readlines(Paths.glyphs_path).each do |line|
					glyphs << line.gsub("\n", "")
				end
				glyphs
			end

			def store(glyphs)
				File.open(Paths.glyphs_path, 'w') do |f|
					glyphs.each do |g|
						f.puts g
					end
				end
			end
		end
	end
end