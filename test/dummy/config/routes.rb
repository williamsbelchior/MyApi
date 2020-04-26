Rails.application.routes.draw do
  mount MyApi::Engine => "/my_api"
end
