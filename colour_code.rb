require 'rubygems'
require 'sinatra'

get '/' do
  @name = 'hodd'
  erb :index
end

post '/' do
  p request.xhr?
  p params
end
