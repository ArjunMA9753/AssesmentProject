Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'user#user'
  post "create_user" => "user#user_create"
  post "update_user" => "user#user_update"
end
