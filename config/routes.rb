Rails.application.routes.draw do
  
  resources :groups do
   get "delete"
  end
  resources :students do
    get "delete"
  end
  resources :schools do
    get "delete"
  end


  devise_for :users

  root to: 'static_pages#index'


  controller :students do
    get 'xls_index' => 'students#xls_index'
  end

  controller :static_pages do 
    get '/index' => 'static_pages#index'

  end

end
