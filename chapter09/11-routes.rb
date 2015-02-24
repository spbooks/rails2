ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.resources :stories, :has_many => :votes, :collection => { :bin => :get }
  
  map.root :controller => "stories"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end