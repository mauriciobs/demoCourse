Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # namespace :api do
  #   resources :people

  # end
  namespace :api do
    get "getUserList", to: "services#getUserList"
    post "searchUserEmail", to: "services#searchUserEmail"
    post "changeUserName", to: "services#changeUserName"
  end
end
