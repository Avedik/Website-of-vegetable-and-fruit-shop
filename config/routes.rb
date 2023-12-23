Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "main#index"
  get "/index.html", to: "main#index"
  get "/login.html", to: "main#login"
  get "/about.html", to: "main#about"
  get "/account.html", to: "main#account"
  get "/blog.html", to: "main#blog"
  get "/cart.html", to: "main#cart"
  get "/checkout.html", to: "main#checkout"
  get "/compare.html", to: "main#compare"
  get "/contact.html", to: "main#contact"
  get "/product.html", to: "main#product"
  get "/register.html", to: "main#register"
  get "/shop.html", to: "main#shop"
  get "/edit.html", to: "main#edit"
  post "/shop.html", to: "main#shop"
  get "/wishlist.html", to: "main#wishlist"
  get "/forgot-password.html", to: "main#index"
  get "create", to: "main#create"

  post 'main/add_to_cart/:id', to: 'main#add_to_cart', as: 'add_to_cart'
  post 'main/remove_from_cart/:id', to: 'main#remove_from_cart', as: 'remove_from_cart'
  post 'add_new_product', to: 'main#add_new_product'
  delete 'main/remove_from_db/:id', to: 'main#remove_from_db', as: 'remove_from_db'
  post 'count_cost', to: 'main#count_cost'
  get 'remove_all_from_cart', to: 'main#remove_all_from_cart'
end
