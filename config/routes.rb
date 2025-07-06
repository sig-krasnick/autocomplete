Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      # Add your API routes here
    end
  end
  
  # Web routes
  get '/autocomplete', to: 'suggestions#autocomplete'
  get '/favicon.ico', to: proc { [204, {}, []] }  # Return 204 No Content
  get '/stats', to: 'suggestions#stats'

  root 'suggestions#index'
  
  # Health check endpoint
  get '/health', to: proc { [200, {}, ['OK']] }
end

