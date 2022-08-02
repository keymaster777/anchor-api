require 'sinatra/base'
require "sinatra/reloader"

class AnchorApi < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'it works again'
  end
end
