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

  post '/multiply5' do
    if ( params.key?("value") && is_numeric?(params["value"]))
      json status: 200, message: (params["value"].to_f * 5) #Casting value to float so that result isnt unintentionally floored
    else
      json status: 400, message: "Invalid value given."
    end
  end

  private

  def is_numeric? (val)
    val == "#{val.to_f}" || val == "#{val.to_i}" 
  end
end
