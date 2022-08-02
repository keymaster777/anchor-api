require 'sinatra/base'
require "sinatra/reloader"
require "sinatra/json"

class AnchorApi < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/ping' do
    json status: 200, message: 'pong'
  end

  get '/' do
    json status: 200, message: 'Hello world.'
  end
end
