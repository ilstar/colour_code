require 'rubygems'
require 'sinatra'
require 'coderay'

CODE_LANGS = %w{Ruby JavaScript CSS ERB HTML HAML YAML JSON XML C Delphi Java PHP Python SQL}

get '/' do
  erb :index
end

post '/' do
  @code = CodeRay.scan(params[:code], params[:lang]).html(:line_numbers => :table, :css => params[:css_type].to_sym)
  
  erb :code
end
