Rails.application.routes.draw do
  devise_for :users, 
      # controllers: {
      #   sessions: 'users/sessions',
      #   registrations: 'users/registrations',
      # }, 
      path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  resources :main,:as => "nilais" 
  resources :mp , :as => "mata_pelajarans"
  resources :mahasiswa , :as => "mahasiswas"
  resources :user , :as => "users"
  #get '/login', to: 'main#login'
  #post '/login', to: 'main#signin'
  post '/mp/search', to: 'mp#search'
  post '/mahasiswa/search', to: 'mahasiswa#search'
  post '/user/search', to: 'user#search'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
