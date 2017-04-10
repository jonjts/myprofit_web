Rails.application.routes.draw do

	devise_for :users, 
	:controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}, 
		:path_names => {:sign_in => "login", :sign_out => "logout"}

	root to: 'home#index'
end
