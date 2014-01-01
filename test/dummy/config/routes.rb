Rails.application.routes.draw do
	if Rails.env.development?
	  mount Icofont::Engine => "/icofont"
	end
  
  root :to => "home#index"
end
