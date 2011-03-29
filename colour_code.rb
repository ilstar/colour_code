require 'rubygems'
require 'sinatra'
require 'coderay'

get '/' do
  erb :index
end

post '/' do
  CodeRay.scan(params[:code], 'ruby').page
end
