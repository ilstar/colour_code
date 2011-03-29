require 'rubygems'
require 'sinatra'
require 'coderay'

get '/' do
  erb :index
end

post '/' do
  @code = CodeRay.scan(params[:code], 'ruby').div(:line_numbers => :table)
  
  erb :code
end
