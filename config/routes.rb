ActionController::Routing::Routes.draw do |map|
  map.resources :vurls, :member => {:redirect => :get}, :collection => {:random => :get}
  map.redirect  ':slug', :controller => 'vurls', :action => 'redirect'
  map.preview   '/p/:slug', :controller => 'vurls', :action => 'preview'

  map.root :controller => 'vurls', :action => 'new'
end
