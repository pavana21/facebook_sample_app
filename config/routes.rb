FacebookSampleApp::Application.routes.draw do
  resources :users
  get 'user/:username' => "users#show", :as => :sample_user

  root :to => 'users#new'
end