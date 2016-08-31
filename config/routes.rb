Rails.application.routes.draw do
  get 'my/pwd'

  root 'welcome#index'

  devise_for :users, only: :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 我的(my)
  match 'my/pwd', to: "my#pwd", via: [:get, :put]

  resources :users, except: :destroy do
    get 'pwd', on: :member
  end

  resources :roles

end
