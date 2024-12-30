Rails.application.routes.draw do
  root "weather#index"
  post "/weather/fetch", to: "weather#fetch"
end
