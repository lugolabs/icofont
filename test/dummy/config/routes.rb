Rails.application.routes.draw do
  mount_icofont
  root :to => "home#index"
end
