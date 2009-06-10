ActionController::Routing::Routes.draw do |map|
  map.resources :vurls, :member => {:redirect => :get}, :collection => {:random => :get}
  map.redirect  ':slug', :controller => 'vurls', :action => 'redirect'
  map.preview   '/p/:slug', :controller => 'vurls', :action => 'preview'

  map.resources :users
  map.claim_user 'claim/:claim_code', :controller => 'users', :action => 'claim'

  map.root :controller => 'vurls', :action => 'new'
end
