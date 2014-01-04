Icofont::Engine.routes.draw do
  get 'glyphs' => 'glyphs#index'
  post 'glyphs/update' => 'glyphs#update'

  # namespace :icofont do
  	# resources :glyphs, :only => [:index, :update]
  # end

  root :to => 'home#index'
end
