require 'rubygems'
require 'sinatra'
require 'coderay'

CODE_LANGS = %w{Ruby C CSS Delphi HTML JSON Java JavaScript PHP Python RHTML SQL YAML}

get '/' do
  erb :index
end

post '/' do
  scan = CodeRay.scan(params[:code], params[:lang])

  @code = case params[:output_type]
  when 'page'
    scan.page
  when 'inline'
    scan.div(:line_numbers => :table)
  end
  
  erb :code
end
