require 'rubygems'
require 'sinatra'
require 'coderay'

CODE_LANGS = %w{Ruby C CSS Delphi HTML JSON Java JavaScript PHP Python RHTML SQL YAML}

get '/' do
  erb :index
end

post '/' do
  @code = CodeRay.scan(params[:code], params[:lang]).div(:line_numbers => :table)
  
  erb :code
end
