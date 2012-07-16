require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'coderay'

CODE_LANGS = %w{Ruby JavaScript CSS ERB HTML HAML YAML JSON XML C Delphi Java PHP Python SQL}

get '/' do
  erb :index
end

post '/' do
  code = params[:code].strip

  if code.empty?
    "no code in the box, please do it."
  else
    @code = CodeRay.scan(code, params[:lang]).html(:line_numbers => :table, :css => params[:css_type].to_sym)

    erb :code
  end
end
