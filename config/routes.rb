Rails.application.routes.draw do
  resources :absensis
  resources :mahasiswa_kelas
  resources :kelas
  devise_for :users, 
      controllers: { omniauth_callbacks: 'omniauth_callbacks' },
      path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  resources :main,:as => "nilais" 
  resources :mp , :as => "mata_pelajarans"
  resources :dosen , :as => "dosens"
  resources :mahasiswa , :as => "mahasiswas" do  
   get 'absen', on: :collection   
  end
  resources :user , :as => "users"
  #get '/login', to: 'main#login'
  #post '/login', to: 'main#signin'
  get '/outbox', to: 'outbox#index'
  get '/sentitem', to: 'sentitem#index'
  post '/mp/search', to: 'mp#search'
  post '/mahasiswa/search', to: 'mahasiswa#search'
  # get '/mahasiswa/absen/', to: 'mahasiswa#absen'
  post '/user/search', to: 'user#search'
  post '/main/search', to: 'main#search'
  post '/kelas/search', to: 'kelas#search'
  post '/dosen/search', to: 'dosen#search'

  post '/outbox/search', to: 'outbox#search'
  post '/sentitem/search', to: 'sentitem#search'
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
