Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      collection { post :sort }
    end
  end
  root 'projects#index'
  match '/tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :put
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
