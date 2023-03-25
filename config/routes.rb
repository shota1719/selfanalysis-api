Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      mount_devise_token_auth_for 'Patients', at: 'auth', controllers: {
        registrations: "api/vi/auth/registrations"
      }
    end
  end
end
