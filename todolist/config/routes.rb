Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      collection { post :sort }
    end
  end
  root 'projects#index'
  match '/tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :post
  match '/tasks/deadline/:id' => 'tasks#deadline', as: 'deadline_task', via: :post
  get '/tasks/deadline/:id', to: 'tasks#deadline_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
