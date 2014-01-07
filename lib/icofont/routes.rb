module ActionDispatch::Routing
  class Mapper
		def mount_icofont
			if Rails.env.development?
				mount Icofont::Engine => "/icofont"
			end
		end
  end
end