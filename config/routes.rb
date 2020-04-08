Rails.application.routes.draw do
  scope '/api/v1' do
    resources :students, only: [:index, :show], defaults: {format: :json}
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :teachers, only: [:create, :destroy], defaults: {format: :json}
  end
end
