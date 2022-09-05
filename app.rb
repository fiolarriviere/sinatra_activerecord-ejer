require_relative 'config/application'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

configure :development do
  use Rack::MethodOverride
end

# acceso al Root
get "/" do

end

# redireccionando a la pagina para mostrar los Restaurantes
get '/restaurants' do
  @restaurants = Restaurant.all

  erb :index
end

# redireccionamos para crear nuevos restaurantes
get "/restaurants/new" do

  erb :new
end

# guardamos los datos creados por el NEW
post '/restaurants' do
  Restaurant.create(
    name: params[:name],
    address: params[:address],
    city: params[:city],
    phone_number: params[:phone_number],
    type_food: params[:type_food],
    image_url: params[:image_url]
  )
  redirect to '/restaurants'
end

# buscar el id para modificar
get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])

  erb :show
end

# para editar datos
get "/restaurants/:id/edit" do

end

# para guardar los datos editados en el GET
patch "/restaurants/:id" do

end

# elimina el ID que vayamos a modificar
delete "/restaurants/:id" do

end
