Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root :to => 'list#index'

 match ":controller(/:action(/:id(.:format)))", :via => :all
end