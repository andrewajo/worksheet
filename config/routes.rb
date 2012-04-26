Worksheet::Application.routes.draw do

  scope "api" do
  	resources :categories
  	resources :items do
  		collection { post :sort }
  	end
  end
  root to: "main#index"
end
