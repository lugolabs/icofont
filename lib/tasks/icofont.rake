require_dependency 'icofont/font_processor'

namespace :icofont do
	desc "Update the icon fonts"
	task :update => :environment do
		processor = Icofont::FontProcessor.new(%w{home aid})
		processor.generate
	end
end
