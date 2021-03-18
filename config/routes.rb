Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  #get 'welcome/testing'
  get 'hola', to: 'welcome#testing'




  #Como se esta manejando relacion con Coment hay que anidar el resource
  resources :articles do
    resources :comments
  end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
