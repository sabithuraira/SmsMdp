Rails.application.routes.draw do
  resources :absensis
  resources :mahasiswa_kelas
  devise_for :users, 
      controllers: { omniauth_callbacks: 'omniauth_callbacks' },
      path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  resources :main,:as => "nilais" 
  resources :mp , :as => "mata_pelajarans"
  resources :dosen , :as => "dosens"
  resources :grade , :as => "grades"
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
  get '/kelas/absensi/:id', to: 'kelas#absensi'
  get '/kelas/nilai/:id', to: 'kelas#nilai'
  post '/kelas/update_absensi/:id', to: 'kelas#update_absensi'
  post '/kelas/update_nilai/:id', to: 'kelas#update_nilai'
  get '/kelas/subsetmahasiswa/:id', to: 'kelas#subsetmahasiswa', :defaults => { :format => 'json' }
  get '/kelas/mahasiswa_rel/:id', to: 'kelas#mahasiswa_rel', :defaults => { :format => 'json' }
  get '/kelas/pertemuan/:id', to: 'kelas#pertemuan', :defaults => { :format => 'json' }
  post '/kelas/update_mahasiswa/:id', to: 'kelas#update_mahasiswa', :defaults => { :format => 'json' }
  delete '/kelas/delete_mahasiswa/:id', to: 'kelas#delete_mahasiswa', :defaults => { :format => 'json' }
  resources :kelas, :as => "kelas"
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
