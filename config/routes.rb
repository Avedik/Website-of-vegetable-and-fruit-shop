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
  post "/shop.html", to: "main#shop"
  get "/wishlist.html", to: "main#wishlist"
  get "/404.html", to: "main#index"
  get "/blog-details.html", to: "main#index"
  get "/forgot-password.html", to: "main#index"
  get "/index-2.html", to: "main#index"
  get "/index-3.html", to: "main#index"
end
