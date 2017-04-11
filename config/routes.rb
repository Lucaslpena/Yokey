Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  root to: 'landing#index', as: :landing
  get 'map' => 'map#home'
  get 'policy' => 'policy#policy'

  get 'healthy' => 'landing#health'

  #get '/users/auth/instagram' => ''

  post 'chat' => 'chat#listening'
  #post 'chat/location' => 'chat#location'

  get 'ais_bot/' => 'ais#index'

end
