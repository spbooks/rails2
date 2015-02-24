ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.resources :stories, :has_many => :votes
  
  map.root :controller => "stories"
    
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end