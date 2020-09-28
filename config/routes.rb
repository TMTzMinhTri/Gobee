Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#landing'

  namespace 'api' do
    namespace 'v1' do
      resources :product, only: [:index]
      post :search_partner, to: "order#search_partner"
    end
  end


  get '/*path', to: 'static_pages#landing'
end
